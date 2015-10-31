package com.flurry.org.codehaus.jackson.node;

import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import java.io.IOException;

public final class MissingNode extends BaseJsonNode
{
  private static final MissingNode instance = new MissingNode();

  public static MissingNode getInstance()
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
    return "";
  }

  public JsonToken asToken()
  {
    return JsonToken.NOT_AVAILABLE;
  }

  public boolean equals(Object paramObject)
  {
    return paramObject == this;
  }

  public boolean isMissingNode()
  {
    return true;
  }

  public JsonNode path(int paramInt)
  {
    return this;
  }

  public JsonNode path(String paramString)
  {
    return this;
  }

  public final void serialize(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonProcessingException
  {
    paramJsonGenerator.writeNull();
  }

  public void serializeWithType(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
    throws IOException, JsonProcessingException
  {
    paramJsonGenerator.writeNull();
  }

  public String toString()
  {
    return "";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.node.MissingNode
 * JD-Core Version:    0.6.2
 */