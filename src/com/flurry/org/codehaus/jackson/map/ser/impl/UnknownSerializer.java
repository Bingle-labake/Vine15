package com.flurry.org.codehaus.jackson.map.ser.impl;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.SerializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.ser.std.SerializerBase;
import java.io.IOException;
import java.lang.reflect.Type;

public class UnknownSerializer extends SerializerBase<Object>
{
  public UnknownSerializer()
  {
    super(Object.class);
  }

  protected void failForEmpty(Object paramObject)
    throws JsonMappingException
  {
    throw new JsonMappingException("No serializer found for class " + paramObject.getClass().getName() + " and no properties discovered to create BeanSerializer (to avoid exception, disable SerializationConfig.Feature.FAIL_ON_EMPTY_BEANS) )");
  }

  public JsonNode getSchema(SerializerProvider paramSerializerProvider, Type paramType)
    throws JsonMappingException
  {
    return null;
  }

  public void serialize(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonMappingException
  {
    if (paramSerializerProvider.isEnabled(SerializationConfig.Feature.FAIL_ON_EMPTY_BEANS))
      failForEmpty(paramObject);
    paramJsonGenerator.writeStartObject();
    paramJsonGenerator.writeEndObject();
  }

  public final void serializeWithType(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
    throws IOException, JsonGenerationException
  {
    if (paramSerializerProvider.isEnabled(SerializationConfig.Feature.FAIL_ON_EMPTY_BEANS))
      failForEmpty(paramObject);
    paramTypeSerializer.writeTypePrefixForObject(paramObject, paramJsonGenerator);
    paramTypeSerializer.writeTypeSuffixForObject(paramObject, paramJsonGenerator);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.impl.UnknownSerializer
 * JD-Core Version:    0.6.2
 */