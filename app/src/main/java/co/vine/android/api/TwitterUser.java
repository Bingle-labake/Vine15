package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class TwitterUser
  implements Parcelable
{
  public static final Parcelable.Creator<TwitterUser> CREATOR = new Parcelable.Creator()
  {
    public TwitterUser createFromParcel(Parcel paramAnonymousParcel)
    {
      return new TwitterUser(paramAnonymousParcel);
    }

    public TwitterUser[] newArray(int paramAnonymousInt)
    {
      return new TwitterUser[paramAnonymousInt];
    }
  };
  public boolean defaultProfileImage;
  public String description;
  public String location;
  public String name;
  public String profileUrl;
  public String screenName;
  public String url;
  public long userId;

  public TwitterUser(Parcel paramParcel)
  {
    this.name = paramParcel.readString();
    this.screenName = paramParcel.readString();
    this.location = paramParcel.readString();
    this.description = paramParcel.readString();
    this.url = paramParcel.readString();
    this.profileUrl = paramParcel.readString();
    if (paramParcel.readInt() == i);
    while (true)
    {
      this.defaultProfileImage = i;
      this.userId = paramParcel.readLong();
      return;
      i = 0;
    }
  }

  public TwitterUser(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, boolean paramBoolean, long paramLong)
  {
    this.name = paramString1;
    this.screenName = paramString2;
    this.location = paramString3;
    this.description = paramString4;
    this.url = paramString5;
    this.profileUrl = paramString6;
    this.defaultProfileImage = paramBoolean;
    this.userId = paramLong;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    TwitterUser localTwitterUser;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localTwitterUser = (TwitterUser)paramObject;
      if (this.defaultProfileImage != localTwitterUser.defaultProfileImage)
        return false;
      if (this.userId != localTwitterUser.userId)
        return false;
      if (this.description != null)
      {
        if (this.description.equals(localTwitterUser.description));
      }
      else
        while (localTwitterUser.description != null)
          return false;
      if (this.location != null)
      {
        if (this.location.equals(localTwitterUser.location));
      }
      else
        while (localTwitterUser.location != null)
          return false;
      if (this.name != null)
      {
        if (this.name.equals(localTwitterUser.name));
      }
      else
        while (localTwitterUser.name != null)
          return false;
      if (this.profileUrl != null)
      {
        if (this.profileUrl.equals(localTwitterUser.profileUrl));
      }
      else
        while (localTwitterUser.profileUrl != null)
          return false;
      if (this.screenName != null)
      {
        if (this.screenName.equals(localTwitterUser.screenName));
      }
      else
        while (localTwitterUser.screenName != null)
          return false;
      if (this.url == null)
        break;
    }
    while (this.url.equals(localTwitterUser.url));
    while (true)
    {
      return false;
      if (localTwitterUser.url == null)
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
    if (this.name != null)
    {
      i = this.name.hashCode();
      int j = i * 31;
      if (this.screenName == null)
        break label192;
      k = this.screenName.hashCode();
      int m = 31 * (j + k);
      if (this.location == null)
        break label197;
      n = this.location.hashCode();
      int i1 = 31 * (m + n);
      if (this.description == null)
        break label203;
      i2 = this.description.hashCode();
      int i3 = 31 * (i1 + i2);
      if (this.url == null)
        break label209;
      i4 = this.url.hashCode();
      i5 = 31 * (i3 + i4);
      if (this.profileUrl == null)
        break label215;
    }
    label192: label197: label203: label209: label215: for (int i6 = this.profileUrl.hashCode(); ; i6 = 0)
    {
      int i7 = 31 * (i5 + i6);
      boolean bool = this.defaultProfileImage;
      int i8 = 0;
      if (bool)
        i8 = 1;
      return 31 * (i7 + i8) + (int)(this.userId ^ this.userId >>> 32);
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
    paramParcel.writeString(this.name);
    paramParcel.writeString(this.screenName);
    paramParcel.writeString(this.location);
    paramParcel.writeString(this.description);
    paramParcel.writeString(this.url);
    paramParcel.writeString(this.profileUrl);
    if (this.defaultProfileImage);
    for (int i = 1; ; i = 0)
    {
      paramParcel.writeInt(i);
      paramParcel.writeLong(this.userId);
      return;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.TwitterUser
 * JD-Core Version:    0.6.2
 */