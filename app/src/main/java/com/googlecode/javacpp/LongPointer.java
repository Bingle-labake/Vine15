package com.googlecode.javacpp;

import java.nio.ByteBuffer;
import java.nio.LongBuffer;

public class LongPointer extends Pointer
{
  public LongPointer(int paramInt)
  {
    try
    {
      allocateArray(paramInt);
      return;
    }
    catch (UnsatisfiedLinkError localUnsatisfiedLinkError)
    {
      throw new RuntimeException("No native JavaCPP library in memory. (Has Loader.load() been called?)", localUnsatisfiedLinkError);
    }
  }

  public LongPointer(Pointer paramPointer)
  {
    super(paramPointer);
  }

  public LongPointer(LongBuffer paramLongBuffer)
  {
    super(paramLongBuffer);
    if ((paramLongBuffer != null) && (paramLongBuffer.hasArray()))
    {
      long[] arrayOfLong = paramLongBuffer.array();
      allocateArray(arrayOfLong.length);
      put(arrayOfLong);
      position(paramLongBuffer.position());
      limit(paramLongBuffer.limit());
    }
  }

  public LongPointer(long[] paramArrayOfLong)
  {
    this(paramArrayOfLong.length);
    put(paramArrayOfLong);
  }

  private native void allocateArray(int paramInt);

  public final LongBuffer asBuffer()
  {
    return asByteBuffer().asLongBuffer();
  }

  public LongPointer capacity(int paramInt)
  {
    return (LongPointer)super.capacity(paramInt);
  }

  public long get()
  {
    return get(0);
  }

  public native long get(int paramInt);

  public LongPointer get(long[] paramArrayOfLong)
  {
    return get(paramArrayOfLong, 0, paramArrayOfLong.length);
  }

  public native LongPointer get(long[] paramArrayOfLong, int paramInt1, int paramInt2);

  public LongPointer limit(int paramInt)
  {
    return (LongPointer)super.limit(paramInt);
  }

  public LongPointer position(int paramInt)
  {
    return (LongPointer)super.position(paramInt);
  }

  public native LongPointer put(int paramInt, long paramLong);

  public LongPointer put(long paramLong)
  {
    return put(0, paramLong);
  }

  public LongPointer put(long[] paramArrayOfLong)
  {
    return put(paramArrayOfLong, 0, paramArrayOfLong.length);
  }

  public native LongPointer put(long[] paramArrayOfLong, int paramInt1, int paramInt2);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.LongPointer
 * JD-Core Version:    0.6.2
 */