package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;

public final class eh extends j
  implements Moment
{
  private ef iS;

  public eh(k paramk, int paramInt)
  {
    super(paramk, paramInt);
  }

  private ef bS()
  {
    try
    {
      if (this.iS == null)
      {
        byte[] arrayOfByte = getByteArray("momentImpl");
        Parcel localParcel = Parcel.obtain();
        localParcel.unmarshall(arrayOfByte, 0, arrayOfByte.length);
        localParcel.setDataPosition(0);
        this.iS = ef.CREATOR.w(localParcel);
        localParcel.recycle();
      }
      return this.iS;
    }
    finally
    {
    }
  }

  public ef bR()
  {
    return bS();
  }

  public String getId()
  {
    return bS().getId();
  }

  public ItemScope getResult()
  {
    return bS().getResult();
  }

  public String getStartDate()
  {
    return bS().getStartDate();
  }

  public ItemScope getTarget()
  {
    return bS().getTarget();
  }

  public String getType()
  {
    return bS().getType();
  }

  public boolean hasId()
  {
    return bS().hasId();
  }

  public boolean hasResult()
  {
    return bS().hasId();
  }

  public boolean hasStartDate()
  {
    return bS().hasStartDate();
  }

  public boolean hasTarget()
  {
    return bS().hasTarget();
  }

  public boolean hasType()
  {
    return bS().hasType();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.eh
 * JD-Core Version:    0.6.2
 */