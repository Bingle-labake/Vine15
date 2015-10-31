package com.flurry.org.codehaus.jackson.map.introspect;

import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector.ReferenceProperty;
import com.flurry.org.codehaus.jackson.map.BeanDescription;
import com.flurry.org.codehaus.jackson.map.BeanPropertyDefinition;
import com.flurry.org.codehaus.jackson.map.MapperConfig;
import com.flurry.org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import com.flurry.org.codehaus.jackson.map.type.TypeBindings;
import com.flurry.org.codehaus.jackson.map.util.Annotations;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class BasicBeanDescription extends BeanDescription
{
  protected final AnnotationIntrospector _annotationIntrospector;
  protected AnnotatedMethod _anyGetterMethod;
  protected AnnotatedMethod _anySetterMethod;
  protected TypeBindings _bindings;
  protected final AnnotatedClass _classInfo;
  protected final MapperConfig<?> _config;
  protected Set<String> _ignoredPropertyNames;
  protected Set<String> _ignoredPropertyNamesForDeser;
  protected Map<Object, AnnotatedMember> _injectables;
  protected AnnotatedMethod _jsonValueMethod;
  protected final List<BeanPropertyDefinition> _properties;

  @Deprecated
  public BasicBeanDescription(MapperConfig<?> paramMapperConfig, JavaType paramJavaType, AnnotatedClass paramAnnotatedClass)
  {
    this(paramMapperConfig, paramJavaType, paramAnnotatedClass, Collections.emptyList());
  }

  protected BasicBeanDescription(MapperConfig<?> paramMapperConfig, JavaType paramJavaType, AnnotatedClass paramAnnotatedClass, List<BeanPropertyDefinition> paramList)
  {
    super(paramJavaType);
    this._config = paramMapperConfig;
    if (paramMapperConfig == null);
    for (AnnotationIntrospector localAnnotationIntrospector = null; ; localAnnotationIntrospector = paramMapperConfig.getAnnotationIntrospector())
    {
      this._annotationIntrospector = localAnnotationIntrospector;
      this._classInfo = paramAnnotatedClass;
      this._properties = paramList;
      return;
    }
  }

  public static BasicBeanDescription forDeserialization(POJOPropertiesCollector paramPOJOPropertiesCollector)
  {
    BasicBeanDescription localBasicBeanDescription = new BasicBeanDescription(paramPOJOPropertiesCollector.getConfig(), paramPOJOPropertiesCollector.getType(), paramPOJOPropertiesCollector.getClassDef(), paramPOJOPropertiesCollector.getProperties());
    localBasicBeanDescription._anySetterMethod = paramPOJOPropertiesCollector.getAnySetterMethod();
    localBasicBeanDescription._ignoredPropertyNames = paramPOJOPropertiesCollector.getIgnoredPropertyNames();
    localBasicBeanDescription._ignoredPropertyNamesForDeser = paramPOJOPropertiesCollector.getIgnoredPropertyNamesForDeser();
    localBasicBeanDescription._injectables = paramPOJOPropertiesCollector.getInjectables();
    return localBasicBeanDescription;
  }

  public static BasicBeanDescription forOtherUse(MapperConfig<?> paramMapperConfig, JavaType paramJavaType, AnnotatedClass paramAnnotatedClass)
  {
    return new BasicBeanDescription(paramMapperConfig, paramJavaType, paramAnnotatedClass, Collections.emptyList());
  }

  public static BasicBeanDescription forSerialization(POJOPropertiesCollector paramPOJOPropertiesCollector)
  {
    BasicBeanDescription localBasicBeanDescription = new BasicBeanDescription(paramPOJOPropertiesCollector.getConfig(), paramPOJOPropertiesCollector.getType(), paramPOJOPropertiesCollector.getClassDef(), paramPOJOPropertiesCollector.getProperties());
    localBasicBeanDescription._jsonValueMethod = paramPOJOPropertiesCollector.getJsonValueMethod();
    localBasicBeanDescription._anyGetterMethod = paramPOJOPropertiesCollector.getAnyGetterMethod();
    return localBasicBeanDescription;
  }

  public LinkedHashMap<String, AnnotatedField> _findPropertyFields(Collection<String> paramCollection, boolean paramBoolean)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    Iterator localIterator = this._properties.iterator();
    while (localIterator.hasNext())
    {
      BeanPropertyDefinition localBeanPropertyDefinition = (BeanPropertyDefinition)localIterator.next();
      AnnotatedField localAnnotatedField = localBeanPropertyDefinition.getField();
      if (localAnnotatedField != null)
      {
        String str = localBeanPropertyDefinition.getName();
        if ((paramCollection == null) || (!paramCollection.contains(str)))
          localLinkedHashMap.put(str, localAnnotatedField);
      }
    }
    return localLinkedHashMap;
  }

  public TypeBindings bindingsForBeanType()
  {
    if (this._bindings == null)
      this._bindings = new TypeBindings(this._config.getTypeFactory(), this._type);
    return this._bindings;
  }

  public AnnotatedMethod findAnyGetter()
    throws IllegalArgumentException
  {
    if ((this._anyGetterMethod != null) && (!Map.class.isAssignableFrom(this._anyGetterMethod.getRawType())))
      throw new IllegalArgumentException("Invalid 'any-getter' annotation on method " + this._anyGetterMethod.getName() + "(): return type is not instance of java.util.Map");
    return this._anyGetterMethod;
  }

  public AnnotatedMethod findAnySetter()
    throws IllegalArgumentException
  {
    if (this._anySetterMethod != null)
    {
      Class localClass = this._anySetterMethod.getParameterClass(0);
      if ((localClass != String.class) && (localClass != Object.class))
        throw new IllegalArgumentException("Invalid 'any-setter' annotation on method " + this._anySetterMethod.getName() + "(): first argument not of type String or Object, but " + localClass.getName());
    }
    return this._anySetterMethod;
  }

  public Map<String, AnnotatedMember> findBackReferenceProperties()
  {
    HashMap localHashMap = null;
    Iterator localIterator = this._properties.iterator();
    while (localIterator.hasNext())
    {
      AnnotatedMember localAnnotatedMember = ((BeanPropertyDefinition)localIterator.next()).getMutator();
      if (localAnnotatedMember != null)
      {
        AnnotationIntrospector.ReferenceProperty localReferenceProperty = this._annotationIntrospector.findReferenceType(localAnnotatedMember);
        if ((localReferenceProperty != null) && (localReferenceProperty.isBackReference()))
        {
          if (localHashMap == null)
            localHashMap = new HashMap();
          String str = localReferenceProperty.getName();
          if (localHashMap.put(str, localAnnotatedMember) != null)
            throw new IllegalArgumentException("Multiple back-reference properties with name '" + str + "'");
        }
      }
    }
    return localHashMap;
  }

  public List<String> findCreatorPropertyNames()
  {
    Object localObject = null;
    for (int i = 0; i < 2; i++)
    {
      if (i == 0);
      for (List localList = getConstructors(); ; localList = getFactoryMethods())
      {
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          AnnotatedWithParams localAnnotatedWithParams = (AnnotatedWithParams)localIterator.next();
          int j = localAnnotatedWithParams.getParameterCount();
          if (j >= 1)
          {
            String str = this._annotationIntrospector.findPropertyNameForParam(localAnnotatedWithParams.getParameter(0));
            if (str != null)
            {
              if (localObject == null)
                localObject = new ArrayList();
              ((List)localObject).add(str);
              for (int k = 1; k < j; k++)
                ((List)localObject).add(this._annotationIntrospector.findPropertyNameForParam(localAnnotatedWithParams.getParameter(k)));
            }
          }
        }
      }
    }
    if (localObject == null)
      localObject = Collections.emptyList();
    return localObject;
  }

  public AnnotatedConstructor findDefaultConstructor()
  {
    return this._classInfo.getDefaultConstructor();
  }

  public LinkedHashMap<String, AnnotatedField> findDeserializableFields(VisibilityChecker<?> paramVisibilityChecker, Collection<String> paramCollection)
  {
    return _findPropertyFields(paramCollection, false);
  }

  public Method findFactoryMethod(Class<?>[] paramArrayOfClass)
  {
    Iterator localIterator = this._classInfo.getStaticMethods().iterator();
    while (localIterator.hasNext())
    {
      AnnotatedMethod localAnnotatedMethod = (AnnotatedMethod)localIterator.next();
      if (isFactoryMethod(localAnnotatedMethod))
      {
        Class localClass = localAnnotatedMethod.getParameterClass(0);
        int i = paramArrayOfClass.length;
        for (int j = 0; j < i; j++)
          if (localClass.isAssignableFrom(paramArrayOfClass[j]))
            return localAnnotatedMethod.getAnnotated();
      }
    }
    return null;
  }

  public LinkedHashMap<String, AnnotatedMethod> findGetters(VisibilityChecker<?> paramVisibilityChecker, Collection<String> paramCollection)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    Iterator localIterator = this._properties.iterator();
    while (localIterator.hasNext())
    {
      BeanPropertyDefinition localBeanPropertyDefinition = (BeanPropertyDefinition)localIterator.next();
      AnnotatedMethod localAnnotatedMethod = localBeanPropertyDefinition.getGetter();
      if (localAnnotatedMethod != null)
      {
        String str = localBeanPropertyDefinition.getName();
        if ((paramCollection == null) || (!paramCollection.contains(str)))
          localLinkedHashMap.put(str, localAnnotatedMethod);
      }
    }
    return localLinkedHashMap;
  }

  public Map<Object, AnnotatedMember> findInjectables()
  {
    return this._injectables;
  }

  public AnnotatedMethod findJsonValueMethod()
  {
    return this._jsonValueMethod;
  }

  public AnnotatedMethod findMethod(String paramString, Class<?>[] paramArrayOfClass)
  {
    return this._classInfo.findMethod(paramString, paramArrayOfClass);
  }

  public List<BeanPropertyDefinition> findProperties()
  {
    return this._properties;
  }

  public LinkedHashMap<String, AnnotatedField> findSerializableFields(VisibilityChecker<?> paramVisibilityChecker, Collection<String> paramCollection)
  {
    return _findPropertyFields(paramCollection, true);
  }

  public JsonSerialize.Inclusion findSerializationInclusion(JsonSerialize.Inclusion paramInclusion)
  {
    if (this._annotationIntrospector == null)
      return paramInclusion;
    return this._annotationIntrospector.findSerializationInclusion(this._classInfo, paramInclusion);
  }

  public LinkedHashMap<String, AnnotatedMethod> findSetters(VisibilityChecker<?> paramVisibilityChecker)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    Iterator localIterator = this._properties.iterator();
    while (localIterator.hasNext())
    {
      BeanPropertyDefinition localBeanPropertyDefinition = (BeanPropertyDefinition)localIterator.next();
      AnnotatedMethod localAnnotatedMethod = localBeanPropertyDefinition.getSetter();
      if (localAnnotatedMethod != null)
        localLinkedHashMap.put(localBeanPropertyDefinition.getName(), localAnnotatedMethod);
    }
    return localLinkedHashMap;
  }

  public Constructor<?> findSingleArgConstructor(Class<?>[] paramArrayOfClass)
  {
    Iterator localIterator = this._classInfo.getConstructors().iterator();
    while (localIterator.hasNext())
    {
      AnnotatedConstructor localAnnotatedConstructor = (AnnotatedConstructor)localIterator.next();
      if (localAnnotatedConstructor.getParameterCount() == 1)
      {
        Class localClass = localAnnotatedConstructor.getParameterClass(0);
        int i = paramArrayOfClass.length;
        for (int j = 0; j < i; j++)
          if (paramArrayOfClass[j] == localClass)
            return localAnnotatedConstructor.getAnnotated();
      }
    }
    return null;
  }

  public Annotations getClassAnnotations()
  {
    return this._classInfo.getAnnotations();
  }

  public AnnotatedClass getClassInfo()
  {
    return this._classInfo;
  }

  public List<AnnotatedConstructor> getConstructors()
  {
    return this._classInfo.getConstructors();
  }

  public List<AnnotatedMethod> getFactoryMethods()
  {
    List localList = this._classInfo.getStaticMethods();
    if (localList.isEmpty())
      return localList;
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = localList.iterator();
    while (localIterator.hasNext())
    {
      AnnotatedMethod localAnnotatedMethod = (AnnotatedMethod)localIterator.next();
      if (isFactoryMethod(localAnnotatedMethod))
        localArrayList.add(localAnnotatedMethod);
    }
    return localArrayList;
  }

  public Set<String> getIgnoredPropertyNames()
  {
    if (this._ignoredPropertyNames == null)
      return Collections.emptySet();
    return this._ignoredPropertyNames;
  }

  public Set<String> getIgnoredPropertyNamesForDeser()
  {
    return this._ignoredPropertyNamesForDeser;
  }

  public boolean hasKnownClassAnnotations()
  {
    return this._classInfo.hasAnnotations();
  }

  public Object instantiateBean(boolean paramBoolean)
  {
    AnnotatedConstructor localAnnotatedConstructor = this._classInfo.getDefaultConstructor();
    if (localAnnotatedConstructor == null)
      return null;
    if (paramBoolean)
      localAnnotatedConstructor.fixAccess();
    try
    {
      Object localObject2 = localAnnotatedConstructor.getAnnotated().newInstance(new Object[0]);
      return localObject2;
    }
    catch (Exception localException)
    {
      for (Object localObject1 = localException; ((Throwable)localObject1).getCause() != null; localObject1 = ((Throwable)localObject1).getCause());
      if ((localObject1 instanceof Error))
        throw ((Error)localObject1);
      if ((localObject1 instanceof RuntimeException))
        throw ((RuntimeException)localObject1);
      throw new IllegalArgumentException("Failed to instantiate bean of type " + this._classInfo.getAnnotated().getName() + ": (" + localObject1.getClass().getName() + ") " + ((Throwable)localObject1).getMessage(), (Throwable)localObject1);
    }
  }

  protected boolean isFactoryMethod(AnnotatedMethod paramAnnotatedMethod)
  {
    Class localClass = paramAnnotatedMethod.getRawType();
    if (!getBeanClass().isAssignableFrom(localClass));
    do
    {
      return false;
      if (this._annotationIntrospector.hasCreatorAnnotation(paramAnnotatedMethod))
        return true;
    }
    while (!"valueOf".equals(paramAnnotatedMethod.getName()));
    return true;
  }

  public JavaType resolveType(Type paramType)
  {
    if (paramType == null)
      return null;
    return bindingsForBeanType().resolveType(paramType);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.introspect.BasicBeanDescription
 * JD-Core Version:    0.6.2
 */