package co.vine.android.api;

import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VineLike
  implements Parcelable
{
  public static final Parcelable.Creator<VineLike> CREATOR = new Parcelable.Creator()
  {
    public VineLike createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineLike(paramAnonymousParcel);
    }

    public VineLike[] newArray(int paramAnonymousInt)
    {
      return new VineLike[paramAnonymousInt];
    }
  };
  public String avatarUrl;
  public long created;
  public long likeId;
  public String location;
  public long postId;
  public VineUser user;
  public long userId;
  public String username;
  public int verified;

  public VineLike()
  {
  }

  public VineLike(Parcel paramParcel)
  {
    this.postId = paramParcel.readLong();
    this.avatarUrl = paramParcel.readString();
    this.location = paramParcel.readString();
    this.username = paramParcel.readString();
    this.created = paramParcel.readLong();
    this.likeId = paramParcel.readLong();
    this.userId = paramParcel.readLong();
    this.verified = paramParcel.readInt();
    this.user = ((VineUser)paramParcel.readParcelable(getClass().getClassLoader()));
  }

  public static VineLike from(Cursor paramCursor)
  {
    VineLike localVineLike = new VineLike();
    localVineLike.postId = paramCursor.getInt(1);
    localVineLike.avatarUrl = paramCursor.getString(28);
    localVineLike.location = paramCursor.getString(31);
    localVineLike.username = paramCursor.getString(32);
    localVineLike.created = paramCursor.getLong(30);
    localVineLike.likeId = paramCursor.getLong(27);
    localVineLike.userId = paramCursor.getLong(29);
    localVineLike.verified = paramCursor.getInt(33);
    return localVineLike;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VineLike localVineLike;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVineLike = (VineLike)paramObject;
      if (this.created != localVineLike.created)
        return false;
      if (this.likeId != localVineLike.likeId)
        return false;
      if (this.postId != localVineLike.postId)
        return false;
      if (this.userId != localVineLike.userId)
        return false;
      if (this.verified != localVineLike.verified)
        return false;
      if (this.avatarUrl != null)
      {
        if (this.avatarUrl.equals(localVineLike.avatarUrl));
      }
      else
        while (localVineLike.avatarUrl != null)
          return false;
      if (this.location != null)
      {
        if (this.location.equals(localVineLike.location));
      }
      else
        while (localVineLike.location != null)
          return false;
      if (this.user != null)
      {
        if (this.user.equals(localVineLike.user));
      }
      else
        while (localVineLike.user != null)
          return false;
      if (this.username == null)
        break;
    }
    while (this.username.equals(localVineLike.username));
    while (true)
    {
      return false;
      if (localVineLike.username == null)
        break;
    }
  }

  public int hashCode()
  {
    int i = 31 * (int)(this.postId ^ this.postId >>> 32);
    int j;
    int m;
    label55: int n;
    if (this.avatarUrl != null)
    {
      j = this.avatarUrl.hashCode();
      int k = 31 * (i + j);
      if (this.location == null)
        break label183;
      m = this.location.hashCode();
      n = 31 * (k + m);
      if (this.username == null)
        break label189;
    }
    label183: label189: for (int i1 = this.username.hashCode(); ; i1 = 0)
    {
      int i2 = 31 * (31 * (31 * (31 * (31 * (n + i1) + (int)(this.created ^ this.created >>> 32)) + (int)(this.likeId ^ this.likeId >>> 32)) + (int)(this.userId ^ this.userId >>> 32)) + this.verified);
      VineUser localVineUser = this.user;
      int i3 = 0;
      if (localVineUser != null)
        i3 = this.user.hashCode();
      return i2 + i3;
      j = 0;
      break;
      m = 0;
      break label55;
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(this.postId);
    paramParcel.writeString(this.avatarUrl);
    paramParcel.writeString(this.location);
    paramParcel.writeString(this.username);
    paramParcel.writeLong(this.created);
    paramParcel.writeLong(this.likeId);
    paramParcel.writeLong(this.userId);
    paramParcel.writeLong(this.verified);
    paramParcel.writeParcelable(this.user, paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineLike
 * JD-Core Version:    0.6.2
 */