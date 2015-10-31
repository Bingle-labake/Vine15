package co.vine.android.util;

import java.io.IOException;
import java.io.InputStream;

public class MeasureInputStream extends InputStream
{
  private final InputStream mInputStream;
  private long mReadTimeMs;
  private long mReadTimeNs;

  public MeasureInputStream(InputStream paramInputStream)
  {
    this.mInputStream = paramInputStream;
    this.mReadTimeMs = 0L;
  }

  public int available()
    throws IOException
  {
    return this.mInputStream.available();
  }

  public void close()
    throws IOException
  {
    this.mInputStream.close();
  }

  public long getReadTime()
  {
    return this.mReadTimeMs + this.mReadTimeNs / 1000000L;
  }

  public void mark(int paramInt)
  {
    this.mInputStream.mark(paramInt);
  }

  public boolean markSupported()
  {
    return this.mInputStream.markSupported();
  }

  public int read()
    throws IOException
  {
    long l = System.nanoTime();
    int i = this.mInputStream.read();
    this.mReadTimeNs += System.nanoTime() - l;
    return i;
  }

  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    long l = System.currentTimeMillis();
    int i = this.mInputStream.read(paramArrayOfByte);
    this.mReadTimeMs += System.currentTimeMillis() - l;
    return i;
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    long l = System.currentTimeMillis();
    int i = this.mInputStream.read(paramArrayOfByte, paramInt1, paramInt2);
    this.mReadTimeMs += System.currentTimeMillis() - l;
    return i;
  }

  public void reset()
    throws IOException
  {
    try
    {
      this.mInputStream.reset();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public long skip(long paramLong)
    throws IOException
  {
    long l1 = System.currentTimeMillis();
    long l2 = super.skip(paramLong);
    this.mReadTimeMs += System.currentTimeMillis() - l1;
    return l2;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.MeasureInputStream
 * JD-Core Version:    0.6.2
 */