package com.flurry.org.apache.avro.util;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.List;

public class ByteBufferInputStream extends InputStream
{
  private List<ByteBuffer> buffers;
  private int current;

  public ByteBufferInputStream(List<ByteBuffer> paramList)
  {
    this.buffers = paramList;
  }

  private ByteBuffer getBuffer()
    throws IOException
  {
    while (this.current < this.buffers.size())
    {
      ByteBuffer localByteBuffer = (ByteBuffer)this.buffers.get(this.current);
      if (localByteBuffer.hasRemaining())
        return localByteBuffer;
      this.current = (1 + this.current);
    }
    throw new EOFException();
  }

  public int read()
    throws IOException
  {
    return 0xFF & getBuffer().get();
  }

  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt2 == 0)
      return 0;
    ByteBuffer localByteBuffer = getBuffer();
    int i = localByteBuffer.remaining();
    if (paramInt2 > i)
    {
      localByteBuffer.get(paramArrayOfByte, paramInt1, i);
      return i;
    }
    localByteBuffer.get(paramArrayOfByte, paramInt1, paramInt2);
    return paramInt2;
  }

  public ByteBuffer readBuffer(int paramInt)
    throws IOException
  {
    if (paramInt == 0)
      return ByteBuffer.allocate(0);
    ByteBuffer localByteBuffer1 = getBuffer();
    if (localByteBuffer1.remaining() == paramInt)
    {
      this.current = (1 + this.current);
      return localByteBuffer1;
    }
    ByteBuffer localByteBuffer2 = ByteBuffer.allocate(paramInt);
    int i = 0;
    while (i < paramInt)
      i += read(localByteBuffer2.array(), i, paramInt - i);
    return localByteBuffer2;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.util.ByteBufferInputStream
 * JD-Core Version:    0.6.2
 */