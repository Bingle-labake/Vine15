package co.vine.android;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class PendingCaptchaRequest
  implements Parcelable
{
  public static final int CAPTCHA_STATE_FAIL_REQUEST = 3;
  public static final int CAPTCHA_STATE_RETRY_REQUEST = 2;
  public static final int CAPTCHA_STATE_UNHANDLED = 1;
  public static final Parcelable.Creator<PendingCaptchaRequest> CREATOR = new Parcelable.Creator()
  {
    public PendingCaptchaRequest createFromParcel(Parcel paramAnonymousParcel)
    {
      return new PendingCaptchaRequest(paramAnonymousParcel);
    }

    public PendingCaptchaRequest[] newArray(int paramAnonymousInt)
    {
      return new PendingCaptchaRequest[paramAnonymousInt];
    }
  };
  public final int actionCode;
  public final Bundle bundle;
  public final String reqId;
  public int state;

  public PendingCaptchaRequest(Parcel paramParcel)
  {
    this.reqId = paramParcel.readString();
    this.actionCode = paramParcel.readInt();
    this.bundle = paramParcel.readBundle();
    this.state = paramParcel.readInt();
  }

  public PendingCaptchaRequest(String paramString, int paramInt, Bundle paramBundle)
  {
    this.reqId = paramString;
    this.actionCode = paramInt;
    this.bundle = paramBundle;
    this.state = 1;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.reqId);
    paramParcel.writeInt(this.actionCode);
    paramParcel.writeBundle(this.bundle);
    paramParcel.writeInt(this.state);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.PendingCaptchaRequest
 * JD-Core Version:    0.6.2
 */