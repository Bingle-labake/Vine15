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
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;

public final class WriterBasedJsonGenerator extends JsonGeneratorImpl
{
  protected static final char[] HEX_CHARS = CharTypes.copyHexChars();
  protected static final int SHORT_WRITE = 32;
  protected SerializableString _currentEscape;
  protected char[] _entityBuffer;
  protected char[] _outputBuffer;
  protected int _outputEnd;
  protected int _outputHead = 0;
  protected int _outputTail = 0;
  protected final Writer _writer;

  public WriterBasedJsonGenerator(IOContext paramIOContext, int paramInt, ObjectCodec paramObjectCodec, Writer paramWriter)
  {
    super(paramIOContext, paramInt, paramObjectCodec);
    this._writer = paramWriter;
    this._outputBuffer = paramIOContext.allocConcatBuffer();
    this._outputEnd = this._outputBuffer.length;
  }

  private char[] _allocateEntityBuffer()
  {
    char[] arrayOfChar = new char[14];
    arrayOfChar[0] = '\\';
    arrayOfChar[2] = '\\';
    arrayOfChar[3] = 'u';
    arrayOfChar[4] = '0';
    arrayOfChar[5] = '0';
    arrayOfChar[8] = '\\';
    arrayOfChar[9] = 'u';
    this._entityBuffer = arrayOfChar;
    return arrayOfChar;
  }

  private void _appendCharacterEscape(char paramChar, int paramInt)
    throws IOException, JsonGenerationException
  {
    if (paramInt >= 0)
    {
      if (2 + this._outputTail > this._outputEnd)
        _flushBuffer();
      char[] arrayOfChar2 = this._outputBuffer;
      int i5 = this._outputTail;
      this._outputTail = (i5 + 1);
      arrayOfChar2[i5] = '\\';
      char[] arrayOfChar3 = this._outputBuffer;
      int i6 = this._outputTail;
      this._outputTail = (i6 + 1);
      arrayOfChar3[i6] = ((char)paramInt);
      return;
    }
    if (paramInt != -2)
    {
      if (2 + this._outputTail > this._outputEnd)
        _flushBuffer();
      int j = this._outputTail;
      char[] arrayOfChar1 = this._outputBuffer;
      int k = j + 1;
      arrayOfChar1[j] = '\\';
      int m = k + 1;
      arrayOfChar1[k] = 'u';
      int i1;
      if (paramChar > 'ÿ')
      {
        int i3 = 0xFF & paramChar >> '\b';
        int i4 = m + 1;
        arrayOfChar1[m] = HEX_CHARS[(i3 >> 4)];
        i1 = i4 + 1;
        arrayOfChar1[i4] = HEX_CHARS[(i3 & 0xF)];
        paramChar = (char)(paramChar & 0xFF);
      }
      while (true)
      {
        int i2 = i1 + 1;
        arrayOfChar1[i1] = HEX_CHARS[(paramChar >> '\004')];
        arrayOfChar1[i2] = HEX_CHARS[(paramChar & 0xF)];
        this._outputTail = i2;
        return;
        int n = m + 1;
        arrayOfChar1[m] = '0';
        i1 = n + 1;
        arrayOfChar1[n] = '0';
      }
    }
    String str;
    if (this._currentEscape == null)
      str = this._characterEscapes.getEscapeSequence(paramChar).getValue();
    int i;
    while (true)
    {
      i = str.length();
      if (i + this._outputTail <= this._outputEnd)
        break;
      _flushBuffer();
      if (i <= this._outputEnd)
        break;
      this._writer.write(str);
      return;
      str = this._currentEscape.getValue();
      this._currentEscape = null;
    }
    str.getChars(0, i, this._outputBuffer, this._outputTail);
    this._outputTail = (i + this._outputTail);
  }

