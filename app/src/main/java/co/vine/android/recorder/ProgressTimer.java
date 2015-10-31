package co.vine.android.recorder;

import android.os.Handler;

public class ProgressTimer
{
  private static final int INTERVAL = 35;
  private final ProgressTimerRunnable mTask;
  private final Thread mTaskThread;

  public ProgressTimer(VineRecorder paramVineRecorder, Handler paramHandler)
  {
    this.mTask = new ProgressTimerRunnable(paramVineRecorder, paramHandler);
    this.mTaskThread = new Thread(this.mTask);
  }

  public void release()
  {
    this.mTask.run = false;
    this.mTaskThread.interrupt();
  }

  public void start()
  {
    this.mTaskThread.start();
  }

  public static class ProgressTimerRunnable
    implements Runnable
  {
    private boolean hasNotifiedThreshold;
    private final VineRecorder mController;
    private final Handler mHandler;
    private int mProgress = -1;
    public volatile boolean run = true;

    public ProgressTimerRunnable(VineRecorder paramVineRecorder, Handler paramHandler)
    {
      this.mController = paramVineRecorder;
      this.mHandler = paramHandler;
    }

    private void exec()
      throws InterruptedException
    {
      final VineRecorder localVineRecorder = this.mController;
      while (true)
      {
        long l1;
        long l2;
        if (this.run)
        {
          l1 = System.currentTimeMillis();
          l2 = localVineRecorder.currentDuration;
          if (l2 >= 0L)
            break label149;
        }
        label149: for (int i = (int)(l2 + l1); ; i = (int)l2)
        {
          if (i != this.mProgress)
          {
            this.mProgress = i;
            localVineRecorder.postProgressUpdate(this.mProgress);
          }
          if ((!this.hasNotifiedThreshold) && (localVineRecorder.isRecordingSegment()) && (this.mProgress >= 1000))
          {
            this.hasNotifiedThreshold = true;
            this.mHandler.post(new Runnable()
            {
              public void run()
              {
                localVineRecorder.onProgressThresholdReached();
              }
            });
          }
          RecordConfigUtils.RecordConfig localRecordConfig = this.mController.getConfig();
          if ((localRecordConfig == null) || (this.mProgress < localRecordConfig.maxDuration))
            break;
          this.mHandler.post(new Runnable()
          {
            public void run()
            {
              localVineRecorder.onProgressMaxReached();
            }
          });
          return;
        }
        Thread.sleep(35L);
      }
    }

    public void run()
    {
      try
      {
        exec();
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.ProgressTimer
 * JD-Core Version:    0.6.2
 */