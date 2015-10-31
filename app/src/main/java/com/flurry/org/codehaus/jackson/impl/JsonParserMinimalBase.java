package com.flurry.org.codehaus.jackson.impl;

import com.flurry.org.codehaus.jackson.Base64Variant;
import com.flurry.org.codehaus.jackson.JsonParseException;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonParser.Feature;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonStreamContext;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.io.NumberInput;
import com.flurry.org.codehaus.jackson.util.ByteArrayBuilder;
import java.io.IOException;

public abstract class JsonParserMinimalBase extends JsonParser
{
  protected static final int INT_APOSTROPHE = 39;
  protected static final int INT_ASTERISK = 42;
  protected static final int INT_BACKSLASH = 92;
  protected static final int INT_COLON = 58;
  protected static final int INT_COMMA = 44;
  protected static final int INT_CR = 13;
  protected static final int INT_LBRACKET = 91;
  protected static final int INT_LCURLY = 123;
  protected static final int INT_LF = 10;
  protected static final int INT_QUOTE = 34;
  protected static final int INT_RBRACKET = 93;
  protected static final int INT_RCURLY = 125;
  protected static final int INT_SLASH = 47;
  protected static final int INT_SPACE = 32;
  protected static final int INT_TAB = 9;
  protected static final int INT_b = 98;
  protected static final int INT_f = 102;
  protected static final int INT_n = 110;
  protected static final int INT_r = 114;
  protected static final int INT_t = 116;
  protected static final int INT_u = 117;

  protected JsonParserMinimalBase()
  {
  }

  protected JsonParserMinimalBase(int paramInt)
  {
    super(paramInt);
  }

  protected static final String _getCharDesc(int paramInt)
  {
    char c = (char)paramInt;
    if (Character.isISOControl(c))
      return "(CTRL-CHAR, code " + paramInt + ")";
    if (paramInt > 255)
      return "'" + c + "' (code " + paramInt + " / 0x" + Integer.toHexString(paramInt) + ")";
    return "'" + c + "' (code " + paramInt + ")";
  }

  protected final JsonParseException _constructError(String paramString, Throwable paramThrowable)
  {
    return new JsonParseException(paramString, getCurrentLocation(), paramThrowable);
  }

  protected void _decodeBase64(String paramString, ByteArrayBuilder paramByteArrayBuilder, Base64Variant paramBase64Variant)
    throws IOException, JsonParseException
  {
    int i = 0;
    int j = paramString.length();
    if (i < j);
    while (true)
    {
      int k = i + 1;
      char c1 = paramString.charAt(i);
      if (k >= j)
        return;
      if (c1 > ' ')
      {
        int m = paramBase64Variant.decodeBase64Char(c1);
        if (m < 0)
          _reportInvalidBase64(paramBase64Variant, c1, 0, null);
        if (k >= j)
          _reportBase64EOF();
        int n = k + 1;
        char c2 = paramString.charAt(k);
        int i1 = paramBase64Variant.decodeBase64Char(c2);
        if (i1 < 0)
          _reportInvalidBase64(paramBase64Variant, c2, 1, null);
        int i2 = i1 | m << 6;
        if (n >= j)
        {
          if (!paramBase64Variant.usesPadding())
          {
            paramByteArrayBuilder.append(i2 >> 4);
            return;
          }
          _reportBase64EOF();
        }
        int i3 = n + 1;
        char c3 = paramString.charAt(n);
        int i4 = paramBase64Variant.decodeBase64Char(c3);
        if (i4 < 0)
        {
          if (i4 != -2)
            _reportInvalidBase64(paramBase64Variant, c3, 2, null);
          if (i3 >= j)
            _reportBase64EOF();
          i = i3 + 1;
          char c5 = paramString.charAt(i3);
          if (!paramBase64Variant.usesPaddingChar(c5))
            _reportInvalidBase64(paramBase64Variant, c5, 3, "expected padding character '" + paramBase64Variant.getPaddingChar() + "'");
          paramByteArrayBuilder.append(i2 >> 4);
          break;
        }
        int i5 = i4 | i2 << 6;
        if (i3 >= j)
        {
          if (!paramBase64Variant.usesPadding())
          {
            paramByteArrayBuilder.appendTwoBytes(i5 >> 2);
            return;
          }
          _reportBase64EOF();
        }
        i = i3 + 1;
        char c4 = paramString.charAt(i3);
        int i6 = paramBase64Variant.decodeBase64Char(c4);
        if (i6 < 0)
        {
          if (i6 != -2)
            _reportInvalidBase64(paramBase64Variant, c4, 3, null);
          paramByteArrayBuilder.appendTwoBytes(i5 >> 2);
          break;
        }
        paramByteArrayBuilder.appendThreeBytes(i6 | i5 << 6);
        break;
      }
      i = k;
    }
  }

