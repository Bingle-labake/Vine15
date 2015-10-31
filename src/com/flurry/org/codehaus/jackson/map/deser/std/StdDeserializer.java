package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonParser.NumberType;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.io.NumberInput;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

public abstract class StdDeserializer<T> extends JsonDeserializer<T>
{
  protected final Class<?> _valueClass;

  protected StdDeserializer(JavaType paramJavaType)
  {
    if (paramJavaType == null);
    for (Class localClass = null; ; localClass = paramJavaType.getRawClass())
    {
      this._valueClass = localClass;
      return;
    }
  }

  protected StdDeserializer(Class<?> paramClass)
  {
    this._valueClass = paramClass;
  }

  protected static final double parseDouble(String paramString)
    throws NumberFormatException
  {
    if ("2.2250738585072012e-308".equals(paramString))
      return 2.225073858507201E-308D;
    return Double.parseDouble(paramString);
  }

  protected final Boolean _parseBoolean(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.VALUE_TRUE)
      return Boolean.TRUE;
    if (localJsonToken == JsonToken.VALUE_FALSE)
      return Boolean.FALSE;
    if (localJsonToken == JsonToken.VALUE_NUMBER_INT)
    {
      if (paramJsonParser.getNumberType() == JsonParser.NumberType.INT)
      {
        if (paramJsonParser.getIntValue() == 0)
          return Boolean.FALSE;
        return Boolean.TRUE;
      }
      return Boolean.valueOf(_parseBooleanFromNumber(paramJsonParser, paramDeserializationContext));
    }
    if (localJsonToken == JsonToken.VALUE_NULL)
      return (Boolean)getNullValue();
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      String str = paramJsonParser.getText().trim();
      if ("true".equals(str))
        return Boolean.TRUE;
      if ("false".equals(str))
        return Boolean.FALSE;
      if (str.length() == 0)
        return (Boolean)getEmptyValue();
      throw paramDeserializationContext.weirdStringException(this._valueClass, "only \"true\" or \"false\" recognized");
    }
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected final boolean _parseBooleanFromNumber(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (paramJsonParser.getNumberType() == JsonParser.NumberType.LONG)
    {
      if (paramJsonParser.getLongValue() == 0L);
      for (Boolean localBoolean = Boolean.FALSE; ; localBoolean = Boolean.TRUE)
        return localBoolean.booleanValue();
    }
    String str = paramJsonParser.getText();
    if (("0.0".equals(str)) || ("0".equals(str)))
      return Boolean.FALSE.booleanValue();
    return Boolean.TRUE.booleanValue();
  }

  protected final boolean _parseBooleanPrimitive(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.VALUE_TRUE);
    label65: String str;
    do
    {
      do
      {
        return true;
        if (localJsonToken == JsonToken.VALUE_FALSE)
          return false;
        if (localJsonToken == JsonToken.VALUE_NULL)
          return false;
        if (localJsonToken != JsonToken.VALUE_NUMBER_INT)
          break label65;
        if (paramJsonParser.getNumberType() != JsonParser.NumberType.INT)
          break;
      }
      while (paramJsonParser.getIntValue() != 0);
      return false;
      return _parseBooleanFromNumber(paramJsonParser, paramDeserializationContext);
      if (localJsonToken != JsonToken.VALUE_STRING)
        break;
      str = paramJsonParser.getText().trim();
    }
    while ("true".equals(str));
    if (("false".equals(str)) || (str.length() == 0))
      return Boolean.FALSE.booleanValue();
    throw paramDeserializationContext.weirdStringException(this._valueClass, "only \"true\" or \"false\" recognized");
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected Byte _parseByte(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
      return Byte.valueOf(paramJsonParser.getByteValue());
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      String str = paramJsonParser.getText().trim();
      int i;
      try
      {
        if (str.length() == 0)
          return (Byte)getEmptyValue();
        i = NumberInput.parseInt(str);
        if ((i < -128) || (i > 127))
          throw paramDeserializationContext.weirdStringException(this._valueClass, "overflow, value can not be represented as 8-bit value");
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid Byte value");
      }
      return Byte.valueOf((byte)i);
    }
    if (localJsonToken == JsonToken.VALUE_NULL)
      return (Byte)getNullValue();
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected java.util.Date _parseDate(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.VALUE_NUMBER_INT)
      return new java.util.Date(paramJsonParser.getLongValue());
    if (localJsonToken == JsonToken.VALUE_NULL)
      return (java.util.Date)getNullValue();
    if (localJsonToken == JsonToken.VALUE_STRING)
      try
      {
        String str = paramJsonParser.getText().trim();
        if (str.length() == 0)
          return (java.util.Date)getEmptyValue();
        java.util.Date localDate = paramDeserializationContext.parseDate(str);
        return localDate;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid representation (error: " + localIllegalArgumentException.getMessage() + ")");
      }
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected final Double _parseDouble(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
      return Double.valueOf(paramJsonParser.getDoubleValue());
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      String str = paramJsonParser.getText().trim();
      if (str.length() == 0)
        return (Double)getEmptyValue();
      switch (str.charAt(0))
      {
      default:
      case 'I':
      case 'N':
      case '-':
      }
      try
      {
        do
        {
          do
          {
            do
            {
              Double localDouble = Double.valueOf(parseDouble(str));
              return localDouble;
            }
            while ((!"Infinity".equals(str)) && (!"INF".equals(str)));
            return Double.valueOf((1.0D / 0.0D));
          }
          while (!"NaN".equals(str));
          return Double.valueOf((0.0D / 0.0D));
        }
        while ((!"-Infinity".equals(str)) && (!"-INF".equals(str)));
        return Double.valueOf((-1.0D / 0.0D));
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid Double value");
      }
    }
    if (localJsonToken == JsonToken.VALUE_NULL)
      return (Double)getNullValue();
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected final double _parseDoublePrimitive(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    double d1 = 0.0D;
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
      d1 = paramJsonParser.getDoubleValue();
    do
    {
      String str;
      do
      {
        return d1;
        if (localJsonToken != JsonToken.VALUE_STRING)
          break;
        str = paramJsonParser.getText().trim();
      }
      while (str.length() == 0);
      switch (str.charAt(0))
      {
      default:
      case 'I':
      case 'N':
      case '-':
      }
      try
      {
        do
        {
          do
          {
            do
            {
              double d2 = parseDouble(str);
              return d2;
            }
            while ((!"Infinity".equals(str)) && (!"INF".equals(str)));
            return (1.0D / 0.0D);
          }
          while (!"NaN".equals(str));
          return (0.0D / 0.0D);
        }
        while ((!"-Infinity".equals(str)) && (!"-INF".equals(str)));
        return (-1.0D / 0.0D);
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid double value");
      }
    }
    while (localJsonToken == JsonToken.VALUE_NULL);
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected final Float _parseFloat(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
      return Float.valueOf(paramJsonParser.getFloatValue());
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      String str = paramJsonParser.getText().trim();
      if (str.length() == 0)
        return (Float)getEmptyValue();
      switch (str.charAt(0))
      {
      default:
      case 'I':
      case 'N':
      case '-':
      }
      try
      {
        do
        {
          do
          {
            do
            {
              Float localFloat = Float.valueOf(Float.parseFloat(str));
              return localFloat;
            }
            while ((!"Infinity".equals(str)) && (!"INF".equals(str)));
            return Float.valueOf((1.0F / 1.0F));
          }
          while (!"NaN".equals(str));
          return Float.valueOf((0.0F / 0.0F));
        }
        while ((!"-Infinity".equals(str)) && (!"-INF".equals(str)));
        return Float.valueOf((1.0F / -1.0F));
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid Float value");
      }
    }
    if (localJsonToken == JsonToken.VALUE_NULL)
      return (Float)getNullValue();
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected final float _parseFloatPrimitive(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
    float f1;
    if ((localJsonToken1 == JsonToken.VALUE_NUMBER_INT) || (localJsonToken1 == JsonToken.VALUE_NUMBER_FLOAT))
      f1 = paramJsonParser.getFloatValue();
    JsonToken localJsonToken2;
    do
    {
      String str;
      int i;
      do
      {
        return f1;
        if (localJsonToken1 != JsonToken.VALUE_STRING)
          break;
        str = paramJsonParser.getText().trim();
        i = str.length();
        f1 = 0.0F;
      }
      while (i == 0);
      switch (str.charAt(0))
      {
      default:
      case 'I':
      case 'N':
      case '-':
      }
      try
      {
        do
        {
          do
          {
            do
            {
              float f2 = Float.parseFloat(str);
              return f2;
            }
            while ((!"Infinity".equals(str)) && (!"INF".equals(str)));
            return (1.0F / 1.0F);
          }
          while (!"NaN".equals(str));
          return (0.0F / 0.0F);
        }
        while ((!"-Infinity".equals(str)) && (!"-INF".equals(str)));
        return (1.0F / -1.0F);
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid float value");
      }
      localJsonToken2 = JsonToken.VALUE_NULL;
      f1 = 0.0F;
    }
    while (localJsonToken1 == localJsonToken2);
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken1);
  }

  protected final int _parseIntPrimitive(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
    int i;
    if ((localJsonToken1 == JsonToken.VALUE_NUMBER_INT) || (localJsonToken1 == JsonToken.VALUE_NUMBER_FLOAT))
      i = paramJsonParser.getIntValue();
    label160: JsonToken localJsonToken2;
    do
    {
      String str;
      int j;
      do
      {
        return i;
        if (localJsonToken1 != JsonToken.VALUE_STRING)
          break;
        str = paramJsonParser.getText().trim();
        long l;
        try
        {
          j = str.length();
          if (j <= 9)
            break label160;
          l = Long.parseLong(str);
          if ((l < -2147483648L) || (l > 2147483647L))
            throw paramDeserializationContext.weirdStringException(this._valueClass, "Overflow: numeric value (" + str + ") out of range of int (" + -2147483648 + " - " + 2147483647 + ")");
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid int value");
        }
        return (int)l;
        i = 0;
      }
      while (j == 0);
      int k = NumberInput.parseInt(str);
      return k;
      localJsonToken2 = JsonToken.VALUE_NULL;
      i = 0;
    }
    while (localJsonToken1 == localJsonToken2);
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken1);
  }

  protected final Integer _parseInteger(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
      return Integer.valueOf(paramJsonParser.getIntValue());
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      String str = paramJsonParser.getText().trim();
      int i;
      long l;
      try
      {
        i = str.length();
        if (i <= 9)
          break label166;
        l = Long.parseLong(str);
        if ((l < -2147483648L) || (l > 2147483647L))
          throw paramDeserializationContext.weirdStringException(this._valueClass, "Overflow: numeric value (" + str + ") out of range of Integer (" + -2147483648 + " - " + 2147483647 + ")");
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid Integer value");
      }
      int j = (int)l;
      return Integer.valueOf(j);
      label166: if (i == 0)
        return (Integer)getEmptyValue();
      Integer localInteger = Integer.valueOf(NumberInput.parseInt(str));
      return localInteger;
    }
    if (localJsonToken == JsonToken.VALUE_NULL)
      return (Integer)getNullValue();
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected final Long _parseLong(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
      return Long.valueOf(paramJsonParser.getLongValue());
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      String str = paramJsonParser.getText().trim();
      if (str.length() == 0)
        return (Long)getEmptyValue();
      try
      {
        Long localLong = Long.valueOf(NumberInput.parseLong(str));
        return localLong;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid Long value");
      }
    }
    if (localJsonToken == JsonToken.VALUE_NULL)
      return (Long)getNullValue();
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected final long _parseLongPrimitive(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    long l1 = 0L;
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
      l1 = paramJsonParser.getLongValue();
    do
    {
      String str;
      do
      {
        return l1;
        if (localJsonToken != JsonToken.VALUE_STRING)
          break;
        str = paramJsonParser.getText().trim();
      }
      while (str.length() == 0);
      try
      {
        long l2 = NumberInput.parseLong(str);
        return l2;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid long value");
      }
    }
    while (localJsonToken == JsonToken.VALUE_NULL);
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected Short _parseShort(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
      return Short.valueOf(paramJsonParser.getShortValue());
    if (localJsonToken == JsonToken.VALUE_STRING)
    {
      String str = paramJsonParser.getText().trim();
      int i;
      try
      {
        if (str.length() == 0)
          return (Short)getEmptyValue();
        i = NumberInput.parseInt(str);
        if ((i < -32768) || (i > 32767))
          throw paramDeserializationContext.weirdStringException(this._valueClass, "overflow, value can not be represented as 16-bit value");
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid Short value");
      }
      return Short.valueOf((short)i);
    }
    if (localJsonToken == JsonToken.VALUE_NULL)
      return (Short)getNullValue();
    throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
  }

  protected final short _parseShortPrimitive(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    int i = _parseIntPrimitive(paramJsonParser, paramDeserializationContext);
    if ((i < -32768) || (i > 32767))
      throw paramDeserializationContext.weirdStringException(this._valueClass, "overflow, value can not be represented as 16-bit value");
    return (short)i;
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromAny(paramJsonParser, paramDeserializationContext);
  }

  protected JsonDeserializer<Object> findDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    return paramDeserializerProvider.findValueDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
  }

  public Class<?> getValueClass()
  {
    return this._valueClass;
  }

  public JavaType getValueType()
  {
    return null;
  }

  protected void handleUnknownProperty(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject, String paramString)
    throws IOException, JsonProcessingException
  {
    if (paramObject == null)
      paramObject = getValueClass();
    if (paramDeserializationContext.handleUnknownProperty(paramJsonParser, this, paramObject, paramString))
      return;
    reportUnknownProperty(paramDeserializationContext, paramObject, paramString);
    paramJsonParser.skipChildren();
  }

  protected boolean isDefaultSerializer(JsonDeserializer<?> paramJsonDeserializer)
  {
    return (paramJsonDeserializer != null) && (paramJsonDeserializer.getClass().getAnnotation(JacksonStdImpl.class) != null);
  }

  protected void reportUnknownProperty(DeserializationContext paramDeserializationContext, Object paramObject, String paramString)
    throws IOException, JsonProcessingException
  {
    if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES))
      throw paramDeserializationContext.unknownFieldException(paramObject, paramString);
  }

  @JacksonStdImpl
  public static class BigDecimalDeserializer extends StdScalarDeserializer<BigDecimal>
  {
    public BigDecimalDeserializer()
    {
      super();
    }

    public BigDecimal deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      JsonToken localJsonToken = paramJsonParser.getCurrentToken();
      if ((localJsonToken == JsonToken.VALUE_NUMBER_INT) || (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT))
        return paramJsonParser.getDecimalValue();
      if (localJsonToken == JsonToken.VALUE_STRING)
      {
        String str = paramJsonParser.getText().trim();
        if (str.length() == 0)
          return null;
        try
        {
          BigDecimal localBigDecimal = new BigDecimal(str);
          return localBigDecimal;
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid representation");
        }
      }
      throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
    }
  }

  @JacksonStdImpl
  public static class BigIntegerDeserializer extends StdScalarDeserializer<BigInteger>
  {
    public BigIntegerDeserializer()
    {
      super();
    }

    public BigInteger deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      JsonToken localJsonToken = paramJsonParser.getCurrentToken();
      if (localJsonToken == JsonToken.VALUE_NUMBER_INT)
        switch (StdDeserializer.1.$SwitchMap$org$codehaus$jackson$JsonParser$NumberType[paramJsonParser.getNumberType().ordinal()])
        {
        default:
        case 1:
        case 2:
        }
      String str;
      do
      {
        str = paramJsonParser.getText().trim();
        if (str.length() != 0)
          break;
        return null;
        return BigInteger.valueOf(paramJsonParser.getLongValue());
        if (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT)
          return paramJsonParser.getDecimalValue().toBigInteger();
      }
      while (localJsonToken == JsonToken.VALUE_STRING);
      throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
      try
      {
        BigInteger localBigInteger = new BigInteger(str);
        return localBigInteger;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
      }
      throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid representation");
    }
  }

  @JacksonStdImpl
  public static final class BooleanDeserializer extends StdDeserializer.PrimitiveOrWrapperDeserializer<Boolean>
  {
    public BooleanDeserializer(Class<Boolean> paramClass, Boolean paramBoolean)
    {
      super(paramBoolean);
    }

    public Boolean deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      return _parseBoolean(paramJsonParser, paramDeserializationContext);
    }

    public Boolean deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
      throws IOException, JsonProcessingException
    {
      return _parseBoolean(paramJsonParser, paramDeserializationContext);
    }
  }

  @JacksonStdImpl
  public static final class ByteDeserializer extends StdDeserializer.PrimitiveOrWrapperDeserializer<Byte>
  {
    public ByteDeserializer(Class<Byte> paramClass, Byte paramByte)
    {
      super(paramByte);
    }

    public Byte deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      return _parseByte(paramJsonParser, paramDeserializationContext);
    }
  }

  @JacksonStdImpl
  public static final class CharacterDeserializer extends StdDeserializer.PrimitiveOrWrapperDeserializer<Character>
  {
    public CharacterDeserializer(Class<Character> paramClass, Character paramCharacter)
    {
      super(paramCharacter);
    }

    public Character deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      JsonToken localJsonToken = paramJsonParser.getCurrentToken();
      if (localJsonToken == JsonToken.VALUE_NUMBER_INT)
      {
        int i = paramJsonParser.getIntValue();
        if ((i >= 0) && (i <= 65535))
          return Character.valueOf((char)i);
      }
      else if (localJsonToken == JsonToken.VALUE_STRING)
      {
        String str = paramJsonParser.getText();
        if (str.length() == 1)
          return Character.valueOf(str.charAt(0));
        if (str.length() == 0)
          return (Character)getEmptyValue();
      }
      throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
    }
  }

  @JacksonStdImpl
  public static final class DoubleDeserializer extends StdDeserializer.PrimitiveOrWrapperDeserializer<Double>
  {
    public DoubleDeserializer(Class<Double> paramClass, Double paramDouble)
    {
      super(paramDouble);
    }

    public Double deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      return _parseDouble(paramJsonParser, paramDeserializationContext);
    }

    public Double deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
      throws IOException, JsonProcessingException
    {
      return _parseDouble(paramJsonParser, paramDeserializationContext);
    }
  }

  @JacksonStdImpl
  public static final class FloatDeserializer extends StdDeserializer.PrimitiveOrWrapperDeserializer<Float>
  {
    public FloatDeserializer(Class<Float> paramClass, Float paramFloat)
    {
      super(paramFloat);
    }

    public Float deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      return _parseFloat(paramJsonParser, paramDeserializationContext);
    }
  }

  @JacksonStdImpl
  public static final class IntegerDeserializer extends StdDeserializer.PrimitiveOrWrapperDeserializer<Integer>
  {
    public IntegerDeserializer(Class<Integer> paramClass, Integer paramInteger)
    {
      super(paramInteger);
    }

    public Integer deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      return _parseInteger(paramJsonParser, paramDeserializationContext);
    }

    public Integer deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
      throws IOException, JsonProcessingException
    {
      return _parseInteger(paramJsonParser, paramDeserializationContext);
    }
  }

  @JacksonStdImpl
  public static final class LongDeserializer extends StdDeserializer.PrimitiveOrWrapperDeserializer<Long>
  {
    public LongDeserializer(Class<Long> paramClass, Long paramLong)
    {
      super(paramLong);
    }

    public Long deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      return _parseLong(paramJsonParser, paramDeserializationContext);
    }
  }

  @JacksonStdImpl
  public static final class NumberDeserializer extends StdScalarDeserializer<Number>
  {
    public NumberDeserializer()
    {
      super();
    }

    public Number deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      JsonToken localJsonToken = paramJsonParser.getCurrentToken();
      if (localJsonToken == JsonToken.VALUE_NUMBER_INT)
      {
        if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_INTEGER_FOR_INTS))
          return paramJsonParser.getBigIntegerValue();
        return paramJsonParser.getNumberValue();
      }
      if (localJsonToken == JsonToken.VALUE_NUMBER_FLOAT)
      {
        if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_DECIMAL_FOR_FLOATS))
          return paramJsonParser.getDecimalValue();
        return Double.valueOf(paramJsonParser.getDoubleValue());
      }
      if (localJsonToken == JsonToken.VALUE_STRING)
      {
        String str = paramJsonParser.getText().trim();
        try
        {
          if (str.indexOf('.') < 0)
            break label135;
          if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_DECIMAL_FOR_FLOATS))
          {
            BigDecimal localBigDecimal = new BigDecimal(str);
            return localBigDecimal;
          }
        }
        catch (IllegalArgumentException localIllegalArgumentException)
        {
          throw paramDeserializationContext.weirdStringException(this._valueClass, "not a valid number");
        }
        return new Double(str);
        label135: if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_INTEGER_FOR_INTS))
          return new BigInteger(str);
        long l = Long.parseLong(str);
        if ((l <= 2147483647L) && (l >= -2147483648L))
          return Integer.valueOf((int)l);
        Long localLong = Long.valueOf(l);
        return localLong;
      }
      throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken);
    }

    public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
      throws IOException, JsonProcessingException
    {
      switch (StdDeserializer.1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
      {
      default:
        return paramTypeDeserializer.deserializeTypedFromScalar(paramJsonParser, paramDeserializationContext);
      case 1:
      case 2:
      case 3:
      }
      return deserialize(paramJsonParser, paramDeserializationContext);
    }
  }

  protected static abstract class PrimitiveOrWrapperDeserializer<T> extends StdScalarDeserializer<T>
  {
    final T _nullValue;

    protected PrimitiveOrWrapperDeserializer(Class<T> paramClass, T paramT)
    {
      super();
      this._nullValue = paramT;
    }

    public final T getNullValue()
    {
      return this._nullValue;
    }
  }

  @JacksonStdImpl
  public static final class ShortDeserializer extends StdDeserializer.PrimitiveOrWrapperDeserializer<Short>
  {
    public ShortDeserializer(Class<Short> paramClass, Short paramShort)
    {
      super(paramShort);
    }

    public Short deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      return _parseShort(paramJsonParser, paramDeserializationContext);
    }
  }

  public static class SqlDateDeserializer extends StdScalarDeserializer<java.sql.Date>
  {
    public SqlDateDeserializer()
    {
      super();
    }

    public java.sql.Date deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      java.util.Date localDate = _parseDate(paramJsonParser, paramDeserializationContext);
      if (localDate == null)
        return null;
      return new java.sql.Date(localDate.getTime());
    }
  }

  public static class StackTraceElementDeserializer extends StdScalarDeserializer<StackTraceElement>
  {
    public StackTraceElementDeserializer()
    {
      super();
    }

    public StackTraceElement deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
      if (localJsonToken1 == JsonToken.START_OBJECT)
      {
        String str1 = "";
        String str2 = "";
        String str3 = "";
        int i = -1;
        while (true)
        {
          JsonToken localJsonToken2 = paramJsonParser.nextValue();
          if (localJsonToken2 == JsonToken.END_OBJECT)
            break;
          String str4 = paramJsonParser.getCurrentName();
          if ("className".equals(str4))
            str1 = paramJsonParser.getText();
          else if ("fileName".equals(str4))
            str3 = paramJsonParser.getText();
          else if ("lineNumber".equals(str4))
          {
            if (localJsonToken2.isNumeric())
              i = paramJsonParser.getIntValue();
            else
              throw JsonMappingException.from(paramJsonParser, "Non-numeric token (" + localJsonToken2 + ") for property 'lineNumber'");
          }
          else if ("methodName".equals(str4))
            str2 = paramJsonParser.getText();
          else if (!"nativeMethod".equals(str4))
            handleUnknownProperty(paramJsonParser, paramDeserializationContext, this._valueClass, str4);
        }
        return new StackTraceElement(str1, str2, str3, i);
      }
      throw paramDeserializationContext.mappingException(this._valueClass, localJsonToken1);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer
 * JD-Core Version:    0.6.2
 */