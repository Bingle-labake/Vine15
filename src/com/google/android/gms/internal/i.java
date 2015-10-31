package com.google.android.gms.internal;

import com.google.android.gms.common.data.DataBuffer;
import java.util.Iterator;
import java.util.NoSuchElementException;

public final class i<T>
  implements Iterator<T>
{
  private final DataBuffer<T> P;
  private int Q;

  public i(DataBuffer<T> paramDataBuffer)
  {
    this.P = ((DataBuffer)x.d(paramDataBuffer));
    this.Q = -1;
  }

  public boolean hasNext()
  {
    return this.Q < -1 + this.P.getCount();
  }

  public T next()
  {
    if (!hasNext())
      throw new NoSuchElementException("Cannot advance the iterator beyond " + this.Q);
    DataBuffer localDataBuffer = this.P;
    int i = 1 + this.Q;
    this.Q = i;
    return localDataBuffer.get(i);
  }

  public void remove()
  {
    throw new UnsupportedOperationException("Cannot remove elements from a DataBufferIterator");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.google.android.gms.internal.i
 * JD-Core Version:    0.6.2
 */