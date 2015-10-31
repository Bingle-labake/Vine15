package com.flurry.org.codehaus.jackson.map.ser.impl;

import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.ResolvableSerializer;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.util.HashMap;

public final class SerializerCache
{
  private ReadOnlyClassToSerializerMap _readOnlyMap = null;
  private HashMap<TypeKey, JsonSerializer<Object>> _sharedMap = new HashMap(64);

  public void addAndResolveNonTypedSerializer(JavaType paramJavaType, JsonSerializer<Object> paramJsonSerializer, SerializerProvider paramSerializerProvider)
    throws JsonMappingException
  {
    try
    {
      if (this._sharedMap.put(new TypeKey(paramJavaType, false), paramJsonSerializer) == null)
        this._readOnlyMap = null;
      if ((paramJsonSerializer instanceof ResolvableSerializer))
        ((ResolvableSerializer)paramJsonSerializer).resolve(paramSerializerProvider);
      return;
    }
    finally
    {
    }
  }

  public void addAndResolveNonTypedSerializer(Class<?> paramClass, JsonSerializer<Object> paramJsonSerializer, SerializerProvider paramSerializerProvider)
    throws JsonMappingException
  {
    try
    {
      if (this._sharedMap.put(new TypeKey(paramClass, false), paramJsonSerializer) == null)
        this._readOnlyMap = null;
      if ((paramJsonSerializer instanceof ResolvableSerializer))
        ((ResolvableSerializer)paramJsonSerializer).resolve(paramSerializerProvider);
      return;
    }
    finally
    {
    }
  }

  public void addTypedSerializer(JavaType paramJavaType, JsonSerializer<Object> paramJsonSerializer)
  {
    try
    {
      if (this._sharedMap.put(new TypeKey(paramJavaType, true), paramJsonSerializer) == null)
        this._readOnlyMap = null;
      return;
    }
    finally
    {
    }
  }

  public void addTypedSerializer(Class<?> paramClass, JsonSerializer<Object> paramJsonSerializer)
  {
    try
    {
      if (this._sharedMap.put(new TypeKey(paramClass, true), paramJsonSerializer) == null)
        this._readOnlyMap = null;
      return;
    }
    finally
    {
    }
  }

  public void flush()
  {
    try
    {
      this._sharedMap.clear();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public ReadOnlyClassToSerializerMap getReadOnlyLookupMap()
  {
    try
    {
      ReadOnlyClassToSerializerMap localReadOnlyClassToSerializerMap = this._readOnlyMap;
      if (localReadOnlyClassToSerializerMap == null)
      {
        localReadOnlyClassToSerializerMap = ReadOnlyClassToSerializerMap.from(this._sharedMap);
        this._readOnlyMap = localReadOnlyClassToSerializerMap;
      }
      return localReadOnlyClassToSerializerMap.instance();
    }
    finally
    {
    }
  }

  public int size()
  {
    try
    {
      int i = this._sharedMap.size();
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public JsonSerializer<Object> typedValueSerializer(JavaType paramJavaType)
  {
    try
    {
      JsonSerializer localJsonSerializer = (JsonSerializer)this._sharedMap.get(new TypeKey(paramJavaType, true));
      return localJsonSerializer;
    }
    finally
    {
    }
  }

  public JsonSerializer<Object> typedValueSerializer(Class<?> paramClass)
  {
    try
    {
      JsonSerializer localJsonSerializer = (JsonSerializer)this._sharedMap.get(new TypeKey(paramClass, true));
      return localJsonSerializer;
    }
    finally
    {
    }
  }

  public JsonSerializer<Object> untypedValueSerializer(JavaType paramJavaType)
  {
    try
    {
      JsonSerializer localJsonSerializer = (JsonSerializer)this._sharedMap.get(new TypeKey(paramJavaType, false));
      return localJsonSerializer;
    }
    finally
    {
    }
  }

  public JsonSerializer<Object> untypedValueSerializer(Class<?> paramClass)
  {
    try
    {
      JsonSerializer localJsonSerializer = (JsonSerializer)this._sharedMap.get(new TypeKey(paramClass, false));
      return localJsonSerializer;
    }
    finally
    {
    }
  }

  public static final class TypeKey
  {
    protected Class<?> _class;
    protected int _hashCode;
    protected boolean _isTyped;
    protected JavaType _type;

    public TypeKey(JavaType paramJavaType, boolean paramBoolean)
    {
      this._type = paramJavaType;
      this._class = null;
      this._isTyped = paramBoolean;
      this._hashCode = hash(paramJavaType, paramBoolean);
    }

    public TypeKey(Class<?> paramClass, boolean paramBoolean)
    {
      this._class = paramClass;
      this._type = null;
      this._isTyped = paramBoolean;
      this._hashCode = hash(paramClass, paramBoolean);
    }

    private static final int hash(JavaType paramJavaType, boolean paramBoolean)
    {
      int i = -1 + paramJavaType.hashCode();
      if (paramBoolean)
        i--;
      return i;
    }

    private static final int hash(Class<?> paramClass, boolean paramBoolean)
    {
      int i = paramClass.getName().hashCode();
      if (paramBoolean)
        i++;
      return i;
    }

    public final boolean equals(Object paramObject)
    {
      if (paramObject == this);
      TypeKey localTypeKey;
      do
      {
        return true;
        localTypeKey = (TypeKey)paramObject;
        if (localTypeKey._isTyped != this._isTyped)
          break label55;
        if (this._class == null)
          break;
      }
      while (localTypeKey._class == this._class);
      return false;
      return this._type.equals(localTypeKey._type);
      label55: return false;
    }

    public final int hashCode()
    {
      return this._hashCode;
    }

    public void resetTyped(JavaType paramJavaType)
    {
      this._type = paramJavaType;
      this._class = null;
      this._isTyped = true;
      this._hashCode = hash(paramJavaType, true);
    }

    public void resetTyped(Class<?> paramClass)
    {
      this._type = null;
      this._class = paramClass;
      this._isTyped = true;
      this._hashCode = hash(paramClass, true);
    }

    public void resetUntyped(JavaType paramJavaType)
    {
      this._type = paramJavaType;
      this._class = null;
      this._isTyped = false;
      this._hashCode = hash(paramJavaType, false);
    }

    public void resetUntyped(Class<?> paramClass)
    {
      this._type = null;
      this._class = paramClass;
      this._isTyped = false;
      this._hashCode = hash(paramClass, false);
    }

    public final String toString()
    {
      if (this._class != null)
        return "{class: " + this._class.getName() + ", typed? " + this._isTyped + "}";
      return "{type: " + this._type + ", typed? " + this._isTyped + "}";
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.impl.SerializerCache
 * JD-Core Version:    0.6.2
 */