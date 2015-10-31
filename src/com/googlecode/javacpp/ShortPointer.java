package com.googlecode.javacpp;

import java.nio.ByteBuffer;
import java.nio.ShortBuffer;

public class ShortPointer extends Pointer
{
  public ShortPointer(int paramInt)
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

  public ShortPointer(Pointer paramPointer)
  {
    super(paramPointer);
  }

  public ShortPointer(ShortBuffer paramShortBuffer)
  {
    super(paramShortBuffer);
    if ((paramShortBuffer != null) && (paramShortBuffer.hasArray()))
    {
      short[] arrayOfShort = paramShortBuffer.array();
      allocateArray(arrayOfShort.length);
      put(arrayOfShort);
      position(paramShortBuffer.position());
      limit(paramShortBuffer.limit());
    }
  }

  public ShortPointer(short[] paramArrayOfShort)
  {
    this(paramArrayOfShort.length);
    put(paramArrayOfShort);
  }

  private native void allocateArray(int paramInt);

  public final ShortBuffer asBuffer()
  {
    return asByteBuffer().asShortBuffer();
  }

  public ShortPointer capacity(int paramInt)
  {
    return (ShortPointer)super.capacity(paramInt);
  }

  public ShortPointer get(short[] paramArrayOfShort)
  {
    return get(paramArrayOfShort, 0, paramArrayOfShort.length);
  }

  public native ShortPointer get(short[] paramArrayOfShort, int paramInt1, int paramInt2);

  public short get()
  {
    return get(0);
  }

  public native short get(int paramInt);

  public ShortPointer limit(int paramInt)
  {
    return (ShortPointer)super.limit(paramInt);
  }

  public ShortPointer position(int paramInt)
  {
    return (ShortPointer)super.position(paramInt);
  }

  public native ShortPointer put(int paramInt, short paramShort);

  public ShortPointer put(short paramShort)
  {
    return put(0, paramShort);
  }

  public ShortPointer put(short[] paramArrayOfShort)
  {
    return put(paramArrayOfShort, 0, paramArrayOfShort.length);
  }

  public native ShortPointer put(short[] paramArrayOfShort, int paramInt1, int paramInt2);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.ShortPointer
 * JD-Core Version:    0.6.2
 */