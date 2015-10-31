package com.google.android.gms.common.data;

import com.google.android.gms.internal.i;
import com.google.android.gms.internal.k;
import java.util.Iterator;

public abstract class DataBuffer<T>
  implements Iterable<T>
{
  protected final k O;

  public DataBuffer(k paramk)
  {
    this.O = paramk;
  }

  public void close()
  {
    this.O.close();
  }

  public int describeContents()
  {
    return 0;
  }

  public abstract T get(int paramInt);

  public int getCount()
  {
    return this.O.getCount();
  }

  public boolean isClosed()
  {
    return this.O.isClosed();
  }

  public Iterator<T> iterator()
  {
    return new i(this);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.common.data.DataBuffer
 * JD-Core Version:    0.6.2
 */