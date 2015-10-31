package co.vine.android;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.HashMap;

public class ActionCache
  implements Parcelable
{
  public static final Parcelable.Creator<ActionCache> CREATOR = new Parcelable.Creator()
  {
    public ActionCache createFromParcel(Parcel paramAnonymousParcel)
    {
      return new ActionCache(paramAnonymousParcel);
    }

    public ActionCache[] newArray(int paramAnonymousInt)
    {
      return new ActionCache[paramAnonymousInt];
    }
  };
  protected final HashMap<Long, Boolean> mCache;

  public ActionCache()
  {
    this.mCache = new HashMap();
  }

  public ActionCache(Parcel paramParcel)
  {
    this.mCache = ((HashMap)paramParcel.readSerializable());
  }

  public boolean contains(long paramLong)
  {
    return this.mCache.containsKey(Long.valueOf(paramLong));
  }

  public int describeContents()
  {
    return 0;
  }

  public void removeEntry(long paramLong)
  {
    this.mCache.remove(Long.valueOf(paramLong));
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeSerializable(this.mCache);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ActionCache
 * JD-Core Version:    0.6.2
 */