package com.flurry.org.codehaus.jackson;

import com.flurry.org.codehaus.jackson.type.TypeReference;
import java.io.Closeable;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Iterator;

public abstract class JsonParser
  implements Closeable, Versioned
{
  private static final int MAX_BYTE_I = 127;
  private static final int MAX_SHORT_I = 32767;
  private static final int MIN_BYTE_I = -128;
  private static final int MIN_SHORT_I = -32768;
  protected JsonToken _currToken;
  protected int _features;
  protected JsonToken _lastClearedToken;

  protected JsonParser()
  {
  }

  protected JsonParser(int paramInt)
  {
    this._features = paramInt;
  }

  protected JsonParseException _constructError(String paramString)
  {
    return new JsonParseException(paramString, getCurrentLocation());
  }

  public boolean canUseSchema(FormatSchema paramFormatSchema)
  {
    return false;
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

  public JsonParser configure(Feature paramFeature, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      enableFeature(paramFeature);
      return this;
    }
    disableFeature(paramFeature);
    return this;
  }

  public JsonParser disable(Feature paramFeature)
  {
    this._features &= (0xFFFFFFFF ^ paramFeature.getMask());
    return this;
  }

  public void disableFeature(Feature paramFeature)
  {
    disable(paramFeature);
  }

  public JsonParser enable(Feature paramFeature)
  {
    this._features |= paramFeature.getMask();
    return this;
  }

  public void enableFeature(Feature paramFeature)
  {
    enable(paramFeature);
  }

  public abstract BigInteger getBigIntegerValue()
    throws IOException, JsonParseException;

  public byte[] getBinaryValue()
    throws IOException, JsonParseException
  {
    return getBinaryValue(Base64Variants.getDefaultVariant());
  }

  public abstract byte[] getBinaryValue(Base64Variant paramBase64Variant)
    throws IOException, JsonParseException;

  public boolean getBooleanValue()
    throws IOException, JsonParseException
  {
    if (getCurrentToken() == JsonToken.VALUE_TRUE)
      return true;
    if (getCurrentToken() == JsonToken.VALUE_FALSE)
      return false;
    throw new JsonParseException("Current token (" + this._currToken + ") not of boolean type", getCurrentLocation());
  }

  public byte getByteValue()
    throws IOException, JsonParseException
  {
    int i = getIntValue();
    if ((i < -128) || (i > 127))
      throw _constructError("Numeric value (" + getText() + ") out of range of Java byte");
    return (byte)i;
  }

  public abstract ObjectCodec getCodec();

  public abstract JsonLocation getCurrentLocation();

  public abstract String getCurrentName()
    throws IOException, JsonParseException;

  public JsonToken getCurrentToken()
  {
    return this._currToken;
  }

  public abstract BigDecimal getDecimalValue()
    throws IOException, JsonParseException;

  public abstract double getDoubleValue()
    throws IOException, JsonParseException;

  public Object getEmbeddedObject()
    throws IOException, JsonParseException
  {
    return null;
  }

  public abstract float getFloatValue()
    throws IOException, JsonParseException;

  public Object getInputSource()
  {
    return null;
  }

  public abstract int getIntValue()
    throws IOException, JsonParseException;

  public JsonToken getLastClearedToken()
  {
    return this._lastClearedToken;
  }

  public abstract long getLongValue()
    throws IOException, JsonParseException;

  public abstract NumberType getNumberType()
    throws IOException, JsonParseException;

  public abstract Number getNumberValue()
    throws IOException, JsonParseException;

  public abstract JsonStreamContext getParsingContext();

  public short getShortValue()
    throws IOException, JsonParseException
  {
    int i = getIntValue();
    if ((i < -32768) || (i > 32767))
      throw _constructError("Numeric value (" + getText() + ") out of range of Java short");
    return (short)i;
  }

  public abstract String getText()
    throws IOException, JsonParseException;

  public abstract char[] getTextCharacters()
    throws IOException, JsonParseException;

  public abstract int getTextLength()
    throws IOException, JsonParseException;

  public abstract int getTextOffset()
    throws IOException, JsonParseException;

  public abstract JsonLocation getTokenLocation();

  public boolean getValueAsBoolean()
    throws IOException, JsonParseException
  {
    return getValueAsBoolean(false);
  }

  public boolean getValueAsBoolean(boolean paramBoolean)
    throws IOException, JsonParseException
  {
    return paramBoolean;
  }

  public double getValueAsDouble()
    throws IOException, JsonParseException
  {
    return getValueAsDouble(0.0D);
  }

  public double getValueAsDouble(double paramDouble)
    throws IOException, JsonParseException
  {
    return paramDouble;
  }

  public int getValueAsInt()
    throws IOException, JsonParseException
  {
    return getValueAsInt(0);
  }

  public int getValueAsInt(int paramInt)
    throws IOException, JsonParseException
  {
    return paramInt;
  }

  public long getValueAsLong()
    throws IOException, JsonParseException
  {
    return getValueAsInt(0);
  }

  public long getValueAsLong(long paramLong)
    throws IOException, JsonParseException
  {
    return paramLong;
  }

  public boolean hasCurrentToken()
  {
    return this._currToken != null;
  }

  public boolean hasTextCharacters()
  {
    return false;
  }

  public abstract boolean isClosed();

  public boolean isEnabled(Feature paramFeature)
  {
    return (this._features & paramFeature.getMask()) != 0;
  }

  public boolean isExpectedStartArrayToken()
  {
    return getCurrentToken() == JsonToken.START_ARRAY;
  }

  public final boolean isFeatureEnabled(Feature paramFeature)
  {
    return isEnabled(paramFeature);
  }

  public Boolean nextBooleanValue()
    throws IOException, JsonParseException
  {
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[nextToken().ordinal()])
    {
    default:
      return null;
    case 1:
      return Boolean.TRUE;
    case 2:
    }
    return Boolean.FALSE;
  }

  public boolean nextFieldName(SerializableString paramSerializableString)
    throws IOException, JsonParseException
  {
    return (nextToken() == JsonToken.FIELD_NAME) && (paramSerializableString.getValue().equals(getCurrentName()));
  }

  public int nextIntValue(int paramInt)
    throws IOException, JsonParseException
  {
    if (nextToken() == JsonToken.VALUE_NUMBER_INT)
      paramInt = getIntValue();
    return paramInt;
  }

  public long nextLongValue(long paramLong)
    throws IOException, JsonParseException
  {
    if (nextToken() == JsonToken.VALUE_NUMBER_INT)
      paramLong = getLongValue();
    return paramLong;
  }

  public String nextTextValue()
    throws IOException, JsonParseException
  {
    if (nextToken() == JsonToken.VALUE_STRING)
      return getText();
    return null;
  }

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

  public <T> T readValueAs(TypeReference<?> paramTypeReference)
    throws IOException, JsonProcessingException
  {
    ObjectCodec localObjectCodec = getCodec();
    if (localObjectCodec == null)
      throw new IllegalStateException("No ObjectCodec defined for the parser, can not deserialize JSON into Java objects");
    return localObjectCodec.readValue(this, paramTypeReference);
  }

  public <T> T readValueAs(Class<T> paramClass)
    throws IOException, JsonProcessingException
  {
    ObjectCodec localObjectCodec = getCodec();
    if (localObjectCodec == null)
      throw new IllegalStateException("No ObjectCodec defined for the parser, can not deserialize JSON into Java objects");
    return localObjectCodec.readValue(this, paramClass);
  }

  public JsonNode readValueAsTree()
    throws IOException, JsonProcessingException
  {
    ObjectCodec localObjectCodec = getCodec();
    if (localObjectCodec == null)
      throw new IllegalStateException("No ObjectCodec defined for the parser, can not deserialize JSON into JsonNode tree");
    return localObjectCodec.readTree(this);
  }

  public <T> Iterator<T> readValuesAs(TypeReference<?> paramTypeReference)
    throws IOException, JsonProcessingException
  {
    ObjectCodec localObjectCodec = getCodec();
    if (localObjectCodec == null)
      throw new IllegalStateException("No ObjectCodec defined for the parser, can not deserialize JSON into Java objects");
    return localObjectCodec.readValues(this, paramTypeReference);
  }

  public <T> Iterator<T> readValuesAs(Class<T> paramClass)
    throws IOException, JsonProcessingException
  {
    ObjectCodec localObjectCodec = getCodec();
    if (localObjectCodec == null)
      throw new IllegalStateException("No ObjectCodec defined for the parser, can not deserialize JSON into Java objects");
    return localObjectCodec.readValues(this, paramClass);
  }

  public int releaseBuffered(OutputStream paramOutputStream)
    throws IOException
  {
    return -1;
  }

  public int releaseBuffered(Writer paramWriter)
    throws IOException
  {
    return -1;
  }

  public abstract void setCodec(ObjectCodec paramObjectCodec);

  public void setFeature(Feature paramFeature, boolean paramBoolean)
  {
    configure(paramFeature, paramBoolean);
  }

  public void setSchema(FormatSchema paramFormatSchema)
  {
    throw new UnsupportedOperationException("Parser of type " + getClass().getName() + " does not support schema of type '" + paramFormatSchema.getSchemaType() + "'");
  }

  public abstract JsonParser skipChildren()
    throws IOException, JsonParseException;

  public Version version()
  {
    return Version.unknownVersion();
  }

  public static enum Feature
  {
    final boolean _defaultState;

    static
    {
      ALLOW_COMMENTS = new Feature("ALLOW_COMMENTS", 1, false);
      ALLOW_UNQUOTED_FIELD_NAMES = new Feature("ALLOW_UNQUOTED_FIELD_NAMES", 2, false);
      ALLOW_SINGLE_QUOTES = new Feature("ALLOW_SINGLE_QUOTES", 3, false);
      ALLOW_UNQUOTED_CONTROL_CHARS = new Feature("ALLOW_UNQUOTED_CONTROL_CHARS", 4, false);
      ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER = new Feature("ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER", 5, false);
      ALLOW_NUMERIC_LEADING_ZEROS = new Feature("ALLOW_NUMERIC_LEADING_ZEROS", 6, false);
      ALLOW_NON_NUMERIC_NUMBERS = new Feature("ALLOW_NON_NUMERIC_NUMBERS", 7, false);
      INTERN_FIELD_NAMES = new Feature("INTERN_FIELD_NAMES", 8, true);
      CANONICALIZE_FIELD_NAMES = new Feature("CANONICALIZE_FIELD_NAMES", 9, true);
      Feature[] arrayOfFeature = new Feature[10];
      arrayOfFeature[0] = AUTO_CLOSE_SOURCE;
      arrayOfFeature[1] = ALLOW_COMMENTS;
      arrayOfFeature[2] = ALLOW_UNQUOTED_FIELD_NAMES;
      arrayOfFeature[3] = ALLOW_SINGLE_QUOTES;
      arrayOfFeature[4] = ALLOW_UNQUOTED_CONTROL_CHARS;
      arrayOfFeature[5] = ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER;
      arrayOfFeature[6] = ALLOW_NUMERIC_LEADING_ZEROS;
      arrayOfFeature[7] = ALLOW_NON_NUMERIC_NUMBERS;
      arrayOfFeature[8] = INTERN_FIELD_NAMES;
      arrayOfFeature[9] = CANONICALIZE_FIELD_NAMES;
    }

    private Feature(boolean paramBoolean)
    {
      this._defaultState = paramBoolean;
    }

    public static int collectDefaults()
    {
      int i = 0;
      for (Feature localFeature : values())
        if (localFeature.enabledByDefault())
          i |= localFeature.getMask();
      return i;
    }

    public boolean enabledByDefault()
    {
      return this._defaultState;
    }

    public boolean enabledIn(int paramInt)
    {
      return (paramInt & getMask()) != 0;
    }

    public int getMask()
    {
      return 1 << ordinal();
    }
  }

  public static enum NumberType
  {
    static
    {
      BIG_INTEGER = new NumberType("BIG_INTEGER", 2);
      FLOAT = new NumberType("FLOAT", 3);
      DOUBLE = new NumberType("DOUBLE", 4);
      BIG_DECIMAL = new NumberType("BIG_DECIMAL", 5);
      NumberType[] arrayOfNumberType = new NumberType[6];
      arrayOfNumberType[0] = INT;
      arrayOfNumberType[1] = LONG;
      arrayOfNumberType[2] = BIG_INTEGER;
      arrayOfNumberType[3] = FLOAT;
      arrayOfNumberType[4] = DOUBLE;
      arrayOfNumberType[5] = BIG_DECIMAL;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.JsonParser
 * JD-Core Version:    0.6.2
 */