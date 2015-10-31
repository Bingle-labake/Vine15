package com.flurry.org.codehaus.jackson.node;

import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import java.io.IOException;

public final class POJONode extends ValueNode
{
  protected final Object _value;

  public POJONode(Object paramObject)
  {
    this._value = paramObject;
  }

  public boolean asBoolean(boolean paramBoolean)
  {
    if ((this._value != null) && ((this._value instanceof Boolean)))
      paramBoolean = ((Boolean)this._value).booleanValue();
    return paramBoolean;
  }

  public double asDouble(double paramDouble)
  {
    if ((this._value instanceof Number))
      paramDouble = ((Number)this._value).doubleValue();
    return paramDouble;
  }

  public int asInt(int paramInt)
  {
    if ((this._value instanceof Number))
      paramInt = ((Number)this._value).intValue();
    return paramInt;
  }

  public long asLong(long paramLong)
  {
    if ((this._value instanceof Number))
      paramLong = ((Number)this._value).longValue();
    return paramLong;
  }

  public String asText()
  {
    if (this._value == null)
      return "null";
    return this._value.toString();
  }

  public JsonToken asToken()
  {
    return JsonToken.VALUE_EMBEDDED_OBJECT;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    POJONode localPOJONode;
    do
    {
      return true;
      if (paramObject == null)
        return false;
      if (paramObject.getClass() != getClass())
        return false;
      localPOJONode = (POJONode)paramObject;
      if (this._value != null)
        break;
    }
    while (localPOJONode._value == null);
    return false;
    return this._value.equals(localPOJONode._value);
  }

  public byte[] getBinaryValue()
    throws IOException
  {
    if ((this._value instanceof byte[]))
      return (byte[])this._value;
    return super.getBinaryValue();
  }

  public Object getPojo()
  {
    return this._value;
  }

  public int hashCode()
  {
    return this._value.hashCode();
  }

  public boolean isPojo()
  {
    return true;
  }

  public final void serialize(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonProcessingException
  {
    if (this._value == null)
    {
      paramJsonGenerator.writeNull();
      return;
    }
    paramJsonGenerator.writeObject(this._value);
  }

  public String toString()
  {
    return String.valueOf(this._value);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.node.POJONode
 * JD-Core Version:    0.6.2
 */