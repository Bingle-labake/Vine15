package com.flurry.org.codehaus.jackson.map.util;

import com.flurry.org.codehaus.jackson.io.SerializedString;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import java.util.Collection;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.Map;

public final class EnumValues
{
  private final EnumMap<?, SerializedString> _values;

  private EnumValues(Map<Enum<?>, SerializedString> paramMap)
  {
    this._values = new EnumMap(paramMap);
  }

  public static EnumValues construct(Class<Enum<?>> paramClass, AnnotationIntrospector paramAnnotationIntrospector)
  {
    return constructFromName(paramClass, paramAnnotationIntrospector);
  }

  public static EnumValues constructFromName(Class<Enum<?>> paramClass, AnnotationIntrospector paramAnnotationIntrospector)
  {
    Enum[] arrayOfEnum = (Enum[])ClassUtil.findEnumType(paramClass).getEnumConstants();
    if (arrayOfEnum != null)
    {
      HashMap localHashMap = new HashMap();
      int i = arrayOfEnum.length;
      for (int j = 0; j < i; j++)
      {
        Enum localEnum = arrayOfEnum[j];
        localHashMap.put(localEnum, new SerializedString(paramAnnotationIntrospector.findEnumValue(localEnum)));
      }
      return new EnumValues(localHashMap);
    }
    throw new IllegalArgumentException("Can not determine enum constants for Class " + paramClass.getName());
  }

  public static EnumValues constructFromToString(Class<Enum<?>> paramClass, AnnotationIntrospector paramAnnotationIntrospector)
  {
    Enum[] arrayOfEnum = (Enum[])ClassUtil.findEnumType(paramClass).getEnumConstants();
    if (arrayOfEnum != null)
    {
      HashMap localHashMap = new HashMap();
      int i = arrayOfEnum.length;
      for (int j = 0; j < i; j++)
      {
        Enum localEnum = arrayOfEnum[j];
        localHashMap.put(localEnum, new SerializedString(localEnum.toString()));
      }
      return new EnumValues(localHashMap);
    }
    throw new IllegalArgumentException("Can not determine enum constants for Class " + paramClass.getName());
  }

  public SerializedString serializedValueFor(Enum<?> paramEnum)
  {
    return (SerializedString)this._values.get(paramEnum);
  }

  @Deprecated
  public String valueFor(Enum<?> paramEnum)
  {
    SerializedString localSerializedString = (SerializedString)this._values.get(paramEnum);
    if (localSerializedString == null)
      return null;
    return localSerializedString.getValue();
  }

  public Collection<SerializedString> values()
  {
    return this._values.values();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.util.EnumValues
 * JD-Core Version:    0.6.2
 */