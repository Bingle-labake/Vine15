package com.flurry.org.codehaus.jackson.impl;

import com.flurry.org.codehaus.jackson.Base64Variant;
import com.flurry.org.codehaus.jackson.JsonParseException;
import com.flurry.org.codehaus.jackson.JsonParser.Feature;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.ObjectCodec;
import com.flurry.org.codehaus.jackson.io.IOContext;
import com.flurry.org.codehaus.jackson.sym.CharsToNameCanonicalizer;
import com.flurry.org.codehaus.jackson.util.ByteArrayBuilder;
import com.flurry.org.codehaus.jackson.util.CharTypes;
import com.flurry.org.codehaus.jackson.util.TextBuffer;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;

public final class ReaderBasedParser extends JsonParserBase
{
  protected char[] _inputBuffer;
  protected ObjectCodec _objectCodec;
  protected Reader _reader;
  protected final CharsToNameCanonicalizer _symbols;
  protected boolean _tokenIncomplete = false;

  public ReaderBasedParser(IOContext paramIOContext, int paramInt, Reader paramReader, ObjectCodec paramObjectCodec, CharsToNameCanonicalizer paramCharsToNameCanonicalizer)
  {
    super(paramIOContext, paramInt);
    this._reader = paramReader;
    this._inputBuffer = paramIOContext.allocTokenBuffer();
    this._objectCodec = paramObjectCodec;
    this._symbols = paramCharsToNameCanonicalizer;
  }

