package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.type.JavaType;

public abstract class ContainerDeserializerBase<T> extends StdDeserializer<T>
{
  protected ContainerDeserializerBase(Class<?> paramClass)
  {
    super(paramClass);
  }

  public abstract JsonDeserializer<Object> getContentDeserializer();

  public abstract JavaType getContentType();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.ContainerDeserializerBase
 * JD-Core Version:    0.6.2
 */