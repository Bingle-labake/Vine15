package com.flurry.org.codehaus.jackson.map.type;

import com.flurry.org.codehaus.jackson.type.JavaType;
import java.util.Collection;
import java.util.Map;

public final class SimpleType extends TypeBase
{
  protected final String[] _typeNames;
  protected final JavaType[] _typeParameters;

  protected SimpleType(Class<?> paramClass)
  {
    this(paramClass, null, null, null, null);
  }

  @Deprecated
  protected SimpleType(Class<?> paramClass, String[] paramArrayOfString, JavaType[] paramArrayOfJavaType)
  {
    this(paramClass, paramArrayOfString, paramArrayOfJavaType, null, null);
  }

  protected SimpleType(Class<?> paramClass, String[] paramArrayOfString, JavaType[] paramArrayOfJavaType, Object paramObject1, Object paramObject2)
  {
    super(paramClass, 0, paramObject1, paramObject2);
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0))
    {
      this._typeNames = null;
      this._typeParameters = null;
      return;
    }
    this._typeNames = paramArrayOfString;
    this._typeParameters = paramArrayOfJavaType;
  }

  public static SimpleType construct(Class<?> paramClass)
  {
    if (Map.class.isAssignableFrom(paramClass))
      throw new IllegalArgumentException("Can not construct SimpleType for a Map (class: " + paramClass.getName() + ")");
    if (Collection.class.isAssignableFrom(paramClass))
      throw new IllegalArgumentException("Can not construct SimpleType for a Collection (class: " + paramClass.getName() + ")");
    if (paramClass.isArray())
      throw new IllegalArgumentException("Can not construct SimpleType for an array (class: " + paramClass.getName() + ")");
    return new SimpleType(paramClass);
  }

  public static SimpleType constructUnsafe(Class<?> paramClass)
  {
    return new SimpleType(paramClass, null, null, null, null);
  }

  protected JavaType _narrow(Class<?> paramClass)
  {
    return new SimpleType(paramClass, this._typeNames, this._typeParameters, this._valueHandler, this._typeHandler);
  }

  protected String buildCanonicalName()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(this._class.getName());
    if ((this._typeParameters != null) && (this._typeParameters.length > 0))
    {
      localStringBuilder.append('<');
      int i = 1;
      JavaType[] arrayOfJavaType = this._typeParameters;
      int j = arrayOfJavaType.length;
      int k = 0;
      if (k < j)
      {
        JavaType localJavaType = arrayOfJavaType[k];
        if (i != 0)
          i = 0;
        while (true)
        {
          localStringBuilder.append(localJavaType.toCanonical());
          k++;
          break;
          localStringBuilder.append(',');
        }
      }
      localStringBuilder.append('>');
    }
    return localStringBuilder.toString();
  }

  public JavaType containedType(int paramInt)
  {
    if ((paramInt < 0) || (this._typeParameters == null) || (paramInt >= this._typeParameters.length))
      return null;
    return this._typeParameters[paramInt];
  }

  public int containedTypeCount()
  {
    if (this._typeParameters == null)
      return 0;
    return this._typeParameters.length;
  }

  public String containedTypeName(int paramInt)
  {
    if ((paramInt < 0) || (this._typeNames == null) || (paramInt >= this._typeNames.length))
      return null;
    return this._typeNames[paramInt];
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1;
    if (paramObject == this)
      bool1 = true;
    JavaType[] arrayOfJavaType1;
    JavaType[] arrayOfJavaType2;
    label99: int i;
    int j;
    do
    {
      do
      {
        int n;
        do
        {
          SimpleType localSimpleType;
          Class localClass3;
          Class localClass4;
          do
          {
            Class localClass1;
            Class localClass2;
            do
            {
              do
              {
                return bool1;
                bool1 = false;
              }
              while (paramObject == null);
              localClass1 = paramObject.getClass();
              localClass2 = getClass();
              bool1 = false;
            }
            while (localClass1 != localClass2);
            localSimpleType = (SimpleType)paramObject;
            localClass3 = localSimpleType._class;
            localClass4 = this._class;
            bool1 = false;
          }
          while (localClass3 != localClass4);
          arrayOfJavaType1 = this._typeParameters;
          arrayOfJavaType2 = localSimpleType._typeParameters;
          if (arrayOfJavaType1 != null)
            break label99;
          if (arrayOfJavaType2 == null)
            break;
          n = arrayOfJavaType2.length;
          bool1 = false;
        }
        while (n != 0);
        return true;
        bool1 = false;
      }
      while (arrayOfJavaType2 == null);
      i = arrayOfJavaType1.length;
      j = arrayOfJavaType2.length;
      bool1 = false;
    }
    while (i != j);
    int k = 0;
    int m = arrayOfJavaType1.length;
    while (true)
    {
      if (k >= m)
        break label168;
      boolean bool2 = arrayOfJavaType1[k].equals(arrayOfJavaType2[k]);
      bool1 = false;
      if (!bool2)
        break;
      k++;
    }
    label168: return true;
  }

  public StringBuilder getErasedSignature(StringBuilder paramStringBuilder)
  {
    return _classSignature(this._class, paramStringBuilder, true);
  }

  public StringBuilder getGenericSignature(StringBuilder paramStringBuilder)
  {
    _classSignature(this._class, paramStringBuilder, false);
    if (this._typeParameters != null)
    {
      paramStringBuilder.append('<');
      JavaType[] arrayOfJavaType = this._typeParameters;
      int i = arrayOfJavaType.length;
      for (int j = 0; j < i; j++)
        paramStringBuilder = arrayOfJavaType[j].getGenericSignature(paramStringBuilder);
      paramStringBuilder.append('>');
    }
    paramStringBuilder.append(';');
    return paramStringBuilder;
  }

  public boolean isContainerType()
  {
    return false;
  }

  public JavaType narrowContentsBy(Class<?> paramClass)
  {
    throw new IllegalArgumentException("Internal error: SimpleType.narrowContentsBy() should never be called");
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder(40);
    localStringBuilder.append("[simple type, class ").append(buildCanonicalName()).append(']');
    return localStringBuilder.toString();
  }

  public JavaType widenContentsBy(Class<?> paramClass)
  {
    throw new IllegalArgumentException("Internal error: SimpleType.widenContentsBy() should never be called");
  }

  public JavaType withContentTypeHandler(Object paramObject)
  {
    throw new IllegalArgumentException("Simple types have no content types; can not call withContenTypeHandler()");
  }

  public SimpleType withContentValueHandler(Object paramObject)
  {
    throw new IllegalArgumentException("Simple types have no content types; can not call withContenValueHandler()");
  }

  public SimpleType withTypeHandler(Object paramObject)
  {
    return new SimpleType(this._class, this._typeNames, this._typeParameters, this._valueHandler, paramObject);
  }

  public SimpleType withValueHandler(Object paramObject)
  {
    if (paramObject == this._valueHandler)
      return this;
    return new SimpleType(this._class, this._typeNames, this._typeParameters, paramObject, this._typeHandler);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.type.SimpleType
 * JD-Core Version:    0.6.2
 */