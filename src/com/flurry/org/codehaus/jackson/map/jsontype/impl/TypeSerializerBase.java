package com.flurry.org.codehaus.jackson.map.jsontype.impl;

import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.As;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeIdResolver;

public abstract class TypeSerializerBase extends TypeSerializer
{
  protected final TypeIdResolver _idResolver;
  protected final BeanProperty _property;

  protected TypeSerializerBase(TypeIdResolver paramTypeIdResolver, BeanProperty paramBeanProperty)
  {
    this._idResolver = paramTypeIdResolver;
    this._property = paramBeanProperty;
  }

  public String getPropertyName()
  {
    return null;
  }

  public TypeIdResolver getTypeIdResolver()
  {
    return this._idResolver;
  }

  public abstract JsonTypeInfo.As getTypeInclusion();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.jsontype.impl.TypeSerializerBase
 * JD-Core Version:    0.6.2
 */