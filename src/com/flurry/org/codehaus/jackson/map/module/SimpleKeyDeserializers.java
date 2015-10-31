package com.flurry.org.codehaus.jackson.map.module;

import com.flurry.org.codehaus.jackson.map.BeanDescription;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.KeyDeserializer;
import com.flurry.org.codehaus.jackson.map.KeyDeserializers;
import com.flurry.org.codehaus.jackson.map.type.ClassKey;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.util.HashMap;

public class SimpleKeyDeserializers
  implements KeyDeserializers
{
  protected HashMap<ClassKey, KeyDeserializer> _classMappings = null;

  public SimpleKeyDeserializers addDeserializer(Class<?> paramClass, KeyDeserializer paramKeyDeserializer)
  {
    if (this._classMappings == null)
      this._classMappings = new HashMap();
    this._classMappings.put(new ClassKey(paramClass), paramKeyDeserializer);
    return this;
  }

  public KeyDeserializer findKeyDeserializer(JavaType paramJavaType, DeserializationConfig paramDeserializationConfig, BeanDescription paramBeanDescription, BeanProperty paramBeanProperty)
  {
    if (this._classMappings == null)
      return null;
    return (KeyDeserializer)this._classMappings.get(new ClassKey(paramJavaType.getRawClass()));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.module.SimpleKeyDeserializers
 * JD-Core Version:    0.6.2
 */