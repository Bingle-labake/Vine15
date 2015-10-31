package com.flurry.org.codehaus.jackson.map.module;

import com.flurry.org.codehaus.jackson.map.BeanDescription;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.deser.ValueInstantiator;
import com.flurry.org.codehaus.jackson.map.deser.ValueInstantiators.Base;
import com.flurry.org.codehaus.jackson.map.type.ClassKey;
import java.util.HashMap;

public class SimpleValueInstantiators extends ValueInstantiators.Base
{
  protected HashMap<ClassKey, ValueInstantiator> _classMappings = new HashMap();

  public SimpleValueInstantiators addValueInstantiator(Class<?> paramClass, ValueInstantiator paramValueInstantiator)
  {
    this._classMappings.put(new ClassKey(paramClass), paramValueInstantiator);
    return this;
  }

  public ValueInstantiator findValueInstantiator(DeserializationConfig paramDeserializationConfig, BeanDescription paramBeanDescription, ValueInstantiator paramValueInstantiator)
  {
    ValueInstantiator localValueInstantiator = (ValueInstantiator)this._classMappings.get(new ClassKey(paramBeanDescription.getBeanClass()));
    if (localValueInstantiator == null)
      return paramValueInstantiator;
    return localValueInstantiator;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.module.SimpleValueInstantiators
 * JD-Core Version:    0.6.2
 */