package com.flurry.org.codehaus.jackson.node;

import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonParser.NumberType;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;

public final class DecimalNode extends NumericNode
{
  protected final BigDecimal _value;

  public DecimalNode(BigDecimal paramBigDecimal)
  {
    this._value = paramBigDecimal;
  }

  public static DecimalNode valueOf(BigDecimal paramBigDecimal)
  {
    return new DecimalNode(paramBigDecimal);
  }

  public String asText()
  {
    return this._value.toString();
  }

  public JsonToken asToken()
  {
    return JsonToken.VALUE_NUMBER_FLOAT;
  }

  public boolean equals(Object paramObject)
  {
    boolean bool;
    if (paramObject == this)
      bool = true;
    Class localClass1;
    Class localClass2;
    do
    {
      do
      {
        return bool;
        bool = false;
      }
      while (paramObject == null);
      localClass1 = paramObject.getClass();
      localClass2 = getClass();
      bool = false;
    }
    while (localClass1 != localClass2);
    return ((DecimalNode)paramObject)._value.equals(this._value);
  }

  public BigInteger getBigIntegerValue()
  {
    return this._value.toBigInteger();
  }

  public BigDecimal getDecimalValue()
  {
    return this._value;
  }

  public double getDoubleValue()
  {
    return this._value.doubleValue();
  }

  public int getIntValue()
  {
    return this._value.intValue();
  }

  public long getLongValue()
  {
    return this._value.longValue();
  }

  public JsonParser.NumberType getNumberType()
  {
    return JsonParser.NumberType.BIG_DECIMAL;
  }

  public Number getNumberValue()
  {
    return this._value;
  }

  public int hashCode()
  {
    return this._value.hashCode();
  }

  public boolean isBigDecimal()
  {
    return true;
  }

  public boolean isFloatingPointNumber()
  {
    return true;
  }

  public final void serialize(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonProcessingException
  {
    paramJsonGenerator.writeNumber(this._value);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.node.DecimalNode
 * JD-Core Version:    0.6.2
 */