package com.flurry.org.codehaus.jackson.map.ser;

import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializationConfig;
import com.flurry.org.codehaus.jackson.map.introspect.BasicBeanDescription;
import java.util.List;

public abstract class BeanSerializerModifier
{
  public List<BeanPropertyWriter> changeProperties(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, List<BeanPropertyWriter> paramList)
  {
    return paramList;
  }

  public JsonSerializer<?> modifySerializer(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, JsonSerializer<?> paramJsonSerializer)
  {
    return paramJsonSerializer;
  }

  public List<BeanPropertyWriter> orderProperties(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, List<BeanPropertyWriter> paramList)
  {
    return paramList;
  }

  public BeanSerializerBuilder updateBuilder(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, BeanSerializerBuilder paramBeanSerializerBuilder)
  {
    return paramBeanSerializerBuilder;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.BeanSerializerModifier
 * JD-Core Version:    0.6.2
 */