package com.flurry.org.codehaus.jackson.map.jsontype.impl;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.As;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeIdResolver;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;

public class AsWrapperTypeDeserializer extends TypeDeserializerBase
{
  @Deprecated
  public AsWrapperTypeDeserializer(JavaType paramJavaType, TypeIdResolver paramTypeIdResolver, BeanProperty paramBeanProperty)
  {
    this(paramJavaType, paramTypeIdResolver, paramBeanProperty, null);
  }

  public AsWrapperTypeDeserializer(JavaType paramJavaType, TypeIdResolver paramTypeIdResolver, BeanProperty paramBeanProperty, Class<?> paramClass)
  {
    super(paramJavaType, paramTypeIdResolver, paramBeanProperty, null);
  }

  private final Object _deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (paramJsonParser.getCurrentToken() != JsonToken.START_OBJECT)
      throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.START_OBJECT, "need JSON Object to contain As.WRAPPER_OBJECT type information for class " + baseTypeName());
    if (paramJsonParser.nextToken() != JsonToken.FIELD_NAME)
      throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.FIELD_NAME, "need JSON String that contains type id (for subtype of " + baseTypeName() + ")");
    JsonDeserializer localJsonDeserializer = _findDeserializer(paramDeserializationContext, paramJsonParser.getText());
    paramJsonParser.nextToken();
    Object localObject = localJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
    if (paramJsonParser.nextToken() != JsonToken.END_OBJECT)
      throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.END_OBJECT, "expected closing END_OBJECT after type information and deserialized value");
    return localObject;
  }

  public Object deserializeTypedFromAny(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    return _deserialize(paramJsonParser, paramDeserializationContext);
  }

  public Object deserializeTypedFromArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    return _deserialize(paramJsonParser, paramDeserializationContext);
  }

  public Object deserializeTypedFromObject(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    return _deserialize(paramJsonParser, paramDeserializationContext);
  }

  public Object deserializeTypedFromScalar(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    return _deserialize(paramJsonParser, paramDeserializationContext);
  }

  public JsonTypeInfo.As getTypeInclusion()
  {
    return JsonTypeInfo.As.WRAPPER_OBJECT;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.jsontype.impl.AsWrapperTypeDeserializer
 * JD-Core Version:    0.6.2
 */