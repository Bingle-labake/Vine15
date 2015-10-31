package com.flurry.org.apache.avro.file;

import java.io.Closeable;
import java.io.IOException;

public abstract interface SeekableInput extends Closeable
{
  public abstract long length()
    throws IOException;

  public abstract int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException;

  public abstract void seek(long paramLong)
    throws IOException;

  public abstract long tell()
    throws IOException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.SeekableInput
 * JD-Core Version:    0.6.2
 */