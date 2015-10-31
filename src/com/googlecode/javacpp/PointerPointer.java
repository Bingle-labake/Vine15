package com.googlecode.javacpp;

public class PointerPointer extends Pointer
{
  private Pointer[] pointerArray;

  public PointerPointer(int paramInt)
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

  public PointerPointer(Pointer paramPointer)
  {
    super(paramPointer);
  }

  public PointerPointer(Pointer[] paramArrayOfPointer)
  {
    this(paramArrayOfPointer.length);
    put(paramArrayOfPointer);
  }

  public PointerPointer(byte[][] paramArrayOfByte)
  {
    this(paramArrayOfByte.length);
    put(paramArrayOfByte);
  }

  public PointerPointer(char[][] paramArrayOfChar)
  {
    this(paramArrayOfChar.length);
    put(paramArrayOfChar);
  }

  public PointerPointer(double[][] paramArrayOfDouble)
  {
    this(paramArrayOfDouble.length);
    put(paramArrayOfDouble);
  }

  public PointerPointer(float[][] paramArrayOfFloat)
  {
    this(paramArrayOfFloat.length);
    put(paramArrayOfFloat);
  }

  public PointerPointer(int[][] paramArrayOfInt)
  {
    this(paramArrayOfInt.length);
    put(paramArrayOfInt);
  }

  public PointerPointer(long[][] paramArrayOfLong)
  {
    this(paramArrayOfLong.length);
    put(paramArrayOfLong);
  }

  public PointerPointer(short[][] paramArrayOfShort)
  {
    this(paramArrayOfShort.length);
    put(paramArrayOfShort);
  }

  private native void allocateArray(int paramInt);

  public PointerPointer capacity(int paramInt)
  {
    return (PointerPointer)super.capacity(paramInt);
  }

  public Pointer get()
  {
    return get(0);
  }

  public native Pointer get(int paramInt);

  public PointerPointer limit(int paramInt)
  {
    return (PointerPointer)super.limit(paramInt);
  }

  public PointerPointer position(int paramInt)
  {
    return (PointerPointer)super.position(paramInt);
  }

  public native PointerPointer put(int paramInt, Pointer paramPointer);

  public PointerPointer put(Pointer paramPointer)
  {
    return put(0, paramPointer);
  }

  public PointerPointer put(Pointer[] paramArrayOfPointer)
  {
    for (int i = 0; i < paramArrayOfPointer.length; i++)
      put(i, paramArrayOfPointer[i]);
    return this;
  }

  public PointerPointer put(byte[][] paramArrayOfByte)
  {
    this.pointerArray = new Pointer[paramArrayOfByte.length];
    for (int i = 0; i < paramArrayOfByte.length; i++)
      this.pointerArray[i] = new BytePointer(paramArrayOfByte[i]);
    return put(this.pointerArray);
  }

  public PointerPointer put(char[][] paramArrayOfChar)
  {
    this.pointerArray = new Pointer[paramArrayOfChar.length];
    for (int i = 0; i < paramArrayOfChar.length; i++)
      this.pointerArray[i] = new CharPointer(paramArrayOfChar[i]);
    return put(this.pointerArray);
  }

  public PointerPointer put(double[][] paramArrayOfDouble)
  {
    this.pointerArray = new Pointer[paramArrayOfDouble.length];
    for (int i = 0; i < paramArrayOfDouble.length; i++)
      this.pointerArray[i] = new DoublePointer(paramArrayOfDouble[i]);
    return put(this.pointerArray);
  }

  public PointerPointer put(float[][] paramArrayOfFloat)
  {
    this.pointerArray = new Pointer[paramArrayOfFloat.length];
    for (int i = 0; i < paramArrayOfFloat.length; i++)
      this.pointerArray[i] = new FloatPointer(paramArrayOfFloat[i]);
    return put(this.pointerArray);
  }

  public PointerPointer put(int[][] paramArrayOfInt)
  {
    this.pointerArray = new Pointer[paramArrayOfInt.length];
    for (int i = 0; i < paramArrayOfInt.length; i++)
      this.pointerArray[i] = new IntPointer(paramArrayOfInt[i]);
    return put(this.pointerArray);
  }

  public PointerPointer put(long[][] paramArrayOfLong)
  {
    this.pointerArray = new Pointer[paramArrayOfLong.length];
    for (int i = 0; i < paramArrayOfLong.length; i++)
      this.pointerArray[i] = new LongPointer(paramArrayOfLong[i]);
    return put(this.pointerArray);
  }

  public PointerPointer put(short[][] paramArrayOfShort)
  {
    this.pointerArray = new Pointer[paramArrayOfShort.length];
    for (int i = 0; i < paramArrayOfShort.length; i++)
      this.pointerArray[i] = new ShortPointer(paramArrayOfShort[i]);
    return put(this.pointerArray);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.PointerPointer
 * JD-Core Version:    0.6.2
 */