package com.googlecode.javacpp;

import java.nio.ByteBuffer;
import java.nio.DoubleBuffer;

public class DoublePointer extends Pointer
{
  public DoublePointer(int paramInt)
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

  public DoublePointer(Pointer paramPointer)
  {
    super(paramPointer);
  }

  public DoublePointer(DoubleBuffer paramDoubleBuffer)
  {
    super(paramDoubleBuffer);
    if ((paramDoubleBuffer != null) && (paramDoubleBuffer.hasArray()))
    {
      double[] arrayOfDouble = paramDoubleBuffer.array();
      allocateArray(arrayOfDouble.length);
      put(arrayOfDouble);
      position(paramDoubleBuffer.position());
      limit(paramDoubleBuffer.limit());
    }
  }

  public DoublePointer(double[] paramArrayOfDouble)
  {
    this(paramArrayOfDouble.length);
    put(paramArrayOfDouble);
  }

  private native void allocateArray(int paramInt);

  public final DoubleBuffer asBuffer()
  {
    return asByteBuffer().asDoubleBuffer();
  }

  public DoublePointer capacity(int paramInt)
  {
    return (DoublePointer)super.capacity(paramInt);
  }

  public double get()
  {
    return get(0);
  }

  public native double get(int paramInt);

  public DoublePointer get(double[] paramArrayOfDouble)
  {
    return get(paramArrayOfDouble, 0, paramArrayOfDouble.length);
  }

  public native DoublePointer get(double[] paramArrayOfDouble, int paramInt1, int paramInt2);

  public DoublePointer limit(int paramInt)
  {
    return (DoublePointer)super.limit(paramInt);
  }

  public DoublePointer position(int paramInt)
  {
    return (DoublePointer)super.position(paramInt);
  }

  public DoublePointer put(double paramDouble)
  {
    return put(0, paramDouble);
  }

  public native DoublePointer put(int paramInt, double paramDouble);

  public DoublePointer put(double[] paramArrayOfDouble)
  {
    return put(paramArrayOfDouble, 0, paramArrayOfDouble.length);
  }

  public native DoublePointer put(double[] paramArrayOfDouble, int paramInt1, int paramInt2);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.DoublePointer
 * JD-Core Version:    0.6.2
 */