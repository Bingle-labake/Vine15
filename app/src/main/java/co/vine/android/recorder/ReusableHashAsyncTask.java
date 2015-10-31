package co.vine.android.recorder;

import com.edisonwang.android.slog.SLog;

public class ReusableHashAsyncTask extends HashAsyncTask
{
  private final boolean mCanKeepRecording;
  private RecordingFile mComputedFile;
  private boolean mIsCompleted = false;
  private final VineRecorder mRecorder;
  private Exception mStartingException = new Exception();

  public ReusableHashAsyncTask(VineRecorder paramVineRecorder)
  {
    super(null);
    this.mRecorder = paramVineRecorder;
    this.mCanKeepRecording = this.mRecorder.canKeepRecording();
  }

  protected RecordingFile doInBackground(RecordingFile[] paramArrayOfRecordingFile)
  {
    if (this.mCanKeepRecording)
      return super.doInBackground(paramArrayOfRecordingFile);
    RecordingFile[] arrayOfRecordingFile = new RecordingFile[1];
    arrayOfRecordingFile[0] = this.mRecorder.getFile();
    return super.doInBackground(arrayOfRecordingFile);
  }

  public RecordingFile getComputedFile()
  {
    return this.mComputedFile;
  }

  public boolean isComplete()
  {
    return this.mIsCompleted;
  }

  public void onComplete(RecordingFile paramRecordingFile, RecordCompleteConsumer paramRecordCompleteConsumer)
  {
    if (!this.mCanKeepRecording)
      this.mRecorder.finalFile = paramRecordingFile;
    if (isCancelled())
    {
      this.mComputedFile = paramRecordingFile;
      return;
    }
    run();
  }

  public void onError(RecordingFile paramRecordingFile, Exception paramException, RecordCompleteConsumer paramRecordCompleteConsumer)
  {
    if (isCancelled())
    {
      this.mIsCompleted = true;
      return;
    }
    SLog.d("Pre-post processing error.", paramException);
    SLog.d("Pre-post was started here.", this.mStartingException);
  }

  public void reset()
  {
    this.mIsCompleted = false;
  }

  public void resumeAll()
  {
    Runnable localRunnable = this.mRecorder.mOnCompleteConsumer;
    if ((localRunnable != null) && (!this.mCanKeepRecording))
    {
      localRunnable.run();
      return;
    }
    run();
  }

  public void run()
  {
    Runnable localRunnable = this.mRecorder.mOnCompleteConsumer;
    if ((localRunnable != null) && (!this.mCanKeepRecording))
    {
      localRunnable.run();
      return;
    }
    this.mIsCompleted = true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.ReusableHashAsyncTask
 * JD-Core Version:    0.6.2
 */