package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import java.io.IOException;

public abstract class JsonSerializer<T>
{
  public Class<T> handledType()
  {
    return null;
  }

  public boolean isUnwrappingSerializer()
  {
    return false;
  }

  public abstract void serialize(T paramT, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonProcessingException;

  public void serializeWithType(T paramT, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
    throws IOException, JsonProcessingException
  {
    serialize(paramT, paramJsonGenerator, paramSerializerProvider);
  }

  public JsonSerializer<T> unwrappingSerializer()
  {
    return this;
  }

  public static abstract class None extends JsonSerializer<Object>
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.JsonSerializer
 * JD-Core Version:    0.6.2
 */