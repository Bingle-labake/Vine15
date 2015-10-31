package com.flurry.org.codehaus.jackson.map.jsontype.impl;

import com.flurry.org.codehaus.jackson.map.jsontype.TypeIdResolver;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.type.JavaType;

public abstract class TypeIdResolverBase
  implements TypeIdResolver
{
  protected final JavaType _baseType;
  protected final TypeFactory _typeFactory;

  protected TypeIdResolverBase(JavaType paramJavaType, TypeFactory paramTypeFactory)
  {
    this._baseType = paramJavaType;
    this._typeFactory = paramTypeFactory;
  }

  public String idFromBaseType()
  {
    return idFromValueAndType(null, this._baseType.getRawClass());
  }

  public void init(JavaType paramJavaType)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.jsontype.impl.TypeIdResolverBase
 * JD-Core Version:    0.6.2
 */