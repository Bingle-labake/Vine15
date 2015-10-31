package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator.Feature;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.PrettyPrinter;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.CharacterEscapes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.io.NumberOutput;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.math.BigInteger;

public class UTF8JsonGenerator extends JsonGeneratorImpl
{
  private static final byte BYTE_0 = 48;
  private static final byte BYTE_BACKSLASH = 92;
  private static final byte BYTE_COLON = 58;
  private static final byte BYTE_COMMA = 44;
  private static final byte BYTE_LBRACKET = 91;
  private static final byte BYTE_LCURLY = 123;
  private static final byte BYTE_QUOTE = 34;
  private static final byte BYTE_RBRACKET = 93;
  private static final byte BYTE_RCURLY = 125;
  private static final byte BYTE_u = 117;
  private static final byte[] FALSE_BYTES = { 102, 97, 108, 115, 101 };
  static final byte[] HEX_CHARS = CharTypes.copyHexBytes();
  private static final int MAX_BYTES_TO_BUFFER = 512;
  private static final byte[] NULL_BYTES = { 110, 117, 108, 108 };
  protected static final int SURR1_FIRST = 55296;
  protected static final int SURR1_LAST = 56319;
  protected static final int SURR2_FIRST = 56320;
  protected static final int SURR2_LAST = 57343;
  private static final byte[] TRUE_BYTES = { 116, 114, 117, 101 };
  protected boolean _bufferRecyclable;
  protected char[] _charBuffer;
  protected final int _charBufferLength;
  protected byte[] _entityBuffer;
  protected byte[] _outputBuffer;
  protected final int _outputEnd;
  protected final int _outputMaxContiguous;
  protected final OutputStream _outputStream;
  protected int _outputTail = 0;

  public UTF8JsonGenerator(IOContext paramIOContext, int paramInt, ObjectCodec paramObjectCodec, OutputStream paramOutputStream)
  {
    super(paramIOContext, paramInt, paramObjectCodec);
    this._outputStream = paramOutputStream;
    this._bufferRecyclable = true;
    this._outputBuffer = paramIOContext.allocWriteEncodingBuffer();
    this._outputEnd = this._outputBuffer.length;
    this._outputMaxContiguous = (this._outputEnd >> 3);
    this._charBuffer = paramIOContext.allocConcatBuffer();
    this._charBufferLength = this._charBuffer.length;
    if (isEnabled(JsonGenerator.Feature.ESCAPE_NON_ASCII))
      setHighestNonEscapedChar(127);
  }

  public UTF8JsonGenerator(IOContext paramIOContext, int paramInt1, ObjectCodec paramObjectCodec, OutputStream paramOutputStream, byte[] paramArrayOfByte, int paramInt2, boolean paramBoolean)
  {
    super(paramIOContext, paramInt1, paramObjectCodec);
    this._outputStream = paramOutputStream;
    this._bufferRecyclable = paramBoolean;
    this._outputTail = paramInt2;
    this._outputBuffer = paramArrayOfByte;
    this._outputEnd = this._outputBuffer.length;
    this._outputMaxContiguous = (this._outputEnd >> 3);
    this._charBuffer = paramIOContext.allocConcatBuffer();
    this._charBufferLength = this._charBuffer.length;
  }

  private int _handleLongCustomEscape(byte[] paramArrayOfByte1, int paramInt1, int paramInt2, byte[] paramArrayOfByte2, int paramInt3)
    throws IOException, JsonGenerationException
  {
    int i = paramArrayOfByte2.length;
    int j;
    if (paramInt1 + i > paramInt2)
    {
      this._outputTail = paramInt1;
      _flushBuffer();
      j = this._outputTail;
      if (i > paramArrayOfByte1.length)
        this._outputStream.write(paramArrayOfByte2, 0, i);
    }
    while (true)
    {
      return j;
      System.arraycopy(paramArrayOfByte2, 0, paramArrayOfByte1, j, i);
      j += i;
      while (j + paramInt3 * 6 > paramInt2)
      {
        _flushBuffer();
        return this._outputTail;
        j = paramInt1;
      }
    }
  }

  private int _outputMultiByteChar(int paramInt1, int paramInt2)
    throws IOException
  {
    byte[] arrayOfByte = this._outputBuffer;
    if ((paramInt1 >= 55296) && (paramInt1 <= 57343))
    {
      int m = paramInt2 + 1;
      arrayOfByte[paramInt2] = 92;
      int n = m + 1;
      arrayOfByte[m] = 117;
      int i1 = n + 1;
      arrayOfByte[n] = HEX_CHARS[(0xF & paramInt1 >> 12)];
      int i2 = i1 + 1;
      arrayOfByte[i1] = HEX_CHARS[(0xF & paramInt1 >> 8)];
      int i3 = i2 + 1;
      arrayOfByte[i2] = HEX_CHARS[(0xF & paramInt1 >> 4)];
      int i4 = i3 + 1;
      arrayOfByte[i3] = HEX_CHARS[(paramInt1 & 0xF)];
      return i4;
    }
    int i = paramInt2 + 1;
    arrayOfByte[paramInt2] = ((byte)(0xE0 | paramInt1 >> 12));
    int j = i + 1;
    arrayOfByte[i] = ((byte)(0x80 | 0x3F & paramInt1 >> 6));
    int k = j + 1;
    arrayOfByte[j] = ((byte)(0x80 | paramInt1 & 0x3F));
    return k;
  }

  private int _outputRawMultiByteChar(int paramInt1, char[] paramArrayOfChar, int paramInt2, int paramInt3)
    throws IOException
  {
    if ((paramInt1 >= 55296) && (paramInt1 <= 57343))
    {
      if (paramInt2 >= paramInt3)
        _reportError("Split surrogate on writeRaw() input (last character)");
      _outputSurrogates(paramInt1, paramArrayOfChar[paramInt2]);
      return paramInt2 + 1;
    }
    byte[] arrayOfByte = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte[i] = ((byte)(0xE0 | paramInt1 >> 12));
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte[j] = ((byte)(0x80 | 0x3F & paramInt1 >> 6));
    int k = this._outputTail;
    this._outputTail = (k + 1);
    arrayOfByte[k] = ((byte)(0x80 | paramInt1 & 0x3F));
    return paramInt2;
  }

