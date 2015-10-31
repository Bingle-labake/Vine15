package com.fasterxml.jackson.core;

import com.fasterxml.jackson.core.type.TypeReference;
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
  private static final int MAX_BYTE_I = 255;
  private static final int MAX_SHORT_I = 32767;
  private static final int MIN_BYTE_I = -128;
  private static final int MIN_SHORT_I = -32768;
  protected int _features;

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

  protected void _reportUnsupportedOperation()
  {
    throw new UnsupportedOperationException("Operation not supported by parser of type " + getClass().getName());
  }

  public boolean canUseSchema(FormatSchema paramFormatSchema)
  {
    return false;
  }

  public abstract void clearCurrentToken();

  public abstract void close()
    throws IOException;

  public JsonParser configure(Feature paramFeature, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      enable(paramFeature);
      return this;
    }
    disable(paramFeature);
    return this;
  }

  public JsonParser disable(Feature paramFeature)
  {
    this._features &= (0xFFFFFFFF ^ paramFeature.getMask());
    return this;
  }

  public JsonParser enable(Feature paramFeature)
  {
    this._features |= paramFeature.getMask();
    return this;
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
    JsonToken localJsonToken = getCurrentToken();
    if (localJsonToken == JsonToken.VALUE_TRUE)
      return true;
    if (localJsonToken == JsonToken.VALUE_FALSE)
      return false;
    throw new JsonParseException("Current token (" + localJsonToken + ") not of boolean type", getCurrentLocation());
  }

  public byte getByteValue()
    throws IOException, JsonParseException
  {
    int i = getIntValue();
    if ((i < -128) || (i > 255))
      throw _constructError("Numeric value (" + getText() + ") out of range of Java byte");
    return (byte)i;
  }

  public abstract ObjectCodec getCodec();

  public abstract JsonLocation getCurrentLocation();

  public abstract String getCurrentName()
    throws IOException, JsonParseException;

  public abstract JsonToken getCurrentToken();

  public abstract BigDecimal getDecimalValue()
    throws IOException, JsonParseException;

  public abstract double getDoubleValue()
    throws IOException, JsonParseException;

  public abstract Object getEmbeddedObject()
    throws IOException, JsonParseException;

  public abstract float getFloatValue()
    throws IOException, JsonParseException;

  public Object getInputSource()
  {
    return null;
  }

  public abstract int getIntValue()
    throws IOException, JsonParseException;

  public abstract JsonToken getLastClearedToken();

  public abstract long getLongValue()
    throws IOException, JsonParseException;

  public abstract NumberType getNumberType()
    throws IOException, JsonParseException;

  public abstract Number getNumberValue()
    throws IOException, JsonParseException;

  public abstract JsonStreamContext getParsingContext();

  public FormatSchema getSchema()
  {
    return null;
  }

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
    return getValueAsLong(0L);
  }

  public long getValueAsLong(long paramLong)
    throws IOException, JsonParseException
  {
    return paramLong;
  }

  public String getValueAsString()
    throws IOException, JsonParseException
  {
    return getValueAsString(null);
  }

  public abstract String getValueAsString(String paramString)
    throws IOException, JsonParseException;

  public abstract boolean hasCurrentToken();

  public abstract boolean hasTextCharacters();

  public abstract boolean isClosed();

  public boolean isEnabled(Feature paramFeature)
  {
    return (this._features & paramFeature.getMask()) != 0;
  }

  public boolean isExpectedStartArrayToken()
  {
    return getCurrentToken() == JsonToken.START_ARRAY;
  }

  public Boolean nextBooleanValue()
    throws IOException, JsonParseException
  {
    switch (1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[nextToken().ordinal()])
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

  public abstract JsonToken nextValue()
    throws IOException, JsonParseException;

  public abstract void overrideCurrentName(String paramString);

  public int readBinaryValue(Base64Variant paramBase64Variant, OutputStream paramOutputStream)
    throws IOException, JsonParseException
  {
    _reportUnsupportedOperation();
    return 0;
  }

  public int readBinaryValue(OutputStream paramOutputStream)
    throws IOException, JsonParseException
  {
    return readBinaryValue(Base64Variants.getDefaultVariant(), paramOutputStream);
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

  public <T extends TreeNode> T readValueAsTree()
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

  public boolean requiresCustomCodec()
  {
    return false;
  }

  public abstract void setCodec(ObjectCodec paramObjectCodec);

  public void setSchema(FormatSchema paramFormatSchema)
  {
    throw new UnsupportedOperationException("Parser of type " + getClass().getName() + " does not support schema of type '" + paramFormatSchema.getSchemaType() + "'");
  }

  public abstract JsonParser skipChildren()
    throws IOException, JsonParseException;

  public abstract Version version();

  public static enum Feature
  {
    private final boolean _defaultState;

    static
    {
      ALLOW_COMMENTS = new Feature("ALLOW_COMMENTS", 1, false);
      ALLOW_UNQUOTED_FIELD_NAMES = new Feature("ALLOW_UNQUOTED_FIELD_NAMES", 2, false);
      ALLOW_SINGLE_QUOTES = new Feature("ALLOW_SINGLE_QUOTES", 3, false);
      ALLOW_UNQUOTED_CONTROL_CHARS = new Feature("ALLOW_UNQUOTED_CONTROL_CHARS", 4, false);
      ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER = new Feature("ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER", 5, false);
      ALLOW_NUMERIC_LEADING_ZEROS = new Feature("ALLOW_NUMERIC_LEADING_ZEROS", 6, false);
      ALLOW_NON_NUMERIC_NUMBERS = new Feature("ALLOW_NON_NUMERIC_NUMBERS", 7, false);
      Feature[] arrayOfFeature = new Feature[8];
      arrayOfFeature[0] = AUTO_CLOSE_SOURCE;
      arrayOfFeature[1] = ALLOW_COMMENTS;
      arrayOfFeature[2] = ALLOW_UNQUOTED_FIELD_NAMES;
      arrayOfFeature[3] = ALLOW_SINGLE_QUOTES;
      arrayOfFeature[4] = ALLOW_UNQUOTED_CONTROL_CHARS;
      arrayOfFeature[5] = ALLOW_BACKSLASH_ESCAPING_ANY_CHARACTER;
      arrayOfFeature[6] = ALLOW_NUMERIC_LEADING_ZEROS;
      arrayOfFeature[7] = ALLOW_NON_NUMERIC_NUMBERS;
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
 * Qualified Name:     com.fasterxml.jackson.core.JsonParser
 * JD-Core Version:    0.6.2
 */