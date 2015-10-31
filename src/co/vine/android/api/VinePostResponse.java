package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VinePostResponse
  implements Parcelable
{
  public static final Parcelable.Creator<VinePostResponse> CREATOR = new Parcelable.Creator()
  {
    public VinePostResponse createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VinePostResponse(paramAnonymousParcel);
    }

    public VinePostResponse[] newArray(int paramAnonymousInt)
    {
      return new VinePostResponse[paramAnonymousInt];
    }
  };
  public final long createdAt;
  public final long postId;

  public VinePostResponse(long paramLong1, long paramLong2)
  {
    this.postId = paramLong1;
    this.createdAt = paramLong2;
  }

  public VinePostResponse(Parcel paramParcel)
  {
    this.postId = paramParcel.readLong();
    this.createdAt = paramParcel.readLong();
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(this.postId);
    paramParcel.writeLong(this.createdAt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VinePostResponse
 * JD-Core Version:    0.6.2
 */