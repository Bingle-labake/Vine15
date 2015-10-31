package co.vine.android.recorder;

import com.edisonwang.android.slog.FormattingTuple;
import com.edisonwang.android.slog.MessageFormatter;
import com.edisonwang.android.slog.SLog;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.ArrayList;
import java.util.Iterator;

public class RecordSession
  implements Externalizable
{
  private static final long serialVersionUID = 8590159620194730309L;
  private short[] mAudioData;
  private int mAudioDataCount = -1;
  private RecordConfigUtils.RecordConfig mConfig;
  private final ArrayList<RecordSegment> mSegments = new ArrayList();
  private byte[] mVideoData;
  private int mVideoDataCount = -1;

  public static RecordSession newSession(RecordConfigUtils.RecordConfig paramRecordConfig)
  {
    RecordSession localRecordSession = new RecordSession();
    localRecordSession.mVideoData = new byte[RecordConfigUtils.getVideoBufferMax(paramRecordConfig)];
    localRecordSession.mAudioData = new short[RecordConfigUtils.getMaxAudioBufferSize(paramRecordConfig)];
    localRecordSession.mConfig = paramRecordConfig;
    return localRecordSession;
  }

  public void add(RecordSegment paramRecordSegment)
  {
    this.mSegments.add(paramRecordSegment);
  }

  public int calculateAudioCount()
  {
    int i = 0;
    Iterator localIterator = this.mSegments.iterator();
    while (localIterator.hasNext())
    {
      RecordSegment localRecordSegment = (RecordSegment)localIterator.next();
      if (!localRecordSegment.removed)
        i += localRecordSegment.getCombinedAudioData().size;
    }
    return i;
  }

  public int calculateVideoCount()
  {
    int i = 0;
    Iterator localIterator1 = this.mSegments.iterator();
    while (localIterator1.hasNext())
    {
      RecordSegment localRecordSegment = (RecordSegment)localIterator1.next();
      if (!localRecordSegment.removed)
      {
        Iterator localIterator2 = localRecordSegment.getVideoData().iterator();
        while (localIterator2.hasNext())
        {
          VideoData localVideoData = (VideoData)localIterator2.next();
          if (localVideoData.size > 0)
            i += localVideoData.size;
        }
      }
    }
    return i;
  }

  public short[] getAudioData()
  {
    return this.mAudioData;
  }

  public int getAudioDataCount()
  {
    if (this.mAudioDataCount == -1)
      this.mAudioDataCount = calculateAudioCount();
    return this.mAudioDataCount;
  }

  public RecordConfigUtils.RecordConfig getConfig()
  {
    return this.mConfig;
  }

  public ArrayList<RecordSegment> getSegments()
  {
    return this.mSegments;
  }

  public byte[] getVideoData()
  {
    return this.mVideoData;
  }

  public int getVideoDataCount()
  {
    if (this.mVideoDataCount == -1)
      this.mVideoDataCount = calculateVideoCount();
    return this.mVideoDataCount;
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.mVideoData = ((byte[])paramObjectInput.readObject());
    this.mAudioData = ((short[])paramObjectInput.readObject());
    this.mSegments.addAll((ArrayList)paramObjectInput.readObject());
  }

  public void setAudioDataCount(int paramInt)
  {
    if ((SLog.sLogsOn) && (paramInt != calculateAudioCount()))
      SLog.e("Audio Counts does not match: {} {}.", Integer.valueOf(paramInt), Integer.valueOf(calculateAudioCount()));
    this.mAudioDataCount = paramInt;
  }

  public void setConfig(RecordConfigUtils.RecordConfig paramRecordConfig)
  {
    this.mConfig = paramRecordConfig;
  }

  public void setVideoDataCount(int paramInt)
  {
    if ((SLog.sLogsOn) && (paramInt != calculateVideoCount()))
      SLog.e("Video Counts does not match: {} {}.", Integer.valueOf(paramInt), Integer.valueOf(calculateVideoCount()));
    this.mVideoDataCount = paramInt;
  }

  public String toString()
  {
    Integer localInteger1 = Integer.valueOf(this.mVideoDataCount);
    Integer localInteger2 = Integer.valueOf(this.mAudioDataCount);
    if (this.mSegments != null);
    for (Integer localInteger3 = Integer.valueOf(this.mSegments.size()); ; localInteger3 = null)
      return MessageFormatter.format("\nVideoData Count: {}, AudioData Count: {}, Segments: {}", localInteger1, localInteger2, localInteger3).getMessage();
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(this.mVideoData);
    paramObjectOutput.writeObject(this.mAudioData);
    paramObjectOutput.writeObject(this.mSegments);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordSession
 * JD-Core Version:    0.6.2
 */