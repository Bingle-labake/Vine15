package org.apache.commons.io.output;

import java.io.IOException;
import java.io.OutputStream;

public class ClosedOutputStream extends OutputStream
{
  public static final ClosedOutputStream CLOSED_OUTPUT_STREAM = new ClosedOutputStream();

  public void write(int paramInt)
    throws IOException
  {
    throw new IOException("write(" + paramInt + ") failed: stream is closed");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.output.ClosedOutputStream
 * JD-Core Version:    0.6.2
 */