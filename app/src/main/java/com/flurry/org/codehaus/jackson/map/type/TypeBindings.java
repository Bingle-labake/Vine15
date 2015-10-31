package com.flurry.org.codehaus.jackson.map.type;

import com.flurry.org.codehaus.jackson.type.JavaType;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;

public class TypeBindings
{
  private static final JavaType[] NO_TYPES = new JavaType[0];
  public static final JavaType UNBOUND = new SimpleType(Object.class);
  protected Map<String, JavaType> _bindings;
  protected final Class<?> _contextClass;
  protected final JavaType _contextType;
  private final TypeBindings _parentBindings;
  protected HashSet<String> _placeholders;
  protected final TypeFactory _typeFactory;

  private TypeBindings(TypeFactory paramTypeFactory, TypeBindings paramTypeBindings, Class<?> paramClass, JavaType paramJavaType)
  {
    this._typeFactory = paramTypeFactory;
    this._parentBindings = paramTypeBindings;
    this._contextClass = paramClass;
    this._contextType = paramJavaType;
  }

  public TypeBindings(TypeFactory paramTypeFactory, JavaType paramJavaType)
  {
    this(paramTypeFactory, null, paramJavaType.getRawClass(), paramJavaType);
  }

  public TypeBindings(TypeFactory paramTypeFactory, Class<?> paramClass)
  {
    this(paramTypeFactory, null, paramClass, null);
  }

  public void _addPlaceholder(String paramString)
  {
    if (this._placeholders == null)
      this._placeholders = new HashSet();
    this._placeholders.add(paramString);
  }

  protected void _resolve()
  {
    _resolveBindings(this._contextClass);
    if (this._contextType != null)
    {
      int i = this._contextType.containedTypeCount();
      if (i > 0)
      {
        if (this._bindings == null)
          this._bindings = new LinkedHashMap();
        for (int j = 0; j < i; j++)
        {
          String str = this._contextType.containedTypeName(j);
          JavaType localJavaType = this._contextType.containedType(j);
          this._bindings.put(str, localJavaType);
        }
      }
    }
    if (this._bindings == null)
      this._bindings = Collections.emptyMap();
  }

  protected void _resolveBindings(Type paramType)
  {
    if (paramType == null)
      return;
    label169: Class localClass1;
    if ((paramType instanceof ParameterizedType))
    {
      ParameterizedType localParameterizedType = (ParameterizedType)paramType;
      Type[] arrayOfType2 = localParameterizedType.getActualTypeArguments();
      if ((arrayOfType2 != null) && (arrayOfType2.length > 0))
      {
        Class localClass2 = (Class)localParameterizedType.getRawType();
        TypeVariable[] arrayOfTypeVariable2 = localClass2.getTypeParameters();
        if (arrayOfTypeVariable2.length != arrayOfType2.length)
          throw new IllegalArgumentException("Strange parametrized type (in class " + localClass2.getName() + "): number of type arguments != number of type parameters (" + arrayOfType2.length + " vs " + arrayOfTypeVariable2.length + ")");
        int m = 0;
        int n = arrayOfType2.length;
        if (m < n)
        {
          String str2 = arrayOfTypeVariable2[m].getName();
          if (this._bindings == null)
          {
            this._bindings = new LinkedHashMap();
            _addPlaceholder(str2);
            this._bindings.put(str2, this._typeFactory._constructType(arrayOfType2[m], this));
          }
          while (true)
          {
            m++;
            break;
            if (!this._bindings.containsKey(str2))
              break label169;
          }
        }
      }
      localClass1 = (Class)localParameterizedType.getRawType();
    }
    TypeVariable[] arrayOfTypeVariable1;
    do
    {
      _resolveBindings(localClass1.getGenericSuperclass());
      Type[] arrayOfType1 = localClass1.getGenericInterfaces();
      int j = arrayOfType1.length;
      for (int k = 0; k < j; k++)
        _resolveBindings(arrayOfType1[k]);
      break;
      if (!(paramType instanceof Class))
        break;
      localClass1 = (Class)paramType;
      _resolveBindings(localClass1.getDeclaringClass());
      arrayOfTypeVariable1 = localClass1.getTypeParameters();
    }
    while ((arrayOfTypeVariable1 == null) || (arrayOfTypeVariable1.length <= 0));
    JavaType localJavaType = this._contextType;
    JavaType[] arrayOfJavaType = null;
    if (localJavaType != null)
    {
      boolean bool = localClass1.isAssignableFrom(this._contextType.getRawClass());
      arrayOfJavaType = null;
      if (bool)
        arrayOfJavaType = this._typeFactory.findTypeParameters(this._contextType, localClass1);
    }
    int i = 0;
    label364: String str1;
    Type localType;
    if (i < arrayOfTypeVariable1.length)
    {
      TypeVariable localTypeVariable = arrayOfTypeVariable1[i];
      str1 = localTypeVariable.getName();
      localType = localTypeVariable.getBounds()[0];
      if (localType != null)
      {
        if (this._bindings != null)
          break label454;
        this._bindings = new LinkedHashMap();
        label420: _addPlaceholder(str1);
        if (arrayOfJavaType == null)
          break label471;
        this._bindings.put(str1, arrayOfJavaType[i]);
      }
    }
    while (true)
    {
      i++;
      break label364;
      break;
      label454: if (!this._bindings.containsKey(str1))
        break label420;
      continue;
      label471: this._bindings.put(str1, this._typeFactory._constructType(localType, this));
    }
  }

