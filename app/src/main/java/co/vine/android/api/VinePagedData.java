package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import java.util.ArrayList;

public class VinePagedData<T extends Parcelable>
  implements Parcelable
{
  public static final Parcelable.Creator<VinePagedData> CREATOR = new Parcelable.Creator()
  {
    public VinePagedData createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VinePagedData(paramAnonymousParcel);
    }

    public VinePagedData[] newArray(int paramAnonymousInt)
    {
      return new VinePagedData[paramAnonymousInt];
    }
  };
  public long anchor;
  public int count;
  public ArrayList<T> items;
  public int nextPage;
  public int previousPage = -1;
  public int size;
  public String title;

  public VinePagedData()
  {
  }

  public VinePagedData(Parcel paramParcel)
  {
    this.anchor = paramParcel.readLong();
    this.count = paramParcel.readInt();
    this.nextPage = paramParcel.readInt();
    this.previousPage = paramParcel.readInt();
    this.size = paramParcel.readInt();
    this.items = paramParcel.readArrayList(getClass().getClassLoader());
    this.title = paramParcel.readString();
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeLong(this.anchor);
    paramParcel.writeInt(this.count);
    paramParcel.writeInt(this.nextPage);
    paramParcel.writeInt(this.previousPage);
    paramParcel.writeInt(this.size);
    paramParcel.writeTypedList(this.items);
    paramParcel.writeString(this.title);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VinePagedData
 * JD-Core Version:    0.6.2
 */