package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VineTypeAhead
  implements Parcelable
{
  public static final Parcelable.Creator<VineTypeAhead> CREATOR = new Parcelable.Creator()
  {
    public VineTypeAhead createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineTypeAhead(paramAnonymousParcel);
    }

    public VineTypeAhead[] newArray(int paramAnonymousInt)
    {
      return new VineTypeAhead[paramAnonymousInt];
    }
  };
  public long id;
  public final String token;
  public final String type;

  public VineTypeAhead(Parcel paramParcel)
  {
    this.id = paramParcel.readLong();
    this.token = paramParcel.readString();
    this.type = paramParcel.readString();
  }

  public VineTypeAhead(String paramString1, String paramString2, long paramLong)
  {
    this.id = paramLong;
    this.token = paramString2;
    this.type = paramString1;
  }

  public static String getPlainTag(String paramString)
  {
    return paramString.substring(1, paramString.length());
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(this.id);
    paramParcel.writeString(this.token);
    paramParcel.writeString(this.type);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineTypeAhead
 * JD-Core Version:    0.6.2
 */