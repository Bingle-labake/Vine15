package com.crashlytics.android;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.List;

final class k
{
  private static k b = new k(new byte[0]);
  private final byte[] a;
  private volatile int c = 0;

  private k(byte[] paramArrayOfByte)
  {
    this.a = paramArrayOfByte;
  }

  public static k a(String paramString)
  {
    try
    {
      k localk = new k(paramString.getBytes("UTF-8"));
      return localk;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException("UTF-8 not supported.", localUnsupportedEncodingException);
    }
  }

  public static k a(ByteBuffer paramByteBuffer)
  {
    byte[] arrayOfByte = new byte[paramByteBuffer.remaining()];
    paramByteBuffer.get(arrayOfByte);
    return new k(arrayOfByte);
  }

  public static k a(List<k> paramList)
  {
    if (paramList.size() == 0)
      return b;
    if (paramList.size() == 1)
      return (k)paramList.get(0);
    Iterator localIterator1 = paramList.iterator();
    int i = 0;
    while (localIterator1.hasNext())
      i += ((k)localIterator1.next()).a.length;
    byte[] arrayOfByte = new byte[i];
    Iterator localIterator2 = paramList.iterator();
    int j = 0;
    while (localIterator2.hasNext())
    {
      k localk = (k)localIterator2.next();
      System.arraycopy(localk.a, 0, arrayOfByte, j, localk.a.length);
      j += localk.a.length;
    }
    return new k(arrayOfByte);
  }

  public final int a()
  {
    return this.a.length;
  }

  public final void a(byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
  {
    System.arraycopy(this.a, paramInt1, paramArrayOfByte, paramInt2, paramInt3);
  }

  public final InputStream b()
  {
    return new ByteArrayInputStream(this.a);
  }

  public final boolean equals(Object paramObject)
  {
    if (paramObject == this);
    while (true)
    {
      return true;
      if (!(paramObject instanceof k))
        return false;
      k localk = (k)paramObject;
      int i = this.a.length;
      if (i != localk.a.length)
        return false;
      byte[] arrayOfByte1 = this.a;
      byte[] arrayOfByte2 = localk.a;
      for (int j = 0; j < i; j++)
        if (arrayOfByte1[j] != arrayOfByte2[j])
          return false;
    }
  }

  public final int hashCode()
  {
    int i = this.c;
    if (i == 0)
    {
      byte[] arrayOfByte = this.a;
      int j = this.a.length;
      int k = 0;
      int m;
      for (i = j; k < j; i = m)
      {
        m = i * 31 + arrayOfByte[k];
        k++;
      }
      if (i == 0)
        i = 1;
      this.c = i;
    }
    return i;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.k
 * JD-Core Version:    0.6.2
 */