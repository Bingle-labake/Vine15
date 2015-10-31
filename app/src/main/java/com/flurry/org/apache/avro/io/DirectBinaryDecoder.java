package com.flurry.org.apache.avro.io;

import com.flurry.org.apache.avro.util.ByteBufferInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

class DirectBinaryDecoder extends BinaryDecoder
{
  private final byte[] buf = new byte[8];
  private ByteReader byteReader;
  private InputStream in;

  DirectBinaryDecoder(InputStream paramInputStream)
  {
    configure(paramInputStream);
  }

  DirectBinaryDecoder configure(InputStream paramInputStream)
  {
    this.in = paramInputStream;
    if ((paramInputStream instanceof ByteBufferInputStream));
    for (Object localObject = new ReuseByteReader((ByteBufferInputStream)paramInputStream); ; localObject = new ByteReader(null))
    {
      this.byteReader = ((ByteReader)localObject);
      return this;
    }
  }

  protected void doReadBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    while (true)
    {
      int i = this.in.read(paramArrayOfByte, paramInt1, paramInt2);
      if ((i == paramInt2) || (paramInt2 == 0))
        return;
      if (i < 0)
        throw new EOFException();
      paramInt1 += i;
      paramInt2 -= i;
    }
  }

  protected void doSkipBytes(long paramLong)
    throws IOException
  {
    while (paramLong > 0L)
    {
      long l = this.in.skip(paramLong);
      if (l <= 0L)
        throw new EOFException();
      paramLong -= l;
    }
  }

  public InputStream inputStream()
  {
    return this.in;
  }

  public boolean isEnd()
    throws IOException
  {
    throw new UnsupportedOperationException();
  }

  public boolean readBoolean()
    throws IOException
  {
    int i = this.in.read();
    if (i < 0)
      throw new EOFException();
    return i == 1;
  }

  public ByteBuffer readBytes(ByteBuffer paramByteBuffer)
    throws IOException
  {
    int i = readInt();
    return this.byteReader.read(paramByteBuffer, i);
  }

  public double readDouble()
    throws IOException
  {
    doReadBytes(this.buf, 0, 8);
    return Double.longBitsToDouble(0xFF & this.buf[0] | (0xFF & this.buf[1]) << 8 | (0xFF & this.buf[2]) << 16 | (0xFF & this.buf[3]) << 24 | (0xFF & this.buf[4]) << 32 | (0xFF & this.buf[5]) << 40 | (0xFF & this.buf[6]) << 48 | (0xFF & this.buf[7]) << 56);
  }

  public float readFloat()
    throws IOException
  {
    doReadBytes(this.buf, 0, 4);
    return Float.intBitsToFloat(0xFF & this.buf[0] | (0xFF & this.buf[1]) << 8 | (0xFF & this.buf[2]) << 16 | (0xFF & this.buf[3]) << 24);
  }

  public int readInt()
    throws IOException
  {
    int i = 0;
    int j = 0;
    do
    {
      int k = this.in.read();
      if (k >= 0)
      {
        i |= (k & 0x7F) << j;
        if ((k & 0x80) == 0)
          return i >>> 1 ^ -(i & 0x1);
      }
      else
      {
        throw new EOFException();
      }
      j += 7;
    }
    while (j < 32);
    throw new IOException("Invalid int encoding");
  }

  public long readLong()
    throws IOException
  {
    long l = 0L;
    int i = 0;
    do
    {
      int j = this.in.read();
      if (j >= 0)
      {
        l |= (0x7F & j) << i;
        if ((j & 0x80) == 0)
          return l >>> 1 ^ -(1L & l);
      }
      else
      {
        throw new EOFException();
      }
      i += 7;
    }
    while (i < 64);
    throw new IOException("Invalid long encoding");
  }

  private class ByteReader
  {
    private ByteReader()
    {
    }

    public ByteBuffer read(ByteBuffer paramByteBuffer, int paramInt)
      throws IOException
    {
      ByteBuffer localByteBuffer;
      if ((paramByteBuffer != null) && (paramInt <= paramByteBuffer.capacity()))
      {
        localByteBuffer = paramByteBuffer;
        localByteBuffer.clear();
      }
      while (true)
      {
        DirectBinaryDecoder.this.doReadBytes(localByteBuffer.array(), localByteBuffer.position(), paramInt);
        localByteBuffer.limit(paramInt);
        return localByteBuffer;
        localByteBuffer = ByteBuffer.allocate(paramInt);
      }
    }
  }

  private class ReuseByteReader extends DirectBinaryDecoder.ByteReader
  {
    private final ByteBufferInputStream bbi;

    public ReuseByteReader(ByteBufferInputStream arg2)
    {
      super(null);
      Object localObject;
      this.bbi = localObject;
    }

    public ByteBuffer read(ByteBuffer paramByteBuffer, int paramInt)
      throws IOException
    {
      if (paramByteBuffer != null)
        return super.read(paramByteBuffer, paramInt);
      return this.bbi.readBuffer(paramInt);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.DirectBinaryDecoder
 * JD-Core Version:    0.6.2
 */