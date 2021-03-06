package com.flurry.org.codehaus.jackson.node;

import com.flurry.org.codehaus.jackson.JsonParser.NumberType;
import java.math.BigDecimal;
import java.math.BigInteger;

public abstract class NumericNode extends ValueNode
{
  public double asDouble()
  {
    return getDoubleValue();
  }

  public double asDouble(double paramDouble)
  {
    return getDoubleValue();
  }

  public int asInt()
  {
    return getIntValue();
  }

  public int asInt(int paramInt)
  {
    return getIntValue();
  }

  public long asLong()
  {
    return getLongValue();
  }

  public long asLong(long paramLong)
  {
    return getLongValue();
  }

  public abstract String asText();

  public abstract BigInteger getBigIntegerValue();

  public abstract BigDecimal getDecimalValue();

  public abstract double getDoubleValue();

  public abstract int getIntValue();

  public abstract long getLongValue();

  public abstract JsonParser.NumberType getNumberType();

  public abstract Number getNumberValue();

  public final boolean isNumber()
  {
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.node.NumericNode
 * JD-Core Version:    0.6.2
 */