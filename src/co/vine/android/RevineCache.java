package co.vine.android;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.HashMap;

public class RevineCache extends ActionCache
  implements Parcelable
{
  public static final Parcelable.Creator<RevineCache> CREATOR = new Parcelable.Creator()
  {
    public RevineCache createFromParcel(Parcel paramAnonymousParcel)
    {
      return new RevineCache(paramAnonymousParcel);
    }

    public RevineCache[] newArray(int paramAnonymousInt)
    {
      return new RevineCache[paramAnonymousInt];
    }
  };
  HashMap<Long, Long> mRepostIdMap;

  public RevineCache()
  {
    this.mRepostIdMap = new HashMap();
  }

  public RevineCache(Parcel paramParcel)
  {
    super(paramParcel);
    this.mRepostIdMap = ((HashMap)paramParcel.readSerializable());
  }

  public int describeContents()
  {
    return 0;
  }

  public long getMyRepostId(long paramLong)
  {
    if (this.mRepostIdMap.containsKey(Long.valueOf(paramLong)))
      return ((Long)this.mRepostIdMap.get(Long.valueOf(paramLong))).longValue();
    return 0L;
  }

  public boolean isRevined(long paramLong)
  {
    Boolean localBoolean = (Boolean)this.mCache.get(Long.valueOf(paramLong));
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public void putMyRepostId(long paramLong1, long paramLong2)
  {
    this.mRepostIdMap.put(Long.valueOf(paramLong1), Long.valueOf(paramLong2));
  }

  public void removeMyRepostId(long paramLong)
  {
    this.mRepostIdMap.remove(Long.valueOf(paramLong));
  }

  public void revine(long paramLong)
  {
    this.mCache.put(Long.valueOf(paramLong), Boolean.valueOf(true));
  }

  public void unRevine(long paramLong)
  {
    this.mCache.put(Long.valueOf(paramLong), Boolean.valueOf(false));
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
    paramParcel.writeSerializable(this.mRepostIdMap);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.RevineCache
 * JD-Core Version:    0.6.2
 */