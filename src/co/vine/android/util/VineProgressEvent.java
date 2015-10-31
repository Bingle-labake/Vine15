package co.vine.android.util;

public class VineProgressEvent
{
  public static final int CANCELED_EVENT_CODE = 8;
  public static final int COMPLETED_EVENT_CODE = 2;
  public static final int FAILED_EVENT_CODE = 4;
  public static final int PART_COMPLETED_EVENT_CODE = 2048;
  public static final int PART_FAILED_EVENT_CODE = 4096;
  public static final int PART_STARTED_EVENT_CODE = 1024;
  public static final int STARTED_EVENT_CODE = 1;
  private int bytesTransfered;
  private int eventCode;

  public VineProgressEvent(int paramInt)
  {
    this.bytesTransfered = paramInt;
  }

  public int getBytesTransfered()
  {
    return this.bytesTransfered;
  }

  public int getEventCode()
  {
    return this.eventCode;
  }

  public void setBytesTransfered(int paramInt)
  {
    this.bytesTransfered = paramInt;
  }

  public void setEventCode(int paramInt)
  {
    this.eventCode = paramInt;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.VineProgressEvent
 * JD-Core Version:    0.6.2
 */