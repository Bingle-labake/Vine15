package co.vine.android;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.HashMap;

public class Friendships
  implements Parcelable
{
  public static final Parcelable.Creator<Friendships> CREATOR = new Parcelable.Creator()
  {
    public Friendships createFromParcel(Parcel paramAnonymousParcel)
    {
      return new Friendships(paramAnonymousParcel);
    }

    public Friendships[] newArray(int paramAnonymousInt)
    {
      return new Friendships[paramAnonymousInt];
    }
  };
  public static final int FRIEND_FOLLOWING = 1;
  public static final int FRIEND_NONE = 0;
  public static final int FRIEND_UNDEFINED = -1;
  private HashMap<Long, Integer> mCache;

  public Friendships()
  {
    this.mCache = new HashMap();
  }

  public Friendships(Parcel paramParcel)
  {
    this.mCache = ((HashMap)paramParcel.readSerializable());
  }

  public static int setFriendship(int paramInt1, int paramInt2)
  {
    return paramInt1 | paramInt2;
  }

  public static int unsetFriendship(int paramInt1, int paramInt2)
  {
    return paramInt1 & (paramInt2 ^ 0xFFFFFFFF);
  }

  public void addFollowing(long paramLong)
  {
    Integer localInteger = (Integer)this.mCache.get(Long.valueOf(paramLong));
    if (localInteger == null)
    {
      this.mCache.put(Long.valueOf(paramLong), Integer.valueOf(setFriendship(0, 1)));
      return;
    }
    this.mCache.put(Long.valueOf(paramLong), Integer.valueOf(setFriendship(localInteger.intValue(), 1)));
  }

  public void clear()
  {
    this.mCache.clear();
  }

  public boolean contains(long paramLong)
  {
    return this.mCache.containsKey(Long.valueOf(paramLong));
  }

  public boolean contains(long paramLong, int paramInt)
  {
    Integer localInteger = (Integer)this.mCache.get(Long.valueOf(paramLong));
    return (localInteger != null) && (localInteger.intValue() == paramInt);
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean isEmpty()
  {
    return this.mCache.isEmpty();
  }

  public boolean isFollowing(long paramLong)
  {
    Integer localInteger = (Integer)this.mCache.get(Long.valueOf(paramLong));
    return (localInteger != null) && ((0x1 & localInteger.intValue()) != 0);
  }

  public void removeFollowing(long paramLong)
  {
    Integer localInteger = (Integer)this.mCache.get(Long.valueOf(paramLong));
    if (localInteger == null)
    {
      this.mCache.put(Long.valueOf(paramLong), Integer.valueOf(unsetFriendship(0, 1)));
      return;
    }
    this.mCache.put(Long.valueOf(paramLong), Integer.valueOf(unsetFriendship(localInteger.intValue(), 1)));
  }

  public int size()
  {
    return this.mCache.size();
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeSerializable(this.mCache);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.Friendships
 * JD-Core Version:    0.6.2
 */