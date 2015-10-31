package com.flurry.org.codehaus.jackson.map;

import java.util.HashMap;
import java.util.Map;

public abstract class InjectableValues
{
  public abstract Object findInjectableValue(Object paramObject1, DeserializationContext paramDeserializationContext, BeanProperty paramBeanProperty, Object paramObject2);

  public static class Std extends InjectableValues
  {
    protected final Map<String, Object> _values;

    public Std()
    {
      this(new HashMap());
    }

    public Std(Map<String, Object> paramMap)
    {
      this._values = paramMap;
    }

    public Std addValue(Class<?> paramClass, Object paramObject)
    {
      this._values.put(paramClass.getName(), paramObject);
      return this;
    }

    public Std addValue(String paramString, Object paramObject)
    {
      this._values.put(paramString, paramObject);
      return this;
    }

    public Object findInjectableValue(Object paramObject1, DeserializationContext paramDeserializationContext, BeanProperty paramBeanProperty, Object paramObject2)
    {
      if (!(paramObject1 instanceof String))
      {
        if (paramObject1 == null);
        for (String str2 = "[null]"; ; str2 = paramObject1.getClass().getName())
          throw new IllegalArgumentException("Unrecognized inject value id type (" + str2 + "), expecting String");
      }
      String str1 = (String)paramObject1;
      Object localObject = this._values.get(str1);
      if ((localObject == null) && (!this._values.containsKey(str1)))
        throw new IllegalArgumentException("No injectable id with value '" + str1 + "' found (for property '" + paramBeanProperty.getName() + "')");
      return localObject;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.InjectableValues
 * JD-Core Version:    0.6.2
 */