  private int _prependOrWriteCharacterEscape(char[] paramArrayOfChar, int paramInt1, int paramInt2, char paramChar, int paramInt3)
    throws IOException, JsonGenerationException
  {
    if (paramInt3 >= 0)
    {
      if ((paramInt1 > 1) && (paramInt1 < paramInt2))
      {
        int i8 = paramInt1 - 2;
        paramArrayOfChar[i8] = '\\';
        paramArrayOfChar[(i8 + 1)] = ((char)paramInt3);
        return i8;
      }
      char[] arrayOfChar2 = this._entityBuffer;
      if (arrayOfChar2 == null)
        arrayOfChar2 = _allocateEntityBuffer();
      arrayOfChar2[1] = ((char)paramInt3);
      this._writer.write(arrayOfChar2, 0, 2);
      return paramInt1;
    }
    if (paramInt3 != -2)
    {
      if ((paramInt1 > 5) && (paramInt1 < paramInt2))
      {
        int n = paramInt1 - 6;
        int i1 = n + 1;
        paramArrayOfChar[n] = '\\';
        int i2 = i1 + 1;
        paramArrayOfChar[i1] = 'u';
        int i4;
        if (paramChar > 'ÿ')
        {
          int i6 = 0xFF & paramChar >> '\b';
          int i7 = i2 + 1;
          paramArrayOfChar[i2] = HEX_CHARS[(i6 >> 4)];
          i4 = i7 + 1;
          paramArrayOfChar[i7] = HEX_CHARS[(i6 & 0xF)];
          paramChar = (char)(paramChar & 0xFF);
        }
        while (true)
        {
          int i5 = i4 + 1;
          paramArrayOfChar[i4] = HEX_CHARS[(paramChar >> '\004')];
          paramArrayOfChar[i5] = HEX_CHARS[(paramChar & 0xF)];
          return i5 - 5;
          int i3 = i2 + 1;
          paramArrayOfChar[i2] = '0';
          i4 = i3 + 1;
          paramArrayOfChar[i3] = '0';
        }
      }
      char[] arrayOfChar1 = this._entityBuffer;
      if (arrayOfChar1 == null)
        arrayOfChar1 = _allocateEntityBuffer();
      this._outputHead = this._outputTail;
      if (paramChar > 'ÿ')
      {
        int k = 0xFF & paramChar >> '\b';
        int m = paramChar & 0xFF;
        arrayOfChar1[10] = HEX_CHARS[(k >> 4)];
        arrayOfChar1[11] = HEX_CHARS[(k & 0xF)];
        arrayOfChar1[12] = HEX_CHARS[(m >> 4)];
        arrayOfChar1[13] = HEX_CHARS[(m & 0xF)];
        this._writer.write(arrayOfChar1, 8, 6);
        return paramInt1;
      }
      arrayOfChar1[6] = HEX_CHARS[(paramChar >> '\004')];
      arrayOfChar1[7] = HEX_CHARS[(paramChar & 0xF)];
      this._writer.write(arrayOfChar1, 2, 6);
      return paramInt1;
    }
    String str;
    if (this._currentEscape == null)
      str = this._characterEscapes.getEscapeSequence(paramChar).getValue();
    while (true)
    {
      int i = str.length();
      if ((paramInt1 < i) || (paramInt1 >= paramInt2))
        break;
      int j = paramInt1 - i;
      str.getChars(0, i, paramArrayOfChar, j);
      return j;
      str = this._currentEscape.getValue();
      this._currentEscape = null;
    }
    this._writer.write(str);
    return paramInt1;
  }

