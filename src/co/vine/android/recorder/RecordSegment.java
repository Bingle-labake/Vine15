package co.vine.android.recorder;

import android.content.Context;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import com.edisonwang.android.slog.SLog;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.nio.ByteBuffer;
import java.nio.ShortBuffer;
import java.util.ArrayList;
import java.util.Iterator;

public class RecordSegment
  implements Externalizable
{
  private static final long serialVersionUID = 7122730863787653276L;
  public Drawable drawable;
  public int index;
  private ArrayList<AudioData> mAudioData;
  private CameraSetting mSetting;
  private String mThumbnailPath;
  private ArrayList<VideoData> mVideoData;
  public boolean removed;
  public long startTimestamp;
  public String videoPath;

  public RecordSegment()
  {
  }

  public RecordSegment(long paramLong)
  {
    this.mVideoData = new ArrayList();
    this.mAudioData = new ArrayList();
    this.mThumbnailPath = "";
    this.startTimestamp = paramLong;
  }

  public RecordSegment(RecordSegment paramRecordSegment)
  {
    this.mSetting = paramRecordSegment.mSetting;
    this.mThumbnailPath = paramRecordSegment.mThumbnailPath;
    this.removed = paramRecordSegment.removed;
    this.index = paramRecordSegment.index;
    this.drawable = paramRecordSegment.drawable;
    this.videoPath = paramRecordSegment.videoPath;
    this.startTimestamp = paramRecordSegment.startTimestamp;
    this.mVideoData = new ArrayList();
    Iterator localIterator1 = paramRecordSegment.mVideoData.iterator();
    while (localIterator1.hasNext())
    {
      VideoData localVideoData = (VideoData)localIterator1.next();
      this.mVideoData.add(new VideoData(localVideoData));
    }
    this.mAudioData = new ArrayList();
    Iterator localIterator2 = paramRecordSegment.mAudioData.iterator();
    while (localIterator2.hasNext())
    {
      AudioData localAudioData = (AudioData)localIterator2.next();
      this.mAudioData.add(new AudioData(localAudioData));
    }
  }

  public static ArrayList<RecordSegment> applyEditedChanges(RecordSession paramRecordSession, ArrayList<RecordSegment> paramArrayList)
  {
    return applyEditedChanges(paramRecordSession, paramRecordSession.getSegments(), null, null, paramArrayList);
  }

  private static ArrayList<RecordSegment> applyEditedChanges(RecordSession paramRecordSession, ArrayList<RecordSegment> paramArrayList1, byte[] paramArrayOfByte, short[] paramArrayOfShort, ArrayList<RecordSegment> paramArrayList2)
  {
    if (paramArrayOfByte == null);
    ArrayList localArrayList1;
    ArrayList localArrayList2;
    byte[] arrayOfByte;
    short[] arrayOfShort;
    ByteBuffer localByteBuffer;
    ShortBuffer localShortBuffer;
    for (boolean bool = true; ; bool = false)
    {
      SLog.i("Apply changes, on source: {}.", Boolean.valueOf(bool));
      localArrayList1 = new ArrayList();
      localArrayList2 = new ArrayList();
      if (paramArrayList2 == null)
        break label630;
      arrayOfByte = paramRecordSession.getVideoData();
      arrayOfShort = paramRecordSession.getAudioData();
      if (bool)
        paramArrayOfByte = new byte[arrayOfByte.length];
      localByteBuffer = ByteBuffer.wrap(paramArrayOfByte);
      if (bool)
        paramArrayOfShort = new short[arrayOfShort.length];
      localShortBuffer = ShortBuffer.wrap(paramArrayOfShort);
      if (!bool)
        break;
      for (int n = 0; n < paramArrayList1.size(); n++)
        ((RecordSegment)paramArrayList1.get(n)).index = n;
    }
    int i = 0;
    long l1 = -1L;
    Iterator localIterator1 = paramArrayList2.iterator();
    while (localIterator1.hasNext())
    {
      RecordSegment localRecordSegment1 = (RecordSegment)localIterator1.next();
      if (!localRecordSegment1.removed)
      {
        RecordSegment localRecordSegment2;
        ArrayList localArrayList3;
        long l2;
        long l3;
        label289: VideoData localVideoData;
        int m;
        if (bool)
        {
          localRecordSegment2 = localRecordSegment1;
          localArrayList1.add(localRecordSegment2);
          SLog.d("Adding segment: {}.", Integer.valueOf(localRecordSegment1.index));
          AudioData localAudioData = localRecordSegment2.getCombinedAudioData();
          localArrayList3 = localRecordSegment2.getVideoData();
          l2 = -1L;
          l3 = 0L;
          localShortBuffer.put(arrayOfShort, localAudioData.start, localAudioData.size);
          SLog.d("Audio Buffers from {} with size {}.", Integer.valueOf(localAudioData.start), Integer.valueOf(localAudioData.size));
          localAudioData.start = i;
          i += localAudioData.size;
          Iterator localIterator2 = localArrayList3.iterator();
          do
          {
            if (!localIterator2.hasNext())
              break;
            localVideoData = (VideoData)localIterator2.next();
          }
          while (localVideoData.size < 0);
          m = localVideoData.start;
          if (l2 != -1L)
            break label437;
          l2 = localVideoData.timestamp;
          if (l1 != -1L)
            break label427;
          l1 = 0L;
          localVideoData.timestamp = 0L;
        }
        while (true)
        {
          SLog.d("Modifying timestamp from {} to {}.", Long.valueOf(l2), Long.valueOf(localVideoData.timestamp));
          l3 = localVideoData.timestamp;
          localVideoData.start = localByteBuffer.position();
          localByteBuffer.put(arrayOfByte, m, localVideoData.size);
          break label289;
          localRecordSegment2 = new RecordSegment(localRecordSegment1);
          break;
          label427: localVideoData.timestamp = l1;
          continue;
          label437: long l4 = localVideoData.timestamp;
          localVideoData.timestamp = (l3 + (localVideoData.timestamp - l2));
          l2 = l4;
        }
        l1 = Math.max(RecordConfigUtils.getTimeStampInNsFromSampleCounted(i), 1000000 * localArrayList3.size() / localRecordSegment2.getCameraSetting().frameRate) - 1000000 / localRecordSegment2.getCameraSetting().frameRate;
        SLog.d("Next timestamp: {}", Long.valueOf(l1));
      }
      else
      {
        localArrayList2.add(localRecordSegment1);
      }
    }
    int j = localShortBuffer.position();
    int k = localByteBuffer.position();
    SLog.d("Buffer limits: {}, {}.", Integer.valueOf(j), Integer.valueOf(k));
    if (bool)
    {
      localByteBuffer.position(0);
      localByteBuffer.get(arrayOfByte);
      localShortBuffer.position(0);
      localShortBuffer.get(arrayOfShort);
      paramRecordSession.setAudioDataCount(j);
      paramRecordSession.setVideoDataCount(k);
    }
    paramArrayList2.removeAll(localArrayList2);
    if (paramArrayList1 != null)
    {
      paramArrayList1.clear();
      paramArrayList1.addAll(paramArrayList2);
    }
    label630: if (bool)
      return localArrayList2;
    return localArrayList1;
  }

  public static ArrayList<RecordSegment> applyForEditedChanges(RecordSession paramRecordSession, byte[] paramArrayOfByte, short[] paramArrayOfShort, ArrayList<RecordSegment> paramArrayList)
  {
    return applyEditedChanges(paramRecordSession, null, paramArrayOfByte, paramArrayOfShort, paramArrayList);
  }

  public void addAudioData(AudioData paramAudioData)
  {
    this.mAudioData.add(paramAudioData);
  }

  public CameraSetting getCameraSetting()
  {
    return this.mSetting;
  }

  public AudioData getCombinedAudioData()
  {
    if (this.mAudioData.size() == 0)
      return new AudioData(0, 0);
    if (this.mAudioData.size() > 1)
    {
      int i = 0;
      Iterator localIterator = this.mAudioData.iterator();
      while (localIterator.hasNext())
        i += ((AudioData)localIterator.next()).size;
      AudioData localAudioData = new AudioData(((AudioData)this.mAudioData.get(0)).start, i);
      this.mAudioData.clear();
      this.mAudioData.add(localAudioData);
    }
    return (AudioData)this.mAudioData.get(0);
  }

  public Drawable getDrawableCopy(Context paramContext)
  {
    if (this.drawable != null)
      return new BitmapDrawable(paramContext.getResources(), ((BitmapDrawable)this.drawable).getBitmap());
    BitmapDrawable localBitmapDrawable = new BitmapDrawable(paramContext.getResources(), getThumbnailPath());
    this.drawable = new BitmapDrawable(paramContext.getResources(), localBitmapDrawable.getBitmap());
    return localBitmapDrawable;
  }

  public String getThumbnailPath()
  {
    return this.mThumbnailPath;
  }

  public ArrayList<VideoData> getVideoData()
  {
    return this.mVideoData;
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.mSetting = ((CameraSetting)paramObjectInput.readObject());
    this.mThumbnailPath = ((String)paramObjectInput.readObject());
    this.mVideoData = ((ArrayList)paramObjectInput.readObject());
    this.mAudioData = new ArrayList();
    this.mAudioData.add((AudioData)paramObjectInput.readObject());
  }

  public RecordSegment setCameraSetting(CameraSetting paramCameraSetting)
  {
    this.mSetting = paramCameraSetting;
    return this;
  }

  public void setThumbnailPath(String paramString)
  {
    this.mThumbnailPath = paramString;
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(this.mSetting);
    paramObjectOutput.writeObject(this.mThumbnailPath);
    paramObjectOutput.writeObject(this.mVideoData);
    paramObjectOutput.writeObject(getCombinedAudioData());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.recorder.RecordSegment
 * JD-Core Version:    0.6.2
 */