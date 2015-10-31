package com.flurry.org.apache.avro.util;

import com.flurry.org.apache.avro.io.BinaryData;
import java.io.UnsupportedEncodingException;

public class Utf8
  implements Comparable<Utf8>, CharSequence
{
  private static final byte[] EMPTY = new byte[0];
  private byte[] bytes = EMPTY;
  private int length;
  private String string;

  public Utf8()
  {
  }

  public Utf8(Utf8 paramUtf8)
  {
    this.length = paramUtf8.length;
    this.bytes = new byte[paramUtf8.length];
    System.arraycopy(paramUtf8.bytes, 0, this.bytes, 0, this.length);
    this.string = paramUtf8.string;
  }

  public Utf8(String paramString)
  {
    this.bytes = getBytesFor(paramString);
    this.length = this.bytes.length;
    this.string = paramString;
  }

  public Utf8(byte[] paramArrayOfByte)
  {
    this.bytes = paramArrayOfByte;
    this.length = paramArrayOfByte.length;
  }

  public static final byte[] getBytesFor(String paramString)
  {
    try
    {
      byte[] arrayOfByte = paramString.getBytes("UTF-8");
      return arrayOfByte;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
    return new byte[0];
  }

  public char charAt(int paramInt)
  {
    return toString().charAt(paramInt);
  }

  public int compareTo(Utf8 paramUtf8)
  {
    return BinaryData.compareBytes(this.bytes, 0, this.length, paramUtf8.bytes, 0, paramUtf8.length);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    while (true)
    {
      return true;
      if (!(paramObject instanceof Utf8))
        return false;
      Utf8 localUtf8 = (Utf8)paramObject;
      if (this.length != localUtf8.length)
        return false;
      byte[] arrayOfByte = localUtf8.bytes;
      for (int i = 0; i < this.length; i++)
        if (this.bytes[i] != arrayOfByte[i])
          return false;
    }
  }

  public int getByteLength()
  {
    return this.length;
  }

  public byte[] getBytes()
  {
    return this.bytes;
  }

  public int getLength()
  {
    return this.length;
  }

  public int hashCode()
  {
    int i = 0;
    for (int j = 0; ; j++)
    {
      if (j >= this.length)
        return i;
      i = i * 31 + this.bytes[j];
    }
  }

  public int length()
  {
    return toString().length();
  }

  public Utf8 setByteLength(int paramInt)
  {
    if (this.length < paramInt)
    {
      byte[] arrayOfByte = new byte[paramInt];
      System.arraycopy(this.bytes, 0, arrayOfByte, 0, this.length);
      this.bytes = arrayOfByte;
    }
    this.length = paramInt;
    this.string = null;
    return this;
  }

  public Utf8 setLength(int paramInt)
  {
    return setByteLength(paramInt);
  }

  public CharSequence subSequence(int paramInt1, int paramInt2)
  {
    return toString().subSequence(paramInt1, paramInt2);
  }

  public String toString()
  {
    if (this.string == null);
    try
    {
      this.string = new String(this.bytes, 0, this.length, "UTF-8");
      return this.string;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      while (true)
        localUnsupportedEncodingException.printStackTrace();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.util.Utf8
 * JD-Core Version:    0.6.2
 */