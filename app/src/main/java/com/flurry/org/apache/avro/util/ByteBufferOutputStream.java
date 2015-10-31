package com.flurry.org.apache.avro.util;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class ByteBufferOutputStream extends OutputStream
{
  public static final int BUFFER_SIZE = 8192;
  private List<ByteBuffer> buffers;

  public ByteBufferOutputStream()
  {
    reset();
  }

  public void append(List<ByteBuffer> paramList)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      ByteBuffer localByteBuffer = (ByteBuffer)localIterator.next();
      localByteBuffer.position(localByteBuffer.limit());
    }
    this.buffers.addAll(paramList);
  }

  public List<ByteBuffer> getBufferList()
  {
    List localList = this.buffers;
    reset();
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
      ((ByteBuffer)localIterator.next()).flip();
    return localList;
  }

  public void prepend(List<ByteBuffer> paramList)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      ByteBuffer localByteBuffer = (ByteBuffer)localIterator.next();
      localByteBuffer.position(localByteBuffer.limit());
    }
    this.buffers.addAll(0, paramList);
  }

  public void reset()
  {
    this.buffers = new LinkedList();
    this.buffers.add(ByteBuffer.allocate(8192));
  }

  public void write(int paramInt)
  {
    ByteBuffer localByteBuffer = (ByteBuffer)this.buffers.get(-1 + this.buffers.size());
    if (localByteBuffer.remaining() < 1)
    {
      localByteBuffer = ByteBuffer.allocate(8192);
      this.buffers.add(localByteBuffer);
    }
    localByteBuffer.put((byte)paramInt);
  }

  public void write(ByteBuffer paramByteBuffer)
  {
    this.buffers.add(paramByteBuffer);
  }

  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    ByteBuffer localByteBuffer = (ByteBuffer)this.buffers.get(-1 + this.buffers.size());
    for (int i = localByteBuffer.remaining(); paramInt2 > i; i = localByteBuffer.remaining())
    {
      localByteBuffer.put(paramArrayOfByte, paramInt1, i);
      paramInt2 -= i;
      paramInt1 += i;
      localByteBuffer = ByteBuffer.allocate(8192);
      this.buffers.add(localByteBuffer);
    }
    localByteBuffer.put(paramArrayOfByte, paramInt1, paramInt2);
  }

  public void writeBuffer(ByteBuffer paramByteBuffer)
    throws IOException
  {
    if (paramByteBuffer.remaining() < 8192)
    {
      write(paramByteBuffer.array(), paramByteBuffer.position(), paramByteBuffer.remaining());
      return;
    }
    ByteBuffer localByteBuffer = paramByteBuffer.duplicate();
    localByteBuffer.position(paramByteBuffer.limit());
    this.buffers.add(localByteBuffer);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.util.ByteBufferOutputStream
 * JD-Core Version:    0.6.2
 */