  private final JsonToken _nextAfterName()
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
      int m = k;
      if (m <= 92)
      {
        if (m != 92)
          break label178;
        k = _decodeEscaped();
      }
      int n;
      while (true)
      {
        paramInt2 = m + paramInt2 * 31;
        n = i + 1;
        arrayOfChar1[i] = k;
        if (n < arrayOfChar1.length)
          break label259;
        arrayOfChar1 = this._textBuffer.finishCurrentSegment();
        i = 0;
        break;
        label178: if (m <= paramInt3)
        {
          if (m == paramInt3)
          {
            this._textBuffer.setCurrentLength(i);
            TextBuffer localTextBuffer = this._textBuffer;
            char[] arrayOfChar3 = localTextBuffer.getTextBuffer();
            int i1 = localTextBuffer.getTextOffset();
            int i2 = localTextBuffer.size();
            return this._symbols.findSymbol(arrayOfChar3, i1, i2, paramInt2);
          }
          if (m < 32)
            _throwUnquotedSpace(m, "name");
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
            paramInt2 = k + paramInt2 * 31;
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

  private final void _skipCComment()
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

  private final void _skipComment()
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

  private final void _skipCppComment()
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

  private final int _skipWS()
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

  private final int _skipWSOrEnd()
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

  private final char _verifyNoLeadingZeroes()
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

  private final JsonToken parseNumberText2(boolean paramBoolean)
    throws IOException, JsonParseException
  {
    char[] arrayOfChar1 = this._textBuffer.emptyAndGetCurrentSegment();
    int i = 0;
    if (paramBoolean)
    {
      int i16 = 0 + 1;
      arrayOfChar1[0] = '-';
      i = i16;
    }
    int j = 0;
    int k;
    label81: int m;
    if (this._inputPtr < this._inputEnd)
    {
      char[] arrayOfChar7 = this._inputBuffer;
      int i15 = this._inputPtr;
      this._inputPtr = (i15 + 1);
      k = arrayOfChar7[i15];
      if (k == 48)
        k = _verifyNoLeadingZeroes();
      if ((k < 48) || (k > 57))
        break label748;
      j++;
      if (i >= arrayOfChar1.length)
      {
        arrayOfChar1 = this._textBuffer.finishCurrentSegment();
        i = 0;
      }
      m = i + 1;
      arrayOfChar1[i] = k;
      if ((this._inputPtr < this._inputEnd) || (loadMore()))
        break label549;
      k = 0;
    }
    for (int n = 1; ; n = 0)
    {
      if (j == 0)
        reportInvalidNumber("Missing integer part (next char " + _getCharDesc(k) + ")");
      int i1 = 0;
      int i2;
      if (k == 46)
      {
        i2 = m + 1;
        arrayOfChar1[m] = k;
        label207: if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        {
          n = 1;
          label228: if (i1 == 0)
            reportUnexpectedNumberChar(k, "Decimal point not followed by a digit");
        }
      }
      while (true)
      {
        int i3 = 0;
        int i4;
        int i5;
        label329: int i6;
        if (k != 101)
        {
          i3 = 0;
          if (k != 69);
        }
        else
        {
          if (i2 >= arrayOfChar1.length)
          {
            arrayOfChar1 = this._textBuffer.finishCurrentSegment();
            i2 = 0;
          }
          i4 = i2 + 1;
          arrayOfChar1[i2] = k;
          if (this._inputPtr >= this._inputEnd)
            break label663;
          char[] arrayOfChar4 = this._inputBuffer;
          int i11 = this._inputPtr;
          this._inputPtr = (i11 + 1);
          i5 = arrayOfChar4[i11];
          if ((i5 != 45) && (i5 != 43))
            break label728;
          if (i4 < arrayOfChar1.length)
            break label721;
          arrayOfChar1 = this._textBuffer.finishCurrentSegment();
          i6 = 0;
          label361: int i7 = i6 + 1;
          arrayOfChar1[i6] = i5;
          if (this._inputPtr >= this._inputEnd)
            break label675;
          char[] arrayOfChar3 = this._inputBuffer;
          int i10 = this._inputPtr;
          this._inputPtr = (i10 + 1);
          i5 = arrayOfChar3[i10];
          label411: i2 = i7;
        }
        while (true)
        {
          int i8;
          if ((i5 <= 57) && (i5 >= 48))
          {
            i3++;
            if (i2 >= arrayOfChar1.length)
            {
              arrayOfChar1 = this._textBuffer.finishCurrentSegment();
              i2 = 0;
            }
            i8 = i2 + 1;
            arrayOfChar1[i2] = i5;
            if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
            {
              n = 1;
              i2 = i8;
            }
          }
          else
          {
            if (i3 == 0)
              reportUnexpectedNumberChar(i5, "Exponent indicator not followed by a digit");
            if (n == 0)
              this._inputPtr = (-1 + this._inputPtr);
            this._textBuffer.setCurrentLength(i2);
            return reset(paramBoolean, j, i1, i3);
            k = getNextChar("No digit following minus sign");
            break;
            label549: char[] arrayOfChar6 = this._inputBuffer;
            int i14 = this._inputPtr;
            this._inputPtr = (i14 + 1);
            k = arrayOfChar6[i14];
            i = m;
            break label81;
            char[] arrayOfChar5 = this._inputBuffer;
            int i12 = this._inputPtr;
            this._inputPtr = (i12 + 1);
            k = arrayOfChar5[i12];
            if ((k < 48) || (k > 57))
              break label228;
            i1++;
            if (i2 >= arrayOfChar1.length)
            {
              arrayOfChar1 = this._textBuffer.finishCurrentSegment();
              i2 = 0;
            }
            int i13 = i2 + 1;
            arrayOfChar1[i2] = k;
            i2 = i13;
            break label207;
            label663: i5 = getNextChar("expected a digit for number exponent");
            break label329;
            label675: i5 = getNextChar("expected a digit for number exponent");
            break label411;
          }
          char[] arrayOfChar2 = this._inputBuffer;
          int i9 = this._inputPtr;
          this._inputPtr = (i9 + 1);
          i5 = arrayOfChar2[i9];
          i2 = i8;
          continue;
          label721: i6 = i4;
          break label361;
          label728: i2 = i4;
          i3 = 0;
        }
        i2 = m;
        i1 = 0;
      }
      label748: m = i;
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
          int k = j;
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          char[] arrayOfChar2 = this._inputBuffer;
          int m = this._inputPtr;
          this._inputPtr = (m + 1);
          char c2 = arrayOfChar2[m];
          int n = paramBase64Variant.decodeBase64Char(c2);
          if (n < 0)
            n = _decodeBase64Escape(paramBase64Variant, c2, 1);
          int i1 = n | k << 6;
          if (this._inputPtr >= this._inputEnd)
            loadMoreGuaranteed();
          char[] arrayOfChar3 = this._inputBuffer;
          int i2 = this._inputPtr;
          this._inputPtr = (i2 + 1);
          char c3 = arrayOfChar3[i2];
          int i3 = paramBase64Variant.decodeBase64Char(c3);
          if (i3 < 0)
          {
            if (i3 != -2)
            {
              if ((c3 == '"') && (!paramBase64Variant.usesPadding()))
              {
                localByteArrayBuilder.append(i1 >> 4);
                return localByteArrayBuilder.toByteArray();
              }
              i3 = _decodeBase64Escape(paramBase64Variant, c3, 2);
            }
            if (i3 == -2)
            {
              if (this._inputPtr >= this._inputEnd)
                loadMoreGuaranteed();
              char[] arrayOfChar5 = this._inputBuffer;
              int i7 = this._inputPtr;
              this._inputPtr = (i7 + 1);
              char c5 = arrayOfChar5[i7];
              if (!paramBase64Variant.usesPaddingChar(c5))
                throw reportInvalidBase64Char(paramBase64Variant, c5, 3, "expected padding character '" + paramBase64Variant.getPaddingChar() + "'");
              localByteArrayBuilder.append(i1 >> 4);
            }
          }
          else
          {
            int i4 = i3 | i1 << 6;
            if (this._inputPtr >= this._inputEnd)
              loadMoreGuaranteed();
            char[] arrayOfChar4 = this._inputBuffer;
            int i5 = this._inputPtr;
            this._inputPtr = (i5 + 1);
            char c4 = arrayOfChar4[i5];
            int i6 = paramBase64Variant.decodeBase64Char(c4);
            if (i6 < 0)
            {
              if (i6 != -2)
              {
                if ((c4 == '"') && (!paramBase64Variant.usesPadding()))
                {
                  localByteArrayBuilder.appendTwoBytes(i4 >> 2);
                  return localByteArrayBuilder.toByteArray();
                }
                i6 = _decodeBase64Escape(paramBase64Variant, c4, 3);
              }
              if (i6 == -2)
                localByteArrayBuilder.appendTwoBytes(i4 >> 2);
            }
            else
            {
              localByteArrayBuilder.appendThreeBytes(i6 | i4 << 6);
            }
          }
        }
      }
    }
  }

