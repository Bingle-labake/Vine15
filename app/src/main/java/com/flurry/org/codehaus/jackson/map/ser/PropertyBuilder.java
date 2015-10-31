package com.flurry.org.codehaus.jackson.map.ser;

import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializationConfig;
import com.flurry.org.codehaus.jackson.map.SerializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import com.flurry.org.codehaus.jackson.map.annotate.JsonSerialize.Typing;
import com.flurry.org.codehaus.jackson.map.introspect.Annotated;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedClass;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedField;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMember;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMethod;
import com.flurry.org.codehaus.jackson.map.introspect.BasicBeanDescription;
import com.flurry.org.codehaus.jackson.map.util.Annotations;
import com.flurry.org.codehaus.jackson.map.util.Comparators;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Map;

public class PropertyBuilder
{
  protected final AnnotationIntrospector _annotationIntrospector;
  protected final BasicBeanDescription _beanDesc;
  protected final SerializationConfig _config;
  protected Object _defaultBean;
  protected final JsonSerialize.Inclusion _outputProps;

  public PropertyBuilder(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription)
  {
    this._config = paramSerializationConfig;
    this._beanDesc = paramBasicBeanDescription;
    this._outputProps = paramBasicBeanDescription.findSerializationInclusion(paramSerializationConfig.getSerializationInclusion());
    this._annotationIntrospector = this._config.getAnnotationIntrospector();
  }

  protected Object _throwWrapped(Exception paramException, String paramString, Object paramObject)
  {
    for (Object localObject = paramException; ((Throwable)localObject).getCause() != null; localObject = ((Throwable)localObject).getCause());
    if ((localObject instanceof Error))
      throw ((Error)localObject);
    if ((localObject instanceof RuntimeException))
      throw ((RuntimeException)localObject);
    throw new IllegalArgumentException("Failed to get property '" + paramString + "' of default " + paramObject.getClass().getName() + " instance");
  }

  protected BeanPropertyWriter buildWriter(String paramString, JavaType paramJavaType, JsonSerializer<Object> paramJsonSerializer, TypeSerializer paramTypeSerializer1, TypeSerializer paramTypeSerializer2, AnnotatedMember paramAnnotatedMember, boolean paramBoolean)
  {
    Method localMethod;
    if ((paramAnnotatedMember instanceof AnnotatedField))
      localMethod = null;
    for (Field localField = ((AnnotatedField)paramAnnotatedMember).getAnnotated(); ; localField = null)
    {
      localJavaType = findSerializationType(paramAnnotatedMember, paramBoolean, paramJavaType);
      if (paramTypeSerializer2 == null)
        break label141;
      if (localJavaType == null)
        localJavaType = paramJavaType;
      if (localJavaType.getContentType() != null)
        break;
      throw new IllegalStateException("Problem trying to create BeanPropertyWriter for property '" + paramString + "' (of type " + this._beanDesc.getType() + "); serialization type " + localJavaType + " has no content");
      localMethod = ((AnnotatedMethod)paramAnnotatedMember).getAnnotated();
    }
    JavaType localJavaType = localJavaType.withContentTypeHandler(paramTypeSerializer2);
    localJavaType.getContentType();
    label141: JsonSerialize.Inclusion localInclusion = this._annotationIntrospector.findSerializationInclusion(paramAnnotatedMember, this._outputProps);
    boolean bool1 = false;
    Object localObject = null;
    if (localInclusion != null)
    {
      int i = 1.$SwitchMap$org$codehaus$jackson$map$annotate$JsonSerialize$Inclusion[localInclusion.ordinal()];
      localObject = null;
      bool1 = false;
      switch (i)
      {
      default:
      case 1:
      case 2:
      case 3:
      case 4:
      }
    }
    while (true)
    {
      BeanPropertyWriter localBeanPropertyWriter = new BeanPropertyWriter(paramAnnotatedMember, this._beanDesc.getClassAnnotations(), paramString, paramJavaType, paramJsonSerializer, paramTypeSerializer1, localJavaType, localMethod, localField, bool1, localObject);
      Boolean localBoolean = this._annotationIntrospector.shouldUnwrapProperty(paramAnnotatedMember);
      if ((localBoolean != null) && (localBoolean.booleanValue()))
        localBeanPropertyWriter = localBeanPropertyWriter.unwrappingWriter();
      return localBeanPropertyWriter;
      localObject = getDefaultValue(paramString, localMethod, localField);
      if (localObject == null)
      {
        bool1 = true;
      }
      else
      {
        boolean bool3 = localObject.getClass().isArray();
        bool1 = false;
        if (bool3)
        {
          localObject = Comparators.getArrayComparator(localObject);
          bool1 = false;
          continue;
          bool1 = true;
          localObject = getEmptyValueChecker(paramString, paramJavaType);
          continue;
          bool1 = true;
          boolean bool2 = paramJavaType.isContainerType();
          localObject = null;
          if (bool2)
            localObject = getContainerValueChecker(paramString, paramJavaType);
        }
      }
    }
  }

