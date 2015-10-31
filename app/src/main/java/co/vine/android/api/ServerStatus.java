package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;

public class ServerStatus
  implements Parcelable
{
  public static final String MEDIA_UPLOAD = "media";
  public static final String S3_UPLOAD = "s3";
  public String message;
  public String staticTimelineUrl;
  public String status;
  public String title;
  public String uploadType;

  public ServerStatus(Parcel paramParcel)
  {
    this.uploadType = paramParcel.readString();
    this.status = paramParcel.readString();
    this.title = paramParcel.readString();
    this.staticTimelineUrl = paramParcel.readString();
    this.message = paramParcel.readString();
  }

  public ServerStatus(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    this.uploadType = paramString1;
    this.status = paramString2;
    this.title = paramString3;
    this.staticTimelineUrl = paramString4;
    this.message = paramString5;
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    ServerStatus localServerStatus;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localServerStatus = (ServerStatus)paramObject;
      if (this.message != null)
      {
        if (this.message.equals(localServerStatus.message));
      }
      else
        while (localServerStatus.message != null)
          return false;
      if (this.staticTimelineUrl != null)
      {
        if (this.staticTimelineUrl.equals(localServerStatus.staticTimelineUrl));
      }
      else
        while (localServerStatus.staticTimelineUrl != null)
          return false;
      if (this.status != null)
      {
        if (this.status.equals(localServerStatus.status));
      }
      else
        while (localServerStatus.status != null)
          return false;
      if (this.title != null)
      {
        if (this.title.equals(localServerStatus.title));
      }
      else
        while (localServerStatus.title != null)
          return false;
      if (this.uploadType == null)
        break;
    }
    while (this.uploadType.equals(localServerStatus.uploadType));
    while (true)
    {
      return false;
      if (localServerStatus.uploadType == null)
        break;
    }
  }

  public int hashCode()
  {
    int i;
    int k;
    label35: int n;
    label59: int i1;
    if (this.uploadType != null)
    {
      i = this.uploadType.hashCode();
      int j = i * 31;
      if (this.status == null)
        break label129;
      k = this.status.hashCode();
      int m = 31 * (j + k);
      if (this.title == null)
        break label134;
      n = this.title.hashCode();
      i1 = 31 * (m + n);
      if (this.staticTimelineUrl == null)
        break label140;
    }
    label129: label134: label140: for (int i2 = this.staticTimelineUrl.hashCode(); ; i2 = 0)
    {
      int i3 = 31 * (i1 + i2);
      String str = this.message;
      int i4 = 0;
      if (str != null)
        i4 = this.message.hashCode();
      return i3 + i4;
      i = 0;
      break;
      k = 0;
      break label35;
      n = 0;
      break label59;
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.uploadType);
    paramParcel.writeString(this.status);
    paramParcel.writeString(this.title);
    paramParcel.writeString(this.staticTimelineUrl);
    paramParcel.writeString(this.message);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.ServerStatus
 * JD-Core Version:    0.6.2
 */