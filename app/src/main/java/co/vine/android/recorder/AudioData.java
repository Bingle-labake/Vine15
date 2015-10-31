package co.vine.android.recorder;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

public class AudioData
  implements Externalizable
{
  int size;
  int start;

  public AudioData()
  {
  }

  public AudioData(int paramInt1, int paramInt2)
  {
    this.start = paramInt1;
    this.size = paramInt2;
  }

  public AudioData(AudioData paramAudioData)
  {
    this.start = paramAudioData.start;
    this.size = paramAudioData.size;
  }

  public long getDurationNs()
  {
    return RecordConfigUtils.getTimeStampInNsFromSampleCounted(this.size);
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.start = paramObjectInput.readInt();
    this.size = paramObjectInput.readInt();
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeInt(this.start);
    paramObjectOutput.writeInt(this.size);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.AudioData
 * JD-Core Version:    0.6.2
 */