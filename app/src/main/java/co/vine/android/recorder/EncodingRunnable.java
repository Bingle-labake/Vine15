package co.vine.android.recorder;

import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.os.Process;
import co.vine.android.util.CrashUtil;
import com.edisonwang.android.slog.SLog;
import com.googlecode.javacv.cpp.avcodec.AVPacket;
import com.googlecode.javacv.cpp.opencv_core.IplImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.LinkedList;
import java.util.concurrent.ConcurrentLinkedQueue;
import org.apache.commons.io.FileUtils;

public class EncodingRunnable
  implements Runnable
{
  private boolean hasLoggedException;
  private VineRecorder.FinishProcessTask mAsyncTask;
  private avcodec.AVPacket mAudioPacket;
  private LinkedList<VideoData> mBufferedVideoData;
  private ByteBuffer mByteBuffer;
  private final CameraManager mCameraManager;
  private final ConcurrentLinkedQueue<VideoData> mDataQueue;
  private VineFFmpegFrameRecorder mEncoder;
  private final opencv_core.IplImage mEncodingImage;
  private final String mEncodingTempPath;
  private RecordSegment mLastSegment;
  private Bitmap mMatrixBitmap;
  private Canvas mMatrixCanvas;
  private int mMaxEncodedSize;
  private final String mOutput;
  private final PictureConverter mPictureConverter;
  private final RecordController mProducer;
  private final int mRecorderFrameRate;
  private volatile boolean mTerminateImmediately = false;
  private final Bitmap mThumbnailBitmap;
  private final Canvas mThumbnailCanvas;
  private final Matrix mThumbnailMatrix;
  private int mTotalProcessed;
  private final byte[] mVideoDataBufferMax;
  private int mVideoDataBufferPosition;
  private avcodec.AVPacket mVideoPacket;
  private long timeToMatrix;
  private long timeToRGB;
  private long timeToRecord;
  private int totalSizeToWait = -1;

  public EncodingRunnable(ConcurrentLinkedQueue<VideoData> paramConcurrentLinkedQueue, byte[] paramArrayOfByte, RecordController paramRecordController, String paramString, int paramInt1, opencv_core.IplImage paramIplImage, ByteBuffer paramByteBuffer, Bitmap paramBitmap1, Bitmap paramBitmap2, PictureConverter paramPictureConverter, int paramInt2, CameraManager paramCameraManager)
  {
    this.mEncodingImage = paramIplImage;
    this.mDataQueue = paramConcurrentLinkedQueue;
    this.mProducer = paramRecordController;
    this.mByteBuffer = paramByteBuffer;
    this.mMatrixBitmap = paramBitmap1;
    this.mThumbnailBitmap = paramBitmap2;
    this.mCameraManager = paramCameraManager;
    this.mThumbnailCanvas = new Canvas(this.mThumbnailBitmap);
    this.mMatrixCanvas = new Canvas(this.mMatrixBitmap);
    this.mBufferedVideoData = new LinkedList();
    this.mVideoDataBufferMax = paramArrayOfByte;
    this.mVideoDataBufferPosition = paramInt2;
    this.mPictureConverter = paramPictureConverter;
    this.mRecorderFrameRate = paramInt1;
    this.mOutput = paramString;
    this.mThumbnailMatrix = new Matrix();
    float f = 1.0F * this.mThumbnailBitmap.getHeight() / this.mMatrixBitmap.getHeight();
    this.mThumbnailMatrix.setScale(f, f);
    this.mEncodingTempPath = (this.mOutput + ".encode");
    makeNewEncoder();
  }

  private boolean doVideoFrame(opencv_core.IplImage paramIplImage, boolean paramBoolean)
    throws VineFFmpegFrameRecorder.Exception
  {
    if (this.mEncoder == null)
      makeNewEncoder();
    while (true)
    {
      VideoData localVideoData = (VideoData)this.mBufferedVideoData.getFirst();
      localVideoData.size = this.mEncoder.encode(paramIplImage, this.mVideoDataBufferMax, this.mVideoDataBufferPosition);
      SLog.d("Write video frame size {}. Total processed {}.", Integer.valueOf(localVideoData.size), Integer.valueOf(this.mTotalProcessed));
      this.mTotalProcessed = (1 + this.mTotalProcessed);
      if (localVideoData.size == -1)
        break;
      localVideoData.start = this.mVideoDataBufferPosition;
      this.mMaxEncodedSize = Math.max(this.mMaxEncodedSize, localVideoData.size);
      this.mVideoDataBufferPosition += localVideoData.size;
      this.mBufferedVideoData.pop();
      return true;
      if (paramBoolean)
      {
        stopEncoder();
        makeNewEncoder();
      }
    }
    SLog.d("******Image was buffered to the next frame.********");
    return false;
  }

  private void makeNewEncoder()
  {
    if (this.mVideoPacket == null)
      this.mVideoPacket = new avcodec.AVPacket();
    if (this.mAudioPacket == null)
      this.mAudioPacket = new avcodec.AVPacket();
    this.mEncoder = RecordConfigUtils.newViewRecorder(this.mEncodingTempPath, this.mRecorderFrameRate, 480, this.mVideoPacket, this.mAudioPacket);
    try
    {
      this.mEncoder.start();
      return;
    }
    catch (VineFFmpegFrameRecorder.Exception localException)
    {
      CrashUtil.logException(localException, "Failed to start encoder", new Object[0]);
    }
  }

  private void process(boolean paramBoolean)
  {
    while (true)
    {
      VideoData localVideoData;
      if (!this.mTerminateImmediately)
      {
        localVideoData = (VideoData)this.mDataQueue.poll();
        if ((localVideoData != null) || (this.mProducer.isRecordingStarted()))
        {
          if ((!this.mProducer.isRecordingStarted()) && (this.mAsyncTask != null))
          {
            int i = Math.max(this.mDataQueue.size(), 1);
            if (this.totalSizeToWait == -1)
            {
              this.totalSizeToWait = i;
              Process.setThreadPriority(-8);
            }
            this.mAsyncTask.publish(90 * (this.totalSizeToWait - i) / this.totalSizeToWait);
          }
          if (localVideoData != null)
            break label129;
          if (!paramBoolean)
            continue;
          try
          {
            Thread.sleep(100L);
          }
          catch (InterruptedException localInterruptedException)
          {
            SLog.d("Break signal reached.");
          }
        }
      }
      else
      {
        return;
        label129: boolean bool;
        if (!paramBoolean)
          bool = true;
        try
        {
          processVideoData(localVideoData, bool);
        }
        catch (VineFFmpegFrameRecorder.Exception localException)
        {
          while (true)
          {
            if (!this.hasLoggedException)
            {
              this.hasLoggedException = true;
              CrashUtil.logException(localException);
            }
            SLog.e("Failed to processVideoData sample.", localException);
            break;
            bool = false;
          }
        }
        catch (IOException localIOException)
        {
          if (!this.hasLoggedException)
          {
            this.hasLoggedException = true;
            CrashUtil.logException(localIOException);
          }
          SLog.e("Failed to generate thumbnail.", localIOException);
        }
      }
    }
  }

  private void processVideoData(VideoData paramVideoData, boolean paramBoolean)
    throws VineFFmpegFrameRecorder.Exception, IOException
  {
    boolean bool1;
    if (this.mLastSegment != paramVideoData.segment)
      bool1 = true;
    while (true)
    {
      this.mLastSegment = paramVideoData.segment;
      synchronized (this.mPictureConverter.LOCK)
      {
        long l1 = System.currentTimeMillis();
        CameraSetting localCameraSetting = paramVideoData.segment.getCameraSetting();
        boolean bool2 = this.mPictureConverter.updateSettingsIfNeeded(localCameraSetting);
        this.mPictureConverter.giveMatrixNewValuesWithScaleIfDegreeHasChangedWithKnownConfigs(localCameraSetting.degrees, false);
        this.mPictureConverter.convert(localCameraSetting, paramVideoData, bool2);
        this.timeToRGB += System.currentTimeMillis() - l1;
        long l2 = System.currentTimeMillis();
        this.mPictureConverter.draw(this.mMatrixCanvas);
        this.timeToMatrix += System.currentTimeMillis() - l2;
        this.mByteBuffer.clear();
        this.mMatrixBitmap.copyPixelsToBuffer(this.mByteBuffer);
        if ((bool1) && (!this.mTerminateImmediately))
        {
          this.mPictureConverter.drawGeneric(this.mThumbnailCanvas, this.mMatrixBitmap, this.mThumbnailMatrix);
          String str = this.mOutput + "." + System.currentTimeMillis() + ".jpg";
          paramVideoData.segment.setThumbnailPath(str);
          File localFile = new File(str);
          ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
          this.mThumbnailBitmap.compress(Bitmap.CompressFormat.JPEG, 100, localByteArrayOutputStream);
          byte[] arrayOfByte = localByteArrayOutputStream.toByteArray();
          FileOutputStream localFileOutputStream = new FileOutputStream(localFile);
          localFileOutputStream.write(arrayOfByte);
          localFileOutputStream.close();
        }
        if (!this.mTerminateImmediately)
        {
          long l3 = System.currentTimeMillis();
          this.mEncodingImage.getByteBuffer().put(this.mByteBuffer.array());
          this.mBufferedVideoData.add(paramVideoData);
          doVideoFrame(this.mEncodingImage, bool1);
          this.timeToRecord += System.currentTimeMillis() - l3;
        }
        this.mCameraManager.addBuffer(paramVideoData.data, paramBoolean);
        paramVideoData.data = null;
        return;
        bool1 = false;
      }
    }
  }

  private void stopEncoder()
  {
    try
    {
      while ((this.mBufferedVideoData.size() > 0) && (doVideoFrame(null, false)));
      this.mEncoder.stopEncoding();
      return;
    }
    catch (VineFFmpegFrameRecorder.Exception localException)
    {
      SLog.e("Error flushing...", localException);
    }
  }

  public String getOutput()
  {
    return this.mOutput;
  }

  public void run()
  {
    Process.setThreadPriority(19);
    SLog.d("Processing started.");
    while ((this.mProducer.isRecordingStarted()) && (!this.mTerminateImmediately))
      process(true);
    SLog.d("Flushing...");
    if (!this.mTerminateImmediately)
      process(false);
    while (true)
    {
      FileUtils.deleteQuietly(new File(this.mEncodingTempPath));
      if (this.mAsyncTask != null)
        this.mAsyncTask.publish(90);
      Object[] arrayOfObject = new Object[5];
      arrayOfObject[0] = Long.valueOf(this.timeToRGB);
      arrayOfObject[1] = Long.valueOf(this.timeToMatrix);
      arrayOfObject[2] = Long.valueOf(this.timeToRecord);
      arrayOfObject[3] = Integer.valueOf(this.mTotalProcessed);
      arrayOfObject[4] = Integer.valueOf(this.mMaxEncodedSize);
      SLog.d("Time used: rgb: {}, matrix: {}, encode: {}, n: {}, max: {}.", arrayOfObject);
      this.mLastSegment = null;
      return;
      SLog.d("Terminate without saving....");
    }
  }

  public void setAsyncTask(VineRecorder.FinishProcessTask paramFinishProcessTask)
  {
    this.mAsyncTask = paramFinishProcessTask;
  }

  public void terminate()
  {
    SLog.d("Terminate without saving turned on.");
    this.mTerminateImmediately = true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.EncodingRunnable
 * JD-Core Version:    0.6.2
 */