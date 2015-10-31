package com.flurry.org.codehaus.jackson.map.ser;

import com.flurry.org.codehaus.jackson.type.JavaType;

@Deprecated
public abstract class SerializerBase<T> extends com.flurry.org.codehaus.jackson.map.ser.std.SerializerBase<T>
{
  protected SerializerBase(JavaType paramJavaType)
  {
    super(paramJavaType);
  }

  protected SerializerBase(Class<T> paramClass)
  {
    super(paramClass);
  }

  protected SerializerBase(Class<?> paramClass, boolean paramBoolean)
  {
    super(paramClass, paramBoolean);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.SerializerBase
 * JD-Core Version:    0.6.2
 */