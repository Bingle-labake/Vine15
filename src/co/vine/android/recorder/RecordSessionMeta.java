package co.vine.android.recorder;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public class RecordSessionMeta
  implements Externalizable
{
  private static final long serialVersionUID = 3412330863787653276L;
  private long mLastModified;
  private int mProgress;

  public RecordSessionMeta()
  {
  }

  public RecordSessionMeta(int paramInt)
  {
    this.mLastModified = System.currentTimeMillis();
    this.mProgress = paramInt;
  }

  public long getLastModified()
  {
    return this.mLastModified;
  }

  public int getProgress()
  {
    return this.mProgress;
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.mProgress = paramObjectInput.readInt();
    this.mLastModified = paramObjectInput.readLong();
  }

  public void setProgress(int paramInt)
  {
    this.mProgress = paramInt;
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeInt(this.mProgress);
    paramObjectOutput.writeLong(this.mLastModified);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordSessionMeta
 * JD-Core Version:    0.6.2
 */