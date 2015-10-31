package com.flurry.org.codehaus.jackson.node;

import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import java.io.IOException;

public final class NullNode extends ValueNode
{
  public static final NullNode instance = new NullNode();

  public static NullNode getInstance()
  {
    return instance;
  }

  public double asDouble(double paramDouble)
  {
    return 0.0D;
  }

  public int asInt(int paramInt)
  {
    return 0;
  }

  public long asLong(long paramLong)
  {
    return 0L;
  }

  public String asText()
  {
    return "null";
  }

  public JsonToken asToken()
  {
    return JsonToken.VALUE_NULL;
  }

  public boolean equals(Object paramObject)
  {
    return paramObject == this;
  }

  public boolean isNull()
  {
    return true;
  }

  public final void serialize(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonProcessingException
  {
    paramJsonGenerator.writeNull();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.node.NullNode
 * JD-Core Version:    0.6.2
 */