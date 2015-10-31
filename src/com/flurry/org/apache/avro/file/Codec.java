package com.flurry.org.apache.avro.file;

import java.io.IOException;
import java.nio.ByteBuffer;

abstract class Codec
{
  abstract ByteBuffer compress(ByteBuffer paramByteBuffer)
    throws IOException;

  abstract ByteBuffer decompress(ByteBuffer paramByteBuffer)
    throws IOException;

  public abstract boolean equals(Object paramObject);

  abstract String getName();

  public abstract int hashCode();

  public String toString()
  {
    return getName();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.Codec
 * JD-Core Version:    0.6.2
 */