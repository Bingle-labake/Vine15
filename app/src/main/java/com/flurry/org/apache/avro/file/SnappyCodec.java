package com.flurry.org.apache.avro.file;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.zip.CRC32;
import org.xerial.snappy.Snappy;

class SnappyCodec extends Codec
{
  private CRC32 crc32 = new CRC32();

  ByteBuffer compress(ByteBuffer paramByteBuffer)
    throws IOException
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(4 + Snappy.maxCompressedLength(paramByteBuffer.remaining()));
    int i = Snappy.compress(paramByteBuffer.array(), paramByteBuffer.position(), paramByteBuffer.remaining(), localByteBuffer.array(), 0);
    this.crc32.reset();
    this.crc32.update(paramByteBuffer.array(), paramByteBuffer.position(), paramByteBuffer.remaining());
    localByteBuffer.putInt(i, (int)this.crc32.getValue());
    localByteBuffer.limit(i + 4);
    return localByteBuffer;
  }

  ByteBuffer decompress(ByteBuffer paramByteBuffer)
    throws IOException
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(Snappy.uncompressedLength(paramByteBuffer.array(), paramByteBuffer.position(), -4 + paramByteBuffer.remaining()));
    int i = Snappy.uncompress(paramByteBuffer.array(), paramByteBuffer.position(), -4 + paramByteBuffer.remaining(), localByteBuffer.array(), 0);
    localByteBuffer.limit(i);
    this.crc32.reset();
    this.crc32.update(localByteBuffer.array(), 0, i);
    if (paramByteBuffer.getInt(-4 + paramByteBuffer.limit()) != (int)this.crc32.getValue())
      throw new IOException("Checksum failure");
    return localByteBuffer;
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
    return "snappy";
  }

  public int hashCode()
  {
    return getName().hashCode();
  }

  static class Option extends CodecFactory
  {
    protected Codec createInstance()
    {
      return new SnappyCodec(null);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.SnappyCodec
 * JD-Core Version:    0.6.2
 */