  protected abstract void _handleEOF()
    throws JsonParseException;

  protected char _handleUnrecognizedCharacterEscape(char paramChar)
    throws JsonProcessingException
  {
    if (isEnabled(JsonParser.Feature.ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER));
    while ((paramChar == '\'') && (isEnabled(JsonParser.Feature.ALLOW_SINGLE_QUOTES)))
      return paramChar;
    _reportError("Unrecognized character escape " + _getCharDesc(paramChar));
    return paramChar;
  }

  protected void _reportBase64EOF()
    throws JsonParseException
  {
    throw _constructError("Unexpected end-of-String in base64 content");
  }

  protected final void _reportError(String paramString)
    throws JsonParseException
  {
    throw _constructError(paramString);
  }

  protected void _reportInvalidBase64(Base64Variant paramBase64Variant, char paramChar, int paramInt, String paramString)
    throws JsonParseException
  {
    String str;
    if (paramChar <= ' ')
      str = "Illegal white space character (code 0x" + Integer.toHexString(paramChar) + ") as character #" + (paramInt + 1) + " of 4-char base64 unit: can only used between units";
    while (true)
    {
      if (paramString != null)
        str = str + ": " + paramString;
      throw _constructError(str);
      if (paramBase64Variant.usesPaddingChar(paramChar))
        str = "Unexpected padding character ('" + paramBase64Variant.getPaddingChar() + "') as character #" + (paramInt + 1) + " of 4-char base64 unit: padding only legal as 3rd or 4th character";
      else if ((!Character.isDefined(paramChar)) || (Character.isISOControl(paramChar)))
        str = "Illegal character (code 0x" + Integer.toHexString(paramChar) + ") in base64 content";
      else
        str = "Illegal character '" + paramChar + "' (code 0x" + Integer.toHexString(paramChar) + ") in base64 content";
    }
  }

  protected void _reportInvalidEOF()
    throws JsonParseException
  {
    _reportInvalidEOF(" in " + this._currToken);
  }

  protected void _reportInvalidEOF(String paramString)
    throws JsonParseException
  {
    _reportError("Unexpected end-of-input" + paramString);
  }

  protected void _reportInvalidEOFInValue()
    throws JsonParseException
  {
    _reportInvalidEOF(" in a value");
  }

  protected void _reportUnexpectedChar(int paramInt, String paramString)
    throws JsonParseException
  {
    String str = "Unexpected character (" + _getCharDesc(paramInt) + ")";
    if (paramString != null)
      str = str + ": " + paramString;
    _reportError(str);
  }

  protected final void _throwInternal()
  {
    throw new RuntimeException("Internal error: this code path should never get executed");
  }

  protected void _throwInvalidSpace(int paramInt)
    throws JsonParseException
  {
    int i = (char)paramInt;
    _reportError("Illegal character (" + _getCharDesc(i) + "): only regular white space (\\r, \\n, \\t) is allowed between tokens");
  }

  protected void _throwUnquotedSpace(int paramInt, String paramString)
    throws JsonParseException
  {
    if ((!isEnabled(JsonParser.Feature.ALLOW_UNQUOTED_CONTROL_CHARS)) || (paramInt >= 32))
    {
      int i = (char)paramInt;
      _reportError("Illegal unquoted character (" + _getCharDesc(i) + "): has to be escaped using backslash to be included in " + paramString);
    }
  }

