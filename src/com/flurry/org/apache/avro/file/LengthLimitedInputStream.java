package com.flurry.org.apache.avro.file;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

class LengthLimitedInputStream extends FilterInputStream
{
  private long remaining;

  protected LengthLimitedInputStream(InputStream paramInputStream, long paramLong)
  {
    super(paramInputStream);
    this.remaining = paramLong;
  }

  private int remainingInt()
  {
    return (int)Math.min(this.remaining, 2147483647L);
  }

  public int available()
    throws IOException
  {
    return Math.min(super.available(), remainingInt());
  }

  public int read()
    throws IOException
  {
    if (this.remaining > 0L)
    {
      int i = super.read();
      if (i != -1)
        this.remaining -= 1L;
      return i;
    }
    return -1;
  }

  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i;
    if (this.remaining == 0L)
      i = -1;
    do
    {
      return i;
      if (paramInt2 > this.remaining)
        paramInt2 = remainingInt();
      i = super.read(paramArrayOfByte, paramInt1, paramInt2);
    }
    while (i == -1);
    this.remaining -= i;
    return i;
  }

  public long skip(long paramLong)
    throws IOException
  {
    long l = super.skip(Math.min(this.remaining, paramLong));
    this.remaining -= l;
    return l;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.LengthLimitedInputStream
 * JD-Core Version:    0.6.2
 */