  protected JavaType findSerializationType(Annotated paramAnnotated, boolean paramBoolean, JavaType paramJavaType)
  {
    Class localClass1 = this._annotationIntrospector.findSerializationType(paramAnnotated);
    Class localClass2;
    if (localClass1 != null)
    {
      localClass2 = paramJavaType.getRawClass();
      if (localClass1.isAssignableFrom(localClass2))
      {
        paramJavaType = paramJavaType.widenBy(localClass1);
        paramBoolean = true;
      }
    }
    else
    {
      JavaType localJavaType = BeanSerializerFactory.modifySecondaryTypesByAnnotation(this._config, paramAnnotated, paramJavaType);
      if (localJavaType != paramJavaType)
      {
        paramBoolean = true;
        paramJavaType = localJavaType;
      }
      if (!paramBoolean)
      {
        JsonSerialize.Typing localTyping = this._annotationIntrospector.findSerializationTyping(paramAnnotated);
        if (localTyping != null)
          if (localTyping != JsonSerialize.Typing.STATIC)
            break label177;
      }
    }
    label177: for (paramBoolean = true; ; paramBoolean = false)
    {
      if (!paramBoolean)
        break label182;
      return paramJavaType;
      if (!localClass2.isAssignableFrom(localClass1))
        throw new IllegalArgumentException("Illegal concrete-type annotation for method '" + paramAnnotated.getName() + "': class " + localClass1.getName() + " not a super-type of (declared) class " + localClass2.getName());
      paramJavaType = this._config.constructSpecializedType(paramJavaType, localClass1);
      break;
    }
    label182: return null;
  }

  public Annotations getClassAnnotations()
  {
    return this._beanDesc.getClassAnnotations();
  }

  protected Object getContainerValueChecker(String paramString, JavaType paramJavaType)
  {
    if (!this._config.isEnabled(SerializationConfig.Feature.WRITE_EMPTY_JSON_ARRAYS))
    {
      if (paramJavaType.isArrayType())
        return new EmptyArrayChecker();
      if (Collection.class.isAssignableFrom(paramJavaType.getRawClass()))
        return new EmptyCollectionChecker();
    }
    return null;
  }

  protected Object getDefaultBean()
  {
    if (this._defaultBean == null)
    {
      this._defaultBean = this._beanDesc.instantiateBean(this._config.isEnabled(SerializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS));
      if (this._defaultBean == null)
      {
        Class localClass = this._beanDesc.getClassInfo().getAnnotated();
        throw new IllegalArgumentException("Class " + localClass.getName() + " has no default constructor; can not instantiate default bean value to support 'properties=JsonSerialize.Inclusion.NON_DEFAULT' annotation");
      }
    }
    return this._defaultBean;
  }

  protected Object getDefaultValue(String paramString, Method paramMethod, Field paramField)
  {
    Object localObject1 = getDefaultBean();
    if (paramMethod != null);
    try
    {
      return paramMethod.invoke(localObject1, new Object[0]);
      Object localObject2 = paramField.get(localObject1);
      return localObject2;
    }
    catch (Exception localException)
    {
      return _throwWrapped(localException, paramString, localObject1);
    }
  }

  protected Object getEmptyValueChecker(String paramString, JavaType paramJavaType)
  {
    Class localClass = paramJavaType.getRawClass();
    if (localClass == String.class)
      return new EmptyStringChecker();
    if (paramJavaType.isArrayType())
      return new EmptyArrayChecker();
    if (Collection.class.isAssignableFrom(localClass))
      return new EmptyCollectionChecker();
    if (Map.class.isAssignableFrom(localClass))
      return new EmptyMapChecker();
    return null;
  }

  public static class EmptyArrayChecker
  {
    public boolean equals(Object paramObject)
    {
      return (paramObject == null) || (Array.getLength(paramObject) == 0);
    }
  }

  public static class EmptyCollectionChecker
  {
    public boolean equals(Object paramObject)
    {
      return (paramObject == null) || (((Collection)paramObject).size() == 0);
    }
  }

  public static class EmptyMapChecker
  {
    public boolean equals(Object paramObject)
    {
      return (paramObject == null) || (((Map)paramObject).size() == 0);
    }
  }

  public static class EmptyStringChecker
  {
    public boolean equals(Object paramObject)
    {
      return (paramObject == null) || (((String)paramObject).length() == 0);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.PropertyBuilder
 * JD-Core Version:    0.6.2
 */