  protected final char _decodeEscaped()
    throws IOException, JsonParseException
  {
    if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
      _reportInvalidEOF(" in character escape sequence");
    char[] arrayOfChar1 = this._inputBuffer;
    int i = this._inputPtr;
    this._inputPtr = (i + 1);
    char c = arrayOfChar1[i];
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
    int j = 0;
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
      j = i1 | j << 4;
    }
    return (char)j;
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
    int m = k;
    if (m <= 92)
    {
      if (m != 92)
        break label122;
      k = _decodeEscaped();
    }
    while (true)
    {
      if (i >= arrayOfChar1.length)
      {
        arrayOfChar1 = this._textBuffer.finishCurrentSegment();
        i = 0;
      }
      int n = i + 1;
      arrayOfChar1[i] = k;
      i = n;
      break;
      label122: if (m <= 34)
      {
        if (m == 34)
        {
          this._textBuffer.setCurrentLength(i);
          return;
        }
        if (m < 32)
          _throwUnquotedSpace(m, "string value");
      }
    }
  }

  protected final String _getText2(JsonToken paramJsonToken)
  {
    if (paramJsonToken == null)
      return null;
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonToken.ordinal()])
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

  protected final JsonToken _handleApostropheValue()
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
    int m = k;
    if (m <= 92)
    {
      if (m != 92)
        break label122;
      k = _decodeEscaped();
    }
    while (true)
    {
      if (i >= arrayOfChar1.length)
      {
        arrayOfChar1 = this._textBuffer.finishCurrentSegment();
        i = 0;
      }
      int n = i + 1;
      arrayOfChar1[i] = k;
      i = n;
      break;
      label122: if (m <= 39)
      {
        if (m == 39)
        {
          this._textBuffer.setCurrentLength(i);
          return JsonToken.VALUE_STRING;
        }
        if (m < 32)
          _throwUnquotedSpace(m, "string value");
      }
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

  protected final JsonToken _handleUnexpectedValue(int paramInt)
    throws IOException, JsonParseException
  {
    switch (paramInt)
    {
    default:
    case 39:
    case 78:
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

  protected final String _handleUnusualFieldName(int paramInt)
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
        k = this._inputEnd;
        m = 0;
        if (j >= k)
          break label243;
      }
    label223: 
    do
    {
      int i1 = this._inputBuffer[j];
      if (i1 < i)
      {
        if (arrayOfInt[i1] == 0)
          break label223;
        int i3 = -1 + this._inputPtr;
        this._inputPtr = j;
        return this._symbols.findSymbol(this._inputBuffer, i3, j - i3, m);
        bool = false;
        break;
        bool = Character.isJavaIdentifierPart((char)paramInt);
        break;
      }
      if (!Character.isJavaIdentifierPart(i1))
      {
        int i2 = -1 + this._inputPtr;
        this._inputPtr = j;
        return this._symbols.findSymbol(this._inputBuffer, i2, j - i2, m);
      }
      m = i1 + m * 31;
      j++;
    }
    while (j < k);
    label243: int n = -1 + this._inputPtr;
    this._inputPtr = j;
    return _parseUnusualFieldName2(n, m, arrayOfInt);
  }

  protected final void _matchToken(String paramString, int paramInt)
    throws IOException, JsonParseException
  {
    int i = paramString.length();
    do
    {
      if ((this._inputPtr >= this._inputEnd) && (!loadMore()))
        _reportInvalidEOFInValue();
      if (this._inputBuffer[this._inputPtr] != paramString.charAt(paramInt))
        _reportInvalidToken(paramString.substring(0, paramInt), "'null', 'true', 'false' or NaN");
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
    this._inputPtr = (1 + this._inputPtr);
    _reportInvalidToken(paramString.substring(0, paramInt), "'null', 'true', 'false' or NaN");
  }

  protected final String _parseApostropheFieldName()
    throws IOException, JsonParseException
  {
    int i = this._inputPtr;
    int j = this._inputEnd;
    int k = 0;
    int i1;
    if (i < j)
    {
      int[] arrayOfInt = CharTypes.getInputCodeLatin1();
      int n = arrayOfInt.length;
      i1 = this._inputBuffer[i];
      if (i1 == 39)
      {
        int i2 = this._inputPtr;
        this._inputPtr = (i + 1);
        return this._symbols.findSymbol(this._inputBuffer, i2, i - i2, k);
      }
      if ((i1 >= n) || (arrayOfInt[i1] == 0))
        break label110;
    }
    while (true)
    {
      int m = this._inputPtr;
      this._inputPtr = i;
      return _parseFieldName2(m, k, 39);
      label110: k = i1 + k * 31;
      i++;
      if (i < j)
        break;
    }
  }

  protected final String _parseFieldName(int paramInt)
    throws IOException, JsonParseException
  {
    if (paramInt != 34)
      return _handleUnusualFieldName(paramInt);
    int i = this._inputPtr;
    int j = this._inputEnd;
    int k = 0;
    if (i < j)
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
          return this._symbols.findSymbol(this._inputBuffer, i2, i - i2, k);
        }
        k = i1 + k * 31;
        i++;
      }
      while (i < j);
    }
    int m = this._inputPtr;
    this._inputPtr = i;
    return _parseFieldName2(m, k, 34);
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

  protected final void _skipCR()
    throws IOException
  {
    if (((this._inputPtr < this._inputEnd) || (loadMore())) && (this._inputBuffer[this._inputPtr] == '\n'))
      this._inputPtr = (1 + this._inputPtr);
    this._currInputRow = (1 + this._currInputRow);
    this._currInputRowStart = this._inputPtr;
  }

  protected final void _skipLF()
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

  public final String getText()
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
      switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[this._currToken.ordinal()])
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
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[this._currToken.ordinal()])
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
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[this._currToken.ordinal()])
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

  protected final boolean loadMore()
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
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[nextToken().ordinal()])
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

  protected final JsonToken parseNumberText(int paramInt)
    throws IOException, JsonParseException
  {
    boolean bool;
    int i;
    int j;
    int k;
    if (paramInt == 45)
    {
      bool = true;
      i = this._inputPtr;
      j = i - 1;
      k = this._inputEnd;
      if (!bool)
        break label104;
      if (i < this._inputEnd)
        break label60;
    }
    label60: label104: int m;
    label113: int i2;
    label234: int i3;
    label277: int i6;
    do
    {
      do
      {
        if (bool)
          j++;
        this._inputPtr = j;
        return parseNumberText2(bool);
        bool = false;
        break;
        char[] arrayOfChar6 = this._inputBuffer;
        int i10 = i + 1;
        paramInt = arrayOfChar6[i];
        if ((paramInt > 57) || (paramInt < 48))
        {
          this._inputPtr = i10;
          return _handleInvalidNumberStart(paramInt, true);
        }
        i = i10;
      }
      while (paramInt == 48);
      m = 1;
      int i1;
      if (i < this._inputEnd)
      {
        char[] arrayOfChar1 = this._inputBuffer;
        n = i + 1;
        i1 = arrayOfChar1[i];
        if ((i1 < 48) || (i1 > 57))
        {
          i2 = 0;
          if (i1 != 46)
            break label234;
        }
      }
      while (true)
      {
        if (n >= k)
        {
          break;
          m++;
          i = n;
          break label113;
          break;
        }
        char[] arrayOfChar5 = this._inputBuffer;
        int i9 = n + 1;
        i1 = arrayOfChar5[n];
        if ((i1 < 48) || (i1 > 57))
        {
          if (i2 == 0)
            reportUnexpectedNumberChar(i1, "Decimal point not followed by a digit");
          n = i9;
          i3 = 0;
          if (i1 != 101)
          {
            i3 = 0;
            if (i1 != 69)
              break label406;
          }
          if (n < k)
            break label277;
          break;
        }
        i2++;
        n = i9;
      }
      char[] arrayOfChar2 = this._inputBuffer;
      i6 = n + 1;
      i7 = arrayOfChar2[n];
      if ((i7 != 45) && (i7 != 43))
        break label452;
    }
    while (i6 >= k);
    char[] arrayOfChar3 = this._inputBuffer;
    int n = i6 + 1;
    int i7 = arrayOfChar3[i6];
    while (true)
    {
      if ((i7 <= 57) && (i7 >= 48))
      {
        i3++;
        if (n >= k)
          break;
        char[] arrayOfChar4 = this._inputBuffer;
        int i8 = n + 1;
        i7 = arrayOfChar4[n];
        n = i8;
        continue;
      }
      if (i3 == 0)
        reportUnexpectedNumberChar(i7, "Exponent indicator not followed by a digit");
      label406: int i4 = -1 + n;
      this._inputPtr = i4;
      int i5 = i4 - j;
      this._textBuffer.resetWithShared(this._inputBuffer, j, i5);
      return reset(bool, m, i2, i3);
      label452: n = i6;
      i3 = 0;
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
 * Qualified Name:     com.flurry.org.codehaus.jackson.impl.ReaderBasedParser
 * JD-Core Version:    0.6.2
 */