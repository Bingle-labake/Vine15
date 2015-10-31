package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.ResolvableDeserializer;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.concurrent.atomic.AtomicReference;

public class AtomicReferenceDeserializer extends StdScalarDeserializer<AtomicReference<?>>
  implements ResolvableDeserializer
{
  protected final BeanProperty _property;
  protected final JavaType _referencedType;
  protected JsonDeserializer<?> _valueDeserializer;

  public AtomicReferenceDeserializer(JavaType paramJavaType, BeanProperty paramBeanProperty)
  {
    super(AtomicReference.class);
    this._referencedType = paramJavaType;
    this._property = paramBeanProperty;
  }

  public AtomicReference<?> deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    return new AtomicReference(this._valueDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
  }

  public void resolve(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider)
    throws JsonMappingException
  {
    this._valueDeserializer = paramDeserializerProvider.findValueDeserializer(paramDeserializationConfig, this._referencedType, this._property);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.AtomicReferenceDeserializer
 * JD-Core Version:    0.6.2
 */