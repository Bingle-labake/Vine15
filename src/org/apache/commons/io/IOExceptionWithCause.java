package org.apache.commons.io;

import java.io.IOException;

public class IOExceptionWithCause extends IOException
{
  private static final long serialVersionUID = 1L;

  public IOExceptionWithCause(String paramString, Throwable paramThrowable)
  {
    super(paramString);
    initCause(paramThrowable);
  }

  public IOExceptionWithCause(Throwable paramThrowable)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.apache.commons.io.IOExceptionWithCause
 * JD-Core Version:    0.6.2
 */