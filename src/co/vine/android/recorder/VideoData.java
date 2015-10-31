package co.vine.android.recorder;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public class VideoData
  implements Externalizable
{
  private static final long serialVersionUID = 8590112321194730309L;
  byte[] data;
  RecordSegment segment;
  int size;
  public int start;
  long timestamp;

  public VideoData()
  {
  }

  public VideoData(long paramLong, byte[] paramArrayOfByte)
  {
    this.timestamp = paramLong;
    this.data = paramArrayOfByte;
    this.start = -1;
    this.size = -1;
  }

  public VideoData(VideoData paramVideoData)
  {
    this.timestamp = paramVideoData.timestamp;
    this.data = paramVideoData.data;
    this.size = paramVideoData.size;
    this.start = paramVideoData.start;
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.timestamp = paramObjectInput.readLong();
    this.start = paramObjectInput.readInt();
    this.size = paramObjectInput.readInt();
  }

  public void setSegment(RecordSegment paramRecordSegment)
  {
    this.segment = paramRecordSegment;
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeLong(this.timestamp);
    paramObjectOutput.writeInt(this.start);
    paramObjectOutput.writeInt(this.size);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.VideoData
 * JD-Core Version:    0.6.2
 */