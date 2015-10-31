package co.vine.android.util;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class PipingInputStream extends FilterInputStream
{
  private InputStream mInputStream;
  private OutputStream mOutputStream;

  public PipingInputStream(InputStream paramInputStream, OutputStream paramOutputStream)
  {
    super(paramInputStream);
    if (paramInputStream == null)
      throw new IllegalArgumentException("InputStream cannot be null");
    this.mInputStream = paramInputStream;
    this.mOutputStream = paramOutputStream;
  }

  public int read()
    throws IOException
  {
    int i = this.mInputStream.read();
    if ((i != -1) && (this.mOutputStream != null))
      this.mOutputStream.write(i);
    return i;
  }

  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = this.mInputStream.read(paramArrayOfByte, paramInt1, paramInt2);
    if ((i != -1) && (this.mOutputStream != null))
      this.mOutputStream.write(paramArrayOfByte, paramInt1, i);
    return i;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.PipingInputStream
 * JD-Core Version:    0.6.2
 */