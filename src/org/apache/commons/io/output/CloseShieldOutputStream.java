package org.apache.commons.io.output;

import java.io.OutputStream;

public class CloseShieldOutputStream extends ProxyOutputStream
{
  public CloseShieldOutputStream(OutputStream paramOutputStream)
  {
    super(paramOutputStream);
  }

  public void close()
  {
    this.out = new ClosedOutputStream();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.output.CloseShieldOutputStream
 * JD-Core Version:    0.6.2
 */