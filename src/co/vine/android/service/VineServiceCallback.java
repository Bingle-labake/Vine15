package co.vine.android.service;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VineServiceCallback
  implements Parcelable
{
  public static final Parcelable.Creator<VineServiceCallback> CREATOR = new Parcelable.Creator()
  {
    public VineServiceCallback createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineServiceCallback(paramAnonymousParcel);
    }

    public VineServiceCallback[] newArray(int paramAnonymousInt)
    {
      return new VineServiceCallback[paramAnonymousInt];
    }
  };
  private final VineServiceResponder mResponder;

  public VineServiceCallback(Parcel paramParcel)
  {
    this.mResponder = ((VineServiceResponder)paramParcel.readStrongBinder());
  }

  public VineServiceCallback(VineServiceResponder paramVineServiceResponder)
  {
    this.mResponder = paramVineServiceResponder;
  }

  public int describeContents()
  {
    return 0;
  }

  public VineServiceResponder getResponder()
  {
    return this.mResponder;
  }

  public void onServiceResponse(Bundle paramBundle)
  {
    this.mResponder.onServiceResponse(paramBundle.getInt("action_code", 0), paramBundle.getInt("resp_code", 0), paramBundle.getString("reason_phrase"), paramBundle);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeStrongBinder(this.mResponder);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.VineServiceCallback
 * JD-Core Version:    0.6.2
 */