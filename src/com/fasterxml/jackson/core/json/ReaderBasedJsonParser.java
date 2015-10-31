package com.fasterxml.jackson.core.json;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.ObjectCodec;
import com.fasterxml.jackson.core.base.ParserBase;
import com.fasterxml.jackson.core.io.CharTypes;
import com.fasterxml.jackson.core.io.IOContext;
import com.fasterxml.jackson.core.sym.CharsToNameCanonicalizer;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.TextBuffer;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;

public final class ReaderBasedJsonParser extends ParserBase
{
  protected final int _hashSeed;
  protected char[] _inputBuffer;
  protected ObjectCodec _objectCodec;
  protected Reader _reader;
  protected final CharsToNameCanonicalizer _symbols;
  protected boolean _tokenIncomplete = false;

  public ReaderBasedJsonParser(IOContext paramIOContext, int paramInt, Reader paramReader, ObjectCodec paramObjectCodec, CharsToNameCanonicalizer paramCharsToNameCanonicalizer)
  {
    super(paramIOContext, paramInt);
    this._reader = paramReader;
    this._inputBuffer = paramIOContext.allocTokenBuffer();
    this._objectCodec = paramObjectCodec;
    this._symbols = paramCharsToNameCanonicalizer;
    this._hashSeed = paramCharsToNameCanonicalizer.hashSeed();
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

  private String _parseFieldName2(int paramInt1, int paramInt2, int paramInt3)
    throws IOException, JsonParseException
  {
    this._textBuffer.resetWithShared(this._inputBuffer, paramInt1, this._inputPtr - paramInt1);
    char[] arrayOfChar1 = this._textBuffer.getCurrentSegment();
    int i = this._textBuffer.getCurrentSegmentSize();
    while (true)
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        _reportInvalidEOF(": was expecting closing '" + (char)paramInt3 + "' for name");
      char[] arrayOfChar2 = this._inputBuffer;
      int j = this._inputPtr;
      this._inputPtr = (j + 1);
      int k = arrayOfChar2[j];
      if (k <= 92)
        if (k != 92);
      int n;
      for (int m = _decodeEscaped(); ; m = k)
      {
        paramInt2 = k + paramInt2 * 33;
        n = i + 1;
        arrayOfChar1[i] = m;
        if (n < arrayOfChar1.length)
          break label259;
        arrayOfChar1 = this._textBuffer.finishCurrentSegment();
        i = 0;
        break;
        if (k <= paramInt3)
        {
          if (k == paramInt3)
          {
            this._textBuffer.setCurrentLength(i);
            TextBuffer localTextBuffer = this._textBuffer;
            char[] arrayOfChar3 = localTextBuffer.getTextBuffer();
            int i1 = localTextBuffer.getTextOffset();
            int i2 = localTextBuffer.size();
            return this._symbols.findSymbol(arrayOfChar3, i1, i2, paramInt2);
          }
          if (k < 32)
            _throwUnquotedSpace(k, "name");
        }
      }
      label259: i = n;
    }
  }

