package com.googlecode.javacpp;

import java.nio.ByteBuffer;
import java.nio.IntBuffer;

public class IntPointer extends Pointer
{
  public IntPointer(int paramInt)
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

  public IntPointer(Pointer paramPointer)
  {
    super(paramPointer);
  }

  public IntPointer(String paramString)
  {
    this(1 + paramString.length());
    putString(paramString);
  }

  public IntPointer(IntBuffer paramIntBuffer)
  {
    super(paramIntBuffer);
    if ((paramIntBuffer != null) && (paramIntBuffer.hasArray()))
    {
      int[] arrayOfInt = paramIntBuffer.array();
      allocateArray(arrayOfInt.length);
      put(arrayOfInt);
      position(paramIntBuffer.position());
      limit(paramIntBuffer.limit());
    }
  }

  public IntPointer(int[] paramArrayOfInt)
  {
    this(paramArrayOfInt.length);
    put(paramArrayOfInt);
  }

  private native void allocateArray(int paramInt);

  public final IntBuffer asBuffer()
  {
    return asByteBuffer().asIntBuffer();
  }

  public IntPointer capacity(int paramInt)
  {
    return (IntPointer)super.capacity(paramInt);
  }

  public int get()
  {
    return get(0);
  }

  public native int get(int paramInt);

  public IntPointer get(int[] paramArrayOfInt)
  {
    return get(paramArrayOfInt, 0, paramArrayOfInt.length);
  }

  public native IntPointer get(int[] paramArrayOfInt, int paramInt1, int paramInt2);

  public String getString()
  {
    int[] arrayOfInt = getStringCodePoints();
    return new String(arrayOfInt, 0, arrayOfInt.length);
  }

  public int[] getStringCodePoints()
  {
    Object localObject = new int[16];
    int i = 0;
    int j = position();
    while (true)
    {
      int k = position(j).get();
      localObject[i] = k;
      if (k == 0)
        break;
      i++;
      j++;
      if (i >= localObject.length)
      {
        int[] arrayOfInt2 = new int[2 * localObject.length];
        System.arraycopy(localObject, 0, arrayOfInt2, 0, localObject.length);
        localObject = arrayOfInt2;
      }
    }
    int[] arrayOfInt1 = new int[i];
    System.arraycopy(localObject, 0, arrayOfInt1, 0, i);
    return arrayOfInt1;
  }

  public IntPointer limit(int paramInt)
  {
    return (IntPointer)super.limit(paramInt);
  }

  public IntPointer position(int paramInt)
  {
    return (IntPointer)super.position(paramInt);
  }

  public IntPointer put(int paramInt)
  {
    return put(0, paramInt);
  }

  public native IntPointer put(int paramInt1, int paramInt2);

  public IntPointer put(int[] paramArrayOfInt)
  {
    return put(paramArrayOfInt, 0, paramArrayOfInt.length);
  }

  public native IntPointer put(int[] paramArrayOfInt, int paramInt1, int paramInt2);

  public IntPointer putString(String paramString)
  {
    int[] arrayOfInt = new int[paramString.length()];
    for (int i = 0; i < arrayOfInt.length; i++)
      arrayOfInt[i] = paramString.codePointAt(i);
    return put(arrayOfInt).put(arrayOfInt.length, 0);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.IntPointer
 * JD-Core Version:    0.6.2
 */