package co.vine.android.network;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class DefaultHttpOperationReader
  implements HttpOperationReader
{
  private final byte[] mBuffer = new byte[2048];
  private final OutputStream mOutputStream;
  private final ProgressListener mProgressListener;

  public DefaultHttpOperationReader()
  {
    this(null, null);
  }

  public DefaultHttpOperationReader(OutputStream paramOutputStream, ProgressListener paramProgressListener)
  {
    this.mOutputStream = paramOutputStream;
    this.mProgressListener = paramProgressListener;
  }

  public void onHandleError(HttpResult paramHttpResult)
  {
  }

  public final void readInput(int paramInt1, int paramInt2, InputStream paramInputStream)
    throws IOException
  {
    Object localObject1;
    if ((this.mOutputStream != null) && (this.mProgressListener != null))
      localObject1 = new CountingOutputStream(this.mOutputStream, paramInt2, this.mProgressListener);
    while (true)
    {
      byte[] arrayOfByte = this.mBuffer;
      if (paramInt2 < 0)
        try
        {
          while (true)
          {
            int k = paramInputStream.read(arrayOfByte, 0, arrayOfByte.length);
            if (k == -1)
              break;
            if (localObject1 != null)
              ((OutputStream)localObject1).write(arrayOfByte, 0, k);
          }
        }
        finally
        {
          while (paramInputStream.read(arrayOfByte, 0, arrayOfByte.length) != -1);
          if (localObject1 == null);
        }
      try
      {
        ((OutputStream)localObject1).flush();
        ((OutputStream)localObject1).close();
        throw localObject2;
        localObject1 = this.mOutputStream;
        continue;
        int i = paramInt2;
        while (i > 0)
        {
          int j = paramInputStream.read(arrayOfByte, 0, Math.min(i, arrayOfByte.length));
          if (j == -1)
            throw new IOException("Invalid content length: " + i);
          if (j > 0)
          {
            i -= j;
            if (localObject1 != null)
              ((OutputStream)localObject1).write(arrayOfByte, 0, j);
          }
        }
        while (paramInputStream.read(arrayOfByte, 0, arrayOfByte.length) != -1);
        if (localObject1 == null);
      }
      catch (IOException localIOException2)
      {
        try
        {
          ((OutputStream)localObject1).flush();
          ((OutputStream)localObject1).close();
          return;
          localIOException2 = localIOException2;
        }
        catch (IOException localIOException1)
        {
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.DefaultHttpOperationReader
 * JD-Core Version:    0.6.2
 */