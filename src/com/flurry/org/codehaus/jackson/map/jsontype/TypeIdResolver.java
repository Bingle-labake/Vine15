package com.flurry.org.codehaus.jackson.map.jsontype;

import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.Id;
import com.flurry.org.codehaus.jackson.type.JavaType;

public abstract interface TypeIdResolver
{
  public abstract JsonTypeInfo.Id getMechanism();

  public abstract String idFromValue(Object paramObject);

  public abstract String idFromValueAndType(Object paramObject, Class<?> paramClass);

  public abstract void init(JavaType paramJavaType);

  public abstract JavaType typeFromId(String paramString);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.jsontype.TypeIdResolver
 * JD-Core Version:    0.6.2
 */