package co.vine.android.recorder;

public class RelativeTime
{
  private long end;
  public final long start;

  public RelativeTime(long paramLong)
  {
    this.start = paramLong;
  }

  public long getDuration(int paramInt)
  {
    int i = 1000 / paramInt;
    long l = this.end - this.start;
    if (l < i)
      l = i + 1;
    return l;
  }

  public long getEnd()
  {
    return this.end;
  }

  public void setEnd(long paramLong)
  {
    this.end = paramLong;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RelativeTime
 * JD-Core Version:    0.6.2
 */