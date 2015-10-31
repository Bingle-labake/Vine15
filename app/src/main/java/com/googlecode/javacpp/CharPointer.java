package com.googlecode.javacpp;

import java.nio.ByteBuffer;
import java.nio.CharBuffer;

public class CharPointer extends Pointer
{
  public CharPointer(int paramInt)
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

  public CharPointer(Pointer paramPointer)
  {
    super(paramPointer);
  }

  public CharPointer(String paramString)
  {
    this(1 + paramString.toCharArray().length);
    putString(paramString);
  }

  public CharPointer(CharBuffer paramCharBuffer)
  {
    super(paramCharBuffer);
    if ((paramCharBuffer != null) && (paramCharBuffer.hasArray()))
    {
      char[] arrayOfChar = paramCharBuffer.array();
      allocateArray(arrayOfChar.length);
      put(arrayOfChar);
      position(paramCharBuffer.position());
      limit(paramCharBuffer.limit());
    }
  }

  public CharPointer(char[] paramArrayOfChar)
  {
    this(paramArrayOfChar.length);
    put(paramArrayOfChar);
  }

  private native void allocateArray(int paramInt);

  public final CharBuffer asBuffer()
  {
    return asByteBuffer().asCharBuffer();
  }

  public CharPointer capacity(int paramInt)
  {
    return (CharPointer)super.capacity(paramInt);
  }

  public char get()
  {
    return get(0);
  }

  public native char get(int paramInt);

  public CharPointer get(char[] paramArrayOfChar)
  {
    return get(paramArrayOfChar, 0, paramArrayOfChar.length);
  }

  public native CharPointer get(char[] paramArrayOfChar, int paramInt1, int paramInt2);

  public String getString()
  {
    return new String(getStringChars());
  }

  public char[] getStringChars()
  {
    Object localObject = new char[16];
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
        char[] arrayOfChar2 = new char[2 * localObject.length];
        System.arraycopy(localObject, 0, arrayOfChar2, 0, localObject.length);
        localObject = arrayOfChar2;
      }
    }
    char[] arrayOfChar1 = new char[i];
    System.arraycopy(localObject, 0, arrayOfChar1, 0, i);
    return arrayOfChar1;
  }

  public CharPointer limit(int paramInt)
  {
    return (CharPointer)super.limit(paramInt);
  }

  public CharPointer position(int paramInt)
  {
    return (CharPointer)super.position(paramInt);
  }

  public CharPointer put(char paramChar)
  {
    return put(0, paramChar);
  }

  public native CharPointer put(int paramInt, char paramChar);

  public CharPointer put(char[] paramArrayOfChar)
  {
    return put(paramArrayOfChar, 0, paramArrayOfChar.length);
  }

  public native CharPointer put(char[] paramArrayOfChar, int paramInt1, int paramInt2);

  public CharPointer putString(String paramString)
  {
    char[] arrayOfChar = paramString.toCharArray();
    return put(arrayOfChar).put(arrayOfChar.length, '\000');
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.CharPointer
 * JD-Core Version:    0.6.2
 */