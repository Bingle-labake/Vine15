package co.vine.android;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class PendingRequest
  implements Parcelable
{
  public static final Parcelable.Creator<PendingRequest> CREATOR = new Parcelable.Creator()
  {
    public PendingRequest createFromParcel(Parcel paramAnonymousParcel)
    {
      return new PendingRequest(paramAnonymousParcel);
    }

    public PendingRequest[] newArray(int paramAnonymousInt)
    {
      return new PendingRequest[paramAnonymousInt];
    }
  };
  public final int fetchType;
  public final String id;

  public PendingRequest(Parcel paramParcel)
  {
    this.id = paramParcel.readString();
    this.fetchType = paramParcel.readInt();
  }

  public PendingRequest(String paramString)
  {
    this.id = paramString;
    this.fetchType = 0;
  }

  public PendingRequest(String paramString, int paramInt)
  {
    this.id = paramString;
    this.fetchType = paramInt;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    PendingRequest localPendingRequest;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localPendingRequest = (PendingRequest)paramObject;
      if (this.id == null)
        break;
    }
    while (this.id.equals(localPendingRequest.id));
    while (localPendingRequest.id != null)
      return false;
    return true;
  }

  public int hashCode()
  {
    if (this.id != null)
      return this.id.hashCode();
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.id);
    paramParcel.writeInt(this.fetchType);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.PendingRequest
 * JD-Core Version:    0.6.2
 */