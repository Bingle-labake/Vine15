package com.flurry.org.apache.avro.file;

import java.io.ByteArrayInputStream;
import java.io.IOException;

public class SeekableByteArrayInput extends ByteArrayInputStream
  implements SeekableInput
{
  public SeekableByteArrayInput(byte[] paramArrayOfByte)
  {
    super(paramArrayOfByte);
  }

  public long length()
    throws IOException
  {
    return this.count;
  }

  public void seek(long paramLong)
    throws IOException
  {
    reset();
    skip(paramLong);
  }

  public long tell()
    throws IOException
  {
    return this.pos;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.SeekableByteArrayInput
 * JD-Core Version:    0.6.2
 */