package com.googlecode.javacpp;

import com.googlecode.javacpp.annotation.Cast;
import com.googlecode.javacpp.annotation.Name;

@Name({"bool"})
public class BoolPointer extends Pointer
{
  public BoolPointer(int paramInt)
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

  public BoolPointer(Pointer paramPointer)
  {
    super(paramPointer);
  }

  private native void allocateArray(int paramInt);

  public BoolPointer capacity(int paramInt)
  {
    return (BoolPointer)super.capacity(paramInt);
  }

  public boolean get()
  {
    return get(0);
  }

  @Cast({"bool"})
  public native boolean get(int paramInt);

  public BoolPointer limit(int paramInt)
  {
    return (BoolPointer)super.limit(paramInt);
  }

  public BoolPointer position(int paramInt)
  {
    return (BoolPointer)super.position(paramInt);
  }

  public native BoolPointer put(int paramInt, boolean paramBoolean);

  public BoolPointer put(boolean paramBoolean)
  {
    return put(0, paramBoolean);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.BoolPointer
 * JD-Core Version:    0.6.2
 */