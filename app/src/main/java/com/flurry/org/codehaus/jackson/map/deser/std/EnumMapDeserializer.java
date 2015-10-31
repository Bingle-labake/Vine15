package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.util.EnumResolver;
import java.io.IOException;
import java.util.EnumMap;

public class EnumMapDeserializer extends StdDeserializer<EnumMap<?, ?>>
{
  protected final Class<?> _enumClass;
  protected final JsonDeserializer<Enum<?>> _keyDeserializer;
  protected final JsonDeserializer<Object> _valueDeserializer;

  @Deprecated
  public EnumMapDeserializer(EnumResolver<?> paramEnumResolver, JsonDeserializer<Object> paramJsonDeserializer)
  {
    this(paramEnumResolver.getEnumClass(), new EnumDeserializer(paramEnumResolver), paramJsonDeserializer);
  }

  public EnumMapDeserializer(Class<?> paramClass, JsonDeserializer<?> paramJsonDeserializer, JsonDeserializer<Object> paramJsonDeserializer1)
  {
    super(EnumMap.class);
    this._enumClass = paramClass;
    this._keyDeserializer = paramJsonDeserializer;
    this._valueDeserializer = paramJsonDeserializer1;
  }

  private EnumMap<?, ?> constructMap()
  {
    return new EnumMap(this._enumClass);
  }

  public EnumMap<?, ?> deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (paramJsonParser.getCurrentToken() != JsonToken.START_OBJECT)
      throw paramDeserializationContext.mappingException(EnumMap.class);
    EnumMap localEnumMap = constructMap();
    if (paramJsonParser.nextToken() != JsonToken.END_OBJECT)
    {
      Enum localEnum = (Enum)this._keyDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
      if (localEnum == null)
        throw paramDeserializationContext.weirdStringException(this._enumClass, "value not one of declared Enum instance names");
      if (paramJsonParser.nextToken() == JsonToken.VALUE_NULL);
      for (Object localObject = null; ; localObject = this._valueDeserializer.deserialize(paramJsonParser, paramDeserializationContext))
      {
        localEnumMap.put(localEnum, localObject);
        break;
      }
    }
    return localEnumMap;
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromObject(paramJsonParser, paramDeserializationContext);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.EnumMapDeserializer
 * JD-Core Version:    0.6.2
 */