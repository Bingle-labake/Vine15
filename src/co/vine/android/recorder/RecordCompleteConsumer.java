package co.vine.android.recorder;

public abstract interface RecordCompleteConsumer extends Runnable
{
  public abstract boolean isComplete();

  public abstract void onComplete(RecordingFile paramRecordingFile, RecordCompleteConsumer paramRecordCompleteConsumer);

  public abstract void onError(RecordingFile paramRecordingFile, Exception paramException, RecordCompleteConsumer paramRecordCompleteConsumer);

  public abstract void reset();

  public abstract void resumeAll();

  public abstract void run();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordCompleteConsumer
 * JD-Core Version:    0.6.2
 */