  protected final void _wrapError(String paramString, Throwable paramThrowable)
    throws JsonParseException
  {
    throw _constructError(paramString, paramThrowable);
  }

  public abstract void close()
    throws IOException;

  public abstract byte[] getBinaryValue(Base64Variant paramBase64Variant)
    throws IOException, JsonParseException;

  public abstract String getCurrentName()
    throws IOException, JsonParseException;

  public abstract JsonStreamContext getParsingContext();

  public abstract String getText()
    throws IOException, JsonParseException;

  public abstract char[] getTextCharacters()
    throws IOException, JsonParseException;

  public abstract int getTextLength()
    throws IOException, JsonParseException;

  public abstract int getTextOffset()
    throws IOException, JsonParseException;

  public boolean getValueAsBoolean(boolean paramBoolean)
    throws IOException, JsonParseException
  {
    boolean bool = true;
    if (this._currToken != null)
      switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[this._currToken.ordinal()])
      {
      default:
      case 6:
      case 5:
      case 7:
      case 8:
      case 9:
      case 10:
      }
    do
    {
      bool = paramBoolean;
      do
        return bool;
      while (getIntValue() != 0);
      return false;
      return false;
      Object localObject = getEmbeddedObject();
      if ((localObject instanceof Boolean))
        return ((Boolean)localObject).booleanValue();
    }
    while (!"true".equals(getText().trim()));
    return bool;
  }

  public double getValueAsDouble(double paramDouble)
    throws IOException, JsonParseException
  {
    if (this._currToken != null)
      switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[this._currToken.ordinal()])
      {
      default:
      case 5:
      case 11:
      case 6:
      case 7:
      case 8:
      case 10:
      case 9:
      }
    Object localObject;
    do
    {
      return paramDouble;
      return getDoubleValue();
      return 1.0D;
      return 0.0D;
      return NumberInput.parseAsDouble(getText(), paramDouble);
      localObject = getEmbeddedObject();
    }
    while (!(localObject instanceof Number));
    return ((Number)localObject).doubleValue();
  }

  public int getValueAsInt(int paramInt)
    throws IOException, JsonParseException
  {
    if (this._currToken != null)
      switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[this._currToken.ordinal()])
      {
      default:
      case 5:
      case 11:
      case 6:
      case 7:
      case 8:
      case 10:
      case 9:
      }
    Object localObject;
    do
    {
      return paramInt;
      return getIntValue();
      return 1;
      return 0;
      return NumberInput.parseAsInt(getText(), paramInt);
      localObject = getEmbeddedObject();
    }
    while (!(localObject instanceof Number));
    return ((Number)localObject).intValue();
  }

  public long getValueAsLong(long paramLong)
    throws IOException, JsonParseException
  {
    if (this._currToken != null)
      switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[this._currToken.ordinal()])
      {
      default:
      case 5:
      case 11:
      case 6:
      case 7:
      case 8:
      case 10:
      case 9:
      }
    Object localObject;
    do
    {
      return paramLong;
      return getLongValue();
      return 1L;
      return 0L;
      return NumberInput.parseAsLong(getText(), paramLong);
      localObject = getEmbeddedObject();
    }
    while (!(localObject instanceof Number));
    return ((Number)localObject).longValue();
  }

  public abstract boolean hasTextCharacters();

  public abstract boolean isClosed();

  public abstract JsonToken nextToken()
    throws IOException, JsonParseException;

  public JsonParser skipChildren()
    throws IOException, JsonParseException
  {
    if ((this._currToken != JsonToken.START_OBJECT) && (this._currToken != JsonToken.START_ARRAY))
      return this;
    int i = 1;
    do
    {
      while (true)
      {
        JsonToken localJsonToken = nextToken();
        if (localJsonToken == null)
        {
          _handleEOF();
          return this;
        }
        switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[localJsonToken.ordinal()])
        {
        default:
          break;
        case 1:
        case 2:
          i++;
        case 3:
        case 4:
        }
      }
      i--;
    }
    while (i != 0);
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.impl.JsonParserMinimalBase
 * JD-Core Version:    0.6.2
 */