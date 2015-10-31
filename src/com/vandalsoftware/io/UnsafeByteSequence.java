package com.vandalsoftware.io;

import java.io.UnsupportedEncodingException;

public class UnsafeByteSequence
{
  private byte[] bytes;
  private int count;

  public UnsafeByteSequence(int paramInt)
  {
    this.bytes = new byte[paramInt];
  }

  public void rewind()
  {
    this.count = 0;
  }

  public int size()
  {
    return this.count;
  }

  public byte[] toByteArray()
  {
    if (this.count == this.bytes.length)
      return this.bytes;
    byte[] arrayOfByte = new byte[this.count];
    System.arraycopy(this.bytes, 0, arrayOfByte, 0, this.count);
    return arrayOfByte;
  }

  public String toString(String paramString)
  {
    try
    {
      String str = new String(this.bytes, 0, this.count, paramString);
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
    }
    return new String(this.bytes, 0, this.count);
  }

  public void write(int paramInt)
  {
    if (this.count == this.bytes.length)
    {
      byte[] arrayOfByte2 = new byte[2 * this.count];
      System.arraycopy(this.bytes, 0, arrayOfByte2, 0, this.count);
      this.bytes = arrayOfByte2;
    }
    byte[] arrayOfByte1 = this.bytes;
    int i = this.count;
    this.count = (i + 1);
    arrayOfByte1[i] = ((byte)paramInt);
  }

  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    if (paramInt2 + this.count >= this.bytes.length)
    {
      byte[] arrayOfByte = new byte[2 * (paramInt2 + this.count)];
      System.arraycopy(this.bytes, 0, arrayOfByte, 0, this.count);
      this.bytes = arrayOfByte;
    }
    System.arraycopy(paramArrayOfByte, paramInt1, this.bytes, this.count, paramInt2);
    this.count = (paramInt2 + this.count);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.vandalsoftware.io.UnsafeByteSequence
 * JD-Core Version:    0.6.2
 */