  public void addBinding(String paramString, JavaType paramJavaType)
  {
    if ((this._bindings == null) || (this._bindings.size() == 0))
      this._bindings = new LinkedHashMap();
    this._bindings.put(paramString, paramJavaType);
  }

  public TypeBindings childInstance()
  {
    return new TypeBindings(this._typeFactory, this, this._contextClass, this._contextType);
  }

  public JavaType findType(String paramString)
  {
    if (this._bindings == null)
      _resolve();
    JavaType localJavaType = (JavaType)this._bindings.get(paramString);
    if (localJavaType != null)
      return localJavaType;
    if ((this._placeholders != null) && (this._placeholders.contains(paramString)))
      return UNBOUND;
    if (this._parentBindings != null)
      return this._parentBindings.findType(paramString);
    if ((this._contextClass != null) && (this._contextClass.getEnclosingClass() != null) && (!Modifier.isStatic(this._contextClass.getModifiers())))
      return UNBOUND;
    String str;
    if (this._contextClass != null)
      str = this._contextClass.getName();
    while (true)
    {
      throw new IllegalArgumentException("Type variable '" + paramString + "' can not be resolved (with context of class " + str + ")");
      if (this._contextType != null)
        str = this._contextType.toString();
      else
        str = "UNKNOWN";
    }
  }

  public int getBindingCount()
  {
    if (this._bindings == null)
      _resolve();
    return this._bindings.size();
  }

  public JavaType resolveType(Class<?> paramClass)
  {
    return this._typeFactory._constructType(paramClass, this);
  }

  public JavaType resolveType(Type paramType)
  {
    return this._typeFactory._constructType(paramType, this);
  }

  public String toString()
  {
    if (this._bindings == null)
      _resolve();
    StringBuilder localStringBuilder = new StringBuilder("[TypeBindings for ");
    if (this._contextType != null)
      localStringBuilder.append(this._contextType.toString());
    while (true)
    {
      localStringBuilder.append(": ").append(this._bindings).append("]");
      return localStringBuilder.toString();
      localStringBuilder.append(this._contextClass.getName());
    }
  }

  public JavaType[] typesAsArray()
  {
    if (this._bindings == null)
      _resolve();
    if (this._bindings.size() == 0)
      return NO_TYPES;
    return (JavaType[])this._bindings.values().toArray(new JavaType[this._bindings.size()]);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.type.TypeBindings
 * JD-Core Version:    0.6.2
 */