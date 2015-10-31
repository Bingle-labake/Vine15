package com.googlecode.javacpp;

import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;

public class BytePointer extends Pointer
{
  public BytePointer(int paramInt)
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

  public BytePointer(Pointer paramPointer)
  {
    super(paramPointer);
  }

  public BytePointer(String paramString)
  {
    this(1 + paramString.getBytes().length);
    putString(paramString);
  }

  public BytePointer(String paramString1, String paramString2)
    throws UnsupportedEncodingException
  {
    this(1 + paramString1.getBytes(paramString2).length);
    putString(paramString1, paramString2);
  }

  public BytePointer(ByteBuffer paramByteBuffer)
  {
    super(paramByteBuffer);
    if ((paramByteBuffer != null) && (paramByteBuffer.hasArray()))
    {
      byte[] arrayOfByte = paramByteBuffer.array();
      allocateArray(arrayOfByte.length);
      put(arrayOfByte);
      position(paramByteBuffer.position());
      limit(paramByteBuffer.limit());
    }
  }

  public BytePointer(byte[] paramArrayOfByte)
  {
    this(paramArrayOfByte.length);
    put(paramArrayOfByte);
  }

  private native void allocateArray(int paramInt);

  public final ByteBuffer asBuffer()
  {
    return asByteBuffer();
  }

  public BytePointer capacity(int paramInt)
  {
    return (BytePointer)super.capacity(paramInt);
  }

  public byte get()
  {
    return get(0);
  }

  public native byte get(int paramInt);

  public BytePointer get(byte[] paramArrayOfByte)
  {
    return get(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public native BytePointer get(byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  public String getString()
  {
    return new String(getStringBytes());
  }

  public String getString(String paramString)
    throws UnsupportedEncodingException
  {
    return new String(getStringBytes(), paramString);
  }

  public byte[] getStringBytes()
  {
    Object localObject = new byte[16];
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
        byte[] arrayOfByte2 = new byte[2 * localObject.length];
        System.arraycopy(localObject, 0, arrayOfByte2, 0, localObject.length);
        localObject = arrayOfByte2;
      }
    }
    byte[] arrayOfByte1 = new byte[i];
    System.arraycopy(localObject, 0, arrayOfByte1, 0, i);
    return arrayOfByte1;
  }

  public BytePointer limit(int paramInt)
  {
    return (BytePointer)super.limit(paramInt);
  }

  public BytePointer position(int paramInt)
  {
    return (BytePointer)super.position(paramInt);
  }

  public BytePointer put(byte paramByte)
  {
    return put(0, paramByte);
  }

  public native BytePointer put(int paramInt, byte paramByte);

  public BytePointer put(byte[] paramArrayOfByte)
  {
    return put(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public native BytePointer put(byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  public BytePointer putString(String paramString)
  {
    byte[] arrayOfByte = paramString.getBytes();
    return put(arrayOfByte).put(arrayOfByte.length, (byte)0);
  }

  public BytePointer putString(String paramString1, String paramString2)
    throws UnsupportedEncodingException
  {
    byte[] arrayOfByte = paramString1.getBytes(paramString2);
    put(arrayOfByte).put(arrayOfByte.length, (byte)0);
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.googlecode.javacpp.BytePointer
 * JD-Core Version:    0.6.2
 */