  private void _prependOrWriteCharacterEscape(char paramChar, int paramInt)
    throws IOException, JsonGenerationException
  {
    if (paramInt >= 0)
    {
      if (this._outputTail >= 2)
      {
        int i7 = -2 + this._outputTail;
        this._outputHead = i7;
        char[] arrayOfChar4 = this._outputBuffer;
        int i8 = i7 + 1;
        arrayOfChar4[i7] = '\\';
        this._outputBuffer[i8] = ((char)paramInt);
        return;
      }
      char[] arrayOfChar3 = this._entityBuffer;
      if (arrayOfChar3 == null)
        arrayOfChar3 = _allocateEntityBuffer();
      this._outputHead = this._outputTail;
      arrayOfChar3[1] = ((char)paramInt);
      this._writer.write(arrayOfChar3, 0, 2);
      return;
    }
    if (paramInt != -2)
    {
      if (this._outputTail >= 6)
      {
        char[] arrayOfChar2 = this._outputBuffer;
        int n = -6 + this._outputTail;
        this._outputHead = n;
        arrayOfChar2[n] = '\\';
        int i1 = n + 1;
        arrayOfChar2[i1] = 'u';
        int i3;
        if (paramChar > 'ÿ')
        {
          int i5 = 0xFF & paramChar >> '\b';
          int i6 = i1 + 1;
          arrayOfChar2[i6] = HEX_CHARS[(i5 >> 4)];
          i3 = i6 + 1;
          arrayOfChar2[i3] = HEX_CHARS[(i5 & 0xF)];
          paramChar = (char)(paramChar & 0xFF);
        }
        while (true)
        {
          int i4 = i3 + 1;
          arrayOfChar2[i4] = HEX_CHARS[(paramChar >> '\004')];
          arrayOfChar2[(i4 + 1)] = HEX_CHARS[(paramChar & 0xF)];
          return;
          int i2 = i1 + 1;
          arrayOfChar2[i2] = '0';
          i3 = i2 + 1;
          arrayOfChar2[i3] = '0';
        }
      }
      char[] arrayOfChar1 = this._entityBuffer;
      if (arrayOfChar1 == null)
        arrayOfChar1 = _allocateEntityBuffer();
      this._outputHead = this._outputTail;
      if (paramChar > 'ÿ')
      {
        int k = 0xFF & paramChar >> '\b';
        int m = paramChar & 0xFF;
        arrayOfChar1[10] = HEX_CHARS[(k >> 4)];
        arrayOfChar1[11] = HEX_CHARS[(k & 0xF)];
        arrayOfChar1[12] = HEX_CHARS[(m >> 4)];
        arrayOfChar1[13] = HEX_CHARS[(m & 0xF)];
        this._writer.write(arrayOfChar1, 8, 6);
        return;
      }
      arrayOfChar1[6] = HEX_CHARS[(paramChar >> '\004')];
      arrayOfChar1[7] = HEX_CHARS[(paramChar & 0xF)];
      this._writer.write(arrayOfChar1, 2, 6);
      return;
    }
    String str;
    if (this._currentEscape == null)
      str = this._characterEscapes.getEscapeSequence(paramChar).getValue();
    while (true)
    {
      int i = str.length();
      if (this._outputTail < i)
        break;
      int j = this._outputTail - i;
      this._outputHead = j;
      str.getChars(0, i, this._outputBuffer, j);
      return;
      str = this._currentEscape.getValue();
      this._currentEscape = null;
    }
    this._outputHead = this._outputTail;
    this._writer.write(str);
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

  private void _writeLongString(String paramString)
    throws IOException, JsonGenerationException
  {
    _flushBuffer();
    int i = paramString.length();
    int j = 0;
    int k = this._outputEnd;
    if (j + k > i)
      k = i - j;
    paramString.getChars(j, j + k, this._outputBuffer, 0);
    if (this._characterEscapes != null)
      _writeSegmentCustom(k);
    while (true)
    {
      j += k;
      if (j < i)
        break;
      return;
      if (this._maximumNonEscapedChar != 0)
        _writeSegmentASCII(k, this._maximumNonEscapedChar);
      else
        _writeSegment(k);
    }
  }

  private void _writeNull()
    throws IOException
  {
    if (4 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    int i = this._outputTail;
    char[] arrayOfChar = this._outputBuffer;
    arrayOfChar[i] = 'n';
    int j = i + 1;
    arrayOfChar[j] = 'u';
    int k = j + 1;
    arrayOfChar[k] = 'l';
    int m = k + 1;
    arrayOfChar[m] = 'l';
    this._outputTail = (m + 1);
  }

  private void _writeQuotedInt(int paramInt)
    throws IOException
  {
    if (13 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    this._outputTail = NumberOutput.outputInt(paramInt, this._outputBuffer, this._outputTail);
    char[] arrayOfChar2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfChar2[j] = '"';
  }

  private void _writeQuotedLong(long paramLong)
    throws IOException
  {
    if (23 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    this._outputTail = NumberOutput.outputLong(paramLong, this._outputBuffer, this._outputTail);
    char[] arrayOfChar2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfChar2[j] = '"';
  }

  private void _writeQuotedRaw(Object paramObject)
    throws IOException
  {
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    writeRaw(paramObject.toString());
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfChar2[j] = '"';
  }

  private void _writeQuotedShort(short paramShort)
    throws IOException
  {
    if (8 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    this._outputTail = NumberOutput.outputInt(paramShort, this._outputBuffer, this._outputTail);
    char[] arrayOfChar2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfChar2[j] = '"';
  }

  private void _writeSegment(int paramInt)
    throws IOException, JsonGenerationException
  {
    int[] arrayOfInt = this._outputEscapes;
    int i = arrayOfInt.length;
    int j = 0;
    int k = 0;
    while (true)
    {
      int m;
      if (j < paramInt)
      {
        m = this._outputBuffer[j];
        if ((m >= i) || (arrayOfInt[m] == 0))
          break label76;
      }
      while (true)
      {
        int n = j - k;
        if (n <= 0)
          break label88;
        this._writer.write(this._outputBuffer, k, n);
        if (j < paramInt)
          break label88;
        return;
        label76: j++;
        if (j < paramInt)
          break;
      }
      label88: int i1 = j + 1;
      k = _prependOrWriteCharacterEscape(this._outputBuffer, i1, paramInt, m, arrayOfInt[m]);
      j = i1;
    }
  }

  private void _writeSegmentASCII(int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = 0;
    int[] arrayOfInt = this._outputEscapes;
    int j = Math.min(arrayOfInt.length, paramInt2 + 1);
    int k = 0;
    int m = 0;
    while (true)
    {
      int n;
      int i1;
      if (m < paramInt1)
      {
        n = this._outputBuffer[m];
        if (n >= j)
          break label93;
        i1 = arrayOfInt[n];
        if (i1 == 0)
          break label105;
      }
      while (true)
      {
        int i2 = m - k;
        if (i2 <= 0)
          break label123;
        this._writer.write(this._outputBuffer, k, i2);
        if (m < paramInt1)
          break label123;
        return;
        label93: if (n > paramInt2)
        {
          i1 = -1;
          continue;
          label105: i = i1;
        }
        else
        {
          m++;
          if (m < paramInt1)
            break;
          i1 = i;
        }
      }
      label123: int i3 = m + 1;
      int i4 = _prependOrWriteCharacterEscape(this._outputBuffer, i3, paramInt1, n, i1);
      m = i3;
      k = i4;
      i = i1;
    }
  }

  private void _writeSegmentCustom(int paramInt)
    throws IOException, JsonGenerationException
  {
    int i = 0;
    int[] arrayOfInt = this._outputEscapes;
    int j;
    int k;
    CharacterEscapes localCharacterEscapes;
    int m;
    if (this._maximumNonEscapedChar < 1)
    {
      j = 65535;
      k = Math.min(arrayOfInt.length, j + 1);
      localCharacterEscapes = this._characterEscapes;
      m = 0;
    }
    label47: int i2;
    for (int n = 0; ; n = i2)
    {
      int i1;
      if (i < paramInt)
      {
        i1 = this._outputBuffer[i];
        if (i1 >= k)
          break label114;
        i2 = arrayOfInt[i1];
        if (i2 == 0)
          break label154;
      }
      label154: 
      while (true)
      {
        int i3 = i - m;
        if (i3 <= 0)
          break label173;
        this._writer.write(this._outputBuffer, m, i3);
        if (i < paramInt)
          break label173;
        return;
        j = this._maximumNonEscapedChar;
        break;
        label114: if (i1 > j)
        {
          i2 = -1;
        }
        else
        {
          SerializableString localSerializableString = localCharacterEscapes.getEscapeSequence(i1);
          this._currentEscape = localSerializableString;
          if (localSerializableString != null)
          {
            i2 = -2;
            continue;
            n = i2;
          }
          else
          {
            i++;
            if (i < paramInt)
              break label47;
            i2 = n;
          }
        }
      }
      label173: int i4 = i + 1;
      int i5 = _prependOrWriteCharacterEscape(this._outputBuffer, i4, paramInt, i1, i2);
      i = i4;
      m = i5;
    }
  }

  private void _writeString(String paramString)
    throws IOException, JsonGenerationException
  {
    int i = paramString.length();
    if (i > this._outputEnd)
    {
      _writeLongString(paramString);
      return;
    }
    if (i + this._outputTail > this._outputEnd)
      _flushBuffer();
    paramString.getChars(0, i, this._outputBuffer, this._outputTail);
    if (this._characterEscapes != null)
    {
      _writeStringCustom(i);
      return;
    }
    if (this._maximumNonEscapedChar != 0)
    {
      _writeStringASCII(i, this._maximumNonEscapedChar);
      return;
    }
    _writeString2(i);
  }

  private void _writeString(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    if (this._characterEscapes != null)
      _writeStringCustom(paramArrayOfChar, paramInt1, paramInt2);
    label53: label64: label195: label212: 
    while (true)
    {
      return;
      if (this._maximumNonEscapedChar != 0)
      {
        _writeStringASCII(paramArrayOfChar, paramInt1, paramInt2, this._maximumNonEscapedChar);
        return;
      }
      int i = paramInt2 + paramInt1;
      int[] arrayOfInt = this._outputEscapes;
      int j = arrayOfInt.length;
      int k = paramInt1;
      int m;
      label85: int i1;
      if (k < i)
      {
        m = k;
        int n = paramArrayOfChar[m];
        if ((n >= j) || (arrayOfInt[n] == 0))
          break label182;
        i1 = m - k;
        if (i1 >= 32)
          break label195;
        if (i1 + this._outputTail > this._outputEnd)
          _flushBuffer();
        if (i1 > 0)
        {
          System.arraycopy(paramArrayOfChar, k, this._outputBuffer, this._outputTail, i1);
          this._outputTail = (i1 + this._outputTail);
        }
      }
      while (true)
      {
        if (m >= i)
          break label212;
        k = m + 1;
        char c = paramArrayOfChar[m];
        _appendCharacterEscape(c, arrayOfInt[c]);
        break label53;
        break;
        m++;
        if (m < i)
          break label64;
        break label85;
        _flushBuffer();
        this._writer.write(paramArrayOfChar, k, i1);
      }
    }
  }

  private void _writeString2(int paramInt)
    throws IOException, JsonGenerationException
  {
    int i = paramInt + this._outputTail;
    int[] arrayOfInt = this._outputEscapes;
    int j = arrayOfInt.length;
    if (this._outputTail < i)
    {
      int m;
      do
      {
        int k = this._outputBuffer[this._outputTail];
        if ((k < j) && (arrayOfInt[k] != 0))
        {
          int n = this._outputTail - this._outputHead;
          if (n > 0)
            this._writer.write(this._outputBuffer, this._outputHead, n);
          char[] arrayOfChar = this._outputBuffer;
          int i1 = this._outputTail;
          this._outputTail = (i1 + 1);
          char c = arrayOfChar[i1];
          _prependOrWriteCharacterEscape(c, arrayOfInt[c]);
          break;
        }
        m = 1 + this._outputTail;
        this._outputTail = m;
      }
      while (m < i);
    }
  }

  private void _writeStringASCII(int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = paramInt1 + this._outputTail;
    int[] arrayOfInt = this._outputEscapes;
    int j = Math.min(arrayOfInt.length, paramInt2 + 1);
    if (this._outputTail < i)
    {
      label128: int m;
      do
      {
        int k = this._outputBuffer[this._outputTail];
        int n;
        if (k < j)
        {
          n = arrayOfInt[k];
          if (n == 0);
        }
        else
        {
          while (true)
          {
            int i1 = this._outputTail - this._outputHead;
            if (i1 > 0)
              this._writer.write(this._outputBuffer, this._outputHead, i1);
            this._outputTail = (1 + this._outputTail);
            _prependOrWriteCharacterEscape(k, n);
            break;
            if (k <= paramInt2)
              break label128;
            n = -1;
          }
        }
        m = 1 + this._outputTail;
        this._outputTail = m;
      }
      while (m < i);
    }
  }

  private void _writeStringASCII(char[] paramArrayOfChar, int paramInt1, int paramInt2, int paramInt3)
    throws IOException, JsonGenerationException
  {
    int i = paramInt2 + paramInt1;
    int[] arrayOfInt = this._outputEscapes;
    int j = Math.min(arrayOfInt.length, paramInt3 + 1);
    int k = 0;
    int m = paramInt1;
    while (true)
    {
      int n;
      int i1;
      label65: int i2;
      if (m < i)
      {
        n = m;
        i1 = paramArrayOfChar[n];
        if (i1 >= j)
          break label137;
        k = arrayOfInt[i1];
        if (k == 0)
          break label150;
        i2 = n - m;
        if (i2 >= 32)
          break label163;
        if (i2 + this._outputTail > this._outputEnd)
          _flushBuffer();
        if (i2 > 0)
        {
          System.arraycopy(paramArrayOfChar, m, this._outputBuffer, this._outputTail, i2);
          this._outputTail = (i2 + this._outputTail);
        }
      }
      while (true)
      {
        if (n < i)
          break label182;
        return;
        label137: if (i1 > paramInt3)
        {
          k = -1;
          break label65;
        }
        label150: n++;
        if (n < i)
          break;
        break label65;
        label163: _flushBuffer();
        this._writer.write(paramArrayOfChar, m, i2);
      }
      label182: m = n + 1;
      _appendCharacterEscape(i1, k);
    }
  }

  private void _writeStringCustom(int paramInt)
    throws IOException, JsonGenerationException
  {
    int i = paramInt + this._outputTail;
    int[] arrayOfInt = this._outputEscapes;
    int j;
    int k;
    CharacterEscapes localCharacterEscapes;
    if (this._maximumNonEscapedChar < 1)
    {
      j = 65535;
      k = Math.min(arrayOfInt.length, j + 1);
      localCharacterEscapes = this._characterEscapes;
      label41: if (this._outputTail >= i);
    }
    else
    {
      label181: int n;
      do
      {
        int m = this._outputBuffer[this._outputTail];
        int i1;
        if (m < k)
        {
          i1 = arrayOfInt[m];
          if (i1 == 0);
        }
        else
        {
          while (true)
          {
            int i2 = this._outputTail - this._outputHead;
            if (i2 > 0)
              this._writer.write(this._outputBuffer, this._outputHead, i2);
            this._outputTail = (1 + this._outputTail);
            _prependOrWriteCharacterEscape(m, i1);
            break label41;
            j = this._maximumNonEscapedChar;
            break;
            if (m > j)
            {
              i1 = -1;
            }
            else
            {
              SerializableString localSerializableString = localCharacterEscapes.getEscapeSequence(m);
              this._currentEscape = localSerializableString;
              if (localSerializableString == null)
                break label181;
              i1 = -2;
            }
          }
        }
        n = 1 + this._outputTail;
        this._outputTail = n;
      }
      while (n < i);
    }
  }

  private void _writeStringCustom(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = paramInt2 + paramInt1;
    int[] arrayOfInt = this._outputEscapes;
    int j;
    int k;
    CharacterEscapes localCharacterEscapes;
    int m;
    int n;
    if (this._maximumNonEscapedChar < 1)
    {
      j = 65535;
      k = Math.min(arrayOfInt.length, j + 1);
      localCharacterEscapes = this._characterEscapes;
      m = 0;
      n = paramInt1;
    }
    while (true)
    {
      int i1;
      label58: int i2;
      label83: int i3;
      if (n < i)
      {
        i1 = n;
        i2 = paramArrayOfChar[i1];
        if (i2 >= k)
          break label164;
        m = arrayOfInt[i2];
        if (m == 0)
          break label204;
        i3 = i1 - n;
        if (i3 >= 32)
          break label217;
        if (i3 + this._outputTail > this._outputEnd)
          _flushBuffer();
        if (i3 > 0)
        {
          System.arraycopy(paramArrayOfChar, n, this._outputBuffer, this._outputTail, i3);
          this._outputTail = (i3 + this._outputTail);
        }
      }
      while (true)
      {
        if (i1 < i)
          break label236;
        return;
        j = this._maximumNonEscapedChar;
        break;
        label164: if (i2 > j)
        {
          m = -1;
          break label83;
        }
        SerializableString localSerializableString = localCharacterEscapes.getEscapeSequence(i2);
        this._currentEscape = localSerializableString;
        if (localSerializableString != null)
        {
          m = -2;
          break label83;
        }
        label204: i1++;
        if (i1 < i)
          break label58;
        break label83;
        label217: _flushBuffer();
        this._writer.write(paramArrayOfChar, n, i3);
      }
      label236: n = i1 + 1;
      _appendCharacterEscape(i2, m);
    }
  }

  private void writeRawLong(String paramString)
    throws IOException, JsonGenerationException
  {
    int i = this._outputEnd - this._outputTail;
    paramString.getChars(0, i, this._outputBuffer, this._outputTail);
    this._outputTail = (i + this._outputTail);
    _flushBuffer();
    int j = paramString.length() - i;
    while (j > this._outputEnd)
    {
      int k = this._outputEnd;
      paramString.getChars(i, i + k, this._outputBuffer, 0);
      this._outputHead = 0;
      this._outputTail = k;
      _flushBuffer();
      i += k;
      j -= k;
    }
    paramString.getChars(i, i + j, this._outputBuffer, 0);
    this._outputHead = 0;
    this._outputTail = j;
  }

  protected void _flushBuffer()
    throws IOException
  {
    int i = this._outputTail - this._outputHead;
    if (i > 0)
    {
      int j = this._outputHead;
      this._outputHead = 0;
      this._outputTail = 0;
      this._writer.write(this._outputBuffer, j, i);
    }
  }

  protected void _releaseBuffers()
  {
    char[] arrayOfChar = this._outputBuffer;
    if (arrayOfChar != null)
    {
      this._outputBuffer = null;
      this._ioContext.releaseConcatBuffer(arrayOfChar);
    }
  }

  protected void _verifyPrettyValueWrite(String paramString, int paramInt)
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

  protected void _verifyValueWrite(String paramString)
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
      writeRaw(this._rootValueSeparator.getValue());
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
        char[] arrayOfChar1 = this._outputBuffer;
        int i8 = this._outputTail;
        this._outputTail = (i8 + 1);
        arrayOfChar1[i8] = '\\';
        char[] arrayOfChar2 = this._outputBuffer;
        int i9 = this._outputTail;
        this._outputTail = (i9 + 1);
        arrayOfChar2[i9] = 'n';
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
        char[] arrayOfChar1 = this._outputBuffer;
        int i11 = this._outputTail;
        this._outputTail = (i11 + 1);
        arrayOfChar1[i11] = '\\';
        char[] arrayOfChar2 = this._outputBuffer;
        int i12 = this._outputTail;
        this._outputTail = (i12 + 1);
        arrayOfChar2[i12] = 'n';
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
        char[] arrayOfChar1 = this._outputBuffer;
        int i6 = this._outputTail;
        this._outputTail = (i6 + 1);
        arrayOfChar1[i6] = '\\';
        char[] arrayOfChar2 = this._outputBuffer;
        int i7 = this._outputTail;
        this._outputTail = (i7 + 1);
        arrayOfChar2[i7] = 'n';
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

  public void _writeFieldName(SerializableString paramSerializableString, boolean paramBoolean)
    throws IOException, JsonGenerationException
  {
    if (this._cfgPrettyPrinter != null)
    {
      _writePPFieldName(paramSerializableString, paramBoolean);
      return;
    }
    if (1 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    if (paramBoolean)
    {
      char[] arrayOfChar5 = this._outputBuffer;
      int n = this._outputTail;
      this._outputTail = (n + 1);
      arrayOfChar5[n] = ',';
    }
    char[] arrayOfChar1 = paramSerializableString.asQuotedChars();
    if (!isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES))
    {
      writeRaw(arrayOfChar1, 0, arrayOfChar1.length);
      return;
    }
    char[] arrayOfChar2 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar2[i] = '"';
    int j = arrayOfChar1.length;
    if (1 + (j + this._outputTail) >= this._outputEnd)
    {
      writeRaw(arrayOfChar1, 0, j);
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      char[] arrayOfChar4 = this._outputBuffer;
      int m = this._outputTail;
      this._outputTail = (m + 1);
      arrayOfChar4[m] = '"';
      return;
    }
    System.arraycopy(arrayOfChar1, 0, this._outputBuffer, this._outputTail, j);
    this._outputTail = (j + this._outputTail);
    char[] arrayOfChar3 = this._outputBuffer;
    int k = this._outputTail;
    this._outputTail = (k + 1);
    arrayOfChar3[k] = '"';
  }

  protected void _writeFieldName(String paramString, boolean paramBoolean)
    throws IOException, JsonGenerationException
  {
    if (this._cfgPrettyPrinter != null)
    {
      _writePPFieldName(paramString, paramBoolean);
      return;
    }
    if (1 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    if (paramBoolean)
    {
      char[] arrayOfChar3 = this._outputBuffer;
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfChar3[k] = ',';
    }
    if (!isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES))
    {
      _writeString(paramString);
      return;
    }
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    _writeString(paramString);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfChar2[j] = '"';
  }

  protected void _writePPFieldName(SerializableString paramSerializableString, boolean paramBoolean)
    throws IOException, JsonGenerationException
  {
    if (paramBoolean)
      this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
    char[] arrayOfChar1;
    while (true)
    {
      arrayOfChar1 = paramSerializableString.asQuotedChars();
      if (!isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES))
        break;
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      char[] arrayOfChar2 = this._outputBuffer;
      int i = this._outputTail;
      this._outputTail = (i + 1);
      arrayOfChar2[i] = '"';
      writeRaw(arrayOfChar1, 0, arrayOfChar1.length);
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      char[] arrayOfChar3 = this._outputBuffer;
      int j = this._outputTail;
      this._outputTail = (j + 1);
      arrayOfChar3[j] = '"';
      return;
      this._cfgPrettyPrinter.beforeObjectEntries(this);
    }
    writeRaw(arrayOfChar1, 0, arrayOfChar1.length);
  }

  protected void _writePPFieldName(String paramString, boolean paramBoolean)
    throws IOException, JsonGenerationException
  {
    if (paramBoolean)
      this._cfgPrettyPrinter.writeObjectEntrySeparator(this);
    while (isEnabled(JsonGenerator.Feature.QUOTE_FIELD_NAMES))
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      char[] arrayOfChar1 = this._outputBuffer;
      int i = this._outputTail;
      this._outputTail = (i + 1);
      arrayOfChar1[i] = '"';
      _writeString(paramString);
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      char[] arrayOfChar2 = this._outputBuffer;
      int j = this._outputTail;
      this._outputTail = (j + 1);
      arrayOfChar2[j] = '"';
      return;
      this._cfgPrettyPrinter.beforeObjectEntries(this);
    }
    _writeString(paramString);
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
    if (this._writer != null)
    {
      if ((!this._ioContext.isResourceManaged()) && (!isEnabled(JsonGenerator.Feature.AUTO_CLOSE_TARGET)))
        break label97;
      this._writer.close();
    }
    while (true)
    {
      _releaseBuffers();
      return;
      label97: if (isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM))
        this._writer.flush();
    }
  }

  public void flush()
    throws IOException
  {
    _flushBuffer();
    if ((this._writer != null) && (isEnabled(JsonGenerator.Feature.FLUSH_PASSED_TO_STREAM)))
      this._writer.flush();
  }

  public Object getOutputTarget()
  {
    return this._writer;
  }

  public int writeBinary(Base64Variant paramBase64Variant, InputStream paramInputStream, int paramInt)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write binary value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    byte[] arrayOfByte = this._ioContext.allocBase64Buffer();
    if (paramInt < 0);
    try
    {
      int m = _writeBinary(paramBase64Variant, paramInputStream, arrayOfByte);
      paramInt = m;
      while (true)
      {
        this._ioContext.releaseBase64Buffer(arrayOfByte);
        if (this._outputTail >= this._outputEnd)
          _flushBuffer();
        char[] arrayOfChar2 = this._outputBuffer;
        int k = this._outputTail;
        this._outputTail = (k + 1);
        arrayOfChar2[k] = '"';
        return paramInt;
        int j = _writeBinary(paramBase64Variant, paramInputStream, arrayOfByte, paramInt);
        if (j > 0)
          _reportError("Too few bytes available: missing " + j + " bytes (out of " + paramInt + ")");
      }
    }
    finally
    {
      this._ioContext.releaseBase64Buffer(arrayOfByte);
    }
  }

  public void writeBinary(Base64Variant paramBase64Variant, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write binary value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    _writeBinary(paramBase64Variant, paramArrayOfByte, paramInt1, paramInt1 + paramInt2);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfChar2[j] = '"';
  }

  public void writeBoolean(boolean paramBoolean)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write boolean value");
    if (5 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    int i = this._outputTail;
    char[] arrayOfChar = this._outputBuffer;
    int n;
    if (paramBoolean)
    {
      arrayOfChar[i] = 't';
      int i1 = i + 1;
      arrayOfChar[i1] = 'r';
      int i2 = i1 + 1;
      arrayOfChar[i2] = 'u';
      n = i2 + 1;
      arrayOfChar[n] = 'e';
    }
    while (true)
    {
      this._outputTail = (n + 1);
      return;
      arrayOfChar[i] = 'f';
      int j = i + 1;
      arrayOfChar[j] = 'a';
      int k = j + 1;
      arrayOfChar[k] = 'l';
      int m = k + 1;
      arrayOfChar[m] = 's';
      n = m + 1;
      arrayOfChar[n] = 'e';
    }
  }

  public void writeEndArray()
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
      char[] arrayOfChar = this._outputBuffer;
      int i = this._outputTail;
      this._outputTail = (i + 1);
      arrayOfChar[i] = ']';
    }
  }

  public void writeEndObject()
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
      char[] arrayOfChar = this._outputBuffer;
      int i = this._outputTail;
      this._outputTail = (i + 1);
      arrayOfChar[i] = '}';
    }
  }

  public void writeFieldName(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    int i = 1;
    int j = this._writeContext.writeFieldName(paramSerializableString.getValue());
    if (j == 4)
      _reportError("Can not write a field name, expecting a value");
    if (j == i);
    while (true)
    {
      _writeFieldName(paramSerializableString, i);
      return;
      i = 0;
    }
  }

  public void writeFieldName(String paramString)
    throws IOException, JsonGenerationException
  {
    int i = 1;
    int j = this._writeContext.writeFieldName(paramString);
    if (j == 4)
      _reportError("Can not write a field name, expecting a value");
    if (j == i);
    while (true)
    {
      _writeFieldName(paramString, i);
      return;
      i = 0;
    }
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
    if (this._cfgNumbersAsStrings)
    {
      _writeQuotedInt(paramInt);
      return;
    }
    if (11 + this._outputTail >= this._outputEnd)
      _flushBuffer();
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
    if (this._cfgNumbersAsStrings)
    {
      _writeQuotedShort(paramShort);
      return;
    }
    if (6 + this._outputTail >= this._outputEnd)
      _flushBuffer();
    this._outputTail = NumberOutput.outputInt(paramShort, this._outputBuffer, this._outputTail);
  }

  public void writeRaw(char paramChar)
    throws IOException, JsonGenerationException
  {
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar[i] = paramChar;
  }

  public void writeRaw(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    writeRaw(paramSerializableString.getValue());
  }

  public void writeRaw(String paramString)
    throws IOException, JsonGenerationException
  {
    int i = paramString.length();
    int j = this._outputEnd - this._outputTail;
    if (j == 0)
    {
      _flushBuffer();
      j = this._outputEnd - this._outputTail;
    }
    if (j >= i)
    {
      paramString.getChars(0, i, this._outputBuffer, this._outputTail);
      this._outputTail = (i + this._outputTail);
      return;
    }
    writeRawLong(paramString);
  }

  public void writeRaw(String paramString, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    int i = this._outputEnd - this._outputTail;
    if (i < paramInt2)
    {
      _flushBuffer();
      i = this._outputEnd - this._outputTail;
    }
    if (i >= paramInt2)
    {
      paramString.getChars(paramInt1, paramInt1 + paramInt2, this._outputBuffer, this._outputTail);
      this._outputTail = (paramInt2 + this._outputTail);
      return;
    }
    writeRawLong(paramString.substring(paramInt1, paramInt1 + paramInt2));
  }

  public void writeRaw(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    if (paramInt2 < 32)
    {
      if (paramInt2 > this._outputEnd - this._outputTail)
        _flushBuffer();
      System.arraycopy(paramArrayOfChar, paramInt1, this._outputBuffer, this._outputTail, paramInt2);
      this._outputTail = (paramInt2 + this._outputTail);
      return;
    }
    _flushBuffer();
    this._writer.write(paramArrayOfChar, paramInt1, paramInt2);
  }

  public void writeRawUTF8String(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _reportUnsupportedOperation();
  }

  public void writeStartArray()
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
    char[] arrayOfChar = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar[i] = '[';
  }

  public void writeStartObject()
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
    char[] arrayOfChar = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar[i] = '{';
  }

  public void writeString(SerializableString paramSerializableString)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write text value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    char[] arrayOfChar2 = paramSerializableString.asQuotedChars();
    int j = arrayOfChar2.length;
    if (j < 32)
    {
      if (j > this._outputEnd - this._outputTail)
        _flushBuffer();
      System.arraycopy(arrayOfChar2, 0, this._outputBuffer, this._outputTail, j);
      this._outputTail = (j + this._outputTail);
    }
    while (true)
    {
      if (this._outputTail >= this._outputEnd)
        _flushBuffer();
      char[] arrayOfChar3 = this._outputBuffer;
      int k = this._outputTail;
      this._outputTail = (k + 1);
      arrayOfChar3[k] = '"';
      return;
      _flushBuffer();
      this._writer.write(arrayOfChar2, 0, j);
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
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    _writeString(paramString);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfChar2[j] = '"';
  }

  public void writeString(char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _verifyValueWrite("write text value");
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar1 = this._outputBuffer;
    int i = this._outputTail;
    this._outputTail = (i + 1);
    arrayOfChar1[i] = '"';
    _writeString(paramArrayOfChar, paramInt1, paramInt2);
    if (this._outputTail >= this._outputEnd)
      _flushBuffer();
    char[] arrayOfChar2 = this._outputBuffer;
    int j = this._outputTail;
    this._outputTail = (j + 1);
    arrayOfChar2[j] = '"';
  }

  public void writeUTF8String(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonGenerationException
  {
    _reportUnsupportedOperation();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.json.WriterBasedJsonGenerator
 * JD-Core Version:    0.6.2
 */