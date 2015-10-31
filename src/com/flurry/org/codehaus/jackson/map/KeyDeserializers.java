package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.type.JavaType;

public abstract interface KeyDeserializers
{
  public abstract KeyDeserializer findKeyDeserializer(JavaType paramJavaType, DeserializationConfig paramDeserializationConfig, BeanDescription paramBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.KeyDeserializers
 * JD-Core Version:    0.6.2
 */