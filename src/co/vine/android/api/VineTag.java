package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;

public class VineTag
  implements Parcelable
{
  public static final Parcelable.Creator<VineTag> CREATOR = new Parcelable.Creator()
  {
    public VineTag createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineTag(paramAnonymousParcel);
    }

    public VineTag[] newArray(int paramAnonymousInt)
    {
      return new VineTag[paramAnonymousInt];
    }
  };
  public long created;
  public boolean deleted;
  public long tagId;
  public String tagName;

  public VineTag()
  {
  }

  public VineTag(Parcel paramParcel)
  {
    if (paramParcel.readInt() == i);
    while (true)
    {
      this.deleted = i;
      this.created = paramParcel.readLong();
      this.tagId = paramParcel.readLong();
      this.tagName = paramParcel.readString();
      return;
      i = 0;
    }
  }

  public VineTag(String paramString, long paramLong)
  {
    this.tagName = paramString;
    this.tagId = paramLong;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    if (this.deleted);
    for (int i = 1; ; i = 0)
    {
      paramParcel.writeInt(i);
      paramParcel.writeLong(this.created);
      paramParcel.writeLong(this.tagId);
      paramParcel.writeString(this.tagName);
      return;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineTag
 * JD-Core Version:    0.6.2
 */