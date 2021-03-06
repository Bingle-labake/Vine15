package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.core.base.ParserBase;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.sym.BytesToNameCanonicalizer;
import com.fasterxml.jackson.core.sym.Name;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public final class UTF8StreamJsonParser extends ParserBase
{
  static final byte BYTE_LF = 10;
  private static final int[] sInputCodesLatin1 = CharTypes.getInputCodeLatin1();
  private static final int[] sInputCodesUtf8 = CharTypes.getInputCodeUtf8();
  protected boolean _bufferRecyclable;
  protected byte[] _inputBuffer;
  protected InputStream _inputStream;
  protected ObjectCodec _objectCodec;
  private int _quad1;
  protected int[] _quadBuffer = new int[16];
  protected final BytesToNameCanonicalizer _symbols;
  protected boolean _tokenIncomplete = false;

  public UTF8StreamJsonParser(IOContext paramIOContext, int paramInt1, InputStream paramInputStream, ObjectCodec paramObjectCodec, BytesToNameCanonicalizer paramBytesToNameCanonicalizer, byte[] paramArrayOfByte, int paramInt2, int paramInt3, boolean paramBoolean)
  {
    super(paramIOContext, paramInt1);
    this._inputStream = paramInputStream;
    this._objectCodec = paramObjectCodec;
    this._symbols = paramBytesToNameCanonicalizer;
    this._inputBuffer = paramArrayOfByte;
    this._inputPtr = paramInt2;
    this._inputEnd = paramInt3;
    this._bufferRecyclable = paramBoolean;
  }

  private int _decodeUtf8_2(int paramInt)
    throws IOException, JsonParseException
  {
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = arrayOfByte[i];
    if ((j & 0xC0) != 128)
      _reportInvalidOther(j & 0xFF, this._inputPtr);
    return (paramInt & 0x1F) << 6 | j & 0x3F;
  }

  private int _decodeUtf8_3(int paramInt)
    throws IOException, JsonParseException
  {
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    int i = paramInt & 0xF;
    byte[] arrayOfByte1 = this._inputBuffer;
    int j = this._inputPtr;
    this._inputPtr = (j + 1);
    int k = arrayOfByte1[j];
    if ((k & 0xC0) != 128)
      _reportInvalidOther(k & 0xFF, this._inputPtr);
    int m = i << 6 | k & 0x3F;
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte2 = this._inputBuffer;
    int n = this._inputPtr;
    this._inputPtr = (n + 1);
    int i1 = arrayOfByte2[n];
    if ((i1 & 0xC0) != 128)
      _reportInvalidOther(i1 & 0xFF, this._inputPtr);
    return m << 6 | i1 & 0x3F;
  }

  private int _decodeUtf8_3fast(int paramInt)
    throws IOException, JsonParseException
  {
    int i = paramInt & 0xF;
    byte[] arrayOfByte1 = this._inputBuffer;
    int j = this._inputPtr;
    this._inputPtr = (j + 1);
    int k = arrayOfByte1[j];
    if ((k & 0xC0) != 128)
      _reportInvalidOther(k & 0xFF, this._inputPtr);
    int m = i << 6 | k & 0x3F;
    byte[] arrayOfByte2 = this._inputBuffer;
    int n = this._inputPtr;
    this._inputPtr = (n + 1);
    int i1 = arrayOfByte2[n];
    if ((i1 & 0xC0) != 128)
      _reportInvalidOther(i1 & 0xFF, this._inputPtr);
    return m << 6 | i1 & 0x3F;
  }

  private int _decodeUtf8_4(int paramInt)
    throws IOException, JsonParseException
  {
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte1 = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = arrayOfByte1[i];
    if ((j & 0xC0) != 128)
      _reportInvalidOther(j & 0xFF, this._inputPtr);
    int k = (paramInt & 0x7) << 6 | j & 0x3F;
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte2 = this._inputBuffer;
    int m = this._inputPtr;
    this._inputPtr = (m + 1);
    int n = arrayOfByte2[m];
    if ((n & 0xC0) != 128)
      _reportInvalidOther(n & 0xFF, this._inputPtr);
    int i1 = k << 6 | n & 0x3F;
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte3 = this._inputBuffer;
    int i2 = this._inputPtr;
    this._inputPtr = (i2 + 1);
    int i3 = arrayOfByte3[i2];
    if ((i3 & 0xC0) != 128)
      _reportInvalidOther(i3 & 0xFF, this._inputPtr);
    return (i1 << 6 | i3 & 0x3F) - 65536;
  }

  private void _finishString2(char[] paramArrayOfChar, int paramInt)
    throws IOException, JsonParseException
  {
    int[] arrayOfInt = sInputCodesUtf8;
    byte[] arrayOfByte = this._inputBuffer;
    int m;
    while (true)
    {
      int i = this._inputPtr;
      if (i >= this._inputEnd)
      {
        loadMoreGuaranteed();
        i = this._inputPtr;
      }
      if (paramInt >= paramArrayOfChar.length)
      {
        paramArrayOfChar = this._textBuffer.finishCurrentSegment();
        paramInt = 0;
      }
      int j = Math.min(this._inputEnd, i + (paramArrayOfChar.length - paramInt));
      while (i < j)
      {
        int k = i + 1;
        m = 0xFF & arrayOfByte[i];
        if (arrayOfInt[m] != 0)
        {
          this._inputPtr = k;
          if (m != 34)
            break label150;
          this._textBuffer.setCurrentLength(paramInt);
          return;
        }
        int n = paramInt + 1;
        paramArrayOfChar[paramInt] = ((char)m);
        i = k;
        paramInt = n;
      }
      this._inputPtr = i;
    }
    label150: switch (arrayOfInt[m])
    {
    default:
      if (m < 32)
      {
        _throwUnquotedSpace(m, "string value");
        label199: if (paramInt < paramArrayOfChar.length)
          break label359;
        paramArrayOfChar = this._textBuffer.finishCurrentSegment();
      }
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    }
    label359: for (int i4 = 0; ; i4 = paramInt)
    {
      paramInt = i4 + 1;
      paramArrayOfChar[i4] = ((char)m);
      break;
      m = _decodeEscaped();
      break label199;
      m = _decodeUtf8_2(m);
      break label199;
      if (this._inputEnd - this._inputPtr >= 2)
      {
        m = _decodeUtf8_3fast(m);
        break label199;
      }
      m = _decodeUtf8_3(m);
      break label199;
      int i1 = _decodeUtf8_4(m);
      int i2 = paramInt + 1;
      paramArrayOfChar[paramInt] = ((char)(0xD800 | i1 >> 10));
      if (i2 >= paramArrayOfChar.length)
      {
        paramArrayOfChar = this._textBuffer.finishCurrentSegment();
        i2 = 0;
      }
      int i3 = 0xDC00 | i1 & 0x3FF;
      paramInt = i2;
      m = i3;
      break label199;
      _reportInvalidChar(m);
      break label199;
    }
  }

  private boolean _isNextTokenNameMaybe(int paramInt, SerializableString paramSerializableString)
    throws IOException, JsonParseException
  {
    String str = _parseFieldName(paramInt).getName();
    this._parsingContext.setCurrentName(str);
    boolean bool = str.equals(paramSerializableString.getValue());
    this._currToken = JsonToken.FIELD_NAME;
    int i = _skipWS();
    if (i != 58)
      _reportUnexpectedChar(i, "was expecting a colon to separate field name and value");
    int j = _skipWS();
    if (j == 34)
    {
      this._tokenIncomplete = true;
      this._nextToken = JsonToken.VALUE_STRING;
      return bool;
    }
    JsonToken localJsonToken;
    switch (j)
    {
    default:
      localJsonToken = _handleUnexpectedValue(j);
    case 91:
    case 123:
    case 93:
    case 125:
    case 116:
    case 102:
    case 110:
    case 45:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    }
    while (true)
    {
      this._nextToken = localJsonToken;
      return bool;
      localJsonToken = JsonToken.START_ARRAY;
      continue;
      localJsonToken = JsonToken.START_OBJECT;
      continue;
      _reportUnexpectedChar(j, "expected a value");
      _matchToken("true", 1);
      localJsonToken = JsonToken.VALUE_TRUE;
      continue;
      _matchToken("false", 1);
      localJsonToken = JsonToken.VALUE_FALSE;
      continue;
      _matchToken("null", 1);
      localJsonToken = JsonToken.VALUE_NULL;
      continue;
      localJsonToken = parseNumberText(j);
    }
  }

  private void _isNextTokenNameYes()
    throws IOException, JsonParseException
  {
    if ((this._inputPtr < -1 + this._inputEnd) && (this._inputBuffer[this._inputPtr] == 58))
    {
      byte[] arrayOfByte = this._inputBuffer;
      int j = 1 + this._inputPtr;
      this._inputPtr = j;
      int k = arrayOfByte[j];
      this._inputPtr = (1 + this._inputPtr);
      if (k == 34)
      {
        this._tokenIncomplete = true;
        this._nextToken = JsonToken.VALUE_STRING;
        return;
      }
      if (k == 123)
      {
        this._nextToken = JsonToken.START_OBJECT;
        return;
      }
      if (k == 91)
      {
        this._nextToken = JsonToken.START_ARRAY;
        return;
      }
      i = k & 0xFF;
      if ((i <= 32) || (i == 47))
        this._inputPtr = (-1 + this._inputPtr);
    }
    for (int i = _skipWS(); ; i = _skipColon())
      switch (i)
      {
      default:
        this._nextToken = _handleUnexpectedValue(i);
        return;
      case 34:
      case 91:
      case 123:
      case 93:
      case 125:
      case 116:
      case 102:
      case 110:
      case 45:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      }
    this._tokenIncomplete = true;
    this._nextToken = JsonToken.VALUE_STRING;
    return;
    this._nextToken = JsonToken.START_ARRAY;
    return;
    this._nextToken = JsonToken.START_OBJECT;
    return;
    _reportUnexpectedChar(i, "expected a value");
    _matchToken("true", 1);
    this._nextToken = JsonToken.VALUE_TRUE;
    return;
    _matchToken("false", 1);
    this._nextToken = JsonToken.VALUE_FALSE;
    return;
    _matchToken("null", 1);
    this._nextToken = JsonToken.VALUE_NULL;
    return;
    this._nextToken = parseNumberText(i);
  }

  private JsonToken _nextAfterName()
  {
    this._nameCopied = false;
    JsonToken localJsonToken = this._nextToken;
    this._nextToken = null;
    if (localJsonToken == JsonToken.START_ARRAY)
      this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
    while (true)
    {
      this._currToken = localJsonToken;
      return localJsonToken;
      if (localJsonToken == JsonToken.START_OBJECT)
        this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
    }
  }

  private JsonToken _nextTokenNotInObject(int paramInt)
    throws IOException, JsonParseException
  {
    if (paramInt == 34)
    {
      this._tokenIncomplete = true;
      JsonToken localJsonToken8 = JsonToken.VALUE_STRING;
      this._currToken = localJsonToken8;
      return localJsonToken8;
    }
    switch (paramInt)
    {
    default:
      JsonToken localJsonToken7 = _handleUnexpectedValue(paramInt);
      this._currToken = localJsonToken7;
      return localJsonToken7;
    case 91:
      this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
      JsonToken localJsonToken6 = JsonToken.START_ARRAY;
      this._currToken = localJsonToken6;
      return localJsonToken6;
    case 123:
      this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
      JsonToken localJsonToken5 = JsonToken.START_OBJECT;
      this._currToken = localJsonToken5;
      return localJsonToken5;
    case 93:
    case 125:
      _reportUnexpectedChar(paramInt, "expected a value");
    case 116:
      _matchToken("true", 1);
      JsonToken localJsonToken4 = JsonToken.VALUE_TRUE;
      this._currToken = localJsonToken4;
      return localJsonToken4;
    case 102:
      _matchToken("false", 1);
      JsonToken localJsonToken3 = JsonToken.VALUE_FALSE;
      this._currToken = localJsonToken3;
      return localJsonToken3;
    case 110:
      _matchToken("null", 1);
      JsonToken localJsonToken2 = JsonToken.VALUE_NULL;
      this._currToken = localJsonToken2;
      return localJsonToken2;
    case 45:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    }
    JsonToken localJsonToken1 = parseNumberText(paramInt);
    this._currToken = localJsonToken1;
    return localJsonToken1;
  }

  private JsonToken _parseFloatText(char[] paramArrayOfChar, int paramInt1, int paramInt2, boolean paramBoolean, int paramInt3)
    throws IOException, JsonParseException
  {
    int i = 0;
    int i14;
    int k;
    label40: int m;
    int j;
    char[] arrayOfChar;
    if (paramInt2 == 46)
    {
      i14 = paramInt1 + 1;
      paramArrayOfChar[paramInt1] = ((char)paramInt2);
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      {
        k = 1;
        if (i == 0)
          reportUnexpectedNumberChar(paramInt2, "Decimal point not followed by a digit");
        m = i;
        j = i14;
        arrayOfChar = paramArrayOfChar;
      }
    }
    while (true)
    {
      int n;
      int i2;
      int i3;
      label188: int i6;
      int i7;
      label255: int i12;
      int i11;
      int i8;
      int i10;
      if ((paramInt2 == 101) || (paramInt2 == 69))
      {
        if (j >= arrayOfChar.length)
        {
          arrayOfChar = this._textBuffer.finishCurrentSegment();
          j = 0;
        }
        n = j + 1;
        arrayOfChar[j] = ((char)paramInt2);
        if (this._inputPtr >= this._inputEnd)
          loadMoreGuaranteed();
        byte[] arrayOfByte1 = this._inputBuffer;
        int i1 = this._inputPtr;
        this._inputPtr = (i1 + 1);
        i2 = 0xFF & arrayOfByte1[i1];
        if ((i2 == 45) || (i2 == 43))
          if (n >= arrayOfChar.length)
          {
            arrayOfChar = this._textBuffer.finishCurrentSegment();
            i3 = 0;
            int i4 = i3 + 1;
            arrayOfChar[i3] = ((char)i2);
            if (this._inputPtr >= this._inputEnd)
              loadMoreGuaranteed();
            byte[] arrayOfByte2 = this._inputBuffer;
            int i5 = this._inputPtr;
            this._inputPtr = (i5 + 1);
            i2 = 0xFF & arrayOfByte2[i5];
            i6 = i4;
            i7 = 0;
            if ((i2 <= 57) && (i2 >= 48))
            {
              i7++;
              if (i6 >= arrayOfChar.length)
              {
                arrayOfChar = this._textBuffer.finishCurrentSegment();
                i6 = 0;
              }
              i12 = i6 + 1;
              arrayOfChar[i6] = ((char)i2);
              if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
              {
                i11 = i7;
                i8 = 1;
                i10 = i12;
                label335: if (i11 == 0)
                  reportUnexpectedNumberChar(i2, "Exponent indicator not followed by a digit");
                label348: if (i8 == 0)
                  this._inputPtr = (-1 + this._inputPtr);
                this._textBuffer.setCurrentLength(i10);
                return resetFloat(paramBoolean, paramInt3, m, i11);
                byte[] arrayOfByte4 = this._inputBuffer;
                int i15 = this._inputPtr;
                this._inputPtr = (i15 + 1);
                paramInt2 = 0xFF & arrayOfByte4[i15];
                k = 0;
                if (paramInt2 < 48)
                  break label40;
                k = 0;
                if (paramInt2 > 57)
                  break label40;
                i++;
                if (i14 < paramArrayOfChar.length)
                  break label557;
                paramArrayOfChar = this._textBuffer.finishCurrentSegment();
              }
            }
          }
      }
      label557: for (int i16 = 0; ; i16 = i14)
      {
        i14 = i16 + 1;
        paramArrayOfChar[i16] = ((char)paramInt2);
        break;
        byte[] arrayOfByte3 = this._inputBuffer;
        int i13 = this._inputPtr;
        this._inputPtr = (i13 + 1);
        i2 = 0xFF & arrayOfByte3[i13];
        i6 = i12;
        break label255;
        i8 = k;
        int i9 = i7;
        i10 = i6;
        i11 = i9;
        break label335;
        i3 = n;
        break label188;
        i6 = n;
        i7 = 0;
        break label255;
        i8 = k;
        i10 = j;
        i11 = 0;
        break label348;
      }
      arrayOfChar = paramArrayOfChar;
      j = paramInt1;
      k = 0;
      m = 0;
    }
  }

  private JsonToken _parserNumber2(char[] paramArrayOfChar, int paramInt1, boolean paramBoolean, int paramInt2)
    throws IOException, JsonParseException
  {
    int i = paramInt2;
    int j = paramInt1;
    char[] arrayOfChar = paramArrayOfChar;
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
    {
      this._textBuffer.setCurrentLength(j);
      return resetInt(paramBoolean, i);
    }
    byte[] arrayOfByte = this._inputBuffer;
    int k = this._inputPtr;
    this._inputPtr = (k + 1);
    int m = 0xFF & arrayOfByte[k];
    if ((m > 57) || (m < 48))
    {
      if ((m == 46) || (m == 101) || (m == 69))
        return _parseFloatText(arrayOfChar, j, m, paramBoolean, i);
    }
    else
    {
      if (j < arrayOfChar.length)
        break label192;
      arrayOfChar = this._textBuffer.finishCurrentSegment();
    }
    label192: for (int n = 0; ; n = j)
    {
      j = n + 1;
      arrayOfChar[n] = ((char)m);
      i++;
      break;
      this._inputPtr = (-1 + this._inputPtr);
      this._textBuffer.setCurrentLength(j);
      return resetInt(paramBoolean, i);
    }
  }

  private void _skipCComment()
    throws IOException, JsonParseException
  {
    int[] arrayOfInt = CharTypes.getInputCodeComment();
    while (true)
    {
      int j;
      int k;
      if ((this._inputPtr < this._inputEnd) || (loadMore()))
      {
        byte[] arrayOfByte = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = (i + 1);
        j = 0xFF & arrayOfByte[i];
        k = arrayOfInt[j];
        if (k == 0);
      }
      else
      {
        switch (k)
        {
        default:
          _reportInvalidChar(j);
          break;
        case 42:
          if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
          {
            _reportInvalidEOF(" in a comment");
            return;
          }
          if (this._inputBuffer[this._inputPtr] == 47)
          {
            this._inputPtr = (1 + this._inputPtr);
            return;
          }
          break;
        case 10:
          _skipLF();
          break;
        case 13:
          _skipCR();
          break;
        case 2:
          _skipUtf8_2(j);
          break;
        case 3:
          _skipUtf8_3(j);
          break;
        case 4:
          _skipUtf8_4(j);
        }
      }
    }
  }

  private int _skipColon()
    throws IOException, JsonParseException
  {
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte1 = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = arrayOfByte1[i];
    int i1;
    int k;
    if (j == 58)
    {
      if (this._inputPtr < this._inputEnd)
      {
        i1 = 0xFF & this._inputBuffer[this._inputPtr];
        if ((i1 > 32) && (i1 != 47))
        {
          this._inputPtr = (1 + this._inputPtr);
          return i1;
        }
      }
    }
    else
    {
      k = j & 0xFF;
      switch (k)
      {
      default:
        if (k < 32)
          _throwInvalidSpace(k);
        if (k != 58)
          _reportUnexpectedChar(k, "was expecting a colon to separate field name and value");
        break;
      case 13:
      case 9:
      case 32:
      case 10:
      case 47:
      }
    }
    while (true)
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        break label372;
      byte[] arrayOfByte3 = this._inputBuffer;
      int n = this._inputPtr;
      this._inputPtr = (n + 1);
      i1 = 0xFF & arrayOfByte3[n];
      if (i1 > 32)
      {
        if (i1 != 47)
          break;
        _skipComment();
        continue;
        _skipCR();
        while (true)
        {
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          byte[] arrayOfByte2 = this._inputBuffer;
          int m = this._inputPtr;
          this._inputPtr = (m + 1);
          k = 0xFF & arrayOfByte2[m];
          break;
          _skipLF();
          continue;
          _skipComment();
        }
      }
      if (i1 != 32)
        if (i1 == 10)
          _skipLF();
        else if (i1 == 13)
          _skipCR();
        else if (i1 != 9)
          _throwInvalidSpace(i1);
    }
    label372: throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.getTypeDesc() + " entries");
  }

  private void _skipComment()
    throws IOException, JsonParseException
  {
    if (!isEnabled(JsonParser.Feature.ALLOW_COMMENTS))
      _reportUnexpectedChar(47, "maybe a (non-standard) comment? (not recognized as one since Feature 'ALLOW_COMMENTS' not enabled for parser)");
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(" in a comment");
    byte[] arrayOfByte = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = 0xFF & arrayOfByte[i];
    if (j == 47)
    {
      _skipCppComment();
      return;
    }
    if (j == 42)
    {
      _skipCComment();
      return;
    }
    _reportUnexpectedChar(j, "was expecting either '*' or '/' for a comment");
  }

  private void _skipCppComment()
    throws IOException, JsonParseException
  {
    int[] arrayOfInt = CharTypes.getInputCodeComment();
    while (true)
    {
      int j;
      int k;
      if ((this._inputPtr < this._inputEnd) || (loadMore()))
      {
        byte[] arrayOfByte = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = (i + 1);
        j = 0xFF & arrayOfByte[i];
        k = arrayOfInt[j];
        if (k == 0);
      }
      else
      {
        switch (k)
        {
        case 42:
        default:
          _reportInvalidChar(j);
          break;
        case 10:
          _skipLF();
          return;
        case 13:
          _skipCR();
          return;
        case 2:
          _skipUtf8_2(j);
          break;
        case 3:
          _skipUtf8_3(j);
          break;
        case 4:
          _skipUtf8_4(j);
        }
      }
    }
  }

  private void _skipUtf8_2(int paramInt)
    throws IOException, JsonParseException
  {
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = arrayOfByte[i];
    if ((j & 0xC0) != 128)
      _reportInvalidOther(j & 0xFF, this._inputPtr);
  }

  private void _skipUtf8_3(int paramInt)
    throws IOException, JsonParseException
  {
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte1 = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = arrayOfByte1[i];
    if ((j & 0xC0) != 128)
      _reportInvalidOther(j & 0xFF, this._inputPtr);
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte2 = this._inputBuffer;
    int k = this._inputPtr;
    this._inputPtr = (k + 1);
    int m = arrayOfByte2[k];
    if ((m & 0xC0) != 128)
      _reportInvalidOther(m & 0xFF, this._inputPtr);
  }

  private void _skipUtf8_4(int paramInt)
    throws IOException, JsonParseException
  {
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte1 = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = arrayOfByte1[i];
    if ((j & 0xC0) != 128)
      _reportInvalidOther(j & 0xFF, this._inputPtr);
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte2 = this._inputBuffer;
    int k = this._inputPtr;
    this._inputPtr = (k + 1);
    int m = arrayOfByte2[k];
    if ((m & 0xC0) != 128)
      _reportInvalidOther(m & 0xFF, this._inputPtr);
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte3 = this._inputBuffer;
    int n = this._inputPtr;
    this._inputPtr = (n + 1);
    int i1 = arrayOfByte3[n];
    if ((i1 & 0xC0) != 128)
      _reportInvalidOther(i1 & 0xFF, this._inputPtr);
  }

  private int _skipWS()
    throws IOException, JsonParseException
  {
    while ((this._inputPtr < this._inputEnd) || (loadMore()))
    {
      byte[] arrayOfByte = this._inputBuffer;
      int i = this._inputPtr;
      this._inputPtr = (i + 1);
      int j = 0xFF & arrayOfByte[i];
      if (j > 32)
      {
        if (j != 47)
          return j;
        _skipComment();
      }
      else if (j != 32)
      {
        if (j == 10)
          _skipLF();
        else if (j == 13)
          _skipCR();
        else if (j != 9)
          _throwInvalidSpace(j);
      }
    }
    throw _constructError("Unexpected end-of-input within/between " + this._parsingContext.getTypeDesc() + " entries");
  }

  private int _skipWSOrEnd()
    throws IOException, JsonParseException
  {
    while ((this._inputPtr < this._inputEnd) || (loadMore()))
    {
      byte[] arrayOfByte = this._inputBuffer;
      int i = this._inputPtr;
      this._inputPtr = (i + 1);
      int j = 0xFF & arrayOfByte[i];
      if (j > 32)
      {
        if (j != 47)
          return j;
        _skipComment();
      }
      else if (j != 32)
      {
        if (j == 10)
          _skipLF();
        else if (j == 13)
          _skipCR();
        else if (j != 9)
          _throwInvalidSpace(j);
      }
    }
    _handleEOF();
    return -1;
  }

  private int _verifyNoLeadingZeroes()
    throws IOException, JsonParseException
  {
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()));
    int i;
    do
    {
      i = 48;
      while ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        do
        {
          return i;
          i = 0xFF & this._inputBuffer[this._inputPtr];
          if ((i < 48) || (i > 57))
            return 48;
          if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS))
            reportInvalidNumber("Leading zeroes not allowed");
          this._inputPtr = (1 + this._inputPtr);
        }
        while (i != 48);
      i = 0xFF & this._inputBuffer[this._inputPtr];
      if ((i < 48) || (i > 57))
        return 48;
      this._inputPtr = (1 + this._inputPtr);
    }
    while (i == 48);
    return i;
  }

  private Name addName(int[] paramArrayOfInt, int paramInt1, int paramInt2)
    throws JsonParseException
  {
    int i = paramInt2 + (-4 + (paramInt1 << 2));
    int j;
    Object localObject1;
    int k;
    int m;
    label50: int n;
    int i1;
    int i5;
    int i6;
    label113: int i3;
    int i4;
    Object localObject2;
    int i2;
    if (paramInt2 < 4)
    {
      j = paramArrayOfInt[(paramInt1 - 1)];
      paramArrayOfInt[(paramInt1 - 1)] = (j << (4 - paramInt2 << 3));
      localObject1 = this._textBuffer.emptyAndGetCurrentSegment();
      k = 0;
      m = 0;
      if (m >= i)
        break label490;
      n = 0xFF & paramArrayOfInt[(m >> 2)] >> (3 - (m & 0x3) << 3);
      i1 = m + 1;
      if (n <= 127)
        break label528;
      if ((n & 0xE0) != 192)
        break label424;
      i5 = n & 0x1F;
      i6 = 1;
      if (i1 + i6 > i)
        _reportInvalidEOF(" in field name");
      int i7 = paramArrayOfInt[(i1 >> 2)] >> (3 - (i1 & 0x3) << 3);
      i1++;
      if ((i7 & 0xC0) != 128)
        _reportInvalidOther(i7);
      n = i5 << 6 | i7 & 0x3F;
      if (i6 > 1)
      {
        int i11 = paramArrayOfInt[(i1 >> 2)] >> (3 - (i1 & 0x3) << 3);
        i1++;
        if ((i11 & 0xC0) != 128)
          _reportInvalidOther(i11);
        n = n << 6 | i11 & 0x3F;
        if (i6 > 2)
        {
          int i12 = paramArrayOfInt[(i1 >> 2)] >> (3 - (i1 & 0x3) << 3);
          i1++;
          if ((i12 & 0xC0) != 128)
            _reportInvalidOther(i12 & 0xFF);
          n = n << 6 | i12 & 0x3F;
        }
      }
      if (i6 <= 2)
        break label528;
      int i8 = n - 65536;
      if (k >= localObject1.length)
        localObject1 = this._textBuffer.expandCurrentSegment();
      int i9 = k + 1;
      localObject1[k] = ((char)(55296 + (i8 >> 10)));
      int i10 = 0xDC00 | i8 & 0x3FF;
      i3 = i1;
      i4 = i9;
      localObject2 = localObject1;
      i2 = i10;
    }
    while (true)
    {
      if (i4 >= localObject2.length)
        localObject2 = this._textBuffer.expandCurrentSegment();
      k = i4 + 1;
      localObject2[i4] = ((char)i2);
      m = i3;
      localObject1 = localObject2;
      break label50;
      j = 0;
      break;
      label424: if ((n & 0xF0) == 224)
      {
        i5 = n & 0xF;
        i6 = 2;
        break label113;
      }
      if ((n & 0xF8) == 240)
      {
        i5 = n & 0x7;
        i6 = 3;
        break label113;
      }
      _reportInvalidInitial(n);
      i5 = 1;
      i6 = i5;
      break label113;
      label490: String str = new String((char[])localObject1, 0, k);
      if (paramInt2 < 4)
        paramArrayOfInt[(paramInt1 - 1)] = j;
      return this._symbols.addName(str, paramArrayOfInt, paramInt1);
      label528: localObject2 = localObject1;
      i2 = n;
      i3 = i1;
      i4 = k;
    }
  }

  private Name findName(int paramInt1, int paramInt2)
    throws JsonParseException
  {
    Name localName = this._symbols.findName(paramInt1);
    if (localName != null)
      return localName;
    this._quadBuffer[0] = paramInt1;
    return addName(this._quadBuffer, 1, paramInt2);
  }

  private Name findName(int paramInt1, int paramInt2, int paramInt3)
    throws JsonParseException
  {
    Name localName = this._symbols.findName(paramInt1, paramInt2);
    if (localName != null)
      return localName;
    this._quadBuffer[0] = paramInt1;
    this._quadBuffer[1] = paramInt2;
    return addName(this._quadBuffer, 2, paramInt3);
  }

  private Name findName(int[] paramArrayOfInt, int paramInt1, int paramInt2, int paramInt3)
    throws JsonParseException
  {
    if (paramInt1 >= paramArrayOfInt.length)
    {
      paramArrayOfInt = growArrayBy(paramArrayOfInt, paramArrayOfInt.length);
      this._quadBuffer = paramArrayOfInt;
    }
    int i = paramInt1 + 1;
    paramArrayOfInt[paramInt1] = paramInt2;
    Name localName = this._symbols.findName(paramArrayOfInt, i);
    if (localName == null)
      localName = addName(paramArrayOfInt, i, paramInt3);
    return localName;
  }

  public static int[] growArrayBy(int[] paramArrayOfInt, int paramInt)
  {
    if (paramArrayOfInt == null)
      return new int[paramInt];
    int i = paramArrayOfInt.length;
    int[] arrayOfInt = new int[i + paramInt];
    System.arraycopy(paramArrayOfInt, 0, arrayOfInt, 0, i);
    return arrayOfInt;
  }

  private int nextByte()
    throws IOException, JsonParseException
  {
    if (this._inputPtr >= this._inputEnd)
      loadMoreGuaranteed();
    byte[] arrayOfByte = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    return 0xFF & arrayOfByte[i];
  }

  private Name parseFieldName(int paramInt1, int paramInt2, int paramInt3)
    throws IOException, JsonParseException
  {
    return parseEscapedFieldName(this._quadBuffer, 0, paramInt1, paramInt2, paramInt3);
  }

  private Name parseFieldName(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IOException, JsonParseException
  {
    this._quadBuffer[0] = paramInt1;
    return parseEscapedFieldName(this._quadBuffer, 1, paramInt2, paramInt3, paramInt4);
  }

  protected void _closeInput()
    throws IOException
  {
    if (this._inputStream != null)
    {
      if ((this._ioContext.isResourceManaged()) || (isEnabled(JsonParser.Feature.AUTO_CLOSE_SOURCE)))
        this._inputStream.close();
      this._inputStream = null;
    }
  }

  protected byte[] _decodeBase64(Base64Variant paramBase64Variant)
    throws IOException, JsonParseException
  {
    ByteArrayBuilder localByteArrayBuilder = _getByteArrayBuilder();
    while (true)
    {
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      byte[] arrayOfByte1 = this._inputBuffer;
      int i = this._inputPtr;
      this._inputPtr = (i + 1);
      int j = 0xFF & arrayOfByte1[i];
      if (j > 32)
      {
        int k = paramBase64Variant.decodeBase64Char(j);
        if (k < 0)
        {
          if (j == 34)
            return localByteArrayBuilder.toByteArray();
          k = _decodeBase64Escape(paramBase64Variant, j, 0);
          if (k < 0);
        }
        else
        {
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          byte[] arrayOfByte2 = this._inputBuffer;
          int m = this._inputPtr;
          this._inputPtr = (m + 1);
          int n = 0xFF & arrayOfByte2[m];
          int i1 = paramBase64Variant.decodeBase64Char(n);
          if (i1 < 0)
            i1 = _decodeBase64Escape(paramBase64Variant, n, 1);
          int i2 = i1 | k << 6;
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          byte[] arrayOfByte3 = this._inputBuffer;
          int i3 = this._inputPtr;
          this._inputPtr = (i3 + 1);
          int i4 = 0xFF & arrayOfByte3[i3];
          int i5 = paramBase64Variant.decodeBase64Char(i4);
          if (i5 < 0)
          {
            if (i5 != -2)
            {
              if ((i4 == 34) && (!paramBase64Variant.usesPadding()))
              {
                localByteArrayBuilder.append(i2 >> 4);
                return localByteArrayBuilder.toByteArray();
              }
              i5 = _decodeBase64Escape(paramBase64Variant, i4, 2);
            }
            if (i5 == -2)
            {
              if (this._inputPtr >= this._inputEnd)
                loadMoreGuaranteed();
              byte[] arrayOfByte5 = this._inputBuffer;
              int i10 = this._inputPtr;
              this._inputPtr = (i10 + 1);
              int i11 = 0xFF & arrayOfByte5[i10];
              if (!paramBase64Variant.usesPaddingChar(i11))
                throw reportInvalidBase64Char(paramBase64Variant, i11, 3, "expected padding character '" + paramBase64Variant.getPaddingChar() + "'");
              localByteArrayBuilder.append(i2 >> 4);
            }
          }
          else
          {
            int i6 = i5 | i2 << 6;
            if (this._inputPtr >= this._inputEnd)
              loadMoreGuaranteed();
            byte[] arrayOfByte4 = this._inputBuffer;
            int i7 = this._inputPtr;
            this._inputPtr = (i7 + 1);
            int i8 = 0xFF & arrayOfByte4[i7];
            int i9 = paramBase64Variant.decodeBase64Char(i8);
            if (i9 < 0)
            {
              if (i9 != -2)
              {
                if ((i8 == 34) && (!paramBase64Variant.usesPadding()))
                {
                  localByteArrayBuilder.appendTwoBytes(i6 >> 2);
                  return localByteArrayBuilder.toByteArray();
                }
                i9 = _decodeBase64Escape(paramBase64Variant, i8, 3);
              }
              if (i9 == -2)
                localByteArrayBuilder.appendTwoBytes(i6 >> 2);
            }
            else
            {
              localByteArrayBuilder.appendThreeBytes(i9 | i6 << 6);
            }
          }
        }
      }
    }
  }

  protected int _decodeCharForError(int paramInt)
    throws IOException, JsonParseException
  {
    int i;
    if (paramInt < 0)
    {
      if ((paramInt & 0xE0) != 192)
        break label147;
      paramInt &= 31;
      i = 1;
    }
    while (true)
    {
      int j = nextByte();
      if ((j & 0xC0) != 128)
        _reportInvalidOther(j & 0xFF);
      paramInt = paramInt << 6 | j & 0x3F;
      if (i > 1)
      {
        int k = nextByte();
        if ((k & 0xC0) != 128)
          _reportInvalidOther(k & 0xFF);
        paramInt = paramInt << 6 | k & 0x3F;
        if (i > 2)
        {
          int m = nextByte();
          if ((m & 0xC0) != 128)
            _reportInvalidOther(m & 0xFF);
          paramInt = paramInt << 6 | m & 0x3F;
        }
      }
      return paramInt;
      label147: if ((paramInt & 0xF0) == 224)
      {
        paramInt &= 15;
        i = 2;
      }
      else if ((paramInt & 0xF8) == 240)
      {
        paramInt &= 7;
        i = 3;
      }
      else
      {
        _reportInvalidInitial(paramInt & 0xFF);
        i = 1;
      }
    }
  }

  protected char _decodeEscaped()
    throws IOException, JsonParseException
  {
    int i = 0;
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(" in character escape sequence");
    byte[] arrayOfByte1 = this._inputBuffer;
    int j = this._inputPtr;
    this._inputPtr = (j + 1);
    int k = arrayOfByte1[j];
    switch (k)
    {
    default:
      return _handleUnrecognizedCharacterEscape((char)_decodeCharForError(k));
    case 98:
      return '\b';
    case 116:
      return '\t';
    case 110:
      return '\n';
    case 102:
      return '\f';
    case 114:
      return '\r';
    case 34:
    case 47:
    case 92:
      return (char)k;
    case 117:
    }
    int m = 0;
    while (i < 4)
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        _reportInvalidEOF(" in character escape sequence");
      byte[] arrayOfByte2 = this._inputBuffer;
      int n = this._inputPtr;
      this._inputPtr = (n + 1);
      int i1 = arrayOfByte2[n];
      int i2 = CharTypes.charToHex(i1);
      if (i2 < 0)
        _reportUnexpectedChar(i1, "expected a hex-digit for character escape sequence");
      m = i2 | m << 4;
      i++;
    }
    return (char)m;
  }

  protected void _finishString()
    throws IOException, JsonParseException
  {
    int i = this._inputPtr;
    if (i >= this._inputEnd)
    {
      loadMoreGuaranteed();
      i = this._inputPtr;
    }
    char[] arrayOfChar = this._textBuffer.emptyAndGetCurrentSegment();
    int[] arrayOfInt = sInputCodesUtf8;
    int j = Math.min(this._inputEnd, i + arrayOfChar.length);
    byte[] arrayOfByte = this._inputBuffer;
    int k = i;
    int m = 0;
    while (k < j)
    {
      int n = 0xFF & arrayOfByte[k];
      if (arrayOfInt[n] != 0)
      {
        if (n != 34)
          break;
        this._inputPtr = (k + 1);
        this._textBuffer.setCurrentLength(m);
        return;
      }
      int i1 = k + 1;
      int i2 = m + 1;
      arrayOfChar[m] = ((char)n);
      m = i2;
      k = i1;
    }
    this._inputPtr = k;
    _finishString2(arrayOfChar, m);
  }

  protected String _getText2(JsonToken paramJsonToken)
  {
    if (paramJsonToken == null)
      return null;
    switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[paramJsonToken.ordinal()])
    {
    default:
      return paramJsonToken.asString();
    case 1:
      return this._parsingContext.getCurrentName();
    case 2:
    case 3:
    case 4:
    }
    return this._textBuffer.contentsAsString();
  }

  protected JsonToken _handleApostropheValue()
    throws IOException, JsonParseException
  {
    char[] arrayOfChar = this._textBuffer.emptyAndGetCurrentSegment();
    int[] arrayOfInt = sInputCodesUtf8;
    byte[] arrayOfByte = this._inputBuffer;
    int i = 0;
    label387: label399: 
    while (true)
    {
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      if (i >= arrayOfChar.length)
      {
        arrayOfChar = this._textBuffer.finishCurrentSegment();
        i = 0;
      }
      int j = this._inputEnd;
      int k = this._inputPtr + (arrayOfChar.length - i);
      if (k < j);
      while (true)
      {
        if (this._inputPtr >= k)
          break label399;
        int m = this._inputPtr;
        this._inputPtr = (m + 1);
        int n = 0xFF & arrayOfByte[m];
        if ((n == 39) || (arrayOfInt[n] != 0))
        {
          if (n == 39)
          {
            this._textBuffer.setCurrentLength(i);
            return JsonToken.VALUE_STRING;
          }
        }
        else
        {
          int i5 = i + 1;
          arrayOfChar[i] = ((char)n);
          i = i5;
          continue;
        }
        label221: int i3;
        switch (arrayOfInt[n])
        {
        default:
          if (n < 32)
            _throwUnquotedSpace(n, "string value");
          _reportInvalidChar(n);
          i3 = n;
        case 1:
        case 2:
        case 3:
        case 4:
        }
        int i4;
        label243: int i1;
        int i2;
        while (true)
          if (i >= arrayOfChar.length)
          {
            arrayOfChar = this._textBuffer.finishCurrentSegment();
            i4 = 0;
            i = i4 + 1;
            arrayOfChar[i4] = ((char)i3);
            break;
            if (n == 34)
              break label221;
            i3 = _decodeEscaped();
            continue;
            i3 = _decodeUtf8_2(n);
            continue;
            if (this._inputEnd - this._inputPtr >= 2)
            {
              i3 = _decodeUtf8_3fast(n);
            }
            else
            {
              i3 = _decodeUtf8_3(n);
              continue;
              i1 = _decodeUtf8_4(n);
              i2 = i + 1;
              arrayOfChar[i] = ((char)(0xD800 | i1 >> 10));
              if (i2 < arrayOfChar.length)
                break label387;
              arrayOfChar = this._textBuffer.finishCurrentSegment();
            }
          }
        for (i = 0; ; i = i2)
        {
          i3 = 0xDC00 | i1 & 0x3FF;
          break;
          i4 = i;
          break label243;
        }
        k = j;
      }
    }
  }

  protected JsonToken _handleInvalidNumberStart(int paramInt, boolean paramBoolean)
    throws IOException, JsonParseException
  {
    int i = paramInt;
    while (i == 73)
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        _reportInvalidEOFInValue();
      byte[] arrayOfByte = this._inputBuffer;
      int j = this._inputPtr;
      this._inputPtr = (j + 1);
      int k = arrayOfByte[j];
      String str;
      if (k == 78)
        if (paramBoolean)
        {
          str = "-INF";
          _matchToken(str, 3);
          if (!isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS))
            break label151;
          if (!paramBoolean)
            break label143;
        }
      label143: for (double d = (-1.0D / 0.0D); ; d = (1.0D / 0.0D))
      {
        return resetAsNaN(str, d);
        str = "+INF";
        break;
        if (k != 110)
          break label188;
        if (paramBoolean)
        {
          str = "-Infinity";
          break;
        }
        str = "+Infinity";
        break;
      }
      label151: _reportError("Non-standard token '" + str + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
      i = k;
      continue;
      label188: i = k;
    }
    reportUnexpectedNumberChar(i, "expected digit (0-9) to follow minus sign, for valid numeric value");
    return null;
  }

  protected JsonToken _handleUnexpectedValue(int paramInt)
    throws IOException, JsonParseException
  {
    switch (paramInt)
    {
    default:
    case 39:
    case 78:
    case 73:
      while (true)
      {
        _reportUnexpectedChar(paramInt, "expected a valid value (number, String, array, object, 'true', 'false' or 'null')");
        return null;
        if (isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES))
        {
          return _handleApostropheValue();
          _matchToken("NaN", 1);
          if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS))
            return resetAsNaN("NaN", (0.0D / 0.0D));
          _reportError("Non-standard token 'NaN': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
          continue;
          _matchToken("Infinity", 1);
          if (isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS))
            return resetAsNaN("Infinity", (1.0D / 0.0D));
          _reportError("Non-standard token 'Infinity': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
        }
      }
    case 43:
    }
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOFInValue();
    byte[] arrayOfByte = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    return _handleInvalidNumberStart(0xFF & arrayOfByte[i], false);
  }

  protected Name _handleUnusualFieldName(int paramInt)
    throws IOException, JsonParseException
  {
    if ((paramInt == 39) && (isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)))
      return _parseApostropheFieldName();
    if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES))
      _reportUnexpectedChar(paramInt, "was expecting double-quote to start field name");
    int[] arrayOfInt1 = CharTypes.getInputCodeUtf8JsNames();
    if (arrayOfInt1[paramInt] != 0)
      _reportUnexpectedChar(paramInt, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
    int[] arrayOfInt2 = this._quadBuffer;
    int i = 0;
    int j = 0;
    int k = paramInt;
    int m = 0;
    Object localObject1 = arrayOfInt2;
    Name localName;
    while (true)
    {
      int i2;
      int i3;
      Object localObject2;
      int i1;
      if (i < 4)
      {
        int i6 = i + 1;
        i2 = k | j << 8;
        i3 = m;
        localObject2 = localObject1;
        i1 = i6;
      }
      int i4;
      while (true)
      {
        if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
          _reportInvalidEOF(" in field name");
        i4 = 0xFF & this._inputBuffer[this._inputPtr];
        if (arrayOfInt1[i4] == 0)
          break;
        if (i1 > 0)
        {
          if (i3 >= localObject2.length)
          {
            localObject2 = growArrayBy((int[])localObject2, localObject2.length);
            this._quadBuffer = ((int[])localObject2);
          }
          int i5 = i3 + 1;
          localObject2[i3] = i2;
          i3 = i5;
        }
        localName = this._symbols.findName((int[])localObject2, i3);
        if (localName != null)
          break label321;
        return addName((int[])localObject2, i3, i1);
        if (m >= localObject1.length)
        {
          localObject1 = growArrayBy((int[])localObject1, localObject1.length);
          this._quadBuffer = ((int[])localObject1);
        }
        int n = m + 1;
        localObject1[m] = j;
        localObject2 = localObject1;
        i1 = 1;
        i2 = k;
        i3 = n;
      }
      this._inputPtr = (1 + this._inputPtr);
      j = i2;
      i = i1;
      localObject1 = localObject2;
      m = i3;
      k = i4;
    }
    label321: return localName;
  }

  protected boolean _loadToHaveAtLeast(int paramInt)
    throws IOException
  {
    if (this._inputStream == null)
      return false;
    int i = this._inputEnd - this._inputPtr;
    if ((i > 0) && (this._inputPtr > 0))
    {
      this._currInputProcessed += this._inputPtr;
      this._currInputRowStart -= this._inputPtr;
      System.arraycopy(this._inputBuffer, this._inputPtr, this._inputBuffer, 0, i);
      this._inputEnd = i;
      label79: this._inputPtr = 0;
    }
    while (true)
    {
      if (this._inputEnd >= paramInt)
        break label186;
      int j = this._inputStream.read(this._inputBuffer, this._inputEnd, this._inputBuffer.length - this._inputEnd);
      if (j < 1)
      {
        _closeInput();
        if (j != 0)
          break;
        throw new IOException("InputStream.read() returned 0 characters when trying to read " + i + " bytes");
        this._inputEnd = 0;
        break label79;
      }
      this._inputEnd = (j + this._inputEnd);
    }
    label186: return true;
  }

  protected void _matchToken(String paramString, int paramInt)
    throws IOException, JsonParseException
  {
    int i = paramString.length();
    do
    {
      if (((this._inputPtr >= this._inputEnd) && (!loadMore())) || (this._inputBuffer[this._inputPtr] != paramString.charAt(paramInt)))
        _reportInvalidToken(paramString.substring(0, paramInt));
      this._inputPtr = (1 + this._inputPtr);
      paramInt++;
    }
    while (paramInt < i);
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()));
    int j;
    do
    {
      return;
      j = 0xFF & this._inputBuffer[this._inputPtr];
    }
    while ((j < 48) || (j == 93) || (j == 125) || (!Character.isJavaIdentifierPart((char)_decodeCharForError(j))));
    _reportInvalidToken(paramString.substring(0, paramInt));
  }

  protected Name _parseApostropheFieldName()
    throws IOException, JsonParseException
  {
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(": was expecting closing ''' for name");
    byte[] arrayOfByte1 = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = 0xFF & arrayOfByte1[i];
    if (j == 39)
      return BytesToNameCanonicalizer.getEmptyName();
    Object localObject1 = this._quadBuffer;
    int[] arrayOfInt = sInputCodesLatin1;
    int k = 0;
    int m = 0;
    int n = 0;
    Object localObject5;
    int i28;
    Name localName;
    label192: int i14;
    int i2;
    int i13;
    label251: int i20;
    Object localObject4;
    int i21;
    label292: int i23;
    int i1;
    int i3;
    if (j == 39)
    {
      if (k <= 0)
        break label615;
      if (n >= localObject1.length)
      {
        localObject1 = growArrayBy((int[])localObject1, localObject1.length);
        this._quadBuffer = ((int[])localObject1);
      }
      int i29 = n + 1;
      localObject1[n] = m;
      localObject5 = localObject1;
      i28 = i29;
      localName = this._symbols.findName(localObject5, i28);
      if (localName == null)
        return addName(localObject5, i28, k);
    }
    else
    {
      if ((j == 34) || (arrayOfInt[j] == 0))
        break label664;
      if (j != 92)
      {
        _throwUnquotedSpace(j, "name");
        if (j <= 127)
          break label664;
        if (k < 4)
          break label645;
        if (n >= localObject1.length)
        {
          localObject1 = growArrayBy((int[])localObject1, localObject1.length);
          this._quadBuffer = ((int[])localObject1);
        }
        int i27 = n + 1;
        localObject1[n] = m;
        i14 = 0;
        i2 = i27;
        i13 = 0;
        if (j >= 2048)
          break label438;
        int i25 = i13 << 8 | (0xC0 | j >> 6);
        int i26 = i14 + 1;
        i20 = i25;
        localObject4 = localObject1;
        i21 = i26;
        i23 = 0x80 | j & 0x3F;
        i1 = i20;
        i3 = i21;
        localObject1 = localObject4;
      }
    }
    for (int i4 = i23; ; i4 = j)
    {
      int i7;
      int i8;
      Object localObject2;
      int i6;
      label352: int i15;
      label438: int i16;
      int i18;
      Object localObject3;
      int i19;
      int i17;
      if (i3 < 4)
      {
        int i11 = i3 + 1;
        i7 = i4 | i1 << 8;
        i8 = i2;
        localObject2 = localObject1;
        i6 = i11;
        if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
          _reportInvalidEOF(" in field name");
        byte[] arrayOfByte2 = this._inputBuffer;
        int i9 = this._inputPtr;
        this._inputPtr = (i9 + 1);
        j = 0xFF & arrayOfByte2[i9];
        int i10 = i6;
        localObject1 = localObject2;
        m = i7;
        n = i8;
        k = i10;
        break;
        j = _decodeEscaped();
        break label192;
        i15 = i13 << 8 | (0xE0 | j >> 12);
        i16 = i14 + 1;
        if (i16 < 4)
          break label626;
        if (i2 >= localObject1.length)
        {
          localObject1 = growArrayBy((int[])localObject1, localObject1.length);
          this._quadBuffer = ((int[])localObject1);
        }
        int i24 = i2 + 1;
        localObject1[i2] = i15;
        i18 = i24;
        localObject3 = localObject1;
        i19 = 0;
        i17 = 0;
      }
      while (true)
      {
        i20 = i17 << 8 | (0x80 | 0x3F & j >> 6);
        i21 = i19 + 1;
        int i22 = i18;
        localObject4 = localObject3;
        i2 = i22;
        break label292;
        if (i2 >= localObject1.length)
        {
          localObject1 = growArrayBy((int[])localObject1, localObject1.length);
          this._quadBuffer = ((int[])localObject1);
        }
        int i5 = i2 + 1;
        localObject1[i2] = i1;
        localObject2 = localObject1;
        i6 = 1;
        i7 = i4;
        i8 = i5;
        break label352;
        return localName;
        label615: localObject5 = localObject1;
        i28 = n;
        break;
        label626: i17 = i15;
        i18 = i2;
        localObject3 = localObject1;
        i19 = i16;
      }
      label645: int i12 = k;
      i13 = m;
      i2 = n;
      i14 = i12;
      break label251;
      label664: i1 = m;
      i2 = n;
      i3 = k;
    }
  }

  protected Name _parseFieldName(int paramInt)
    throws IOException, JsonParseException
  {
    if (paramInt != 34)
      return _handleUnusualFieldName(paramInt);
    if (9 + this._inputPtr > this._inputEnd)
      return slowParseFieldName();
    byte[] arrayOfByte = this._inputBuffer;
    int[] arrayOfInt = sInputCodesLatin1;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = 0xFF & arrayOfByte[i];
    if (arrayOfInt[j] == 0)
    {
      int k = this._inputPtr;
      this._inputPtr = (k + 1);
      int m = 0xFF & arrayOfByte[k];
      if (arrayOfInt[m] == 0)
      {
        int n = m | j << 8;
        int i1 = this._inputPtr;
        this._inputPtr = (i1 + 1);
        int i2 = 0xFF & arrayOfByte[i1];
        if (arrayOfInt[i2] == 0)
        {
          int i3 = i2 | n << 8;
          int i4 = this._inputPtr;
          this._inputPtr = (i4 + 1);
          int i5 = 0xFF & arrayOfByte[i4];
          if (arrayOfInt[i5] == 0)
          {
            int i6 = i5 | i3 << 8;
            int i7 = this._inputPtr;
            this._inputPtr = (i7 + 1);
            int i8 = 0xFF & arrayOfByte[i7];
            if (arrayOfInt[i8] == 0)
            {
              this._quad1 = i6;
              return parseMediumFieldName(i8, arrayOfInt);
            }
            if (i8 == 34)
              return findName(i6, 4);
            return parseFieldName(i6, i8, 4);
          }
          if (i5 == 34)
            return findName(i3, 3);
          return parseFieldName(i3, i5, 3);
        }
        if (i2 == 34)
          return findName(n, 2);
        return parseFieldName(n, i2, 2);
      }
      if (m == 34)
        return findName(j, 1);
      return parseFieldName(j, m, 1);
    }
    if (j == 34)
      return BytesToNameCanonicalizer.getEmptyName();
    return parseFieldName(0, j, 0);
  }

  protected int _readBinary(Base64Variant paramBase64Variant, OutputStream paramOutputStream, byte[] paramArrayOfByte)
    throws IOException, JsonParseException
  {
    int i = -3 + paramArrayOfByte.length;
    int j = 0;
    int k = 0;
    int i1;
    label86: 
    do
    {
      int n;
      do
      {
        if (this._inputPtr >= this._inputEnd)
          loadMoreGuaranteed();
        byte[] arrayOfByte1 = this._inputBuffer;
        int m = this._inputPtr;
        this._inputPtr = (m + 1);
        n = 0xFF & arrayOfByte1[m];
      }
      while (n <= 32);
      i1 = paramBase64Variant.decodeBase64Char(n);
      if (i1 >= 0)
        break;
      if (n == 34)
      {
        this._tokenIncomplete = false;
        if (k > 0)
        {
          j += k;
          paramOutputStream.write(paramArrayOfByte, 0, k);
        }
        return j;
      }
      i1 = _decodeBase64Escape(paramBase64Variant, n, 0);
    }
    while (i1 < 0);
    int i2 = i1;
    if (k > i)
    {
      j += k;
      paramOutputStream.write(paramArrayOfByte, 0, k);
    }
    for (int i3 = 0; ; i3 = k)
    {
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      byte[] arrayOfByte2 = this._inputBuffer;
      int i4 = this._inputPtr;
      this._inputPtr = (i4 + 1);
      int i5 = 0xFF & arrayOfByte2[i4];
      int i6 = paramBase64Variant.decodeBase64Char(i5);
      if (i6 < 0)
        i6 = _decodeBase64Escape(paramBase64Variant, i5, 1);
      int i7 = i6 | i2 << 6;
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      byte[] arrayOfByte3 = this._inputBuffer;
      int i8 = this._inputPtr;
      this._inputPtr = (i8 + 1);
      int i9 = 0xFF & arrayOfByte3[i8];
      int i10 = paramBase64Variant.decodeBase64Char(i9);
      if (i10 < 0)
      {
        if (i10 != -2)
        {
          if ((i9 == 34) && (!paramBase64Variant.usesPadding()))
          {
            int i25 = i7 >> 4;
            k = i3 + 1;
            paramArrayOfByte[i3] = ((byte)i25);
            break label86;
          }
          i10 = _decodeBase64Escape(paramBase64Variant, i9, 2);
        }
        if (i10 == -2)
        {
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          byte[] arrayOfByte5 = this._inputBuffer;
          int i22 = this._inputPtr;
          this._inputPtr = (i22 + 1);
          int i23 = 0xFF & arrayOfByte5[i22];
          if (!paramBase64Variant.usesPaddingChar(i23))
            throw reportInvalidBase64Char(paramBase64Variant, i23, 3, "expected padding character '" + paramBase64Variant.getPaddingChar() + "'");
          int i24 = i7 >> 4;
          k = i3 + 1;
          paramArrayOfByte[i3] = ((byte)i24);
          break;
        }
      }
      int i11 = i10 | i7 << 6;
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      byte[] arrayOfByte4 = this._inputBuffer;
      int i12 = this._inputPtr;
      this._inputPtr = (i12 + 1);
      int i13 = 0xFF & arrayOfByte4[i12];
      int i14 = paramBase64Variant.decodeBase64Char(i13);
      if (i14 < 0)
      {
        if (i14 != -2)
        {
          if ((i13 == 34) && (!paramBase64Variant.usesPadding()))
          {
            int i20 = i11 >> 2;
            int i21 = i3 + 1;
            paramArrayOfByte[i3] = ((byte)(i20 >> 8));
            k = i21 + 1;
            paramArrayOfByte[i21] = ((byte)i20);
            break label86;
          }
          i14 = _decodeBase64Escape(paramBase64Variant, i13, 3);
        }
        if (i14 == -2)
        {
          int i18 = i11 >> 2;
          int i19 = i3 + 1;
          paramArrayOfByte[i3] = ((byte)(i18 >> 8));
          k = i19 + 1;
          paramArrayOfByte[i19] = ((byte)i18);
          break;
        }
      }
      int i15 = i14 | i11 << 6;
      int i16 = i3 + 1;
      paramArrayOfByte[i3] = ((byte)(i15 >> 16));
      int i17 = i16 + 1;
      paramArrayOfByte[i16] = ((byte)(i15 >> 8));
      k = i17 + 1;
      paramArrayOfByte[i17] = ((byte)i15);
      break;
    }
  }

  protected void _releaseBuffers()
    throws IOException
  {
    super._releaseBuffers();
    if (this._bufferRecyclable)
    {
      byte[] arrayOfByte = this._inputBuffer;
      if (arrayOfByte != null)
      {
        this._inputBuffer = null;
        this._ioContext.releaseReadIOBuffer(arrayOfByte);
      }
    }
  }

  protected void _reportInvalidChar(int paramInt)
    throws JsonParseException
  {
    if (paramInt < 32)
      _throwInvalidSpace(paramInt);
    _reportInvalidInitial(paramInt);
  }

  protected void _reportInvalidInitial(int paramInt)
    throws JsonParseException
  {
    _reportError("Invalid UTF-8 start byte 0x" + Integer.toHexString(paramInt));
  }

  protected void _reportInvalidOther(int paramInt)
    throws JsonParseException
  {
    _reportError("Invalid UTF-8 middle byte 0x" + Integer.toHexString(paramInt));
  }

  protected void _reportInvalidOther(int paramInt1, int paramInt2)
    throws JsonParseException
  {
    this._inputPtr = paramInt2;
    _reportInvalidOther(paramInt1);
  }

  protected void _reportInvalidToken(String paramString)
    throws IOException, JsonParseException
  {
    _reportInvalidToken(paramString, "'null', 'true', 'false' or NaN");
  }

  protected void _reportInvalidToken(String paramString1, String paramString2)
    throws IOException, JsonParseException
  {
    StringBuilder localStringBuilder = new StringBuilder(paramString1);
    while (true)
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()));
      char c;
      do
      {
        _reportError("Unrecognized token '" + localStringBuilder.toString() + "': was expecting " + paramString2);
        return;
        byte[] arrayOfByte = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = (i + 1);
        c = (char)_decodeCharForError(arrayOfByte[i]);
      }
      while (!Character.isJavaIdentifierPart(c));
      localStringBuilder.append(c);
    }
  }

  protected void _skipCR()
    throws IOException
  {
    if (((this._inputPtr < this._inputEnd) || (loadMore())) && (this._inputBuffer[this._inputPtr] == 10))
      this._inputPtr = (1 + this._inputPtr);
    this._currInputRow = (1 + this._currInputRow);
    this._currInputRowStart = this._inputPtr;
  }

  protected void _skipLF()
    throws IOException
  {
    this._currInputRow = (1 + this._currInputRow);
    this._currInputRowStart = this._inputPtr;
  }

  protected void _skipString()
    throws IOException, JsonParseException
  {
    this._tokenIncomplete = false;
    int[] arrayOfInt = sInputCodesUtf8;
    byte[] arrayOfByte = this._inputBuffer;
    int i = this._inputPtr;
    int j = this._inputEnd;
    if (i >= j)
    {
      loadMoreGuaranteed();
      i = this._inputPtr;
      j = this._inputEnd;
    }
    while (true)
    {
      int k;
      int m;
      if (i < j)
      {
        k = i + 1;
        m = 0xFF & arrayOfByte[i];
        if (arrayOfInt[m] == 0)
          break label190;
        this._inputPtr = k;
        if (m != 34);
      }
      else
      {
        this._inputPtr = i;
        break;
      }
      switch (arrayOfInt[m])
      {
      default:
        if (m < 32)
          _throwUnquotedSpace(m, "string value");
        break;
      case 1:
        _decodeEscaped();
        break;
      case 2:
        _skipUtf8_2(m);
        break;
      case 3:
        _skipUtf8_3(m);
        break;
      case 4:
        _skipUtf8_4(m);
        break;
        _reportInvalidChar(m);
        break;
      }
      label190: i = k;
    }
  }

  public void close()
    throws IOException
  {
    super.close();
    this._symbols.release();
  }

  public byte[] getBinaryValue(Base64Variant paramBase64Variant)
    throws IOException, JsonParseException
  {
    if ((this._currToken != JsonToken.VALUE_STRING) && ((this._currToken != JsonToken.VALUE_EMBEDDED_OBJECT) || (this._binaryValue == null)))
      _reportError("Current token (" + this._currToken + ") not VALUE_STRING or VALUE_EMBEDDED_OBJECT, can not access as binary");
    if (this._tokenIncomplete);
    while (true)
    {
      try
      {
        this._binaryValue = _decodeBase64(paramBase64Variant);
        this._tokenIncomplete = false;
        return this._binaryValue;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw _constructError("Failed to decode VALUE_STRING as base64 (" + paramBase64Variant + "): " + localIllegalArgumentException.getMessage());
      }
      if (this._binaryValue == null)
      {
        ByteArrayBuilder localByteArrayBuilder = _getByteArrayBuilder();
        _decodeBase64(getText(), localByteArrayBuilder, paramBase64Variant);
        this._binaryValue = localByteArrayBuilder.toByteArray();
      }
    }
  }

  public ObjectCodec getCodec()
  {
    return this._objectCodec;
  }

  public Object getInputSource()
  {
    return this._inputStream;
  }

  public String getText()
    throws IOException, JsonParseException
  {
    if (this._currToken == JsonToken.VALUE_STRING)
    {
      if (this._tokenIncomplete)
      {
        this._tokenIncomplete = false;
        _finishString();
      }
      return this._textBuffer.contentsAsString();
    }
    return _getText2(this._currToken);
  }

  public char[] getTextCharacters()
    throws IOException, JsonParseException
  {
    if (this._currToken != null)
    {
      switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this._currToken.ordinal()])
      {
      default:
        return this._currToken.asCharArray();
      case 1:
        String str;
        int i;
        if (!this._nameCopied)
        {
          str = this._parsingContext.getCurrentName();
          i = str.length();
          if (this._nameCopyBuffer != null)
            break label116;
          this._nameCopyBuffer = this._ioContext.allocNameCopyBuffer(i);
        }
        while (true)
        {
          str.getChars(0, i, this._nameCopyBuffer, 0);
          this._nameCopied = true;
          return this._nameCopyBuffer;
          if (this._nameCopyBuffer.length < i)
            this._nameCopyBuffer = new char[i];
        }
      case 2:
        label116: if (this._tokenIncomplete)
        {
          this._tokenIncomplete = false;
          _finishString();
        }
        break;
      case 3:
      case 4:
      }
      return this._textBuffer.getTextBuffer();
    }
    return null;
  }

  public int getTextLength()
    throws IOException, JsonParseException
  {
    JsonToken localJsonToken = this._currToken;
    int i = 0;
    if (localJsonToken != null);
    switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this._currToken.ordinal()])
    {
    default:
      i = this._currToken.asCharArray().length;
      return i;
    case 1:
      return this._parsingContext.getCurrentName().length();
    case 2:
      if (this._tokenIncomplete)
      {
        this._tokenIncomplete = false;
        _finishString();
      }
      break;
    case 3:
    case 4:
    }
    return this._textBuffer.size();
  }

  public int getTextOffset()
    throws IOException, JsonParseException
  {
    if (this._currToken != null);
    switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this._currToken.ordinal()])
    {
    case 1:
    default:
      return 0;
    case 2:
      if (this._tokenIncomplete)
      {
        this._tokenIncomplete = false;
        _finishString();
      }
      break;
    case 3:
    case 4:
    }
    return this._textBuffer.getTextOffset();
  }

  public String getValueAsString()
    throws IOException, JsonParseException
  {
    if (this._currToken == JsonToken.VALUE_STRING)
    {
      if (this._tokenIncomplete)
      {
        this._tokenIncomplete = false;
        _finishString();
      }
      return this._textBuffer.contentsAsString();
    }
    return super.getValueAsString(null);
  }

  public String getValueAsString(String paramString)
    throws IOException, JsonParseException
  {
    if (this._currToken == JsonToken.VALUE_STRING)
    {
      if (this._tokenIncomplete)
      {
        this._tokenIncomplete = false;
        _finishString();
      }
      return this._textBuffer.contentsAsString();
    }
    return super.getValueAsString(paramString);
  }

  protected boolean loadMore()
    throws IOException
  {
    this._currInputProcessed += this._inputEnd;
    this._currInputRowStart -= this._inputEnd;
    InputStream localInputStream = this._inputStream;
    boolean bool = false;
    int i;
    if (localInputStream != null)
    {
      i = this._inputStream.read(this._inputBuffer, 0, this._inputBuffer.length);
      if (i <= 0)
        break label74;
      this._inputPtr = 0;
      this._inputEnd = i;
      bool = true;
    }
    label74: 
    do
    {
      return bool;
      _closeInput();
      bool = false;
    }
    while (i != 0);
    throw new IOException("InputStream.read() returned 0 characters when trying to read " + this._inputBuffer.length + " bytes");
  }

  public Boolean nextBooleanValue()
    throws IOException, JsonParseException
  {
    if (this._currToken == JsonToken.FIELD_NAME)
    {
      this._nameCopied = false;
      JsonToken localJsonToken1 = this._nextToken;
      this._nextToken = null;
      this._currToken = localJsonToken1;
      Boolean localBoolean;
      if (localJsonToken1 == JsonToken.VALUE_TRUE)
        localBoolean = Boolean.TRUE;
      JsonToken localJsonToken2;
      do
      {
        return localBoolean;
        if (localJsonToken1 == JsonToken.VALUE_FALSE)
          return Boolean.FALSE;
        if (localJsonToken1 == JsonToken.START_ARRAY)
        {
          this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
          return null;
        }
        localJsonToken2 = JsonToken.START_OBJECT;
        localBoolean = null;
      }
      while (localJsonToken1 != localJsonToken2);
      this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
      return null;
    }
    switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[nextToken().ordinal()])
    {
    default:
      return null;
    case 5:
      return Boolean.TRUE;
    case 6:
    }
    return Boolean.FALSE;
  }

  public boolean nextFieldName(SerializableString paramSerializableString)
    throws IOException, JsonParseException
  {
    int i = 0;
    this._numTypesValid = 0;
    if (this._currToken == JsonToken.FIELD_NAME)
    {
      _nextAfterName();
      return false;
    }
    if (this._tokenIncomplete)
      _skipString();
    int j = _skipWSOrEnd();
    if (j < 0)
    {
      close();
      this._currToken = null;
      return false;
    }
    this._tokenInputTotal = (this._currInputProcessed + this._inputPtr - 1L);
    this._tokenInputRow = this._currInputRow;
    this._tokenInputCol = (-1 + (this._inputPtr - this._currInputRowStart));
    this._binaryValue = null;
    if (j == 93)
    {
      if (!this._parsingContext.inArray())
        _reportMismatchedEndMarker(j, '}');
      this._parsingContext = this._parsingContext.getParent();
      this._currToken = JsonToken.END_ARRAY;
      return false;
    }
    if (j == 125)
    {
      if (!this._parsingContext.inObject())
        _reportMismatchedEndMarker(j, ']');
      this._parsingContext = this._parsingContext.getParent();
      this._currToken = JsonToken.END_OBJECT;
      return false;
    }
    if (this._parsingContext.expectComma())
    {
      if (j != 44)
        _reportUnexpectedChar(j, "was expecting comma to separate " + this._parsingContext.getTypeDesc() + " entries");
      j = _skipWS();
    }
    if (!this._parsingContext.inObject())
    {
      _nextTokenNotInObject(j);
      return false;
    }
    byte[] arrayOfByte;
    int k;
    int m;
    int n;
    if (j == 34)
    {
      arrayOfByte = paramSerializableString.asQuotedUTF8();
      k = arrayOfByte.length;
      if (k + this._inputPtr < this._inputEnd)
      {
        m = k + this._inputPtr;
        if (this._inputBuffer[m] == 34)
          n = this._inputPtr;
      }
    }
    while (true)
    {
      if (i == k)
      {
        this._inputPtr = (m + 1);
        this._parsingContext.setCurrentName(paramSerializableString.getValue());
        this._currToken = JsonToken.FIELD_NAME;
        _isNextTokenNameYes();
        return true;
      }
      if (arrayOfByte[i] != this._inputBuffer[(n + i)])
        return _isNextTokenNameMaybe(j, paramSerializableString);
      i++;
    }
  }

  public int nextIntValue(int paramInt)
    throws IOException, JsonParseException
  {
    if (this._currToken == JsonToken.FIELD_NAME)
    {
      this._nameCopied = false;
      localJsonToken = this._nextToken;
      this._nextToken = null;
      this._currToken = localJsonToken;
      if (localJsonToken == JsonToken.VALUE_NUMBER_INT)
        paramInt = getIntValue();
    }
    while (nextToken() != JsonToken.VALUE_NUMBER_INT)
    {
      JsonToken localJsonToken;
      do
      {
        return paramInt;
        if (localJsonToken == JsonToken.START_ARRAY)
        {
          this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
          return paramInt;
        }
      }
      while (localJsonToken != JsonToken.START_OBJECT);
      this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
      return paramInt;
    }
    return getIntValue();
  }

  public long nextLongValue(long paramLong)
    throws IOException, JsonParseException
  {
    if (this._currToken == JsonToken.FIELD_NAME)
    {
      this._nameCopied = false;
      localJsonToken = this._nextToken;
      this._nextToken = null;
      this._currToken = localJsonToken;
      if (localJsonToken == JsonToken.VALUE_NUMBER_INT)
        paramLong = getLongValue();
    }
    while (nextToken() != JsonToken.VALUE_NUMBER_INT)
    {
      JsonToken localJsonToken;
      do
      {
        return paramLong;
        if (localJsonToken == JsonToken.START_ARRAY)
        {
          this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
          return paramLong;
        }
      }
      while (localJsonToken != JsonToken.START_OBJECT);
      this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
      return paramLong;
    }
    return getLongValue();
  }

  public String nextTextValue()
    throws IOException, JsonParseException
  {
    JsonToken localJsonToken3;
    String str;
    if (this._currToken == JsonToken.FIELD_NAME)
    {
      this._nameCopied = false;
      localJsonToken3 = this._nextToken;
      this._nextToken = null;
      this._currToken = localJsonToken3;
      if (localJsonToken3 == JsonToken.VALUE_STRING)
      {
        if (this._tokenIncomplete)
        {
          this._tokenIncomplete = false;
          _finishString();
        }
        str = this._textBuffer.contentsAsString();
      }
    }
    JsonToken localJsonToken1;
    JsonToken localJsonToken2;
    do
    {
      JsonToken localJsonToken4;
      do
      {
        return str;
        if (localJsonToken3 == JsonToken.START_ARRAY)
        {
          this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
          return null;
        }
        localJsonToken4 = JsonToken.START_OBJECT;
        str = null;
      }
      while (localJsonToken3 != localJsonToken4);
      this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
      return null;
      localJsonToken1 = nextToken();
      localJsonToken2 = JsonToken.VALUE_STRING;
      str = null;
    }
    while (localJsonToken1 != localJsonToken2);
    return getText();
  }

  public JsonToken nextToken()
    throws IOException, JsonParseException
  {
    this._numTypesValid = 0;
    if (this._currToken == JsonToken.FIELD_NAME)
      return _nextAfterName();
    if (this._tokenIncomplete)
      _skipString();
    int i = _skipWSOrEnd();
    if (i < 0)
    {
      close();
      this._currToken = null;
      return null;
    }
    this._tokenInputTotal = (this._currInputProcessed + this._inputPtr - 1L);
    this._tokenInputRow = this._currInputRow;
    this._tokenInputCol = (-1 + (this._inputPtr - this._currInputRowStart));
    this._binaryValue = null;
    if (i == 93)
    {
      if (!this._parsingContext.inArray())
        _reportMismatchedEndMarker(i, '}');
      this._parsingContext = this._parsingContext.getParent();
      JsonToken localJsonToken3 = JsonToken.END_ARRAY;
      this._currToken = localJsonToken3;
      return localJsonToken3;
    }
    if (i == 125)
    {
      if (!this._parsingContext.inObject())
        _reportMismatchedEndMarker(i, ']');
      this._parsingContext = this._parsingContext.getParent();
      JsonToken localJsonToken2 = JsonToken.END_OBJECT;
      this._currToken = localJsonToken2;
      return localJsonToken2;
    }
    if (this._parsingContext.expectComma())
    {
      if (i != 44)
        _reportUnexpectedChar(i, "was expecting comma to separate " + this._parsingContext.getTypeDesc() + " entries");
      i = _skipWS();
    }
    if (!this._parsingContext.inObject())
      return _nextTokenNotInObject(i);
    Name localName = _parseFieldName(i);
    this._parsingContext.setCurrentName(localName.getName());
    this._currToken = JsonToken.FIELD_NAME;
    int j = _skipWS();
    if (j != 58)
      _reportUnexpectedChar(j, "was expecting a colon to separate field name and value");
    int k = _skipWS();
    if (k == 34)
    {
      this._tokenIncomplete = true;
      this._nextToken = JsonToken.VALUE_STRING;
      return this._currToken;
    }
    JsonToken localJsonToken1;
    switch (k)
    {
    default:
      localJsonToken1 = _handleUnexpectedValue(k);
    case 91:
    case 123:
    case 93:
    case 125:
    case 116:
    case 102:
    case 110:
    case 45:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    }
    while (true)
    {
      this._nextToken = localJsonToken1;
      return this._currToken;
      localJsonToken1 = JsonToken.START_ARRAY;
      continue;
      localJsonToken1 = JsonToken.START_OBJECT;
      continue;
      _reportUnexpectedChar(k, "expected a value");
      _matchToken("true", 1);
      localJsonToken1 = JsonToken.VALUE_TRUE;
      continue;
      _matchToken("false", 1);
      localJsonToken1 = JsonToken.VALUE_FALSE;
      continue;
      _matchToken("null", 1);
      localJsonToken1 = JsonToken.VALUE_NULL;
      continue;
      localJsonToken1 = parseNumberText(k);
    }
  }

  protected Name parseEscapedFieldName(int[] paramArrayOfInt, int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    throws IOException, JsonParseException
  {
    int[] arrayOfInt1 = sInputCodesLatin1;
    label100: int m;
    int[] arrayOfInt2;
    label148: int i5;
    Object localObject2;
    int i6;
    Object localObject1;
    int i;
    if (arrayOfInt1[paramInt3] != 0)
    {
      if (paramInt3 == 34)
      {
        if (paramInt4 > 0)
        {
          if (paramInt1 >= paramArrayOfInt.length)
          {
            paramArrayOfInt = growArrayBy(paramArrayOfInt, paramArrayOfInt.length);
            this._quadBuffer = paramArrayOfInt;
          }
          int i11 = paramInt1 + 1;
          paramArrayOfInt[paramInt1] = paramInt2;
          paramInt1 = i11;
        }
        Name localName = this._symbols.findName(paramArrayOfInt, paramInt1);
        if (localName == null)
          localName = addName(paramArrayOfInt, paramInt1, paramInt4);
        return localName;
      }
      if (paramInt3 != 92)
      {
        _throwUnquotedSpace(paramInt3, "name");
        if (paramInt3 <= 127)
          break label497;
        if (paramInt4 < 4)
          break label488;
        if (paramInt1 >= paramArrayOfInt.length)
        {
          paramArrayOfInt = growArrayBy(paramArrayOfInt, paramArrayOfInt.length);
          this._quadBuffer = paramArrayOfInt;
        }
        m = paramInt1 + 1;
        paramArrayOfInt[paramInt1] = paramInt2;
        paramInt4 = 0;
        paramInt2 = 0;
        arrayOfInt2 = paramArrayOfInt;
        if (paramInt3 >= 2048)
          break label303;
        int i9 = paramInt2 << 8 | (0xC0 | paramInt3 >> 6);
        int i10 = paramInt4 + 1;
        i5 = i9;
        localObject2 = arrayOfInt2;
        i6 = i10;
        paramInt2 = 0x80 | paramInt3 & 0x3F;
        paramInt4 = i6;
        paramInt1 = m;
        localObject1 = localObject2;
        i = i5;
      }
    }
    while (true)
    {
      label235: int n;
      label303: int i1;
      int i3;
      int[] arrayOfInt3;
      int i4;
      int i2;
      if (paramInt4 < 4)
      {
        paramInt4++;
        paramInt2 |= i << 8;
        paramArrayOfInt = (int[])localObject1;
        if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
          _reportInvalidEOF(" in field name");
        byte[] arrayOfByte = this._inputBuffer;
        int k = this._inputPtr;
        this._inputPtr = (k + 1);
        paramInt3 = 0xFF & arrayOfByte[k];
        break;
        paramInt3 = _decodeEscaped();
        break label100;
        n = paramInt2 << 8 | (0xE0 | paramInt3 >> 12);
        i1 = paramInt4 + 1;
        if (i1 < 4)
          break label469;
        if (m >= arrayOfInt2.length)
        {
          arrayOfInt2 = growArrayBy(arrayOfInt2, arrayOfInt2.length);
          this._quadBuffer = arrayOfInt2;
        }
        int i8 = m + 1;
        arrayOfInt2[m] = n;
        i3 = i8;
        arrayOfInt3 = arrayOfInt2;
        i4 = 0;
        i2 = 0;
      }
      while (true)
      {
        i5 = i2 << 8 | (0x80 | 0x3F & paramInt3 >> 6);
        i6 = i4 + 1;
        int i7 = i3;
        localObject2 = arrayOfInt3;
        m = i7;
        break;
        if (paramInt1 >= localObject1.length)
        {
          localObject1 = growArrayBy((int[])localObject1, localObject1.length);
          this._quadBuffer = ((int[])localObject1);
        }
        int j = paramInt1 + 1;
        localObject1[paramInt1] = i;
        paramInt4 = 1;
        paramInt1 = j;
        paramArrayOfInt = (int[])localObject1;
        break label235;
        label469: i2 = n;
        i3 = m;
        arrayOfInt3 = arrayOfInt2;
        i4 = i1;
      }
      label488: m = paramInt1;
      arrayOfInt2 = paramArrayOfInt;
      break label148;
      label497: i = paramInt2;
      localObject1 = paramArrayOfInt;
      paramInt2 = paramInt3;
    }
  }

  protected Name parseLongFieldName(int paramInt)
    throws IOException, JsonParseException
  {
    int[] arrayOfInt1 = sInputCodesLatin1;
    int i = 2;
    int j = paramInt;
    while (true)
    {
      if (this._inputEnd - this._inputPtr < 4)
        return parseEscapedFieldName(this._quadBuffer, i, 0, j, 0);
      byte[] arrayOfByte1 = this._inputBuffer;
      int k = this._inputPtr;
      this._inputPtr = (k + 1);
      int m = 0xFF & arrayOfByte1[k];
      if (arrayOfInt1[m] != 0)
      {
        if (m == 34)
          return findName(this._quadBuffer, i, j, 1);
        return parseEscapedFieldName(this._quadBuffer, i, j, m, 1);
      }
      int n = m | j << 8;
      byte[] arrayOfByte2 = this._inputBuffer;
      int i1 = this._inputPtr;
      this._inputPtr = (i1 + 1);
      int i2 = 0xFF & arrayOfByte2[i1];
      if (arrayOfInt1[i2] != 0)
      {
        if (i2 == 34)
          return findName(this._quadBuffer, i, n, 2);
        return parseEscapedFieldName(this._quadBuffer, i, n, i2, 2);
      }
      int i3 = i2 | n << 8;
      byte[] arrayOfByte3 = this._inputBuffer;
      int i4 = this._inputPtr;
      this._inputPtr = (i4 + 1);
      int i5 = 0xFF & arrayOfByte3[i4];
      if (arrayOfInt1[i5] != 0)
      {
        if (i5 == 34)
          return findName(this._quadBuffer, i, i3, 3);
        return parseEscapedFieldName(this._quadBuffer, i, i3, i5, 3);
      }
      int i6 = i5 | i3 << 8;
      byte[] arrayOfByte4 = this._inputBuffer;
      int i7 = this._inputPtr;
      this._inputPtr = (i7 + 1);
      j = 0xFF & arrayOfByte4[i7];
      if (arrayOfInt1[j] != 0)
      {
        if (j == 34)
          return findName(this._quadBuffer, i, i6, 4);
        return parseEscapedFieldName(this._quadBuffer, i, i6, j, 4);
      }
      if (i >= this._quadBuffer.length)
        this._quadBuffer = growArrayBy(this._quadBuffer, i);
      int[] arrayOfInt2 = this._quadBuffer;
      int i8 = i + 1;
      arrayOfInt2[i] = i6;
      i = i8;
    }
  }

  protected Name parseMediumFieldName(int paramInt, int[] paramArrayOfInt)
    throws IOException, JsonParseException
  {
    byte[] arrayOfByte1 = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = 0xFF & arrayOfByte1[i];
    if (paramArrayOfInt[j] != 0)
    {
      if (j == 34)
        return findName(this._quad1, paramInt, 1);
      return parseFieldName(this._quad1, paramInt, j, 1);
    }
    int k = j | paramInt << 8;
    byte[] arrayOfByte2 = this._inputBuffer;
    int m = this._inputPtr;
    this._inputPtr = (m + 1);
    int n = 0xFF & arrayOfByte2[m];
    if (paramArrayOfInt[n] != 0)
    {
      if (n == 34)
        return findName(this._quad1, k, 2);
      return parseFieldName(this._quad1, k, n, 2);
    }
    int i1 = n | k << 8;
    byte[] arrayOfByte3 = this._inputBuffer;
    int i2 = this._inputPtr;
    this._inputPtr = (i2 + 1);
    int i3 = 0xFF & arrayOfByte3[i2];
    if (paramArrayOfInt[i3] != 0)
    {
      if (i3 == 34)
        return findName(this._quad1, i1, 3);
      return parseFieldName(this._quad1, i1, i3, 3);
    }
    int i4 = i3 | i1 << 8;
    byte[] arrayOfByte4 = this._inputBuffer;
    int i5 = this._inputPtr;
    this._inputPtr = (i5 + 1);
    int i6 = 0xFF & arrayOfByte4[i5];
    if (paramArrayOfInt[i6] != 0)
    {
      if (i6 == 34)
        return findName(this._quad1, i4, 4);
      return parseFieldName(this._quad1, i4, i6, 4);
    }
    this._quadBuffer[0] = this._quad1;
    this._quadBuffer[1] = i4;
    return parseLongFieldName(i6);
  }

  protected JsonToken parseNumberText(int paramInt)
    throws IOException, JsonParseException
  {
    int i = 1;
    char[] arrayOfChar = this._textBuffer.emptyAndGetCurrentSegment();
    if (paramInt == 45);
    int k;
    boolean bool;
    for (int j = i; ; bool = false)
    {
      if (j == 0)
        break label326;
      arrayOfChar[0] = '-';
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      byte[] arrayOfByte2 = this._inputBuffer;
      int i6 = this._inputPtr;
      this._inputPtr = (i6 + 1);
      k = 0xFF & arrayOfByte2[i6];
      if ((k >= 48) && (k <= 57))
        break;
      return _handleInvalidNumberStart(k, i);
    }
    label319: label326: int n;
    for (int m = i; ; n = 0)
    {
      if (k == 48)
        k = _verifyNoLeadingZeroes();
      int i1 = m + 1;
      arrayOfChar[m] = ((char)k);
      int i2 = this._inputPtr + arrayOfChar.length;
      if (i2 > this._inputEnd)
        i2 = this._inputEnd;
      if (this._inputPtr >= i2)
        return _parserNumber2(arrayOfChar, i1, bool, i);
      byte[] arrayOfByte1 = this._inputBuffer;
      int i3 = this._inputPtr;
      this._inputPtr = (i3 + 1);
      int i4 = 0xFF & arrayOfByte1[i3];
      if ((i4 < 48) || (i4 > 57))
      {
        if ((i4 == 46) || (i4 == 101) || (i4 == 69))
          return _parseFloatText(arrayOfChar, i1, i4, bool, i);
      }
      else
      {
        i++;
        if (i1 < arrayOfChar.length)
          break label319;
        arrayOfChar = this._textBuffer.finishCurrentSegment();
      }
      for (int i5 = 0; ; i5 = i1)
      {
        i1 = i5 + 1;
        arrayOfChar[i5] = ((char)i4);
        break;
        this._inputPtr = (-1 + this._inputPtr);
        this._textBuffer.setCurrentLength(i1);
        return resetInt(bool, i);
      }
      k = paramInt;
    }
  }

  public int readBinaryValue(Base64Variant paramBase64Variant, OutputStream paramOutputStream)
    throws IOException, JsonParseException
  {
    if ((!this._tokenIncomplete) || (this._currToken != JsonToken.VALUE_STRING))
    {
      byte[] arrayOfByte1 = getBinaryValue(paramBase64Variant);
      paramOutputStream.write(arrayOfByte1);
      return arrayOfByte1.length;
    }
    byte[] arrayOfByte2 = this._ioContext.allocBase64Buffer();
    try
    {
      int i = _readBinary(paramBase64Variant, paramOutputStream, arrayOfByte2);
      return i;
    }
    finally
    {
      this._ioContext.releaseBase64Buffer(arrayOfByte2);
    }
  }

  public int releaseBuffered(OutputStream paramOutputStream)
    throws IOException
  {
    int i = this._inputEnd - this._inputPtr;
    if (i < 1)
      return 0;
    int j = this._inputPtr;
    paramOutputStream.write(this._inputBuffer, j, i);
    return i;
  }

  public void setCodec(ObjectCodec paramObjectCodec)
  {
    this._objectCodec = paramObjectCodec;
  }

  protected Name slowParseFieldName()
    throws IOException, JsonParseException
  {
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(": was expecting closing '\"' for name");
    byte[] arrayOfByte = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = 0xFF & arrayOfByte[i];
    if (j == 34)
      return BytesToNameCanonicalizer.getEmptyName();
    return parseEscapedFieldName(this._quadBuffer, 0, 0, j, 0);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.json.UTF8StreamJsonParser
 * JD-Core Version:    0.6.2
 */