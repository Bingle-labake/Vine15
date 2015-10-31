package co.vine.android;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.HashMap;

public class LikeCache extends ActionCache
  implements Parcelable
{
  public static final Parcelable.Creator<LikeCache> CREATOR = new Parcelable.Creator()
  {
    public LikeCache createFromParcel(Parcel paramAnonymousParcel)
    {
      return new LikeCache(paramAnonymousParcel);
    }

    public LikeCache[] newArray(int paramAnonymousInt)
    {
      return new LikeCache[paramAnonymousInt];
    }
  };

  public LikeCache()
  {
  }

  public LikeCache(Parcel paramParcel)
  {
    super(paramParcel);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean isLike(long paramLong)
  {
    Boolean localBoolean = (Boolean)this.mCache.get(Long.valueOf(paramLong));
    if (localBoolean == null)
      return false;
    return localBoolean.booleanValue();
  }

  public void like(long paramLong)
  {
    this.mCache.put(Long.valueOf(paramLong), Boolean.valueOf(true));
  }

  public void unlike(long paramLong)
  {
    this.mCache.put(Long.valueOf(paramLong), Boolean.valueOf(false));
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    super.writeToParcel(paramParcel, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.LikeCache
 * JD-Core Version:    0.6.2
 */