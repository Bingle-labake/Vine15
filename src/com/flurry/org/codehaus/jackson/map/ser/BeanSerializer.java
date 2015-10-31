package com.flurry.org.codehaus.jackson.map.ser;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.ser.impl.UnwrappingBeanSerializer;
import com.flurry.org.codehaus.jackson.map.ser.std.BeanSerializerBase;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;

public class BeanSerializer extends BeanSerializerBase
{
  protected BeanSerializer(BeanSerializer paramBeanSerializer)
  {
    super(paramBeanSerializer);
  }

  protected BeanSerializer(BeanSerializerBase paramBeanSerializerBase)
  {
    super(paramBeanSerializerBase);
  }

  public BeanSerializer(JavaType paramJavaType, BeanPropertyWriter[] paramArrayOfBeanPropertyWriter1, BeanPropertyWriter[] paramArrayOfBeanPropertyWriter2, AnyGetterWriter paramAnyGetterWriter, Object paramObject)
  {
    super(paramJavaType, paramArrayOfBeanPropertyWriter1, paramArrayOfBeanPropertyWriter2, paramAnyGetterWriter, paramObject);
  }

  public BeanSerializer(Class<?> paramClass, BeanPropertyWriter[] paramArrayOfBeanPropertyWriter1, BeanPropertyWriter[] paramArrayOfBeanPropertyWriter2, AnyGetterWriter paramAnyGetterWriter, Object paramObject)
  {
    super(paramClass, paramArrayOfBeanPropertyWriter1, paramArrayOfBeanPropertyWriter2, paramAnyGetterWriter, paramObject);
  }

  public static BeanSerializer createDummy(Class<?> paramClass)
  {
    return new BeanSerializer(paramClass, NO_PROPS, null, null, null);
  }

  public final void serialize(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    paramJsonGenerator.writeStartObject();
    if (this._propertyFilterId != null)
      serializeFieldsFiltered(paramObject, paramJsonGenerator, paramSerializerProvider);
    while (true)
    {
      paramJsonGenerator.writeEndObject();
      return;
      serializeFields(paramObject, paramJsonGenerator, paramSerializerProvider);
    }
  }

  public String toString()
  {
    return "BeanSerializer for " + handledType().getName();
  }

  public JsonSerializer<Object> unwrappingSerializer()
  {
    return new UnwrappingBeanSerializer(this);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.BeanSerializer
 * JD-Core Version:    0.6.2
 */