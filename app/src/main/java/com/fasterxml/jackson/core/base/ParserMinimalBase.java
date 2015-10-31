package com.fasterxml.jackson.core.base;

import com.fasterxml.jackson.core.Base64Variant;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonStreamContext;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.core.Version;
import com.fasterxml.jackson.core.io.NumberInput;
import com.fasterxml.jackson.core.util.ByteArrayBuilder;
import com.fasterxml.jackson.core.util.VersionUtil;
import java.io.IOException;

public abstract class ParserMinimalBase extends JsonParser
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
  protected JsonToken _currToken;
  protected JsonToken _lastClearedToken;

  protected ParserMinimalBase()
  {
  }

  protected ParserMinimalBase(int paramInt)
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
    try
    {
      paramBase64Variant.decode(paramString, paramByteArrayBuilder);
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      _reportError(localIllegalArgumentException.getMessage());
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

  @Deprecated
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

  @Deprecated
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
    VersionUtil.throwInternal();
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

  public void clearCurrentToken()
  {
    if (this._currToken != null)
    {
      this._lastClearedToken = this._currToken;
      this._currToken = null;
    }
  }

  public abstract void close()
    throws IOException;

  public abstract byte[] getBinaryValue(Base64Variant paramBase64Variant)
    throws IOException, JsonParseException;

  public abstract String getCurrentName()
    throws IOException, JsonParseException;

  public JsonToken getCurrentToken()
  {
    return this._currToken;
  }

  public JsonToken getLastClearedToken()
  {
    return this._lastClearedToken;
  }

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
    boolean bool;
    if (this._currToken != null)
    {
      int i = 1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this._currToken.ordinal()];
      bool = false;
      switch (i)
      {
      default:
      case 7:
      case 8:
      case 5:
      case 6:
      case 9:
      case 10:
      }
    }
    do
    {
      bool = paramBoolean;
      int j;
      do
      {
        return bool;
        j = getIntValue();
        bool = false;
      }
      while (j == 0);
      return true;
      return true;
      Object localObject = getEmbeddedObject();
      if ((localObject instanceof Boolean))
        return ((Boolean)localObject).booleanValue();
    }
    while (!"true".equals(getText().trim()));
    return true;
  }

  public double getValueAsDouble(double paramDouble)
    throws IOException, JsonParseException
  {
    if (this._currToken != null)
      switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this._currToken.ordinal()])
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
      switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this._currToken.ordinal()])
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
      switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[this._currToken.ordinal()])
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

  public String getValueAsString(String paramString)
    throws IOException, JsonParseException
  {
    if ((this._currToken != JsonToken.VALUE_STRING) && ((this._currToken == null) || (this._currToken == JsonToken.VALUE_NULL) || (!this._currToken.isScalarValue())))
      return paramString;
    return getText();
  }

  public boolean hasCurrentToken()
  {
    return this._currToken != null;
  }

  public abstract boolean hasTextCharacters();

  public abstract boolean isClosed();

  public abstract JsonToken nextToken()
    throws IOException, JsonParseException;

  public JsonToken nextValue()
    throws IOException, JsonParseException
  {
    JsonToken localJsonToken = nextToken();
    if (localJsonToken == JsonToken.FIELD_NAME)
      localJsonToken = nextToken();
    return localJsonToken;
  }

  public abstract void overrideCurrentName(String paramString);

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
        switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[localJsonToken.ordinal()])
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

  public Version version()
  {
    return VersionUtil.versionFor(getClass());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.fasterxml.jackson.core.base.ParserMinimalBase
 * JD-Core Version:    0.6.2
 */