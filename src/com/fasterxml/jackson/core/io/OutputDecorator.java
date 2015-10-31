package com.fasterxml.jackson.core.io;

import java.io.IOException;
import java.io.OutputStream;
import java.io.Serializable;
import java.io.Writer;

public abstract class OutputDecorator
  implements Serializable
{
  private static final long serialVersionUID = 1L;

  public abstract OutputStream decorate(IOContext paramIOContext, OutputStream paramOutputStream)
    throws IOException;

  public abstract Writer decorate(IOContext paramIOContext, Writer paramWriter)
    throws IOException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.io.OutputDecorator
 * JD-Core Version:    0.6.2
 */