  private String _parseUnusualFieldName2(int paramInt1, int paramInt2, int[] paramArrayOfInt)
    throws IOException, JsonParseException
  {
    this._textBuffer.resetWithShared(this._inputBuffer, paramInt1, this._inputPtr - paramInt1);
    char[] arrayOfChar1 = this._textBuffer.getCurrentSegment();
    int i = this._textBuffer.getCurrentSegmentSize();
    int j = paramArrayOfInt.length;
    while (true)
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()));
      int i1;
      while (true)
      {
        this._textBuffer.setCurrentLength(i);
        TextBuffer localTextBuffer = this._textBuffer;
        char[] arrayOfChar2 = localTextBuffer.getTextBuffer();
        int m = localTextBuffer.getTextOffset();
        int n = localTextBuffer.size();
        return this._symbols.findSymbol(arrayOfChar2, m, n, paramInt2);
        int k = this._inputBuffer[this._inputPtr];
        if (k <= j)
        {
          if (paramArrayOfInt[k] != 0);
        }
        else
          while (Character.isJavaIdentifierPart(k))
          {
            this._inputPtr = (1 + this._inputPtr);
            paramInt2 = k + paramInt2 * 33;
            i1 = i + 1;
            arrayOfChar1[i] = k;
            if (i1 < arrayOfChar1.length)
              break label199;
            arrayOfChar1 = this._textBuffer.finishCurrentSegment();
            i = 0;
            break;
          }
      }
      label199: i = i1;
    }
  }

  private void _skipCComment()
    throws IOException, JsonParseException
  {
    while (true)
    {
      int j;
      if ((this._inputPtr < this._inputEnd) || (loadMore()))
      {
        char[] arrayOfChar = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = (i + 1);
        j = arrayOfChar[i];
        if (j <= 42)
          if (j == 42)
            if ((this._inputPtr < this._inputEnd) || (loadMore()));
      }
      else
      {
        _reportInvalidEOF(" in a comment");
        return;
        if (this._inputBuffer[this._inputPtr] == '/')
        {
          this._inputPtr = (1 + this._inputPtr);
          return;
          if (j < 32)
            if (j == 10)
              _skipLF();
            else if (j == 13)
              _skipCR();
            else if (j != 9)
              _throwInvalidSpace(j);
        }
      }
    }
  }

  private void _skipComment()
    throws IOException, JsonParseException
  {
    if (!isEnabled(JsonParser.Feature.ALLOW_COMMENTS))
      _reportUnexpectedChar(47, "maybe a (non-standard) comment? (not recognized as one since Feature 'ALLOW_COMMENTS' not enabled for parser)");
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(" in a comment");
    char[] arrayOfChar = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    int j = arrayOfChar[i];
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
    while (true)
    {
      int j;
      if ((this._inputPtr < this._inputEnd) || (loadMore()))
      {
        char[] arrayOfChar = this._inputBuffer;
        int i = this._inputPtr;
        this._inputPtr = (i + 1);
        j = arrayOfChar[i];
        if (j < 32)
          if (j == 10)
            _skipLF();
      }
      else
      {
        return;
        if (j == 13)
        {
          _skipCR();
          return;
        }
        if (j != 9)
          _throwInvalidSpace(j);
      }
    }
  }

  private int _skipWS()
    throws IOException, JsonParseException
  {
    while ((this._inputPtr < this._inputEnd) || (loadMore()))
    {
      char[] arrayOfChar = this._inputBuffer;
      int i = this._inputPtr;
      this._inputPtr = (i + 1);
      int j = arrayOfChar[i];
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
      char[] arrayOfChar = this._inputBuffer;
      int i = this._inputPtr;
      this._inputPtr = (i + 1);
      j = arrayOfChar[i];
      if (j > 32)
      {
        if (j != 47)
          break label110;
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
    int j = -1;
    label110: return j;
  }

  private char _verifyNoLeadingZeroes()
    throws IOException, JsonParseException
  {
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()));
    char c;
    do
    {
      c = '0';
      while ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        do
        {
          return c;
          c = this._inputBuffer[this._inputPtr];
          if ((c < '0') || (c > '9'))
            return '0';
          if (!isEnabled(JsonParser.Feature.ALLOW_NUMERIC_LEADING_ZEROS))
            reportInvalidNumber("Leading zeroes not allowed");
          this._inputPtr = (1 + this._inputPtr);
        }
        while (c != '0');
      c = this._inputBuffer[this._inputPtr];
      if ((c < '0') || (c > '9'))
        return '0';
      this._inputPtr = (1 + this._inputPtr);
    }
    while (c == '0');
    return c;
  }

  private JsonToken parseNumberText2(boolean paramBoolean)
    throws IOException, JsonParseException
  {
    char[] arrayOfChar1 = this._textBuffer.emptyAndGetCurrentSegment();
    if (paramBoolean)
      arrayOfChar1[0] = '-';
    for (int i = 1; ; i = 0)
    {
      int j;
      int k;
      char[] arrayOfChar2;
      int n;
      label84: int i32;
      int i4;
      int i3;
      int i1;
      char[] arrayOfChar3;
      int i2;
      if (this._inputPtr < this._inputEnd)
      {
        char[] arrayOfChar11 = this._inputBuffer;
        int i34 = this._inputPtr;
        this._inputPtr = (i34 + 1);
        j = arrayOfChar11[i34];
        if (j == 48)
          j = _verifyNoLeadingZeroes();
        k = 0;
        int m = j;
        arrayOfChar2 = arrayOfChar1;
        n = m;
        if ((n < 48) || (n > 57))
          break label891;
        k++;
        if (i >= arrayOfChar2.length)
        {
          arrayOfChar2 = this._textBuffer.finishCurrentSegment();
          i = 0;
        }
        i32 = i + 1;
        arrayOfChar2[i] = n;
        if ((this._inputPtr < this._inputEnd) || (loadMore()))
          break label619;
        i4 = 1;
        i3 = 0;
        i1 = k;
        arrayOfChar3 = arrayOfChar2;
        i2 = i32;
      }
      while (true)
      {
        if (i1 == 0)
          reportInvalidNumber("Missing integer part (next char " + _getCharDesc(i3) + ")");
        char[] arrayOfChar8;
        int i25;
        int i26;
        int i27;
        int i5;
        int i29;
        label263: int i8;
        int i6;
        char[] arrayOfChar4;
        int i7;
        if (i3 == 46)
        {
          int i24 = i2 + 1;
          arrayOfChar3[i2] = i3;
          arrayOfChar8 = arrayOfChar3;
          i25 = i24;
          i26 = i3;
          i27 = 0;
          if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
          {
            i5 = i26;
            i29 = 1;
            if (i27 == 0)
              reportUnexpectedNumberChar(i5, "Decimal point not followed by a digit");
            i8 = i27;
            i6 = i25;
            int i30 = i29;
            arrayOfChar4 = arrayOfChar8;
            i7 = i30;
          }
        }
        while (true)
        {
          int i9;
          int i10;
          label382: int i11;
          label416: int i13;
          label467: int i14;
          int i15;
          int i16;
          label478: int i20;
          int i17;
          int i19;
          int i18;
          if ((i5 == 101) || (i5 == 69))
          {
            if (i6 >= arrayOfChar4.length)
            {
              arrayOfChar4 = this._textBuffer.finishCurrentSegment();
              i6 = 0;
            }
            i9 = i6 + 1;
            arrayOfChar4[i6] = i5;
            if (this._inputPtr < this._inputEnd)
            {
              char[] arrayOfChar7 = this._inputBuffer;
              int i23 = this._inputPtr;
              this._inputPtr = (i23 + 1);
              i10 = arrayOfChar7[i23];
              if ((i10 != 45) && (i10 != 43))
                break label823;
              if (i9 < arrayOfChar4.length)
                break label816;
              arrayOfChar4 = this._textBuffer.finishCurrentSegment();
              i11 = 0;
              int i12 = i11 + 1;
              arrayOfChar4[i11] = i10;
              if (this._inputPtr >= this._inputEnd)
                break label755;
              char[] arrayOfChar6 = this._inputBuffer;
              int i22 = this._inputPtr;
              this._inputPtr = (i22 + 1);
              i13 = arrayOfChar6[i22];
              i14 = i13;
              i15 = i12;
              i16 = 0;
              if ((i14 > 57) || (i14 < 48))
                break label801;
              i16++;
              if (i15 >= arrayOfChar4.length)
              {
                arrayOfChar4 = this._textBuffer.finishCurrentSegment();
                i15 = 0;
              }
              i20 = i15 + 1;
              arrayOfChar4[i15] = i14;
              if ((this._inputPtr < this._inputEnd) || (loadMore()))
                break label767;
              i17 = i16;
              i19 = 1;
              i18 = i20;
              label557: if (i17 == 0)
                reportUnexpectedNumberChar(i14, "Exponent indicator not followed by a digit");
              label571: if (i19 == 0)
                this._inputPtr = (-1 + this._inputPtr);
              this._textBuffer.setCurrentLength(i18);
              return reset(paramBoolean, i1, i8, i17);
              j = getNextChar("No digit following minus sign");
              break;
              label619: char[] arrayOfChar10 = this._inputBuffer;
              int i33 = this._inputPtr;
              this._inputPtr = (i33 + 1);
              n = arrayOfChar10[i33];
              i = i32;
              break label84;
              char[] arrayOfChar9 = this._inputBuffer;
              int i28 = this._inputPtr;
              this._inputPtr = (i28 + 1);
              i26 = arrayOfChar9[i28];
              if (i26 < 48)
                break label858;
              if (i26 > 57)
              {
                i5 = i26;
                i29 = i4;
                break label263;
              }
              i27++;
              if (i25 < arrayOfChar8.length)
                break label851;
              arrayOfChar8 = this._textBuffer.finishCurrentSegment();
            }
          }
          label801: label816: label823: label851: for (int i31 = 0; ; i31 = i25)
          {
            i25 = i31 + 1;
            arrayOfChar8[i31] = i26;
            break;
            i10 = getNextChar("expected a digit for number exponent");
            break label382;
            label755: i13 = getNextChar("expected a digit for number exponent");
            break label467;
            label767: char[] arrayOfChar5 = this._inputBuffer;
            int i21 = this._inputPtr;
            this._inputPtr = (i21 + 1);
            i14 = arrayOfChar5[i21];
            i15 = i20;
            break label478;
            i17 = i16;
            i18 = i15;
            i19 = i7;
            break label557;
            i11 = i9;
            break label416;
            i14 = i10;
            i15 = i9;
            i16 = 0;
            break label478;
            i18 = i6;
            i19 = i7;
            i17 = 0;
            break label571;
          }
          label858: i5 = i26;
          i29 = i4;
          break label263;
          i5 = i3;
          arrayOfChar4 = arrayOfChar3;
          i6 = i2;
          i7 = i4;
          i8 = 0;
        }
        label891: i1 = k;
        i2 = i;
        i3 = n;
        arrayOfChar3 = arrayOfChar2;
        i4 = 0;
      }
    }
  }

  protected void _closeInput()
    throws IOException
  {
    if (this._reader != null)
    {
      if ((this._ioContext.isResourceManaged()) || (isEnabled(JsonParser.Feature.AUTO_CLOSE_SOURCE)))
        this._reader.close();
      this._reader = null;
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
      char[] arrayOfChar1 = this._inputBuffer;
      int i = this._inputPtr;
      this._inputPtr = (i + 1);
      char c1 = arrayOfChar1[i];
      if (c1 > ' ')
      {
        int j = paramBase64Variant.decodeBase64Char(c1);
        if (j < 0)
        {
          if (c1 == '"')
            return localByteArrayBuilder.toByteArray();
          j = _decodeBase64Escape(paramBase64Variant, c1, 0);
          if (j < 0);
        }
        else
        {
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          char[] arrayOfChar2 = this._inputBuffer;
          int k = this._inputPtr;
          this._inputPtr = (k + 1);
          char c2 = arrayOfChar2[k];
          int m = paramBase64Variant.decodeBase64Char(c2);
          if (m < 0)
            m = _decodeBase64Escape(paramBase64Variant, c2, 1);
          int n = m | j << 6;
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          char[] arrayOfChar3 = this._inputBuffer;
          int i1 = this._inputPtr;
          this._inputPtr = (i1 + 1);
          char c3 = arrayOfChar3[i1];
          int i2 = paramBase64Variant.decodeBase64Char(c3);
          if (i2 < 0)
          {
            if (i2 != -2)
            {
              if ((c3 == '"') && (!paramBase64Variant.usesPadding()))
              {
                localByteArrayBuilder.append(n >> 4);
                return localByteArrayBuilder.toByteArray();
              }
              i2 = _decodeBase64Escape(paramBase64Variant, c3, 2);
            }
            if (i2 == -2)
            {
              if (this._inputPtr >= this._inputEnd)
                loadMoreGuaranteed();
              char[] arrayOfChar5 = this._inputBuffer;
              int i6 = this._inputPtr;
              this._inputPtr = (i6 + 1);
              char c5 = arrayOfChar5[i6];
              if (!paramBase64Variant.usesPaddingChar(c5))
                throw reportInvalidBase64Char(paramBase64Variant, c5, 3, "expected padding character '" + paramBase64Variant.getPaddingChar() + "'");
              localByteArrayBuilder.append(n >> 4);
            }
          }
          else
          {
            int i3 = i2 | n << 6;
            if (this._inputPtr >= this._inputEnd)
              loadMoreGuaranteed();
            char[] arrayOfChar4 = this._inputBuffer;
            int i4 = this._inputPtr;
            this._inputPtr = (i4 + 1);
            char c4 = arrayOfChar4[i4];
            int i5 = paramBase64Variant.decodeBase64Char(c4);
            if (i5 < 0)
            {
              if (i5 != -2)
              {
                if ((c4 == '"') && (!paramBase64Variant.usesPadding()))
                {
                  localByteArrayBuilder.appendTwoBytes(i3 >> 2);
                  return localByteArrayBuilder.toByteArray();
                }
                i5 = _decodeBase64Escape(paramBase64Variant, c4, 3);
              }
              if (i5 == -2)
                localByteArrayBuilder.appendTwoBytes(i3 >> 2);
            }
            else
            {
              localByteArrayBuilder.appendThreeBytes(i5 | i3 << 6);
            }
          }
        }
      }
    }
  }

  protected char _decodeEscaped()
    throws IOException, JsonParseException
  {
    int i = 0;
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(" in character escape sequence");
    char[] arrayOfChar1 = this._inputBuffer;
    int j = this._inputPtr;
    this._inputPtr = (j + 1);
    char c = arrayOfChar1[j];
    switch (c)
    {
    default:
      c = _handleUnrecognizedCharacterEscape(c);
    case '"':
    case '/':
    case '\\':
      return c;
    case 'b':
      return '\b';
    case 't':
      return '\t';
    case 'n':
      return '\n';
    case 'f':
      return '\f';
    case 'r':
      return '\r';
    case 'u':
    }
    for (int k = 0; k < 4; k++)
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        _reportInvalidEOF(" in character escape sequence");
      char[] arrayOfChar2 = this._inputBuffer;
      int m = this._inputPtr;
      this._inputPtr = (m + 1);
      int n = arrayOfChar2[m];
      int i1 = CharTypes.charToHex(n);
      if (i1 < 0)
        _reportUnexpectedChar(n, "expected a hex-digit for character escape sequence");
      i = i1 | i << 4;
    }
    return (char)i;
  }

  protected void _finishString()
    throws IOException, JsonParseException
  {
    int i = this._inputPtr;
    int j = this._inputEnd;
    if (i < j)
    {
      int[] arrayOfInt = CharTypes.getInputCodeLatin1();
      int k = arrayOfInt.length;
      do
      {
        int m = this._inputBuffer[i];
        if ((m < k) && (arrayOfInt[m] != 0))
        {
          if (m != 34)
            break;
          this._textBuffer.resetWithShared(this._inputBuffer, this._inputPtr, i - this._inputPtr);
          this._inputPtr = (i + 1);
          return;
        }
        i++;
      }
      while (i < j);
    }
    this._textBuffer.resetWithCopy(this._inputBuffer, this._inputPtr, i - this._inputPtr);
    this._inputPtr = i;
    _finishString2();
  }

  protected void _finishString2()
    throws IOException, JsonParseException
  {
    char[] arrayOfChar1 = this._textBuffer.getCurrentSegment();
    int i = this._textBuffer.getCurrentSegmentSize();
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(": was expecting closing quote for a string value");
    char[] arrayOfChar2 = this._inputBuffer;
    int j = this._inputPtr;
    this._inputPtr = (j + 1);
    int k = arrayOfChar2[j];
    if (k <= 92)
    {
      if (k == 92)
        k = _decodeEscaped();
    }
    else
    {
      label86: if (i < arrayOfChar1.length)
        break label159;
      arrayOfChar1 = this._textBuffer.finishCurrentSegment();
    }
    label159: for (int m = 0; ; m = i)
    {
      i = m + 1;
      arrayOfChar1[m] = k;
      break;
      if (k > 34)
        break label86;
      if (k == 34)
      {
        this._textBuffer.setCurrentLength(i);
        return;
      }
      if (k >= 32)
        break label86;
      _throwUnquotedSpace(k, "string value");
      break label86;
    }
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
    char[] arrayOfChar1 = this._textBuffer.emptyAndGetCurrentSegment();
    int i = this._textBuffer.getCurrentSegmentSize();
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(": was expecting closing quote for a string value");
    char[] arrayOfChar2 = this._inputBuffer;
    int j = this._inputPtr;
    this._inputPtr = (j + 1);
    int k = arrayOfChar2[j];
    if (k <= 92)
    {
      if (k == 92)
        k = _decodeEscaped();
    }
    else
    {
      label86: if (i < arrayOfChar1.length)
        break label162;
      arrayOfChar1 = this._textBuffer.finishCurrentSegment();
    }
    label162: for (int m = 0; ; m = i)
    {
      i = m + 1;
      arrayOfChar1[m] = k;
      break;
      if (k > 39)
        break label86;
      if (k == 39)
      {
        this._textBuffer.setCurrentLength(i);
        return JsonToken.VALUE_STRING;
      }
      if (k >= 32)
        break label86;
      _throwUnquotedSpace(k, "string value");
      break label86;
    }
  }

  protected JsonToken _handleInvalidNumberStart(int paramInt, boolean paramBoolean)
    throws IOException, JsonParseException
  {
    double d = (-1.0D / 0.0D);
    if (paramInt == 73)
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        _reportInvalidEOFInValue();
      char[] arrayOfChar = this._inputBuffer;
      int i = this._inputPtr;
      this._inputPtr = (i + 1);
      paramInt = arrayOfChar[i];
      if (paramInt != 78)
        break label158;
      String str2;
      if (paramBoolean)
      {
        str2 = "-INF";
        _matchToken(str2, 3);
        if (!isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS))
          break label117;
        if (!paramBoolean)
          break label110;
      }
      while (true)
      {
        return resetAsNaN(str2, d);
        str2 = "+INF";
        break;
        label110: d = (1.0D / 0.0D);
      }
      label117: _reportError("Non-standard token '" + str2 + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
    }
    while (true)
    {
      reportUnexpectedNumberChar(paramInt, "expected digit (0-9) to follow minus sign, for valid numeric value");
      return null;
      label158: if (paramInt == 110)
      {
        String str1;
        if (paramBoolean)
        {
          str1 = "-Infinity";
          _matchToken(str1, 3);
          if (!isEnabled(JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS))
            break label217;
          if (!paramBoolean)
            break label210;
        }
        while (true)
        {
          return resetAsNaN(str1, d);
          str1 = "+Infinity";
          break;
          label210: d = (1.0D / 0.0D);
        }
        label217: _reportError("Non-standard token '" + str1 + "': enable JsonParser.Feature.ALLOW_NON_NUMERIC_NUMBERS to allow");
      }
    }
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
    char[] arrayOfChar = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    return _handleInvalidNumberStart(arrayOfChar[i], false);
  }

  protected String _handleUnusualFieldName(int paramInt)
    throws IOException, JsonParseException
  {
    if ((paramInt == 39) && (isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)))
      return _parseApostropheFieldName();
    if (!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES))
      _reportUnexpectedChar(paramInt, "was expecting double-quote to start field name");
    int[] arrayOfInt = CharTypes.getInputCodeLatin1JsNames();
    int i = arrayOfInt.length;
    boolean bool;
    int j;
    int k;
    int m;
    if (paramInt < i)
      if ((arrayOfInt[paramInt] == 0) && ((paramInt < 48) || (paramInt > 57)))
      {
        bool = true;
        if (!bool)
          _reportUnexpectedChar(paramInt, "was expecting either valid name character (for unquoted name) or double-quote (for quoted) to start field name");
        j = this._inputPtr;
        k = this._hashSeed;
        m = this._inputEnd;
        if (j >= m)
          break label246;
      }
    label226: 
    do
    {
      int i1 = this._inputBuffer[j];
      if (i1 < i)
      {
        if (arrayOfInt[i1] == 0)
          break label226;
        int i3 = -1 + this._inputPtr;
        this._inputPtr = j;
        return this._symbols.findSymbol(this._inputBuffer, i3, j - i3, k);
        bool = false;
        break;
        bool = Character.isJavaIdentifierPart((char)paramInt);
        break;
      }
      if (!Character.isJavaIdentifierPart(i1))
      {
        int i2 = -1 + this._inputPtr;
        this._inputPtr = j;
        return this._symbols.findSymbol(this._inputBuffer, i2, j - i2, k);
      }
      k = i1 + k * 33;
      j++;
    }
    while (j < m);
    label246: int n = -1 + this._inputPtr;
    this._inputPtr = j;
    return _parseUnusualFieldName2(n, k, arrayOfInt);
  }

  protected void _matchToken(String paramString, int paramInt)
    throws IOException, JsonParseException
  {
    int i = paramString.length();
    do
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        _reportInvalidToken(paramString.substring(0, paramInt));
      if (this._inputBuffer[this._inputPtr] != paramString.charAt(paramInt))
        _reportInvalidToken(paramString.substring(0, paramInt));
      this._inputPtr = (1 + this._inputPtr);
      paramInt++;
    }
    while (paramInt < i);
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()));
    char c;
    do
    {
      return;
      c = this._inputBuffer[this._inputPtr];
    }
    while ((c < '0') || (c == ']') || (c == '}') || (!Character.isJavaIdentifierPart(c)));
    _reportInvalidToken(paramString.substring(0, paramInt));
  }

  protected String _parseApostropheFieldName()
    throws IOException, JsonParseException
  {
    int i = this._inputPtr;
    int j = this._hashSeed;
    int k = this._inputEnd;
    int i1;
    if (i < k)
    {
      int[] arrayOfInt = CharTypes.getInputCodeLatin1();
      int n = arrayOfInt.length;
      i1 = this._inputBuffer[i];
      if (i1 == 39)
      {
        int i2 = this._inputPtr;
        this._inputPtr = (i + 1);
        return this._symbols.findSymbol(this._inputBuffer, i2, i - i2, j);
      }
      if ((i1 >= n) || (arrayOfInt[i1] == 0))
        break label113;
    }
    while (true)
    {
      int m = this._inputPtr;
      this._inputPtr = i;
      return _parseFieldName2(m, j, 39);
      label113: j = i1 + j * 33;
      i++;
      if (i < k)
        break;
    }
  }

  protected String _parseFieldName(int paramInt)
    throws IOException, JsonParseException
  {
    if (paramInt != 34)
      return _handleUnusualFieldName(paramInt);
    int i = this._inputPtr;
    int j = this._hashSeed;
    int k = this._inputEnd;
    if (i < k)
    {
      int[] arrayOfInt = CharTypes.getInputCodeLatin1();
      int n = arrayOfInt.length;
      do
      {
        int i1 = this._inputBuffer[i];
        if ((i1 < n) && (arrayOfInt[i1] != 0))
        {
          if (i1 != 34)
            break;
          int i2 = this._inputPtr;
          this._inputPtr = (i + 1);
          return this._symbols.findSymbol(this._inputBuffer, i2, i - i2, j);
        }
        j = i1 + j * 33;
        i++;
      }
      while (i < k);
    }
    int m = this._inputPtr;
    this._inputPtr = i;
    return _parseFieldName2(m, j, 34);
  }

  protected int _readBinary(Base64Variant paramBase64Variant, OutputStream paramOutputStream, byte[] paramArrayOfByte)
    throws IOException, JsonParseException
  {
    int i = -3 + paramArrayOfByte.length;
    int j = 0;
    int k = 0;
    int n;
    label82: 
    do
    {
      char c1;
      do
      {
        if (this._inputPtr >= this._inputEnd)
          loadMoreGuaranteed();
        char[] arrayOfChar1 = this._inputBuffer;
        int m = this._inputPtr;
        this._inputPtr = (m + 1);
        c1 = arrayOfChar1[m];
      }
      while (c1 <= ' ');
      n = paramBase64Variant.decodeBase64Char(c1);
      if (n >= 0)
        break;
      if (c1 == '"')
      {
        this._tokenIncomplete = false;
        if (k > 0)
        {
          j += k;
          paramOutputStream.write(paramArrayOfByte, 0, k);
        }
        return j;
      }
      n = _decodeBase64Escape(paramBase64Variant, c1, 0);
    }
    while (n < 0);
    int i1 = n;
    if (k > i)
    {
      j += k;
      paramOutputStream.write(paramArrayOfByte, 0, k);
    }
    for (int i2 = 0; ; i2 = k)
    {
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      char[] arrayOfChar2 = this._inputBuffer;
      int i3 = this._inputPtr;
      this._inputPtr = (i3 + 1);
      char c2 = arrayOfChar2[i3];
      int i4 = paramBase64Variant.decodeBase64Char(c2);
      if (i4 < 0)
        i4 = _decodeBase64Escape(paramBase64Variant, c2, 1);
      int i5 = i4 | i1 << 6;
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      char[] arrayOfChar3 = this._inputBuffer;
      int i6 = this._inputPtr;
      this._inputPtr = (i6 + 1);
      char c3 = arrayOfChar3[i6];
      int i7 = paramBase64Variant.decodeBase64Char(c3);
      if (i7 < 0)
      {
        if (i7 != -2)
        {
          if ((c3 == '"') && (!paramBase64Variant.usesPadding()))
          {
            int i20 = i5 >> 4;
            k = i2 + 1;
            paramArrayOfByte[i2] = ((byte)i20);
            break label82;
          }
          i7 = _decodeBase64Escape(paramBase64Variant, c3, 2);
        }
        if (i7 == -2)
        {
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          char[] arrayOfChar5 = this._inputBuffer;
          int i18 = this._inputPtr;
          this._inputPtr = (i18 + 1);
          char c5 = arrayOfChar5[i18];
          if (!paramBase64Variant.usesPaddingChar(c5))
            throw reportInvalidBase64Char(paramBase64Variant, c5, 3, "expected padding character '" + paramBase64Variant.getPaddingChar() + "'");
          int i19 = i5 >> 4;
          k = i2 + 1;
          paramArrayOfByte[i2] = ((byte)i19);
          break;
        }
      }
      int i8 = i7 | i5 << 6;
      if (this._inputPtr >= this._inputEnd)
        loadMoreGuaranteed();
      char[] arrayOfChar4 = this._inputBuffer;
      int i9 = this._inputPtr;
      this._inputPtr = (i9 + 1);
      char c4 = arrayOfChar4[i9];
      int i10 = paramBase64Variant.decodeBase64Char(c4);
      if (i10 < 0)
      {
        if (i10 != -2)
        {
          if ((c4 == '"') && (!paramBase64Variant.usesPadding()))
          {
            int i16 = i8 >> 2;
            int i17 = i2 + 1;
            paramArrayOfByte[i2] = ((byte)(i16 >> 8));
            k = i17 + 1;
            paramArrayOfByte[i17] = ((byte)i16);
            break label82;
          }
          i10 = _decodeBase64Escape(paramBase64Variant, c4, 3);
        }
        if (i10 == -2)
        {
          int i14 = i8 >> 2;
          int i15 = i2 + 1;
          paramArrayOfByte[i2] = ((byte)(i14 >> 8));
          k = i15 + 1;
          paramArrayOfByte[i15] = ((byte)i14);
          break;
        }
      }
      int i11 = i10 | i8 << 6;
      int i12 = i2 + 1;
      paramArrayOfByte[i2] = ((byte)(i11 >> 16));
      int i13 = i12 + 1;
      paramArrayOfByte[i12] = ((byte)(i11 >> 8));
      k = i13 + 1;
      paramArrayOfByte[i13] = ((byte)i11);
      break;
    }
  }

  protected void _releaseBuffers()
    throws IOException
  {
    super._releaseBuffers();
    char[] arrayOfChar = this._inputBuffer;
    if (arrayOfChar != null)
    {
      this._inputBuffer = null;
      this._ioContext.releaseTokenBuffer(arrayOfChar);
    }
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
        _reportError("Unrecognized token '" + localStringBuilder.toString() + "': was expecting ");
        return;
        c = this._inputBuffer[this._inputPtr];
      }
      while (!Character.isJavaIdentifierPart(c));
      this._inputPtr = (1 + this._inputPtr);
      localStringBuilder.append(c);
    }
  }

  protected void _skipCR()
    throws IOException
  {
    if (((this._inputPtr < this._inputEnd) || (loadMore())) && (this._inputBuffer[this._inputPtr] == '\n'))
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
    int i = this._inputPtr;
    int j = this._inputEnd;
    char[] arrayOfChar = this._inputBuffer;
    while (true)
    {
      if (i >= j)
      {
        this._inputPtr = i;
        if (!loadMore())
          _reportInvalidEOF(": was expecting closing quote for a string value");
        i = this._inputPtr;
        j = this._inputEnd;
      }
      int k = i + 1;
      int m = arrayOfChar[i];
      if (m <= 92)
      {
        if (m == 92)
        {
          this._inputPtr = k;
          _decodeEscaped();
          i = this._inputPtr;
          j = this._inputEnd;
        }
        else if (m <= 34)
        {
          if (m == 34)
          {
            this._inputPtr = k;
            return;
          }
          if (m < 32)
          {
            this._inputPtr = k;
            _throwUnquotedSpace(m, "string value");
          }
        }
      }
      else
        i = k;
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
    return this._reader;
  }

  protected char getNextChar(String paramString)
    throws IOException, JsonParseException
  {
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(paramString);
    char[] arrayOfChar = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    return arrayOfChar[i];
  }

  public String getText()
    throws IOException, JsonParseException
  {
    JsonToken localJsonToken = this._currToken;
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      if (this._tokenIncomplete)
      {
        this._tokenIncomplete = false;
        _finishString();
      }
      return this._textBuffer.contentsAsString();
    }
    return _getText2(localJsonToken);
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
    Reader localReader = this._reader;
    boolean bool = false;
    int i;
    if (localReader != null)
    {
      i = this._reader.read(this._inputBuffer, 0, this._inputBuffer.length);
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
    throw new IOException("Reader returned 0 characters when trying to read " + this._inputEnd);
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
    boolean bool = this._parsingContext.inObject();
    if (bool)
    {
      String str = _parseFieldName(i);
      this._parsingContext.setCurrentName(str);
      this._currToken = JsonToken.FIELD_NAME;
      int j = _skipWS();
      if (j != 58)
        _reportUnexpectedChar(j, "was expecting a colon to separate field name and value");
      i = _skipWS();
    }
    JsonToken localJsonToken1;
    switch (i)
    {
    default:
      localJsonToken1 = _handleUnexpectedValue(i);
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
    while (bool)
    {
      this._nextToken = localJsonToken1;
      return this._currToken;
      this._tokenIncomplete = true;
      localJsonToken1 = JsonToken.VALUE_STRING;
      continue;
      if (!bool)
        this._parsingContext = this._parsingContext.createChildArrayContext(this._tokenInputRow, this._tokenInputCol);
      localJsonToken1 = JsonToken.START_ARRAY;
      continue;
      if (!bool)
        this._parsingContext = this._parsingContext.createChildObjectContext(this._tokenInputRow, this._tokenInputCol);
      localJsonToken1 = JsonToken.START_OBJECT;
      continue;
      _reportUnexpectedChar(i, "expected a value");
      _matchToken("true", 1);
      localJsonToken1 = JsonToken.VALUE_TRUE;
      continue;
      _matchToken("false", 1);
      localJsonToken1 = JsonToken.VALUE_FALSE;
      continue;
      _matchToken("null", 1);
      localJsonToken1 = JsonToken.VALUE_NULL;
      continue;
      localJsonToken1 = parseNumberText(i);
    }
    this._currToken = localJsonToken1;
    return localJsonToken1;
  }

  protected JsonToken parseNumberText(int paramInt)
    throws IOException, JsonParseException
  {
    int i = 1;
    int j = 0;
    int k;
    int m;
    int n;
    int i1;
    if (paramInt == 45)
    {
      k = i;
      m = this._inputPtr;
      n = m - 1;
      i1 = this._inputEnd;
      if (k == 0)
        break label118;
      if (m < this._inputEnd)
        break label75;
    }
    int i14;
    label56: boolean bool;
    label75: int i2;
    label118: int i3;
    label128: int i4;
    int i15;
    int i16;
    label184: int i17;
    int i19;
    int i6;
    int i5;
    while (true)
      if (k != 0)
      {
        i14 = n + 1;
        this._inputPtr = i14;
        return parseNumberText2(k);
        bool = false;
        break;
        char[] arrayOfChar6 = this._inputBuffer;
        i2 = m + 1;
        paramInt = arrayOfChar6[m];
        if ((paramInt > 57) || (paramInt < 48))
        {
          this._inputPtr = i2;
          return _handleInvalidNumberStart(paramInt, i);
          i2 = m;
        }
        if (paramInt != 48)
          if (i2 < this._inputEnd)
          {
            char[] arrayOfChar1 = this._inputBuffer;
            i3 = i2 + 1;
            i4 = arrayOfChar1[i2];
            if ((i4 < 48) || (i4 > 57))
            {
              if (i4 != 46)
                break label484;
              i15 = 0;
              i16 = i3;
              if (i16 >= i1)
                break label404;
              char[] arrayOfChar5 = this._inputBuffer;
              i17 = i16 + 1;
              int i18 = arrayOfChar5[i16];
              if ((i18 >= 48) && (i18 <= 57))
                break label396;
              if (i15 == 0)
                reportUnexpectedNumberChar(i18, "Decimal point not followed by a digit");
              i19 = i15;
              i6 = i17;
              i5 = i18;
            }
          }
      }
    for (int i7 = i19; ; i7 = 0)
    {
      int i10;
      int i11;
      int i12;
      if (i5 != 101)
      {
        j = 0;
        if (i5 != 69);
      }
      else
      {
        if (i6 >= i1)
          break;
        char[] arrayOfChar2 = this._inputBuffer;
        i10 = i6 + 1;
        i11 = arrayOfChar2[i6];
        if ((i11 != 45) && (i11 != 43))
          break label471;
        if (i10 >= i1)
          break;
        char[] arrayOfChar3 = this._inputBuffer;
        i6 = i10 + 1;
        i12 = arrayOfChar3[i10];
      }
      while (true)
      {
        if ((i12 <= 57) && (i12 >= 48))
        {
          j++;
          if (i6 >= i1)
            break;
          char[] arrayOfChar4 = this._inputBuffer;
          int i13 = i6 + 1;
          i12 = arrayOfChar4[i6];
          i6 = i13;
          continue;
          i++;
          i2 = i3;
          break label128;
          break;
          label396: i15++;
          i16 = i17;
          break label184;
          label404: break;
        }
        if (j == 0)
          reportUnexpectedNumberChar(i12, "Exponent indicator not followed by a digit");
        int i8 = i6 - 1;
        this._inputPtr = i8;
        int i9 = i8 - n;
        this._textBuffer.resetWithShared(this._inputBuffer, n, i9);
        return reset(bool, i, i7, j);
        i14 = n;
        break label56;
        label471: i12 = i11;
        i6 = i10;
        j = 0;
      }
      label484: i5 = i4;
      i6 = i3;
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

  public int releaseBuffered(Writer paramWriter)
    throws IOException
  {
    int i = this._inputEnd - this._inputPtr;
    if (i < 1)
      return 0;
    int j = this._inputPtr;
    paramWriter.write(this._inputBuffer, j, i);
    return i;
  }

  public void setCodec(ObjectCodec paramObjectCodec)
  {
    this._objectCodec = paramObjectCodec;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.json.ReaderBasedJsonParser
 * JD-Core Version:    0.6.2
 */