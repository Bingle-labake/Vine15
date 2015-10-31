package co.vine.android.api;

import android.database.Cursor;
import android.os.Parcel;
import android.os.Parcelable;

public class VineChannel
  implements Parcelable, Comparable<VineChannel>
{
  public String backgroundColor;
  public String channel;
  public long channelId;
  public long created;
  public String fontColor;
  public boolean isLast;
  public long lastUsedTimestamp;
  public String retinaIconUrl;

  public VineChannel()
  {
  }

  public VineChannel(Parcel paramParcel)
  {
    this.channelId = paramParcel.readLong();
    this.created = paramParcel.readLong();
    this.lastUsedTimestamp = paramParcel.readLong();
    this.channel = paramParcel.readString();
    this.retinaIconUrl = paramParcel.readString();
    this.backgroundColor = paramParcel.readString();
    this.fontColor = paramParcel.readString();
    if (paramParcel.readInt() == i);
    while (true)
    {
      this.isLast = i;
      return;
      i = 0;
    }
  }

  public static VineChannel from(Cursor paramCursor)
  {
    int i = 1;
    VineChannel localVineChannel = new VineChannel();
    localVineChannel.channelId = paramCursor.getLong(i);
    localVineChannel.created = paramCursor.getLong(3);
    localVineChannel.lastUsedTimestamp = paramCursor.getLong(7);
    localVineChannel.channel = paramCursor.getString(2);
    localVineChannel.retinaIconUrl = paramCursor.getString(4);
    localVineChannel.backgroundColor = paramCursor.getString(5);
    localVineChannel.fontColor = paramCursor.getString(6);
    if (paramCursor.getInt(8) == i);
    while (true)
    {
      localVineChannel.isLast = i;
      return localVineChannel;
      i = 0;
    }
  }

  public int compareTo(VineChannel paramVineChannel)
  {
    return Long.valueOf(paramVineChannel.channelId).compareTo(Long.valueOf(this.channelId));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VineChannel localVineChannel;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVineChannel = (VineChannel)paramObject;
      if (this.isLast != localVineChannel.isLast)
        return false;
      if (this.channelId != localVineChannel.channelId)
        return false;
      if (this.created != localVineChannel.created)
        return false;
      if (this.lastUsedTimestamp != localVineChannel.lastUsedTimestamp)
        return false;
      if (this.channel != null)
      {
        if (this.channel.equals(localVineChannel.channel));
      }
      else
        while (localVineChannel.channel != null)
          return false;
      if (this.retinaIconUrl != null)
      {
        if (this.retinaIconUrl.equals(localVineChannel.retinaIconUrl));
      }
      else
        while (localVineChannel.retinaIconUrl != null)
          return false;
      if (this.backgroundColor != null)
      {
        if (this.backgroundColor.equals(localVineChannel.backgroundColor));
      }
      else
        while (localVineChannel.backgroundColor != null)
          return false;
      if (this.fontColor == null)
        break;
    }
    while (this.fontColor.equals(localVineChannel.fontColor));
    while (true)
    {
      return false;
      if (localVineChannel.fontColor == null)
        break;
    }
  }

  public int hashCode()
  {
    int i = 31 * (31 * (31 * (int)(this.channelId ^ this.channelId >>> 32) + (int)(this.created ^ this.created >>> 32)) + (int)(this.lastUsedTimestamp ^ this.lastUsedTimestamp >>> 32));
    int j;
    int m;
    label83: int i1;
    label108: int i2;
    if (this.isLast)
    {
      j = 1;
      int k = 31 * (i + j);
      if (this.channel == null)
        break label178;
      m = this.channel.hashCode();
      int n = 31 * (k + m);
      if (this.retinaIconUrl == null)
        break label184;
      i1 = this.retinaIconUrl.hashCode();
      i2 = 31 * (n + i1);
      if (this.backgroundColor == null)
        break label190;
    }
    label178: label184: label190: for (int i3 = this.backgroundColor.hashCode(); ; i3 = 0)
    {
      int i4 = 31 * (i2 + i3);
      String str = this.fontColor;
      int i5 = 0;
      if (str != null)
        i5 = this.fontColor.hashCode();
      return i4 + i5;
      j = 0;
      break;
      m = 0;
      break label83;
      i1 = 0;
      break label108;
    }
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(this.channelId);
    paramParcel.writeLong(this.created);
    paramParcel.writeLong(this.lastUsedTimestamp);
    paramParcel.writeString(this.channel);
    paramParcel.writeString(this.retinaIconUrl);
    paramParcel.writeString(this.backgroundColor);
    paramParcel.writeString(this.fontColor);
    if (this.isLast);
    for (int i = 1; ; i = 0)
    {
      paramParcel.writeInt(i);
      return;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineChannel
 * JD-Core Version:    0.6.2
 */