  private int _readMore(InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt1, int paramInt2, int paramInt3)
    throws IOException
  {
    int i = 0;
    while (paramInt1 < paramInt2)
    {
      int n = i + 1;
      int i1 = paramInt1 + 1;
      paramArrayOfByte[i] = paramArrayOfByte[paramInt1];
      i = n;
      paramInt1 = i1;
    }
    int j = Math.min(paramInt3, paramArrayOfByte.length);
    do
    {
      int k = j - i;
      if (k == 0);
      int m;
      do
      {
        return i;
        m = paramInputStream.read(paramArrayOfByte, i, k);
      }
      while (m < 0);
      i += m;
    }
    while (i < 3);
    return i;
  }

  private final void _writeBytes(byte[] paramArrayOfByte)
    throws IOException
  {
    int i = paramArrayOfByte.length;
    if (i + this._outputTail > this._outputEnd)
    {
      _flushBuffer();
      if (i > 512)
      {
        this._outputStream.write(paramArrayOfByte, 0, i);
        return;
      }
    }
    System.arraycopy(paramArrayOfByte, 0, this._outputBuffer, this._outputTail, i);
    this._outputTail = (i + this._outputTail);
  }

  private final void _writeBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt2 + this._outputTail > this._outputEnd)
    {
      _flushBuffer();
      if (paramInt2 > 512)
      {
        this._outputStream.write(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
    }
    System.arraycopy(paramArrayOfByte, paramInt1, this._outputBuffer, this._outputTail, paramInt2);
    this._outputTail = (paramInt2 + this._outputTail);
  }

  private int _writeCustomEscape(byte[] paramArrayOfByte, int paramInt1, SerializableString paramSerializableString, int paramInt2)
    throws IOException, JsonGenerationException
  {
    byte[] arrayOfByte = paramSerializableString.asUnquotedUTF8();
    int i = arrayOfByte.length;
    if (i > 6)
      return _handleLongCustomEscape(paramArrayOfByte, paramInt1, this._outputEnd, arrayOfByte, paramInt2);
    System.arraycopy(arrayOfByte, 0, paramArrayOfByte, paramInt1, i);
    return i + paramInt1;
  }

  private void _writeCustomStringSegment2(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    if (this._outputTail + 6 * (paramInt2 - paramInt1) > this._outputEnd)
      _flushBuffer();
    int i = this._outputTail;
    byte[] arrayOfByte = this._outputBuffer;
    int[] arrayOfInt = this._outputEscapes;
    int j;
    CharacterEscapes localCharacterEscapes;
    if (this._maximumNonEscapedChar <= 0)
    {
      j = 65535;
      localCharacterEscapes = this._characterEscapes;
    }
    while (true)
      if (paramInt1 < paramInt2)
      {
        int k = paramInt1 + 1;
        int m = paramArrayOfChar[paramInt1];
        if (m <= 127)
        {
          if (arrayOfInt[m] == 0)
          {
            int i3 = i + 1;
            arrayOfByte[i] = ((byte)m);
            i = i3;
            paramInt1 = k;
            continue;
            j = this._maximumNonEscapedChar;
            break;
          }
          int i1 = arrayOfInt[m];
          if (i1 > 0)
          {
            int i2 = i + 1;
            arrayOfByte[i] = 92;
            i = i2 + 1;
            arrayOfByte[i2] = ((byte)i1);
            paramInt1 = k;
            continue;
          }
          if (i1 == -2)
          {
            SerializableString localSerializableString2 = localCharacterEscapes.getEscapeSequence(m);
            if (localSerializableString2 == null)
              _reportError("Invalid custom escape definitions; custom escape not found for character code 0x" + Integer.toHexString(m) + ", although was supposed to have one");
            i = _writeCustomEscape(arrayOfByte, i, localSerializableString2, paramInt2 - k);
            paramInt1 = k;
            continue;
          }
          i = _writeGenericEscape(m, i);
          paramInt1 = k;
          continue;
        }
        if (m > j)
        {
          i = _writeGenericEscape(m, i);
          paramInt1 = k;
        }
        else
        {
          SerializableString localSerializableString1 = localCharacterEscapes.getEscapeSequence(m);
          if (localSerializableString1 != null)
          {
            i = _writeCustomEscape(arrayOfByte, i, localSerializableString1, paramInt2 - k);
            paramInt1 = k;
          }
          else
          {
            if (m <= 2047)
            {
              int n = i + 1;
              arrayOfByte[i] = ((byte)(0xC0 | m >> 6));
              i = n + 1;
              arrayOfByte[n] = ((byte)(0x80 | m & 0x3F));
            }
            while (true)
            {
              paramInt1 = k;
              break;
              i = _outputMultiByteChar(m, i);
            }
          }
        }
      }
    this._outputTail = i;
  }

  private int _writeGenericEscape(int paramInt1, int paramInt2)
    throws IOException
  {
    byte[] arrayOfByte = this._outputBuffer;
    int i = paramInt2 + 1;
    arrayOfByte[paramInt2] = 92;
    int j = i + 1;
    arrayOfByte[i] = 117;
    int m;
    if (paramInt1 > 255)
    {
      int i2 = 0xFF & paramInt1 >> 8;
      int i3 = j + 1;
      arrayOfByte[j] = HEX_CHARS[(i2 >> 4)];
      m = i3 + 1;
      arrayOfByte[i3] = HEX_CHARS[(i2 & 0xF)];
      paramInt1 &= 255;
    }
    while (true)
    {
      int n = m + 1;
      arrayOfByte[m] = HEX_CHARS[(paramInt1 >> 4)];
      int i1 = n + 1;
      arrayOfByte[n] = HEX_CHARS[(paramInt1 & 0xF)];
      return i1;
      int k = j + 1;
      arrayOfByte[j] = 48;
      m = k + 1;
      arrayOfByte[k] = 48;
    }
  }

  private void _writeLongString(String paramString)
    throws IOException, JsonGenerationException
  {
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    _writeStringSegments(paramString);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte2[j] = 34;
  }

  private void _writeLongString(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    _writeStringSegments(this._charBuffer, 0, paramInt2);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte2[j] = 34;
  }

  private void _writeNull()
    throws IOException
  {
    if (4 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    System.arraycopy(NULL_BYTES, 0, this._outputBuffer, this._outputTail, 4);
    this._outputTail = (4 + this._outputTail);
  }

  private void _writeQuotedInt(int paramInt)
    throws IOException
  {
    if (13 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    this._outputTail = NumberOutput.outputInt(paramInt, this._outputBuffer, this._outputTail);
    byte[] arrayOfByte2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte2[j] = 34;
  }

  private void _writeQuotedLong(long paramLong)
    throws IOException
  {
    if (23 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    this._outputTail = NumberOutput.outputLong(paramLong, this._outputBuffer, this._outputTail);
    byte[] arrayOfByte2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte2[j] = 34;
  }

  private void _writeQuotedRaw(Object paramObject)
    throws IOException
  {
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    writeRaw(paramObject.toString());
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte2[j] = 34;
  }

  private void _writeQuotedShort(short paramShort)
    throws IOException
  {
    if (8 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    this._outputTail = NumberOutput.outputInt(paramShort, this._outputBuffer, this._outputTail);
    byte[] arrayOfByte2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte2[j] = 34;
  }

  private final void _writeSegmentedRaw(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = this._outputEnd;
    byte[] arrayOfByte = this._outputBuffer;
    int j = paramInt1;
    label21: int k;
    int n;
    int i1;
    if (j < paramInt2)
    {
      k = paramArrayOfChar[j];
      if (k >= 128)
      {
        if (3 + this._outputTail >= this._outputEnd)
          _flushBuffer();
        n = j + 1;
        i1 = paramArrayOfChar[j];
        if (i1 >= 2048)
          break label182;
        int i2 = this._outputTail;
        this._outputTail = (i2 + 1);
        arrayOfByte[i2] = ((byte)(0xC0 | i1 >> 6));
        int i3 = this._outputTail;
        this._outputTail = (i3 + 1);
        arrayOfByte[i3] = ((byte)(0x80 | i1 & 0x3F));
      }
    }
    while (true)
    {
      j = n;
      break;
      if (this._outputTail >= i)
        _flushBuffer();
      int m = this._outputTail;
      this._outputTail = (m + 1);
      arrayOfByte[m] = ((byte)k);
      j++;
      if (j < paramInt2)
        break label21;
      return;
      label182: _outputRawMultiByteChar(i1, paramArrayOfChar, n, paramInt2);
    }
  }

  private final void _writeStringSegment(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = paramInt2 + paramInt1;
    int j = this._outputTail;
    byte[] arrayOfByte = this._outputBuffer;
    int[] arrayOfInt = this._outputEscapes;
    while (true)
    {
      int k;
      if (paramInt1 < i)
      {
        k = paramArrayOfChar[paramInt1];
        if ((k <= 127) && (arrayOfInt[k] == 0));
      }
      else
      {
        this._outputTail = j;
        if (paramInt1 < i)
        {
          if (this._characterEscapes == null)
            break;
          _writeCustomStringSegment2(paramArrayOfChar, paramInt1, i);
        }
        return;
      }
      int m = j + 1;
      arrayOfByte[j] = ((byte)k);
      paramInt1++;
      j = m;
    }
    if (this._maximumNonEscapedChar == 0)
    {
      _writeStringSegment2(paramArrayOfChar, paramInt1, i);
      return;
    }
    _writeStringSegmentASCII2(paramArrayOfChar, paramInt1, i);
  }

  private final void _writeStringSegment2(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    if (this._outputTail + 6 * (paramInt2 - paramInt1) > this._outputEnd)
      _flushBuffer();
    int i = this._outputTail;
    byte[] arrayOfByte = this._outputBuffer;
    int[] arrayOfInt = this._outputEscapes;
    while (paramInt1 < paramInt2)
    {
      int j = paramInt1 + 1;
      int k = paramArrayOfChar[paramInt1];
      if (k <= 127)
      {
        if (arrayOfInt[k] == 0)
        {
          int i2 = i + 1;
          arrayOfByte[i] = ((byte)k);
          i = i2;
          paramInt1 = j;
        }
        else
        {
          int n = arrayOfInt[k];
          if (n > 0)
          {
            int i1 = i + 1;
            arrayOfByte[i] = 92;
            i = i1 + 1;
            arrayOfByte[i1] = ((byte)n);
            paramInt1 = j;
          }
          else
          {
            i = _writeGenericEscape(k, i);
            paramInt1 = j;
          }
        }
      }
      else
      {
        if (k <= 2047)
        {
          int m = i + 1;
          arrayOfByte[i] = ((byte)(0xC0 | k >> 6));
          i = m + 1;
          arrayOfByte[m] = ((byte)(0x80 | k & 0x3F));
        }
        while (true)
        {
          paramInt1 = j;
          break;
          i = _outputMultiByteChar(k, i);
        }
      }
    }
    this._outputTail = i;
  }

  private final void _writeStringSegmentASCII2(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    if (this._outputTail + 6 * (paramInt2 - paramInt1) > this._outputEnd)
      _flushBuffer();
    int i = this._outputTail;
    byte[] arrayOfByte = this._outputBuffer;
    int[] arrayOfInt = this._outputEscapes;
    int j = this._maximumNonEscapedChar;
    while (paramInt1 < paramInt2)
    {
      int k = paramInt1 + 1;
      int m = paramArrayOfChar[paramInt1];
      if (m <= 127)
      {
        if (arrayOfInt[m] == 0)
        {
          int i3 = i + 1;
          arrayOfByte[i] = ((byte)m);
          i = i3;
          paramInt1 = k;
        }
        else
        {
          int i1 = arrayOfInt[m];
          if (i1 > 0)
          {
            int i2 = i + 1;
            arrayOfByte[i] = 92;
            i = i2 + 1;
            arrayOfByte[i2] = ((byte)i1);
            paramInt1 = k;
          }
          else
          {
            i = _writeGenericEscape(m, i);
            paramInt1 = k;
          }
        }
      }
      else if (m > j)
      {
        i = _writeGenericEscape(m, i);
        paramInt1 = k;
      }
      else
      {
        if (m <= 2047)
        {
          int n = i + 1;
          arrayOfByte[i] = ((byte)(0xC0 | m >> 6));
          i = n + 1;
          arrayOfByte[n] = ((byte)(0x80 | m & 0x3F));
        }
        while (true)
        {
          paramInt1 = k;
          break;
          i = _outputMultiByteChar(m, i);
        }
      }
    }
    this._outputTail = i;
  }

  private final void _writeStringSegments(String paramString)
    throws IOException, JsonGenerationException
  {
    int i = paramString.length();
    char[] arrayOfChar = this._charBuffer;
    int j = i;
    int k = 0;
    while (j > 0)
    {
      int m = Math.min(this._outputMaxContiguous, j);
      paramString.getChars(k, k + m, arrayOfChar, 0);
      if (m + this._outputTail > this._outputEnd)
        _flushBuffer();
      _writeStringSegment(arrayOfChar, 0, m);
      k += m;
      j -= m;
    }
  }

  private final void _writeStringSegments(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    do
    {
      int i = Math.min(this._outputMaxContiguous, paramInt2);
      if (i + this._outputTail > this._outputEnd)
        _flushBuffer();
      _writeStringSegment(paramArrayOfChar, paramInt1, i);
      paramInt1 += i;
      paramInt2 -= i;
    }
    while (paramInt2 > 0);
  }

  private void _writeUTF8Segment(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int[] arrayOfInt = this._outputEscapes;
    int i = paramInt1 + paramInt2;
    int k;
    for (int j = paramInt1; j < i; j = k)
    {
      k = j + 1;
      int m = paramArrayOfByte[j];
      if ((m >= 0) && (arrayOfInt[m] != 0))
      {
        _writeUTF8Segment2(paramArrayOfByte, paramInt1, paramInt2);
        return;
      }
    }
    if (paramInt2 + this._outputTail > this._outputEnd)
      _flushBuffer();
    System.arraycopy(paramArrayOfByte, paramInt1, this._outputBuffer, this._outputTail, paramInt2);
    this._outputTail = (paramInt2 + this._outputTail);
  }

  private void _writeUTF8Segment2(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = this._outputTail;
    if (i + paramInt2 * 6 > this._outputEnd)
    {
      _flushBuffer();
      i = this._outputTail;
    }
    byte[] arrayOfByte = this._outputBuffer;
    int[] arrayOfInt = this._outputEscapes;
    int j = paramInt2 + paramInt1;
    while (paramInt1 < j)
    {
      int k = paramInt1 + 1;
      int m = paramArrayOfByte[paramInt1];
      if ((m < 0) || (arrayOfInt[m] == 0))
      {
        int n = i + 1;
        arrayOfByte[i] = m;
        i = n;
        paramInt1 = k;
      }
      else
      {
        int i1 = arrayOfInt[m];
        if (i1 > 0)
        {
          int i2 = i + 1;
          arrayOfByte[i] = 92;
          i = i2 + 1;
          arrayOfByte[i2] = ((byte)i1);
        }
        while (true)
        {
          paramInt1 = k;
          break;
          i = _writeGenericEscape(m, i);
        }
      }
    }
    this._outputTail = i;
  }

  private void _writeUTF8Segments(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    do
    {
      int i = Math.min(this._outputMaxContiguous, paramInt2);
      _writeUTF8Segment(paramArrayOfByte, paramInt1, i);
      paramInt1 += i;
      paramInt2 -= i;
    }
    while (paramInt2 > 0);
  }

  protected final int _decodeSurrogate(int paramInt1, int paramInt2)
    throws IOException
  {
    if ((paramInt2 < 56320) || (paramInt2 > 57343))
      _reportError("Incomplete surrogate pair: first char 0x" + Integer.toHexString(paramInt1) + ", second 0x" + Integer.toHexString(paramInt2));
    return 65536 + (paramInt1 - 55296 << 10) + (paramInt2 - 56320);
  }

  protected final void _flushBuffer()
    throws IOException
  {
    int i = this._outputTail;
    if (i > 0)
    {
      this._outputTail = 0;
      this._outputStream.write(this._outputBuffer, 0, i);
    }
  }

  protected final void _outputSurrogates(int paramInt1, int paramInt2)
    throws IOException
  {
    int i = _decodeSurrogate(paramInt1, paramInt2);
    if (4 + this._outputTail > this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte[j] = ((byte)(0xF0 | i >> 18));
    int k = this._outputTail;
    this._outputTail = (k + 1);
    arrayOfByte[k] = ((byte)(0x80 | 0x3F & i >> 12));
    int m = this._outputTail;
    this._outputTail = (m + 1);
    arrayOfByte[m] = ((byte)(0x80 | 0x3F & i >> 6));
    int n = this._outputTail;
    this._outputTail = (n + 1);
    arrayOfByte[n] = ((byte)(0x80 | i & 0x3F));
  }

  protected void _releaseBuffers()
  {
    byte[] arrayOfByte = this._outputBuffer;
    if ((arrayOfByte != null) && (this._bufferRecyclable))
    {
      this._outputBuffer = null;
      this._ioContext.releaseWriteEncodingBuffer(arrayOfByte);
    }
    char[] arrayOfChar = this._charBuffer;
    if (arrayOfChar != null)
    {
      this._charBuffer = null;
      this._ioContext.releaseConcatBuffer(arrayOfChar);
    }
  }

  protected final void _verifyPrettyValueWrite(String paramString, int paramInt)
    throws IOException, JsonGenerationException
  {
    switch (paramInt)
    {
    default:
      _throwInternal();
    case 1:
    case 2:
    case 3:
    case 0:
    }
    do
    {
      return;
      this._cfgPrettyPrinter.writeArrayValueSeparator(this);
      return;
      this._cfgPrettyPrinter.writeObjectFieldValueSeparator(this);
      return;
      this._cfgPrettyPrinter.writeRootValueSeparator(this);
      return;
      if (this._writeContext.inArray())
      {
        this._cfgPrettyPrinter.beforeArrayValues(this);
        return;
      }
    }
    while (!this._writeContext.inObject());
    this._cfgPrettyPrinter.beforeObjectEntries(this);
  }

  protected final void _verifyValueWrite(String paramString)
    throws IOException, JsonGenerationException
  {
    int i = this._writeContext.writeValue();
    if (i == 5)
      _reportError("Can not " + paramString + ", expecting field name");
    if (this._cfgPrettyPrinter == null)
    {
      switch (i)
      {
      default:
      case 1:
      case 2:
      case 3:
      }
      byte[] arrayOfByte;
      do
      {
        do
        {
          return;
          for (int j = 44; ; j = 58)
          {
            if (this._outputTail >= this._outputEnd)
              _flushBuffer();
            this._outputBuffer[this._outputTail] = j;
            this._outputTail = (1 + this._outputTail);
            return;
          }
        }
        while (this._rootValueSeparator == null);
        arrayOfByte = this._rootValueSeparator.asUnquotedUTF8();
      }
      while (arrayOfByte.length <= 0);
      _writeBytes(arrayOfByte);
      return;
    }
    _verifyPrettyValueWrite(paramString, i);
  }

  protected int _writeBinary(Base64Variant paramBase64Variant, InputStream paramInputStream, byte[] paramArrayOfByte)
    throws IOException, JsonGenerationException
  {
    int i = -3;
    int j = -6 + this._outputEnd;
    int k = paramBase64Variant.getMaxLineLength() >> 2;
    int m = 0;
    int n = 0;
    int i1 = 0;
    int i10;
    int i11;
    if (i1 > i)
    {
      n = _readMore(paramInputStream, paramArrayOfByte, i1, n, paramArrayOfByte.length);
      if (n < 3)
      {
        if (n >= 0)
          break label326;
        if (this._outputTail > j)
          _flushBuffer();
        i10 = paramArrayOfByte[0] << 16;
        if (1 >= n)
          break label316;
        i11 = i10 | (0xFF & paramArrayOfByte[1]) << 8;
      }
    }
    for (int i12 = 2; ; i12 = 1)
    {
      int i13 = m + i12;
      this._outputTail = paramBase64Variant.encodeBase64Partial(i11, i12, this._outputBuffer, this._outputTail);
      return i13;
      i = n - 3;
      i1 = 0;
      if (this._outputTail > j)
        _flushBuffer();
      int i2 = i1 + 1;
      int i3 = paramArrayOfByte[i1] << 8;
      int i4 = i2 + 1;
      int i5 = (i3 | 0xFF & paramArrayOfByte[i2]) << 8;
      i1 = i4 + 1;
      int i6 = i5 | 0xFF & paramArrayOfByte[i4];
      m += 3;
      this._outputTail = paramBase64Variant.encodeBase64Chunk(i6, this._outputBuffer, this._outputTail);
      int i7 = k - 1;
      if (i7 <= 0)
      {
        byte[] arrayOfByte1 = this._outputBuffer;
        int i8 = this._outputTail;
        this._outputTail = (i8 + 1);
        arrayOfByte1[i8] = 92;
        byte[] arrayOfByte2 = this._outputBuffer;
        int i9 = this._outputTail;
        this._outputTail = (i9 + 1);
        arrayOfByte2[i9] = 110;
        i7 = paramBase64Variant.getMaxLineLength() >> 2;
      }
      k = i7;
      break;
      label316: i11 = i10;
    }
    label326: return m;
  }

  protected int _writeBinary(Base64Variant paramBase64Variant, InputStream paramInputStream, byte[] paramArrayOfByte, int paramInt)
    throws IOException, JsonGenerationException
  {
    int i = 0;
    int j = 0;
    int k = -3;
    int m = -6 + this._outputEnd;
    int n = paramBase64Variant.getMaxLineLength() >> 2;
    int i1 = paramInt;
    int i3;
    if (i1 > 2)
    {
      if (i <= k)
        break label172;
      j = _readMore(paramInputStream, paramArrayOfByte, i, j, i1);
      i = 0;
      if (j >= 3);
    }
    else if (i1 > 0)
    {
      int i2 = _readMore(paramInputStream, paramArrayOfByte, i, j, i1);
      if (i2 > 0)
      {
        if (this._outputTail > m)
          _flushBuffer();
        i3 = paramArrayOfByte[0] << 16;
        if (1 >= i2)
          break label342;
        i3 |= (0xFF & paramArrayOfByte[1]) << 8;
      }
    }
    label172: label342: for (int i4 = 2; ; i4 = 1)
    {
      this._outputTail = paramBase64Variant.encodeBase64Partial(i3, i4, this._outputBuffer, this._outputTail);
      i1 -= i4;
      return i1;
      k = j - 3;
      if (this._outputTail > m)
        _flushBuffer();
      int i5 = i + 1;
      int i6 = paramArrayOfByte[i] << 8;
      int i7 = i5 + 1;
      int i8 = (i6 | 0xFF & paramArrayOfByte[i5]) << 8;
      i = i7 + 1;
      int i9 = i8 | 0xFF & paramArrayOfByte[i7];
      i1 -= 3;
      this._outputTail = paramBase64Variant.encodeBase64Chunk(i9, this._outputBuffer, this._outputTail);
      int i10 = n - 1;
      if (i10 <= 0)
      {
        byte[] arrayOfByte1 = this._outputBuffer;
        int i11 = this._outputTail;
        this._outputTail = (i11 + 1);
        arrayOfByte1[i11] = 92;
        byte[] arrayOfByte2 = this._outputBuffer;
        int i12 = this._outputTail;
        this._outputTail = (i12 + 1);
        arrayOfByte2[i12] = 110;
        i10 = paramBase64Variant.getMaxLineLength() >> 2;
      }
      n = i10;
      break;
    }
  }

  protected void _writeBinary(Base64Variant paramBase64Variant, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = paramInt2 - 3;
    int j = -6 + this._outputEnd;
    int k = paramBase64Variant.getMaxLineLength() >> 2;
    while (paramInt1 <= i)
    {
      if (this._outputTail > j)
        _flushBuffer();
      int i2 = paramInt1 + 1;
      int i3 = paramArrayOfByte[paramInt1] << 8;
      int i4 = i2 + 1;
      int i5 = (i3 | 0xFF & paramArrayOfByte[i2]) << 8;
      paramInt1 = i4 + 1;
      this._outputTail = paramBase64Variant.encodeBase64Chunk(i5 | 0xFF & paramArrayOfByte[i4], this._outputBuffer, this._outputTail);
      k--;
      if (k <= 0)
      {
        byte[] arrayOfByte1 = this._outputBuffer;
        int i6 = this._outputTail;
        this._outputTail = (i6 + 1);
        arrayOfByte1[i6] = 92;
        byte[] arrayOfByte2 = this._outputBuffer;
        int i7 = this._outputTail;
        this._outputTail = (i7 + 1);
        arrayOfByte2[i7] = 110;
        k = paramBase64Variant.getMaxLineLength() >> 2;
      }
    }
    int m = paramInt2 - paramInt1;
    if (m > 0)
    {
      if (this._outputTail > j)
        _flushBuffer();
      int n = paramInt1 + 1;
      int i1 = paramArrayOfByte[paramInt1] << 16;
      if (m == 2)
      {
        (n + 1);
        i1 |= (0xFF & paramArrayOfByte[n]) << 8;
      }
      this._outputTail = paramBase64Variant.encodeBase64Partial(i1, m, this._outputBuffer, this._outputTail);
    }
  }

  protected final void _writeFieldName(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    if (!isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES))
    {
      int m = paramSerializableString.appendQuotedUTF8(this._outputBuffer, this._outputTail);
      if (m < 0)
      {
        _writeBytes(paramSerializableString.asQuotedUTF8());
        return;
      }
      this._outputTail = (m + this._outputTail);
      return;
    }
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    int j = paramSerializableString.appendQuotedUTF8(this._outputBuffer, this._outputTail);
    if (j < 0)
      _writeBytes(paramSerializableString.asQuotedUTF8());
    while (true)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte2 = this._outputBuffer;
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfByte2[k] = 34;
      return;
      this._outputTail = (j + this._outputTail);
    }
  }

  protected final void _writeFieldName(String paramString)
    throws IOException, JsonGenerationException
  {
    if (!isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES))
    {
      _writeStringSegments(paramString);
      return;
    }
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    int j = paramString.length();
    if (j <= this._charBufferLength)
    {
      paramString.getChars(0, j, this._charBuffer, 0);
      if (j <= this._outputMaxContiguous)
      {
        if (j + this._outputTail > this._outputEnd)
          _flushBuffer();
        _writeStringSegment(this._charBuffer, 0, j);
      }
    }
    while (true)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte2 = this._outputBuffer;
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfByte2[k] = 34;
      return;
      _writeStringSegments(this._charBuffer, 0, j);
      continue;
      _writeStringSegments(paramString);
    }
  }

  protected final void _writePPFieldName(SerializableString paramSerializableString, boolean paramBoolean)
    throws IOException, JsonGenerationException
  {
    if (paramBoolean)
      this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
    while (true)
    {
      boolean bool = isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES);
      if (bool)
      {
        if (this._outputTail >= this._outputEnd)
          _flushBuffer();
        byte[] arrayOfByte2 = this._outputBuffer;
        int j = this._outputTail;
        this._outputTail = (j + 1);
        arrayOfByte2[j] = 34;
      }
      _writeBytes(paramSerializableString.asQuotedUTF8());
      if (bool)
      {
        if (this._outputTail >= this._outputEnd)
          _flushBuffer();
        byte[] arrayOfByte1 = this._outputBuffer;
        int i = this._outputTail;
        this._outputTail = (i + 1);
        arrayOfByte1[i] = 34;
      }
      return;
      this._cfgPrettyPrinter.beforeObjectEntries(this);
    }
  }

  protected final void _writePPFieldName(String paramString, boolean paramBoolean)
    throws IOException, JsonGenerationException
  {
    int j;
    if (paramBoolean)
    {
      this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
      if (!isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES))
        break label207;
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte1 = this._outputBuffer;
      int i = this._outputTail;
      this._outputTail = (i + 1);
      arrayOfByte1[i] = 34;
      j = paramString.length();
      if (j > this._charBufferLength)
        break label199;
      paramString.getChars(0, j, this._charBuffer, 0);
      if (j > this._outputMaxContiguous)
        break label185;
      if (j + this._outputTail > this._outputEnd)
        _flushBuffer();
      _writeStringSegment(this._charBuffer, 0, j);
    }
    while (true)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte2 = this._outputBuffer;
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfByte2[k] = 34;
      return;
      this._cfgPrettyPrinter.beforeObjectEntries(this);
      break;
      label185: _writeStringSegments(this._charBuffer, 0, j);
      continue;
      label199: _writeStringSegments(paramString);
    }
    label207: _writeStringSegments(paramString);
  }

  public void close()
    throws IOException
  {
    super.close();
    if ((this._outputBuffer != null) && (isEnabled(JsonGenerator.Feature.AUTO_CLOSE_JSON_CONTENT)))
      while (true)
      {
        JsonWriteContext localJsonWriteContext = getOutputContext();
        if (localJsonWriteContext.inArray())
        {
          writeEndArray();
        }
        else
        {
          if (!localJsonWriteContext.inObject())
            break;
          writeEndObject();
        }
      }
    _flushBuffer();
    if (this._outputStream != null)
    {
      if ((!this._ioContext.isResourceManaged()) && (!isEnabled(JsonGenerator.Feature.AUTO_CLOSE_TARGET)))
        break label97;
      this._outputStream.close();
    }
    while (true)
    {
      _releaseBuffers();
      return;
      label97: if (isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM))
        this._outputStream.flush();
    }
  }

  public final void flush()
    throws IOException
  {
    _flushBuffer();
    if ((this._outputStream != null) && (isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)))
      this._outputStream.flush();
  }

  public Object getOutputTarget()
  {
    return this._outputStream;
  }

  public int writeBinary(Base64Variant paramBase64Variant, InputStream paramInputStream, int paramInt)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write binary value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    byte[] arrayOfByte2 = this._ioContext.allocBase64Buffer();
    if (paramInt < 0);
    try
    {
      int m = _writeBinary(paramBase64Variant, paramInputStream, arrayOfByte2);
      paramInt = m;
      while (true)
      {
        this._ioContext.releaseBase64Buffer(arrayOfByte2);
        if (this._outputTail >= this._outputEnd)
          _flushBuffer();
        byte[] arrayOfByte3 = this._outputBuffer;
        int k = this._outputTail;
        this._outputTail = (k + 1);
        arrayOfByte3[k] = 34;
        return paramInt;
        int j = _writeBinary(paramBase64Variant, paramInputStream, arrayOfByte2, paramInt);
        if (j > 0)
          _reportError("Too few bytes available: missing " + j + " bytes (out of " + paramInt + ")");
      }
    }
    finally
    {
      this._ioContext.releaseBase64Buffer(arrayOfByte2);
    }
  }

  public void writeBinary(Base64Variant paramBase64Variant, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write binary value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    _writeBinary(paramBase64Variant, paramArrayOfByte, paramInt1, paramInt1 + paramInt2);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte2[j] = 34;
  }

  public void writeBoolean(boolean paramBoolean)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write boolean value");
    if (5 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    if (paramBoolean);
    for (byte[] arrayOfByte = TRUE_BYTES; ; arrayOfByte = FALSE_BYTES)
    {
      int i = arrayOfByte.length;
      System.arraycopy(arrayOfByte, 0, this._outputBuffer, this._outputTail, i);
      this._outputTail = (i + this._outputTail);
      return;
    }
  }

  public final void writeEndArray()
    throws IOException, JsonGenerationException
  {
    if (!this._writeContext.inArray())
      _reportError("Current context not an ARRAY but " + this._writeContext.getTypeDesc());
    if (this._cfgPrettyPrinter != null)
      this._cfgPrettyPrinter.writeEndArray(this, this._writeContext.getEntryCount());
    while (true)
    {
      this._writeContext = this._writeContext.getParent();
      return;
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte = this._outputBuffer;
      int i = this._outputTail;
      this._outputTail = (i + 1);
      arrayOfByte[i] = 93;
    }
  }

  public final void writeEndObject()
    throws IOException, JsonGenerationException
  {
    if (!this._writeContext.inObject())
      _reportError("Current context not an object but " + this._writeContext.getTypeDesc());
    if (this._cfgPrettyPrinter != null)
      this._cfgPrettyPrinter.writeEndObject(this, this._writeContext.getEntryCount());
    while (true)
    {
      this._writeContext = this._writeContext.getParent();
      return;
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte = this._outputBuffer;
      int i = this._outputTail;
      this._outputTail = (i + 1);
      arrayOfByte[i] = 125;
    }
  }

  public final void writeFieldName(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    int i = 1;
    int j = this._writeContext.writeFieldName(paramSerializableString.getValue());
    if (j == 4)
      _reportError("Can not write a field name, expecting a value");
    if (this._cfgPrettyPrinter != null)
    {
      if (j == i);
      while (true)
      {
        _writePPFieldName(paramSerializableString, i);
        return;
        i = 0;
      }
    }
    if (j == i)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte = this._outputBuffer;
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfByte[k] = 44;
    }
    _writeFieldName(paramSerializableString);
  }

  public final void writeFieldName(String paramString)
    throws IOException, JsonGenerationException
  {
    int i = 1;
    int j = this._writeContext.writeFieldName(paramString);
    if (j == 4)
      _reportError("Can not write a field name, expecting a value");
    if (this._cfgPrettyPrinter != null)
    {
      if (j == i);
      while (true)
      {
        _writePPFieldName(paramString, i);
        return;
        i = 0;
      }
    }
    if (j == i)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte = this._outputBuffer;
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfByte[k] = 44;
    }
    _writeFieldName(paramString);
  }

  public void writeNull()
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write null value");
    _writeNull();
  }

  public void writeNumber(double paramDouble)
    throws IOException, JsonGenerationException
  {
    if ((this._cfgNumbersAsStrings) || (((Double.isNaN(paramDouble)) || (Double.isInfinite(paramDouble))) && (isEnabled(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS))))
    {
      writeString(String.valueOf(paramDouble));
      return;
    }
    _verifyValueWrite("write number");
    writeRaw(String.valueOf(paramDouble));
  }

  public void writeNumber(float paramFloat)
    throws IOException, JsonGenerationException
  {
    if ((this._cfgNumbersAsStrings) || (((Float.isNaN(paramFloat)) || (Float.isInfinite(paramFloat))) && (isEnabled(JsonGenerator.Feature.QUOTE_NON_NUMERIC_NUMBERS))))
    {
      writeString(String.valueOf(paramFloat));
      return;
    }
    _verifyValueWrite("write number");
    writeRaw(String.valueOf(paramFloat));
  }

  public void writeNumber(int paramInt)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write number");
    if (11 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    if (this._cfgNumbersAsStrings)
    {
      _writeQuotedInt(paramInt);
      return;
    }
    this._outputTail = NumberOutput.outputInt(paramInt, this._outputBuffer, this._outputTail);
  }

  public void writeNumber(long paramLong)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write number");
    if (this._cfgNumbersAsStrings)
    {
      _writeQuotedLong(paramLong);
      return;
    }
    if (21 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    this._outputTail = NumberOutput.outputLong(paramLong, this._outputBuffer, this._outputTail);
  }

  public void writeNumber(String paramString)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write number");
    if (this._cfgNumbersAsStrings)
    {
      _writeQuotedRaw(paramString);
      return;
    }
    writeRaw(paramString);
  }

  public void writeNumber(BigDecimal paramBigDecimal)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write number");
    if (paramBigDecimal == null)
    {
      _writeNull();
      return;
    }
    if (this._cfgNumbersAsStrings)
    {
      _writeQuotedRaw(paramBigDecimal);
      return;
    }
    writeRaw(paramBigDecimal.toString());
  }

  public void writeNumber(BigInteger paramBigInteger)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write number");
    if (paramBigInteger == null)
    {
      _writeNull();
      return;
    }
    if (this._cfgNumbersAsStrings)
    {
      _writeQuotedRaw(paramBigInteger);
      return;
    }
    writeRaw(paramBigInteger.toString());
  }

  public void writeNumber(short paramShort)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write number");
    if (6 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    if (this._cfgNumbersAsStrings)
    {
      _writeQuotedShort(paramShort);
      return;
    }
    this._outputTail = NumberOutput.outputInt(paramShort, this._outputBuffer, this._outputTail);
  }

  public void writeRaw(char paramChar)
    throws IOException, JsonGenerationException
  {
    if (3 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte = this._outputBuffer;
    if (paramChar <= '')
    {
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfByte[k] = ((byte)paramChar);
      return;
    }
    if (paramChar < 'ࠀ')
    {
      int i = this._outputTail;
      this._outputTail = (i + 1);
      arrayOfByte[i] = ((byte)(0xC0 | paramChar >> '\006'));
      int j = this._outputTail;
      this._outputTail = (j + 1);
      arrayOfByte[j] = ((byte)(0x80 | paramChar & 0x3F));
      return;
    }
    _outputRawMultiByteChar(paramChar, null, 0, 0);
  }

  public void writeRaw(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    byte[] arrayOfByte = paramSerializableString.asUnquotedUTF8();
    if (arrayOfByte.length > 0)
      _writeBytes(arrayOfByte);
  }

  public void writeRaw(String paramString)
    throws IOException, JsonGenerationException
  {
    int i = paramString.length();
    int j = 0;
    while (i > 0)
    {
      char[] arrayOfChar = this._charBuffer;
      int k = arrayOfChar.length;
      if (i < k)
        k = i;
      paramString.getChars(j, j + k, arrayOfChar, 0);
      writeRaw(arrayOfChar, 0, k);
      j += k;
      i -= k;
    }
  }

  public void writeRaw(String paramString, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = paramInt2;
    while (i > 0)
    {
      char[] arrayOfChar = this._charBuffer;
      int j = arrayOfChar.length;
      if (i < j)
        j = i;
      paramString.getChars(paramInt1, paramInt1 + j, arrayOfChar, 0);
      writeRaw(arrayOfChar, 0, j);
      paramInt1 += j;
      i -= j;
    }
  }

  public final void writeRaw(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = paramInt2 + (paramInt2 + paramInt2);
    if (i + this._outputTail > this._outputEnd)
    {
      if (this._outputEnd < i)
      {
        _writeSegmentedRaw(paramArrayOfChar, paramInt1, paramInt2);
        return;
      }
      _flushBuffer();
    }
    int j = paramInt2 + paramInt1;
    int k = paramInt1;
    label50: label57: int m;
    int i1;
    int i2;
    if (k < j)
    {
      m = paramArrayOfChar[k];
      if (m <= 127)
        break label167;
      i1 = k + 1;
      i2 = paramArrayOfChar[k];
      if (i2 >= 2048)
        break label206;
      byte[] arrayOfByte2 = this._outputBuffer;
      int i3 = this._outputTail;
      this._outputTail = (i3 + 1);
      arrayOfByte2[i3] = ((byte)(0xC0 | i2 >> 6));
      byte[] arrayOfByte3 = this._outputBuffer;
      int i4 = this._outputTail;
      this._outputTail = (i4 + 1);
      arrayOfByte3[i4] = ((byte)(0x80 | i2 & 0x3F));
    }
    while (true)
    {
      k = i1;
      break label50;
      break;
      label167: byte[] arrayOfByte1 = this._outputBuffer;
      int n = this._outputTail;
      this._outputTail = (n + 1);
      arrayOfByte1[n] = ((byte)m);
      k++;
      if (k < j)
        break label57;
      return;
      label206: _outputRawMultiByteChar(i2, paramArrayOfChar, i1, j);
    }
  }

  public void writeRawUTF8String(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write text value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    _writeBytes(paramArrayOfByte, paramInt1, paramInt2);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte2[j] = 34;
  }

  public final void writeStartArray()
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("start an array");
    this._writeContext = this._writeContext.createChildArrayContext();
    if (this._cfgPrettyPrinter != null)
    {
      this._cfgPrettyPrinter.writeStartArray(this);
      return;
    }
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte[i] = 91;
  }

  public final void writeStartObject()
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("start an object");
    this._writeContext = this._writeContext.createChildObjectContext();
    if (this._cfgPrettyPrinter != null)
    {
      this._cfgPrettyPrinter.writeStartObject(this);
      return;
    }
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte[i] = 123;
  }

  public final void writeString(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write text value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    int j = paramSerializableString.appendQuotedUTF8(this._outputBuffer, this._outputTail);
    if (j < 0)
      _writeBytes(paramSerializableString.asQuotedUTF8());
    while (true)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte2 = this._outputBuffer;
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfByte2[k] = 34;
      return;
      this._outputTail = (j + this._outputTail);
    }
  }

  public void writeString(String paramString)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write text value");
    if (paramString == null)
    {
      _writeNull();
      return;
    }
    int i = paramString.length();
    if (i > this._charBufferLength)
    {
      _writeLongString(paramString);
      return;
    }
    paramString.getChars(0, i, this._charBuffer, 0);
    if (i > this._outputMaxContiguous)
    {
      _writeLongString(this._charBuffer, 0, i);
      return;
    }
    if (i + this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfByte1[j] = 34;
    _writeStringSegment(this._charBuffer, 0, i);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte2 = this._outputBuffer;
    int k = this._outputTail;
    this._outputTail = (k + 1);
    arrayOfByte2[k] = 34;
  }

  public void writeString(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write text value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    if (paramInt2 <= this._outputMaxContiguous)
    {
      if (paramInt2 + this._outputTail > this._outputEnd)
        _flushBuffer();
      _writeStringSegment(paramArrayOfChar, paramInt1, paramInt2);
    }
    while (true)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte2 = this._outputBuffer;
      int j = this._outputTail;
      this._outputTail = (j + 1);
      arrayOfByte2[j] = 34;
      return;
      _writeStringSegments(paramArrayOfChar, paramInt1, paramInt2);
    }
  }

  public void writeUTF8String(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write text value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    byte[] arrayOfByte1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfByte1[i] = 34;
    if (paramInt2 <= this._outputMaxContiguous)
      _writeUTF8Segment(paramArrayOfByte, paramInt1, paramInt2);
    while (true)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      byte[] arrayOfByte2 = this._outputBuffer;
      int j = this._outputTail;
      this._outputTail = (j + 1);
      arrayOfByte2[j] = 34;
      return;
      _writeUTF8Segments(paramArrayOfByte, paramInt1, paramInt2);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.json.UTF8JsonGenerator
 * JD-Core Version:    0.6.2
 */