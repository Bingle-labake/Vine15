package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VineLogin
  implements Parcelable
{
  public static final Parcelable.Creator<VineLogin> CREATOR = new Parcelable.Creator()
  {
    public VineLogin createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineLogin(paramAnonymousParcel);
    }

    public VineLogin[] newArray(int paramAnonymousInt)
    {
      return new VineLogin[paramAnonymousInt];
    }
  };
  public static final int LOGIN_TYPE_EMAIL = 1;
  public static final int LOGIN_TYPE_TWITTER = 2;
  public String edition;
  public String key;
  public int loginType;
  public String name;
  public String twitterSecret;
  public String twitterToken;
  public long twitterUserId;
  public String twitterUsername;
  public long userId;
  public String username;

  public VineLogin(Parcel paramParcel)
  {
    this.key = paramParcel.readString();
    this.username = paramParcel.readString();
    this.name = paramParcel.readString();
    this.twitterUsername = paramParcel.readString();
    this.twitterToken = paramParcel.readString();
    this.twitterSecret = paramParcel.readString();
    this.userId = paramParcel.readLong();
    this.twitterUserId = paramParcel.readLong();
    this.loginType = paramParcel.readInt();
    this.edition = paramParcel.readString();
  }

  public VineLogin(String paramString1, String paramString2, long paramLong, String paramString3)
  {
    this.key = paramString1;
    this.username = paramString2;
    this.userId = paramLong;
    this.loginType = 1;
    this.edition = paramString3;
  }

  public VineLogin(String paramString1, String paramString2, String paramString3, String paramString4, long paramLong, String paramString5)
  {
    this.key = paramString1;
    this.twitterUsername = paramString2;
    this.twitterToken = paramString3;
    this.twitterSecret = paramString4;
    this.twitterUserId = paramLong;
    this.loginType = 2;
    this.edition = paramString5;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VineLogin localVineLogin;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVineLogin = (VineLogin)paramObject;
      if (this.loginType != localVineLogin.loginType)
        return false;
      if (this.twitterUserId != localVineLogin.twitterUserId)
        return false;
      if (this.userId != localVineLogin.userId)
        return false;
      if (this.key != null)
      {
        if (this.key.equals(localVineLogin.key));
      }
      else
        while (localVineLogin.key != null)
          return false;
      if (this.name != null)
      {
        if (this.name.equals(localVineLogin.name));
      }
      else
        while (localVineLogin.name != null)
          return false;
      if (this.twitterSecret != null)
      {
        if (this.twitterSecret.equals(localVineLogin.twitterSecret));
      }
      else
        while (localVineLogin.twitterSecret != null)
          return false;
      if (this.twitterToken != null)
      {
        if (this.twitterToken.equals(localVineLogin.twitterToken));
      }
      else
        while (localVineLogin.twitterToken != null)
          return false;
      if (this.twitterUsername != null)
      {
        if (this.twitterUsername.equals(localVineLogin.twitterUsername));
      }
      else
        while (localVineLogin.twitterUsername != null)
          return false;
      if (this.username != null)
      {
        if (this.username.equals(localVineLogin.username));
      }
      else
        while (localVineLogin.username != null)
          return false;
      if (this.edition == null)
        break;
    }
    while (this.edition.equals(localVineLogin.edition));
    while (true)
    {
      return false;
      if (localVineLogin.edition == null)
        break;
    }
  }

  public int hashCode()
  {
    int i;
    int k;
    label35: int n;
    label59: int i2;
    label85: int i4;
    label111: int i5;
    if (this.key != null)
    {
      i = this.key.hashCode();
      int j = i * 31;
      if (this.username == null)
        break label223;
      k = this.username.hashCode();
      int m = 31 * (j + k);
      if (this.name == null)
        break label228;
      n = this.name.hashCode();
      int i1 = 31 * (m + n);
      if (this.twitterToken == null)
        break label234;
      i2 = this.twitterToken.hashCode();
      int i3 = 31 * (i1 + i2);
      if (this.twitterSecret == null)
        break label240;
      i4 = this.twitterSecret.hashCode();
      i5 = 31 * (i3 + i4);
      if (this.twitterUsername == null)
        break label246;
    }
    label223: label228: label234: label240: label246: for (int i6 = this.twitterUsername.hashCode(); ; i6 = 0)
    {
      int i7 = 31 * (31 * (31 * (31 * (i5 + i6) + (int)(this.userId ^ this.userId >>> 32)) + (int)(this.twitterUserId ^ this.twitterUserId >>> 32)) + this.loginType);
      String str = this.edition;
      int i8 = 0;
      if (str != null)
        i8 = this.edition.hashCode();
      return i7 + i8;
      i = 0;
      break;
      k = 0;
      break label35;
      n = 0;
      break label59;
      i2 = 0;
      break label85;
      i4 = 0;
      break label111;
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.key);
    paramParcel.writeString(this.username);
    paramParcel.writeString(this.name);
    paramParcel.writeString(this.twitterUsername);
    paramParcel.writeString(this.twitterToken);
    paramParcel.writeString(this.twitterSecret);
    paramParcel.writeLong(this.userId);
    paramParcel.writeLong(this.twitterUserId);
    paramParcel.writeInt(this.loginType);
    paramParcel.writeString(this.edition);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineLogin
 * JD-Core Version:    0.6.2
 */