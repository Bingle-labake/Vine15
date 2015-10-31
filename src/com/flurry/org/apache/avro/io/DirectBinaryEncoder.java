package com.flurry.org.apache.avro.io;

import java.io.IOException;
import java.io.OutputStream;

public class DirectBinaryEncoder extends BinaryEncoder
{
  private final byte[] buf = new byte[12];
  private OutputStream out;

  DirectBinaryEncoder(OutputStream paramOutputStream)
  {
    configure(paramOutputStream);
  }

  public int bytesBuffered()
  {
    return 0;
  }

  DirectBinaryEncoder configure(OutputStream paramOutputStream)
  {
    if (paramOutputStream == null)
      throw new NullPointerException("OutputStream cannot be null!");
    this.out = paramOutputStream;
    return this;
  }

  public void flush()
    throws IOException
  {
    this.out.flush();
  }

  public void writeBoolean(boolean paramBoolean)
    throws IOException
  {
    OutputStream localOutputStream = this.out;
    if (paramBoolean);
    for (int i = 1; ; i = 0)
    {
      localOutputStream.write(i);
      return;
    }
  }

  public void writeDouble(double paramDouble)
    throws IOException
  {
    byte[] arrayOfByte = new byte[8];
    int i = BinaryData.encodeDouble(paramDouble, arrayOfByte, 0);
    this.out.write(arrayOfByte, 0, i);
  }

  public void writeFixed(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    this.out.write(paramArrayOfByte, paramInt1, paramInt2);
  }

  public void writeFloat(float paramFloat)
    throws IOException
  {
    int i = BinaryData.encodeFloat(paramFloat, this.buf, 0);
    this.out.write(this.buf, 0, i);
  }

  public void writeInt(int paramInt)
    throws IOException
  {
    int i = paramInt << 1 ^ paramInt >> 31;
    if ((i & 0xFFFFFF80) == 0)
    {
      this.out.write(i);
      return;
    }
    if ((i & 0xFFFFC000) == 0)
    {
      this.out.write(i | 0x80);
      this.out.write(i >>> 7);
      return;
    }
    int j = BinaryData.encodeInt(paramInt, this.buf, 0);
    this.out.write(this.buf, 0, j);
  }

  public void writeLong(long paramLong)
    throws IOException
  {
    long l = paramLong << 1 ^ paramLong >> 63;
    if ((0x80000000 & l) == 0L)
    {
      int j = (int)l;
      while ((j & 0xFFFFFF80) != 0)
      {
        this.out.write((byte)(0xFF & (j | 0x80)));
        j >>>= 7;
      }
      this.out.write((byte)j);
      return;
    }
    int i = BinaryData.encodeLong(paramLong, this.buf, 0);
    this.out.write(this.buf, 0, i);
  }

  protected void writeZero()
    throws IOException
  {
    this.out.write(0);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.DirectBinaryEncoder
 * JD-Core Version:    0.6.2
 */