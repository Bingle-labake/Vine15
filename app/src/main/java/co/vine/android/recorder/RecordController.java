package co.vine.android.recorder;

import android.annotation.TargetApi;
import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.SurfaceTexture;
import android.hardware.Camera;
import android.hardware.Camera.AutoFocusCallback;
import android.hardware.Camera.PreviewCallback;
import android.media.AudioRecord;
import android.os.Looper;
import android.os.Process;
import android.support.v8.renderscript.RenderScript;
import android.view.Surface;
import android.view.SurfaceHolder;
import android.view.SurfaceHolder.Callback;
import android.view.SurfaceView;
import android.view.TextureView;
import android.view.TextureView.SurfaceTextureListener;
import android.view.View;
import co.vine.android.VineException;
import co.vine.android.util.CrashUtil;
import com.edisonwang.android.slog.SLog;
import com.googlecode.javacv.cpp.opencv_core.IplImage;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentLinkedQueue;

@TargetApi(14)
public class RecordController
  implements TextureView.SurfaceTextureListener, Camera.PreviewCallback, SurfaceHolder.Callback, Camera.AutoFocusCallback
{
  private volatile boolean isRecordingStarted = false;
  private short[] mAudioDataBufferMax;
  private AudioRecordRunnable mAudioRunnable;
  private Thread mAudioThread;
  private volatile long mAudioTimeRecorded;
  private volatile long mAudioTimestamp;
  private boolean mAutoFocus = true;
  private Bitmap mBitmap;
  private ByteBuffer mBuffer;
  private final CameraManager mCameraManager;
  private volatile RecordSegment mCurrentSegment;
  private final ConcurrentLinkedQueue<VideoData> mDataQueue = new ConcurrentLinkedQueue();
  private EncodingRunnable mEncodingRunnable;
  private boolean mEncodingThreadWasRunning;
  private VineRecorder.FinishProcessTask mFinishProcessTask;
  private boolean mFlash = false;
  private long mFrameTime;
  private Bitmap mGhostBitmap;
  private Canvas mGhostCanvas;
  private VideoData mGhostFrame;
  private CameraManager.InvalidPreviewSizeException mInvalidPreviewSizeException;
  private opencv_core.IplImage mIplImage;
  private boolean mIsFocusing = false;
  private boolean mIsRecordingEnded;
  private RecordSegment mLastAudioRecordingSegment;
  private long mLastAudioTimestamp;
  private CameraSetting mLastCameraSetting;
  private VideoData mLastFrame;
  private VideoData mLastLastFrame;
  private RecordSegment mLastVideoSegment;
  public VineRecorder mParent;
  private PictureConverter mPictureConverter;
  private Thread mProcessThread;
  private RenderScript mRS;
  private int mRotation;
  private volatile boolean mRunAudioThread = true;
  private RecordSession mSession;
  private long mStartTime;
  private Surface mSurface;
  private SurfaceHolder mSurfaceHolder;
  private SurfaceTexture mSurfaceTexture;
  private TextureView mTextureView;
  private Bitmap mThumbnailBitmap;
  private byte[] mVideoDataBufferMax;
  private final int[] mVideoRecordLock = new int[0];
  private VineFFmpegFrameRecorder mVideoRecorder;
  private long mVideoTimestamp;
  private volatile boolean recordingAudio;

  public RecordController(VineRecorder paramVineRecorder)
  {
    this.mParent = paramVineRecorder;
    this.mCameraManager = CameraManager.getInstance();
    this.mCameraManager.setPreviewCallback(this);
  }

  private void onSurfaceCreated()
  {
    SLog.d("Surface created...");
    this.mParent.onSurfaceReady(this);
  }

  private void onSurfaceDestroyed()
  {
    this.mSurfaceTexture = null;
    this.mSurface = null;
  }

  private void onSurfaceUpdated()
  {
    if ((!this.isRecordingStarted) && (this.mCameraManager.isPreviewing()))
      SLog.d("Surface updated. mCameraManager is previewing...");
    try
    {
      this.mCameraManager.stopPreview();
      label29: if (!this.mCameraManager.isPreviewing())
        startPreview();
      return;
    }
    catch (Exception localException)
    {
      break label29;
    }
  }

  private void updateGhostBitmap(boolean paramBoolean)
  {
    synchronized (this.mPictureConverter.LOCK)
    {
      CameraSetting localCameraSetting = this.mGhostFrame.segment.getCameraSetting();
      boolean bool = this.mPictureConverter.updateSettingsIfNeeded(localCameraSetting);
      this.mPictureConverter.giveMatrixNewValuesWithScaleIfDegreeHasChangedWithKnownConfigs(localCameraSetting.degrees, localCameraSetting.frontFacing);
      if (this.mPictureConverter.convert(localCameraSetting, this.mGhostFrame, bool))
      {
        this.mPictureConverter.draw(this.mGhostCanvas);
        if (paramBoolean)
          this.mParent.updateGhostBitmap(this.mGhostBitmap);
      }
      return;
    }
  }

  private void writeToFile(ArrayList<RecordSegment> paramArrayList, byte[] paramArrayOfByte, short[] paramArrayOfShort, boolean paramBoolean, int paramInt)
  {
    try
    {
      SLog.i("Write to file: {}", Boolean.valueOf(paramBoolean));
      while ((this.mAudioRunnable != null) && (this.mAudioRunnable.isInitialized))
        Thread.sleep(20L);
    }
    catch (InterruptedException localInterruptedException)
    {
      SLog.d("No...");
      try
      {
        if (this.mBitmap == null)
          this.mBitmap = Bitmap.createBitmap(480, 480, RecordConfigUtils.DEFAULT_BITMAP_CONFIG);
        VineFFmpegFrameRecorder localVineFFmpegFrameRecorder;
        if (paramBoolean)
        {
          localVineFFmpegFrameRecorder = RecordConfigUtils.newViewRecorder(this.mParent.getFile().getPreviewVideoPath() + ".temp_video.mp4", paramInt, 480);
          localVineFFmpegFrameRecorder.start();
        }
        while (true)
        {
          new CombingRunnable(this.mParent.getFile(), paramBoolean, paramArrayOfShort, paramArrayOfByte, paramArrayList, localVineFFmpegFrameRecorder, this.mFinishProcessTask, this.mBitmap, getFrameBuffer()).run();
          return;
          localVineFFmpegFrameRecorder = this.mVideoRecorder;
        }
      }
      catch (VineFFmpegFrameRecorder.Exception localException)
      {
        CrashUtil.logException(localException, "Cannot start audio recorder. ", new Object[0]);
      }
    }
  }

  public void autoFocus(int paramInt1, int paramInt2)
  {
    if ((!this.mIsFocusing) && (this.mCameraManager.setFocusAreas(paramInt1, paramInt2)) && (this.mCameraManager.autoFocus(this)))
    {
      this.mIsFocusing = true;
      this.mParent.showFocusIndicator(paramInt1, paramInt2);
    }
  }

  public boolean canChangeFocus()
  {
    return this.mCameraManager.canChangeFocus();
  }

  public void finishLastIfNeeded()
    throws Exception
  {
    try
    {
      if (this.mProcessThread != null)
        this.mProcessThread.join();
      label14: this.mEncodingThreadWasRunning = false;
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label14;
    }
  }

  public Bitmap getBitmap()
  {
    if (this.mBitmap == null)
      this.mBitmap = Bitmap.createBitmap(480, 480, RecordConfigUtils.DEFAULT_BITMAP_CONFIG);
    return this.mBitmap;
  }

  public CameraSetting getCameraSetting()
  {
    return this.mCameraManager.getCameraSetting();
  }

  public VineRecorder.FinishProcessTask getFinishProcessTask()
  {
    return this.mFinishProcessTask;
  }

  public opencv_core.IplImage getFrameBuffer()
  {
    if (this.mIplImage == null)
      this.mIplImage = opencv_core.IplImage.create(480, 480, 8, 4);
    return this.mIplImage;
  }

  protected Bitmap getGhostBitmap()
  {
    return this.mGhostBitmap;
  }

  public long getTimestamp()
  {
    SLog.i("Recorder Timestamp: {}.", Long.valueOf(this.mAudioTimestamp));
    return this.mAudioTimestamp / 1000L;
  }

  protected void initializeGhostBitmapsIfNeeded()
  {
    if (this.mGhostBitmap == null)
    {
      this.mGhostBitmap = Bitmap.createBitmap(480, 480, RecordConfigUtils.DEFAULT_BITMAP_CONFIG);
      this.mGhostCanvas = new Canvas(this.mGhostBitmap);
    }
  }

  public void invalidateGhostFrame()
  {
    this.mGhostFrame = null;
  }

  public boolean isAudioReady()
  {
    return (this.mAudioRunnable != null) && (this.mAudioRunnable.isInitialized);
  }

  public boolean isCameraReady()
  {
    return this.mCameraManager.isCameraReady();
  }

  public boolean isFlashSupported()
  {
    return this.mCameraManager.isFlashSupported();
  }

  public boolean isPreviewing()
  {
    return this.mCameraManager.isPreviewing();
  }

  public boolean isRecording()
  {
    return this.mCurrentSegment != null;
  }

  public boolean isRecordingStarted()
  {
    return this.isRecordingStarted;
  }

  public boolean isSurfaceReady()
  {
    return (this.mSurfaceTexture != null) || (this.mSurface != null);
  }

  public void logPreviewSizeExceptionIfNeeded()
  {
    if (this.mInvalidPreviewSizeException != null)
      CrashUtil.logException(this.mInvalidPreviewSizeException);
  }

  public void makePreview(RecordSegment paramRecordSegment, boolean paramBoolean)
  {
    if (!paramBoolean);
    try
    {
      if ((paramRecordSegment.videoPath == null) || (!new File(paramRecordSegment.videoPath).exists()))
      {
        VineFFmpegFrameRecorder localVineFFmpegFrameRecorder = RecordConfigUtils.newViewRecorder(this.mParent.getFile().getPreviewVideoPath() + ".temp_video.mp4", paramRecordSegment.getCameraSetting().frameRate, 480);
        localVineFFmpegFrameRecorder.start();
        new CombingRunnable(this.mParent.getFile(), paramRecordSegment, localVineFFmpegFrameRecorder, this.mFinishProcessTask, getBitmap(), getFrameBuffer(), paramBoolean).run();
      }
      return;
    }
    catch (VineFFmpegFrameRecorder.Exception localException)
    {
      CrashUtil.logException(localException, "Cannot start audio recorder", new Object[0]);
    }
  }

  public void modifyZoom(boolean paramBoolean)
  {
    this.mCameraManager.modifyZoom(paramBoolean);
  }

  public void offerLastFrame(RecordSegment paramRecordSegment, VideoData paramVideoData)
  {
    synchronized (this.mVideoRecordLock)
    {
      if (this.mLastFrame != null)
      {
        this.mVideoTimestamp += this.mFrameTime;
        if (this.mLastFrame.timestamp > this.mVideoTimestamp)
          this.mVideoTimestamp = this.mLastFrame.timestamp;
        this.mLastFrame.setSegment(paramRecordSegment);
        paramRecordSegment.getVideoData().add(this.mLastFrame);
        this.mDataQueue.offer(this.mLastFrame);
        ByteBuffer localByteBuffer = this.mCameraManager.getSharedByteBuffer();
        localByteBuffer.rewind();
        localByteBuffer.put(this.mLastFrame.data);
        this.mGhostFrame = new VideoData(0L, localByteBuffer.array());
        this.mGhostFrame.setSegment(paramRecordSegment);
        this.mLastVideoSegment = paramRecordSegment;
        SLog.d("Video timestamp {}, actual {}, segment: {}", Long.valueOf(this.mVideoTimestamp), Long.valueOf(this.mLastFrame.timestamp), paramRecordSegment);
        this.mLastFrame = paramVideoData;
      }
      return;
    }
  }

  public void onAutoFocus(boolean paramBoolean, Camera paramCamera)
  {
    this.mIsFocusing = false;
    this.mParent.onAutoFocusComplete(paramBoolean);
  }

  public void onPause()
  {
    setRecording(null);
    releaseCameraAndPreview();
    this.mCameraManager.setPreviewCallback(null);
  }

  public void onPreviewFrame(byte[] paramArrayOfByte, Camera paramCamera)
  {
    long l1 = 0L;
    if (this.mAudioTimestamp == l1)
      if (this.mStartTime > l1)
        l1 = 1000L * (System.currentTimeMillis() - this.mStartTime);
    while (paramArrayOfByte == null)
    {
      this.mParent.onDeviceNotSupported(new VineException("Camera is not supported yet."));
      return;
      if (this.mLastAudioTimestamp == this.mAudioTimestamp)
      {
        l1 = this.mAudioTimestamp + this.mFrameTime;
      }
      else
      {
        long l2 = (System.nanoTime() - this.mAudioTimeRecorded) / 1000L;
        l1 = l2 + this.mAudioTimestamp;
        this.mLastAudioTimestamp = this.mAudioTimestamp;
        SLog.d("Offset {}.", Long.valueOf(l2));
      }
    }
    this.mCameraManager.removeBufferFromAvailableQueue(paramArrayOfByte);
    while (true)
    {
      RecordSegment localRecordSegment;
      synchronized (this.mVideoRecordLock)
      {
        localRecordSegment = this.mCurrentSegment;
        if (localRecordSegment == null)
          break label209;
        if (this.mLastFrame == null)
        {
          this.mLastFrame = new VideoData(l1, paramArrayOfByte);
          offerLastFrame(localRecordSegment, null);
          return;
        }
      }
      offerLastFrame(localRecordSegment, new VideoData(l1, paramArrayOfByte));
      continue;
      label209: if (this.mLastLastFrame != null)
        this.mCameraManager.addCallbackBuffer(this.mLastLastFrame.data);
      this.mLastLastFrame = this.mLastFrame;
      this.mLastFrame = new VideoData(l1, paramArrayOfByte);
    }
  }

  public void onSurfaceTextureAvailable(SurfaceTexture paramSurfaceTexture, int paramInt1, int paramInt2)
  {
    this.mSurfaceTexture = paramSurfaceTexture;
    onSurfaceCreated();
  }

  public boolean onSurfaceTextureDestroyed(SurfaceTexture paramSurfaceTexture)
  {
    onSurfaceDestroyed();
    return true;
  }

  public void onSurfaceTextureSizeChanged(SurfaceTexture paramSurfaceTexture, int paramInt1, int paramInt2)
  {
    this.mSurfaceTexture = paramSurfaceTexture;
    onSurfaceCreated();
    onSurfaceUpdated();
  }

  public void onSurfaceTextureUpdated(SurfaceTexture paramSurfaceTexture)
  {
    this.mSurfaceTexture = paramSurfaceTexture;
    onSurfaceUpdated();
  }

  public boolean openDefaultCamera(boolean paramBoolean1, boolean paramBoolean2)
  {
    CameraSetting localCameraSetting = this.mCameraManager.openDefaultCamera(this.mParent.getConfig(), paramBoolean1, this.mRotation, paramBoolean2);
    this.mLastCameraSetting = localCameraSetting;
    if (localCameraSetting != null)
    {
      SLog.d("Received camera info.");
      this.mCameraManager.setPreviewHeight(localCameraSetting.originalH);
      this.mCameraManager.setPreviewWidth(localCameraSetting.originalW);
      startPreview();
      this.mIsFocusing = false;
      this.mParent.onCameraReady(this);
      return true;
    }
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Boolean.valueOf(paramBoolean1);
    CrashUtil.log("Failed to open camera: {}.", arrayOfObject);
    return false;
  }

  public void refreshBufferMax(RecordSession paramRecordSession)
  {
    this.mSession = paramRecordSession;
    this.mVideoDataBufferMax = this.mSession.getVideoData();
    this.mAudioDataBufferMax = this.mSession.getAudioData();
  }

  public void releaseCallbacks()
  {
    if (this.mSurfaceHolder != null)
    {
      SLog.d("releasing surface holder callback");
      this.mSurfaceHolder.removeCallback(this);
    }
    if (this.mTextureView != null)
    {
      SLog.d("releasing surface holder callback");
      this.mTextureView.setSurfaceTextureListener(null);
    }
  }

  protected void releaseCameraAndPreview()
  {
    CrashUtil.log("Release camera and preview.");
    this.mCameraManager.releaseCameraAndPreview();
  }

  public void releaseCameraResources()
  {
    this.mCameraManager.releaseCameraResources();
  }

  public void releaseParent()
  {
    this.mParent = null;
  }

  public void releaseResources()
  {
    SLog.d("releaseResources");
    if (this.mIplImage != null)
      this.mIplImage.release();
    this.mDataQueue.clear();
    this.mIplImage = null;
    this.mBuffer = null;
    if (this.mRS != null)
    {
      this.mRS.destroy();
      this.mRS = null;
    }
    if (this.mBitmap != null)
      this.mBitmap.recycle();
    this.mBitmap = null;
    if (this.mThumbnailBitmap != null)
      this.mThumbnailBitmap.recycle();
    this.mThumbnailBitmap = null;
    this.mLastAudioRecordingSegment = null;
    this.mLastVideoSegment = null;
    this.mEncodingRunnable = null;
    System.gc();
  }

  public void requestGhostDrawing(boolean paramBoolean)
  {
    if (this.mGhostFrame != null)
    {
      if (paramBoolean)
      {
        initializeGhostBitmapsIfNeeded();
        updateGhostBitmap(false);
      }
    }
    else
      return;
    new Thread(new GhostUpdateRunnable()).start();
  }

  public void setAudioTimestamp(int paramInt)
  {
    this.mAudioTimestamp = paramInt;
  }

  public void setAutoFocus(boolean paramBoolean)
  {
    this.mAutoFocus = paramBoolean;
    try
    {
      if (this.mAutoFocus)
      {
        if (this.mCameraManager.isPreviewing())
          this.mCameraManager.startContinuousAutoFocus(this.mCameraManager.getParameters());
      }
      else if (this.mCameraManager.isPreviewing())
      {
        this.mCameraManager.allowSetFocus(this.mCameraManager.getParameters());
        if ((this.mAutoFocus) && (!this.mIsFocusing) && (this.mCameraManager.autoFocus(this)))
        {
          this.mIsFocusing = true;
          return;
        }
      }
    }
    catch (Exception localException)
    {
      CrashUtil.logException(localException, "It's ok if we failed to auto focus here.", new Object[0]);
    }
  }

  public void setFinishProcessTask(VineRecorder.FinishProcessTask paramFinishProcessTask)
  {
    this.mFinishProcessTask = paramFinishProcessTask;
    if (this.mEncodingRunnable != null)
      this.mEncodingRunnable.setAsyncTask(this.mFinishProcessTask);
  }

  public void setPreviewSurface(View paramView)
    throws IOException
  {
    this.mCameraManager.setPreviewCallback(this);
    if ((paramView instanceof TextureView))
      switchSurface((TextureView)paramView);
    if ((paramView instanceof SurfaceView))
      switchSurface((SurfaceView)paramView);
  }

  public void setRecording(RecordSegment paramRecordSegment)
  {
    if (isRecordingStarted())
    {
      if (paramRecordSegment != null)
      {
        this.mStartTime = System.currentTimeMillis();
        paramRecordSegment.setCameraSetting(this.mCameraManager.getCameraSetting());
      }
      this.mCurrentSegment = paramRecordSegment;
    }
  }

  public void setRecordingAudio(boolean paramBoolean)
  {
    this.recordingAudio = paramBoolean;
  }

  public void setVideoTimeStamp(long paramLong)
  {
    this.mVideoTimestamp = paramLong;
  }

  public boolean start(Activity paramActivity, String paramString, int paramInt1, int paramInt2)
    throws RecordController.RecordControllerReadyStartedException
  {
    try
    {
      if (!this.mCameraManager.isCameraReady())
        throw new RuntimeException("You have to choose a camera via open() first.");
    }
    finally
    {
    }
    if ((this.mTextureView == null) && (this.mSurfaceHolder == null))
      throw new RuntimeException("You have to set a preview surface via switchSurface first.");
    if (this.isRecordingStarted)
      throw new RecordControllerReadyStartedException();
    CameraSetting localCameraSetting = this.mCameraManager.getCameraSetting();
    if (localCameraSetting == null)
      throw new RuntimeException("Camera is ready but camera setting is null, something is terribly wrong.");
    SLog.d("START Recorder");
    this.mIsRecordingEnded = false;
    this.isRecordingStarted = true;
    this.mAudioRunnable = new AudioRecordRunnable(paramString, paramInt1, null);
    SLog.i("Audio recorder initialized with count {}.", Integer.valueOf(paramInt1));
    SLog.i("Starting timestamps: {}", Long.valueOf(this.mVideoTimestamp), Long.valueOf(this.mAudioTimestamp));
    this.mRunAudioThread = true;
    this.mLastFrame = null;
    this.mAudioThread = new Thread(this.mAudioRunnable, "AudioRunnable");
    this.mAudioThread.start();
    this.mStartTime = 0L;
    int i = localCameraSetting.frameRate;
    while (true)
    {
      try
      {
        VineFFmpegFrameRecorder.tryLoad(paramActivity);
        this.mAudioRunnable.updateTimestamp();
        if (this.mVideoRecorder == null)
          this.mVideoRecorder = RecordConfigUtils.newViewRecorder(paramString + ".video.mp4", i, 480);
      }
      catch (VineFFmpegFrameRecorder.Exception localException1)
      {
        try
        {
          this.mVideoRecorder.start();
          if (this.mIplImage == null)
            this.mIplImage = opencv_core.IplImage.create(480, 480, 8, 4);
          if (this.mRS == null)
            this.mRS = RenderScript.create(paramActivity);
          if (this.mBuffer == null)
            this.mBuffer = ByteBuffer.allocate(921600);
          int j = this.mParent.getSize().x / 2;
          if (this.mThumbnailBitmap == null)
            this.mThumbnailBitmap = Bitmap.createBitmap(j, j, RecordConfigUtils.DEFAULT_BITMAP_CONFIG);
          if (!this.mCameraManager.isCameraReady())
          {
            CrashUtil.logException(new VineException("Camera was released already. "));
            bool = false;
            return bool;
            localException1 = localException1;
            CrashUtil.logException(localException1, "Failed to load native libraries.", new Object[0]);
          }
        }
        catch (VineFFmpegFrameRecorder.Exception localException2)
        {
          throw new RuntimeException(localException2);
        }
      }
      this.mPictureConverter = new PictureConverter(this.mRS, 480, localCameraSetting);
      this.mEncodingRunnable = new EncodingRunnable(this.mDataQueue, this.mVideoDataBufferMax, this, paramString, i, getFrameBuffer(), this.mBuffer, getBitmap(), this.mThumbnailBitmap, this.mPictureConverter, paramInt2, this.mCameraManager);
      this.mProcessThread = new Thread(this.mEncodingRunnable, "EncodingRunnable");
      this.mProcessThread.start();
      boolean bool = true;
    }
  }

  public void startPreview()
  {
    if ((this.mCameraManager.isCameraReady()) && (!this.mCameraManager.isPreviewing()))
    {
      CameraSetting localCameraSetting = this.mCameraManager.getCameraSetting();
      if (localCameraSetting != null)
      {
        localCameraSetting.frameRate = this.mCameraManager.setFrameRate(localCameraSetting.frameRate);
        if (localCameraSetting.frameRate > 0)
        {
          this.mFrameTime = (1000000L / localCameraSetting.frameRate);
          SLog.d("Determined frame rate: {}, frame time: {}.", Integer.valueOf(localCameraSetting.frameRate), Long.valueOf(this.mFrameTime));
          try
          {
            if (this.mTextureView != null)
            {
              this.mCameraManager.startPreview(this.mSurfaceTexture, this.mFlash, this.mAutoFocus, localCameraSetting.frameRate, this.mRotation, (int)(this.mAudioTimestamp / 1000L));
              return;
            }
            this.mCameraManager.startPreview(this.mSurface, this.mFlash, this.mAutoFocus, localCameraSetting.frameRate, this.mRotation, (int)(this.mAudioTimestamp / 1000L));
            return;
          }
          catch (CameraManager.InvalidPreviewSizeException localInvalidPreviewSizeException)
          {
            localCameraSetting.originalH = 240;
            localCameraSetting.originalW = 320;
            CrashUtil.log("CAUGHT INVALID PREVIEW SIZE, trying to use a smaller size again: " + localCameraSetting.originalW + " * " + localCameraSetting.originalH + " ff: " + localCameraSetting.frontFacing);
            this.mInvalidPreviewSizeException = localInvalidPreviewSizeException;
            this.mCameraManager.setPreviewHeight(localCameraSetting.originalH);
            this.mCameraManager.setPreviewWidth(localCameraSetting.originalW);
            try
            {
              if (this.mTextureView != null)
              {
                this.mCameraManager.startPreview(this.mSurfaceTexture, this.mFlash, this.mAutoFocus, localCameraSetting.frameRate, this.mRotation, (int)(this.mAudioTimestamp / 1000L));
                return;
              }
            }
            catch (Exception localException)
            {
              throw new RuntimeException(localException);
            }
            this.mCameraManager.startPreview(this.mSurface, this.mFlash, this.mAutoFocus, localCameraSetting.frameRate, this.mRotation, (int)(this.mAudioTimestamp / 1000L));
          }
        }
      }
    }
  }

  public void stop(boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((!this.isRecordingStarted) && (SLog.sLogsOn))
      throw new IllegalStateException("You can't stop before you have start it.");
    try
    {
      this.mRunAudioThread = false;
      if (this.isRecordingStarted)
      {
        SLog.d("Finishing recording, calling stop and release on recorder");
        if (!paramBoolean2)
          break label142;
        releaseCameraAndPreview();
        SLog.d("Waiting...........");
        this.isRecordingStarted = false;
        if (!paramBoolean1)
          break label185;
        if (this.mEncodingRunnable != null)
          this.mEncodingRunnable.terminate();
        if (this.mProcessThread != null)
          this.mProcessThread.interrupt();
      }
    }
    catch (Exception localException1)
    {
      while (true)
      {
        try
        {
          finishLastIfNeeded();
          releaseResources();
          this.mIsRecordingEnded = true;
          this.isRecordingStarted = false;
          if (!paramBoolean2)
            break label254;
          releaseCameraAndPreview();
          if (this.mFinishProcessTask != null)
            this.mFinishProcessTask.publish(100);
          SLog.d("Recorder is stopped.");
          return;
          label142: this.mCameraManager.setPreviewCallback(null);
          continue;
          localException1 = localException1;
          CrashUtil.logException(localException1, "Stop failed", new Object[0]);
          continue;
        }
        catch (Exception localException2)
        {
          CrashUtil.logException(localException2, "discard failed.", new Object[0]);
          continue;
        }
        label185: if (Looper.myLooper() == Looper.getMainLooper())
        {
          this.mEncodingThreadWasRunning = true;
        }
        else
        {
          if (!this.mParent.canKeepRecording())
            this.mEncodingThreadWasRunning = true;
          finishLastIfNeeded();
          if (!this.mParent.canKeepRecording())
          {
            this.mBuffer.clear();
            System.gc();
            writeToFile(false);
            releaseResources();
            continue;
            label254: this.mCameraManager.setPreviewCallback(null);
          }
        }
      }
    }
  }

  public void surfaceChanged(SurfaceHolder paramSurfaceHolder, int paramInt1, int paramInt2, int paramInt3)
  {
    this.mSurfaceHolder = paramSurfaceHolder;
    this.mSurface = paramSurfaceHolder.getSurface();
    onSurfaceCreated();
    onSurfaceUpdated();
  }

  public void surfaceCreated(SurfaceHolder paramSurfaceHolder)
  {
    this.mSurfaceHolder = paramSurfaceHolder;
    this.mSurface = paramSurfaceHolder.getSurface();
    onSurfaceCreated();
  }

  public void surfaceDestroyed(SurfaceHolder paramSurfaceHolder)
  {
    onSurfaceDestroyed();
  }

  public void swapSession()
  {
    this.mSession = this.mParent.getFile().getSession();
    this.mVideoDataBufferMax = this.mSession.getVideoData();
    this.mAudioDataBufferMax = this.mSession.getAudioData();
    this.mCurrentSegment = null;
    this.mLastFrame = null;
    this.mLastLastFrame = null;
    this.mLastVideoSegment = null;
    this.mLastAudioRecordingSegment = null;
    this.mIsRecordingEnded = false;
    this.mVideoRecorder = null;
    if ((this.mAudioThread != null) && (this.mAudioRunnable != null))
      if (this.mAudioRunnable.isInitialized)
        this.mAudioRunnable.forceQuit = true;
    try
    {
      this.mAudioThread.join();
      label110: this.mAudioThread = null;
      this.mAudioRunnable = null;
      this.mGhostFrame = null;
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      break label110;
    }
  }

  public void switchFlash()
  {
    if (!this.mFlash);
    for (boolean bool = true; ; bool = false)
    {
      this.mFlash = bool;
      this.mCameraManager.changeFlashState(this.mFlash);
      return;
    }
  }

  public void switchSurface(SurfaceView paramSurfaceView)
    throws IOException
  {
    this.mSurfaceHolder = paramSurfaceView.getHolder();
    this.mSurfaceHolder.addCallback(this);
  }

  public void switchSurface(TextureView paramTextureView)
    throws IOException
  {
    this.mTextureView = paramTextureView;
    this.mTextureView.setSurfaceTextureListener(this);
    if (this.mTextureView.isAvailable())
      onSurfaceTextureAvailable(paramTextureView.getSurfaceTexture(), paramTextureView.getWidth(), paramTextureView.getHeight());
  }

  public void updateRotation(Activity paramActivity)
  {
    this.mRotation = CameraManager.getCameraRotation(paramActivity);
  }

  public boolean wasEncodingThreadRunning()
  {
    return this.mEncodingThreadWasRunning;
  }

  public void writeToFile(ArrayList<RecordSegment> paramArrayList, byte[] paramArrayOfByte, short[] paramArrayOfShort, int paramInt)
  {
    writeToFile(paramArrayList, paramArrayOfByte, paramArrayOfShort, true, paramInt);
  }

  public void writeToFile(boolean paramBoolean)
  {
    RecordSession localRecordSession = this.mParent.getFile().getSession();
    writeToFile(localRecordSession.getSegments(), localRecordSession.getVideoData(), localRecordSession.getAudioData(), paramBoolean, this.mLastCameraSetting.frameRate);
  }

  public class AudioRecordRunnable
    implements Runnable
  {
    public boolean forceQuit;
    public volatile boolean isInitialized;
    private final short[] mAudioDataBuffer = new short[RecordConfigUtils.AUDIO_RUNNABLE_SAMPLE_SIZE];
    private final AudioRecord mAudioRecord = new AudioRecord(1, 44100, 16, 2, RecordConfigUtils.AUDIO_RUNNABLE_SAMPLE_SIZE);
    private int mCount;
    private final String mOutput;

    private AudioRecordRunnable(String paramInt, int arg3)
    {
      int i;
      this.mCount = i;
      this.mOutput = paramInt;
      SLog.d("Buffer size {}.", Integer.valueOf(this.mAudioDataBuffer.length));
    }

    private void record(RecordSegment paramRecordSegment, ShortBuffer paramShortBuffer)
    {
      int i = paramShortBuffer.limit();
      paramShortBuffer.get(RecordController.this.mAudioDataBufferMax, this.mCount, i);
      paramRecordSegment.addAudioData(new AudioData(this.mCount, i));
      this.mCount = (i + this.mCount);
    }

    public void run()
    {
      Process.setThreadPriority(-19);
      SLog.d("mAudioRecord.startRecording()");
      this.isInitialized = false;
      while (this.mAudioRecord.getState() == 0)
        try
        {
          Thread.sleep(100L);
        }
        catch (InterruptedException localInterruptedException)
        {
        }
      this.isInitialized = true;
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = this.mOutput;
      CrashUtil.log("mAudioRecord.isInitialized: {}.", arrayOfObject1);
      this.mAudioRecord.startRecording();
      if (((!RecordController.this.mRunAudioThread) && (RecordController.this.mVideoTimestamp <= RecordController.this.mAudioTimestamp)) || (RecordController.this.mIsRecordingEnded) || (this.forceQuit));
      label114: label377: 
      while (true)
      {
        SLog.d("AudioThread Finished, release mAudioRecord");
        this.mAudioRecord.stop();
        this.mAudioRecord.release();
        this.isInitialized = false;
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = this.mOutput;
        CrashUtil.log("mAudioRecord released: {}.", arrayOfObject2);
        return;
        updateTimestamp();
        int i = this.mAudioRecord.read(this.mAudioDataBuffer, 0, this.mAudioDataBuffer.length);
        if ((i <= 0) || (i <= 0))
          break;
        RecordSegment localRecordSegment1 = RecordController.this.mCurrentSegment;
        if ((localRecordSegment1 != null) && (RecordController.this.recordingAudio))
        {
          record(localRecordSegment1, ShortBuffer.wrap(this.mAudioDataBuffer, 0, i));
          RecordController.access$1102(RecordController.this, localRecordSegment1);
        }
        while (true)
        {
          if (RecordController.this.mParent == null)
            break label377;
          RecordConfigUtils.RecordConfig localRecordConfig = RecordController.this.mParent.getConfig();
          if (localRecordConfig == null)
            break label114;
          if (RecordController.this.mAudioTimestamp < 1000 * localRecordConfig.maxDuration)
            break;
          break label114;
          RecordSegment localRecordSegment2 = RecordController.this.mLastAudioRecordingSegment;
          if (localRecordSegment2 == null)
            localRecordSegment2 = RecordController.this.mLastVideoSegment;
          if (RecordController.this.mVideoTimestamp > RecordController.this.mAudioTimestamp)
            if (localRecordSegment2 == null)
              SLog.e("Recording have not started yet? {} vs {}.", Long.valueOf(RecordController.this.mVideoTimestamp), Long.valueOf(RecordController.this.mAudioTimestamp));
            else
              record(localRecordSegment2, ShortBuffer.wrap(this.mAudioDataBuffer, 0, i));
        }
      }
    }

    public void updateTimestamp()
    {
      if (RecordController.this.mVideoRecorder != null)
      {
        int i = RecordConfigUtils.getTimeStampInNsFromSampleCounted(this.mCount);
        if (RecordController.this.mAudioTimestamp != i)
        {
          RecordController.access$302(RecordController.this, i);
          RecordController.access$402(RecordController.this, System.nanoTime());
        }
      }
    }
  }

  public class GhostUpdateRunnable
    implements Runnable
  {
    public GhostUpdateRunnable()
    {
    }

    public void run()
    {
      RecordController.this.initializeGhostBitmapsIfNeeded();
      RecordController.this.updateGhostBitmap(true);
    }
  }

  public static abstract interface OnRecorderControllerStateChangedListener
  {
    public abstract void onCameraReady(RecordController paramRecordController);

    public abstract void onSurfaceReady(RecordController paramRecordController);
  }

  public static class RecordControllerReadyStartedException extends Exception
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordController
 * JD-Core Version:    0.6.2
 */