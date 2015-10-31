package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.map.deser.std.ContainerDeserializerBase;

@Deprecated
public abstract class ContainerDeserializer<T> extends ContainerDeserializerBase<T>
{
  protected ContainerDeserializer(Class<?> paramClass)
  {
    super(paramClass);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.ContainerDeserializer
 * JD-Core Version:    0.6.2
 */