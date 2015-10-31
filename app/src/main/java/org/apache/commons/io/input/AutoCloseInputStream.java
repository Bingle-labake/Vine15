package org.apache.commons.io.input;

import java.io.IOException;
import java.io.InputStream;

public class AutoCloseInputStream extends ProxyInputStream
{
  public AutoCloseInputStream(InputStream paramInputStream)
  {
    super(paramInputStream);
  }

  protected void afterRead(int paramInt)
    throws IOException
  {
    if (paramInt == -1)
      close();
  }

  public void close()
    throws IOException
  {
    this.in.close();
    this.in = new ClosedInputStream();
  }

  protected void finalize()
    throws Throwable
  {
    close();
    super.finalize();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.input.AutoCloseInputStream
 * JD-Core Version:    0.6.2
 */