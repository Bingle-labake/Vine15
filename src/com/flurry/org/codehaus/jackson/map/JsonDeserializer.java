package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import java.io.IOException;

public abstract class JsonDeserializer<T>
{
  public abstract T deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException;

  public T deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, T paramT)
    throws IOException, JsonProcessingException
  {
    throw new UnsupportedOperationException();
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromAny(paramJsonParser, paramDeserializationContext);
  }

  public T getEmptyValue()
  {
    return getNullValue();
  }

  public T getNullValue()
  {
    return null;
  }

  public JsonDeserializer<T> unwrappingDeserializer()
  {
    return this;
  }

  public static abstract class None extends JsonDeserializer<Object>
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.JsonDeserializer
 * JD-Core Version:    0.6.2
 */