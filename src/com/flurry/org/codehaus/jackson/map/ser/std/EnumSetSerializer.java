package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.EnumSet;
import java.util.Iterator;

public class EnumSetSerializer extends AsArraySerializerBase<EnumSet<? extends Enum<?>>>
{
  public EnumSetSerializer(JavaType paramJavaType, BeanProperty paramBeanProperty)
  {
    super(EnumSet.class, paramJavaType, true, null, paramBeanProperty, null);
  }

  public ContainerSerializerBase<?> _withValueTypeSerializer(TypeSerializer paramTypeSerializer)
  {
    return this;
  }

  public void serializeContents(EnumSet<? extends Enum<?>> paramEnumSet, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    JsonSerializer localJsonSerializer = this._elementSerializer;
    Iterator localIterator = paramEnumSet.iterator();
    while (localIterator.hasNext())
    {
      Enum localEnum = (Enum)localIterator.next();
      if (localJsonSerializer == null)
        localJsonSerializer = paramSerializerProvider.findValueSerializer(localEnum.getDeclaringClass(), this._property);
      localJsonSerializer.serialize(localEnum, paramJsonGenerator, paramSerializerProvider);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.EnumSetSerializer
 * JD-Core Version:    0.6.2
 */