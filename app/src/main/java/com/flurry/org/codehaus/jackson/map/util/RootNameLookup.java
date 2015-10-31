package com.flurry.org.codehaus.jackson.map.util;

import com.flurry.org.codehaus.jackson.io.SerializedString;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.MapperConfig;
import com.flurry.org.codehaus.jackson.map.introspect.BasicBeanDescription;
import com.flurry.org.codehaus.jackson.map.type.ClassKey;
import com.flurry.org.codehaus.jackson.type.JavaType;

public class RootNameLookup
{
  protected LRUMap<ClassKey, SerializedString> _rootNames;

  public SerializedString findRootName(JavaType paramJavaType, MapperConfig<?> paramMapperConfig)
  {
    return findRootName(paramJavaType.getRawClass(), paramMapperConfig);
  }

  public SerializedString findRootName(Class<?> paramClass, MapperConfig<?> paramMapperConfig)
  {
    try
    {
      ClassKey localClassKey = new ClassKey(paramClass);
      SerializedString localSerializedString;
      if (this._rootNames == null)
      {
        this._rootNames = new LRUMap(20, 200);
        BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramMapperConfig.introspectClassAnnotations(paramClass);
        String str = paramMapperConfig.getAnnotationIntrospector().findRootName(localBasicBeanDescription.getClassInfo());
        if (str == null)
          str = paramClass.getSimpleName();
        localSerializedString = new SerializedString(str);
        this._rootNames.put(localClassKey, localSerializedString);
      }
      while (true)
      {
        return localSerializedString;
        localSerializedString = (SerializedString)this._rootNames.get(localClassKey);
        if (localSerializedString == null)
          break;
      }
    }
    finally
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.util.RootNameLookup
 * JD-Core Version:    0.6.2
 */