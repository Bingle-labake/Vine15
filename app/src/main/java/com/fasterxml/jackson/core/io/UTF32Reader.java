package com.fasterxml.jackson.core.io;

import java.io.CharConversionException;
import java.io.IOException;
import java.io.InputStream;

public class UTF32Reader extends BaseReader
{
  protected final boolean _bigEndian;
  protected int _byteCount = 0;
  protected int _charCount = 0;
  protected final boolean _managedBuffers;
  protected char _surrogate = '\000';

  public UTF32Reader(IOContext paramIOContext, InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    super(paramIOContext, paramInputStream, paramArrayOfByte, paramInt1, paramInt2);
    this._bigEndian = paramBoolean;
    boolean bool = false;
    if (paramInputStream != null)
      bool = true;
    this._managedBuffers = bool;
  }

  private boolean loadMore(int paramInt)
    throws IOException
  {
    this._byteCount += this._length - paramInt;
    if (paramInt > 0)
    {
      if (this._ptr > 0)
      {
        for (int k = 0; k < paramInt; k++)
          this._buffer[k] = this._buffer[(k + this._ptr)];
        this._ptr = 0;
      }
      this._length = paramInt;
      if (this._length >= 4)
        break label230;
      if (this._in != null)
        break label201;
    }
    label201: for (int j = -1; ; j = this._in.read(this._buffer, this._length, this._buffer.length - this._length))
    {
      if (j < 1)
      {
        if (j < 0)
        {
          if (this._managedBuffers)
            freeBuffers();
          reportUnexpectedEOF(this._length, 4);
        }
        reportStrangeStream();
      }
      this._length = (j + this._length);
      break;
      this._ptr = 0;
      int i;
      if (this._in == null)
        i = -1;
      while (i < 1)
      {
        this._length = 0;
        if (i < 0)
        {
          if (this._managedBuffers)
            freeBuffers();
          return false;
          i = this._in.read(this._buffer);
        }
        else
        {
          reportStrangeStream();
        }
      }
      this._length = i;
      break;
    }
    label230: return true;
  }

  private void reportInvalid(int paramInt1, int paramInt2, String paramString)
    throws IOException
  {
    int i = -1 + (this._byteCount + this._ptr);
    int j = paramInt2 + this._charCount;
    throw new CharConversionException("Invalid UTF-32 character 0x" + Integer.toHexString(paramInt1) + paramString + " at char #" + j + ", byte #" + i + ")");
  }

  private void reportUnexpectedEOF(int paramInt1, int paramInt2)
    throws IOException
  {
    int i = paramInt1 + this._byteCount;
    int j = this._charCount;
    throw new CharConversionException("Unexpected EOF in the middle of a 4-byte UTF-32 char: got " + paramInt1 + ", needed " + paramInt2 + ", at char #" + j + ", byte #" + i + ")");
  }

  public int read(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException
  {
    if (this._buffer == null)
      paramInt2 = -1;
    while (paramInt2 < 1)
      return paramInt2;
    if ((paramInt1 < 0) || (paramInt1 + paramInt2 > paramArrayOfChar.length))
      reportBounds(paramArrayOfChar, paramInt1, paramInt2);
    int i = paramInt2 + paramInt1;
    int k;
    if (this._surrogate != 0)
    {
      k = paramInt1 + 1;
      paramArrayOfChar[paramInt1] = this._surrogate;
      this._surrogate = '\000';
    }
    while (true)
    {
      int i1;
      int i2;
      label144: int m;
      if (k < i)
      {
        i1 = this._ptr;
        if (this._bigEndian)
        {
          i2 = this._buffer[i1] << 24 | (0xFF & this._buffer[(i1 + 1)]) << 16 | (0xFF & this._buffer[(i1 + 2)]) << 8 | 0xFF & this._buffer[(i1 + 3)];
          this._ptr = (4 + this._ptr);
          if (i2 <= 65535)
            break label368;
          if (i2 > 1114111)
            reportInvalid(i2, k - paramInt1, "(above " + Integer.toHexString(1114111) + ") ");
          int i3 = i2 - 65536;
          m = k + 1;
          paramArrayOfChar[k] = ((char)(55296 + (i3 >> 10)));
          i2 = 0xDC00 | i3 & 0x3FF;
          if (m < i)
            break label372;
          this._surrogate = ((char)i2);
        }
      }
      while (true)
      {
        int n = m - paramInt1;
        this._charCount = (n + this._charCount);
        return n;
        int j = this._length - this._ptr;
        if ((j >= 4) || (loadMore(j)))
          break label410;
        return -1;
        i2 = 0xFF & this._buffer[i1] | (0xFF & this._buffer[(i1 + 1)]) << 8 | (0xFF & this._buffer[(i1 + 2)]) << 16 | this._buffer[(i1 + 3)] << 24;
        break label144;
        label368: m = k;
        label372: k = m + 1;
        paramArrayOfChar[m] = ((char)i2);
        if (this._ptr < this._length)
          break;
        m = k;
        continue;
        m = k;
      }
      label410: k = paramInt1;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.io.UTF32Reader
 * JD-Core Version:    0.6.2
 */