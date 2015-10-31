package com.flurry.org.apache.avro.file;

import java.io.IOException;
import java.nio.ByteBuffer;

final class NullCodec extends Codec
{
  private static final NullCodec INSTANCE = new NullCodec();
  public static final CodecFactory OPTION = new Option();

  ByteBuffer compress(ByteBuffer paramByteBuffer)
    throws IOException
  {
    return paramByteBuffer;
  }

  ByteBuffer decompress(ByteBuffer paramByteBuffer)
    throws IOException
  {
    return paramByteBuffer;
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    while (getClass() == paramObject.getClass())
      return true;
    return false;
  }

  String getName()
  {
    return "null";
  }

  public int hashCode()
  {
    return 2;
  }

  static class Option extends CodecFactory
  {
    protected Codec createInstance()
    {
      return NullCodec.INSTANCE;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.NullCodec
 * JD-Core Version:    0.6.2
 */