package co.vine.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import android.os.Parcelable.Creator;
import android.text.style.ForegroundColorSpan;
import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;
import java.util.ArrayList;
import java.util.HashMap;

public class VineEntity
  implements Externalizable, Comparable<VineEntity>, Parcelable
{
  public static final Parcelable.Creator<VineEntity> CREATOR = new Parcelable.Creator()
  {
    public VineEntity createFromParcel(Parcel paramAnonymousParcel)
    {
      return new VineEntity(paramAnonymousParcel);
    }

    public VineEntity[] newArray(int paramAnonymousInt)
    {
      return new VineEntity[paramAnonymousInt];
    }
  };
  public static final String TYPE_MENTION = "mention";
  public static final String TYPE_POST = "post";
  public static final String TYPE_TAG = "tag";
  public static final String TYPE_USER = "user";
  private static final long serialVersionUID = -4017215936161446091L;
  public boolean adjusted = false;
  public int end;
  public long id;
  public String link;
  public int start;
  public String title;
  public String type;

  public VineEntity()
  {
  }

  public VineEntity(Parcel paramParcel)
  {
    this.type = paramParcel.readString();
    this.title = paramParcel.readString();
    this.link = paramParcel.readString();
    this.start = paramParcel.readInt();
    this.end = paramParcel.readInt();
    this.id = paramParcel.readLong();
    int i = paramParcel.readInt();
    boolean bool = false;
    if (i > 0)
      bool = true;
    this.adjusted = bool;
  }

  public VineEntity(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2, long paramLong)
  {
    this.type = paramString1;
    this.title = paramString2;
    this.link = paramString3;
    this.start = paramInt1;
    this.end = paramInt2;
    this.id = paramLong;
    this.adjusted = false;
  }

  public VineEntity clone()
  {
    return new VineEntity(this.type, this.title, this.link, this.start, this.end, this.id);
  }

  public int compareTo(VineEntity paramVineEntity)
  {
    return Integer.valueOf(this.end).compareTo(Integer.valueOf(paramVineEntity.end));
  }

  public int describeContents()
  {
    return 0;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    VineEntity localVineEntity;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localVineEntity = (VineEntity)paramObject;
      if (this.adjusted != localVineEntity.adjusted)
        return false;
      if (this.end != localVineEntity.end)
        return false;
      if (this.id != localVineEntity.id)
        return false;
      if (this.start != localVineEntity.start)
        return false;
      if (this.link != null)
      {
        if (this.link.equals(localVineEntity.link));
      }
      else
        while (localVineEntity.link != null)
          return false;
      if (this.title != null)
      {
        if (this.title.equals(localVineEntity.title));
      }
      else
        while (localVineEntity.title != null)
          return false;
      if (this.type == null)
        break;
    }
    while (this.type.equals(localVineEntity.type));
    while (true)
    {
      return false;
      if (localVineEntity.type == null)
        break;
    }
  }

  public int hashCode()
  {
    int i;
    int k;
    label35: int m;
    if (this.type != null)
    {
      i = this.type.hashCode();
      int j = i * 31;
      if (this.title == null)
        break label130;
      k = this.title.hashCode();
      m = 31 * (j + k);
      if (this.link == null)
        break label135;
    }
    label130: label135: for (int n = this.link.hashCode(); ; n = 0)
    {
      int i1 = 31 * (31 * (31 * (31 * (m + n) + this.start) + this.end) + (int)(this.id ^ this.id >>> 32));
      boolean bool = this.adjusted;
      int i2 = 0;
      if (bool)
        i2 = 1;
      return i1 + i2;
      i = 0;
      break;
      k = 0;
      break label35;
    }
  }

  public boolean isTagType()
  {
    return "tag".equals(this.type);
  }

  public boolean isUserType()
  {
    return ("user".equals(this.type)) || ("mention".equals(this.type)) || ("post".equals(this.type));
  }

  public void readExternal(ObjectInput paramObjectInput)
    throws IOException, ClassNotFoundException
  {
    this.type = ((String)paramObjectInput.readObject());
    this.title = ((String)paramObjectInput.readObject());
    this.link = ((String)paramObjectInput.readObject());
    this.start = paramObjectInput.readInt();
    this.end = paramObjectInput.readInt();
    this.id = paramObjectInput.readLong();
    this.adjusted = paramObjectInput.readBoolean();
  }

  public HashMap<String, Object> toMap()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("id", Long.valueOf(this.id));
    localHashMap.put("type", this.type);
    localHashMap.put("text", this.title);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(Integer.valueOf(this.start));
    localArrayList.add(Integer.valueOf(this.end));
    localHashMap.put("range", localArrayList);
    return localHashMap;
  }

  public void writeExternal(ObjectOutput paramObjectOutput)
    throws IOException
  {
    paramObjectOutput.writeObject(this.type);
    paramObjectOutput.writeObject(this.title);
    paramObjectOutput.writeObject(this.link);
    paramObjectOutput.writeInt(this.start);
    paramObjectOutput.writeInt(this.end);
    paramObjectOutput.writeLong(this.id);
    paramObjectOutput.writeBoolean(this.adjusted);
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    paramParcel.writeString(this.type);
    paramParcel.writeString(this.title);
    paramParcel.writeString(this.link);
    paramParcel.writeInt(this.start);
    paramParcel.writeInt(this.end);
    paramParcel.writeLong(this.id);
    if (this.adjusted);
    for (int i = 1; ; i = 0)
    {
      paramParcel.writeInt(i);
      return;
    }
  }

  public static class Range
  {
    public VineEntity entity;
    public ForegroundColorSpan span;
    public int upper;

    public Range(int paramInt, VineEntity paramVineEntity, ForegroundColorSpan paramForegroundColorSpan)
    {
      this.upper = paramInt;
      this.entity = paramVineEntity;
      this.span = paramForegroundColorSpan;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.api.VineEntity
 * JD-Core Version:    0.6.2
 */