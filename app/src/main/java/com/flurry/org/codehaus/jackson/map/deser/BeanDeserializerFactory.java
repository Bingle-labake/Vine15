package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.map.AbstractTypeResolver;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector.ReferenceProperty;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.BeanProperty.Std;
import com.flurry.org.codehaus.jackson.map.BeanPropertyDefinition;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializerFactory;
import com.flurry.org.codehaus.jackson.map.DeserializerFactory.Config;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.Deserializers;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.KeyDeserializer;
import com.flurry.org.codehaus.jackson.map.KeyDeserializers;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.impl.CreatorCollector;
import com.flurry.org.codehaus.jackson.map.deser.impl.CreatorProperty;
import com.flurry.org.codehaus.jackson.map.deser.std.StdKeyDeserializers;
import com.flurry.org.codehaus.jackson.map.deser.std.ThrowableDeserializer;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedClass;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedConstructor;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedField;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMember;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMethod;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedParameter;
import com.flurry.org.codehaus.jackson.map.introspect.BasicBeanDescription;
import com.flurry.org.codehaus.jackson.map.introspect.VisibilityChecker;
import com.flurry.org.codehaus.jackson.map.type.ArrayType;
import com.flurry.org.codehaus.jackson.map.type.CollectionLikeType;
import com.flurry.org.codehaus.jackson.map.type.CollectionType;
import com.flurry.org.codehaus.jackson.map.type.MapLikeType;
import com.flurry.org.codehaus.jackson.map.type.MapType;
import com.flurry.org.codehaus.jackson.map.type.TypeBindings;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.map.util.EnumResolver;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class BeanDeserializerFactory extends BasicDeserializerFactory
{
  private static final Class<?>[] INIT_CAUSE_PARAMS = { Throwable.class };
  public static final BeanDeserializerFactory instance = new BeanDeserializerFactory(null);
  protected final DeserializerFactory.Config _factoryConfig;

  @Deprecated
  public BeanDeserializerFactory()
  {
    this(null);
  }

  public BeanDeserializerFactory(DeserializerFactory.Config paramConfig)
  {
    if (paramConfig == null)
      paramConfig = new ConfigImpl();
    this._factoryConfig = paramConfig;
  }

  private KeyDeserializer _createEnumKeyDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspect(paramJavaType);
    Class localClass = paramJavaType.getRawClass();
    EnumResolver localEnumResolver = constructEnumResolver(localClass, paramDeserializationConfig);
    Iterator localIterator = localBasicBeanDescription.getFactoryMethods().iterator();
    while (localIterator.hasNext())
    {
      AnnotatedMethod localAnnotatedMethod = (AnnotatedMethod)localIterator.next();
      if (paramDeserializationConfig.getAnnotationIntrospector().hasCreatorAnnotation(localAnnotatedMethod))
      {
        if ((localAnnotatedMethod.getParameterCount() == 1) && (localAnnotatedMethod.getRawType().isAssignableFrom(localClass)))
        {
          if (localAnnotatedMethod.getParameterType(0) != String.class)
            throw new IllegalArgumentException("Parameter #0 type for factory method (" + localAnnotatedMethod + ") not suitable, must be java.lang.String");
          if (paramDeserializationConfig.canOverrideAccessModifiers())
            ClassUtil.checkAndFixAccess(localAnnotatedMethod.getMember());
          return StdKeyDeserializers.constructEnumKeyDeserializer(localEnumResolver, localAnnotatedMethod);
        }
        throw new IllegalArgumentException("Unsuitable method (" + localAnnotatedMethod + ") decorated with @JsonCreator (for Enum type " + localClass.getName() + ")");
      }
    }
    return StdKeyDeserializers.constructEnumKeyDeserializer(localEnumResolver);
  }

  protected void _addDeserializerConstructors(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, VisibilityChecker<?> paramVisibilityChecker, AnnotationIntrospector paramAnnotationIntrospector, CreatorCollector paramCreatorCollector)
    throws JsonMappingException
  {
    Iterator localIterator = paramBasicBeanDescription.getConstructors().iterator();
    while (localIterator.hasNext())
    {
      AnnotatedConstructor localAnnotatedConstructor = (AnnotatedConstructor)localIterator.next();
      int i = localAnnotatedConstructor.getParameterCount();
      if (i >= 1)
      {
        boolean bool1 = paramAnnotationIntrospector.hasCreatorAnnotation(localAnnotatedConstructor);
        boolean bool2 = paramVisibilityChecker.isCreatorVisible(localAnnotatedConstructor);
        if (i == 1)
        {
          _handleSingleArgumentConstructor(paramDeserializationConfig, paramBasicBeanDescription, paramVisibilityChecker, paramAnnotationIntrospector, paramCreatorCollector, localAnnotatedConstructor, bool1, bool2);
        }
        else if ((bool1) || (bool2))
        {
          Object localObject1 = null;
          int j = 0;
          int k = 0;
          CreatorProperty[] arrayOfCreatorProperty = new CreatorProperty[i];
          int m = 0;
          if (m < i)
          {
            AnnotatedParameter localAnnotatedParameter = localAnnotatedConstructor.getParameter(m);
            String str;
            label145: Object localObject2;
            if (localAnnotatedParameter == null)
            {
              str = null;
              localObject2 = paramAnnotationIntrospector.findInjectableValueId(localAnnotatedParameter);
              if ((str == null) || (str.length() <= 0))
                break label207;
              j++;
              arrayOfCreatorProperty[m] = constructCreatorProperty(paramDeserializationConfig, paramBasicBeanDescription, str, m, localAnnotatedParameter, localObject2);
            }
            while (true)
            {
              m++;
              break;
              str = paramAnnotationIntrospector.findPropertyNameForParam(localAnnotatedParameter);
              break label145;
              label207: if (localObject2 != null)
              {
                k++;
                arrayOfCreatorProperty[m] = constructCreatorProperty(paramDeserializationConfig, paramBasicBeanDescription, str, m, localAnnotatedParameter, localObject2);
              }
              else if (localObject1 == null)
              {
                localObject1 = localAnnotatedParameter;
              }
            }
          }
          if ((bool1) || (j > 0) || (k > 0))
          {
            if (j + k == i)
              paramCreatorCollector.addPropertyCreator(localAnnotatedConstructor, arrayOfCreatorProperty);
          }
          else
          {
            if (0 == 0)
              continue;
            paramCreatorCollector.addPropertyCreator(localAnnotatedConstructor, arrayOfCreatorProperty);
            continue;
          }
          if ((j == 0) && (k + 1 == i))
            throw new IllegalArgumentException("Delegated constructor with Injectables not yet supported (see [JACKSON-712]) for " + localAnnotatedConstructor);
          throw new IllegalArgumentException("Argument #" + localObject1.getIndex() + " of constructor " + localAnnotatedConstructor + " has no property name annotation; must have name when multiple-paramater constructor annotated as Creator");
        }
      }
    }
  }

  protected void _addDeserializerFactoryMethods(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, VisibilityChecker<?> paramVisibilityChecker, AnnotationIntrospector paramAnnotationIntrospector, CreatorCollector paramCreatorCollector)
    throws JsonMappingException
  {
    Iterator localIterator = paramBasicBeanDescription.getFactoryMethods().iterator();
    while (localIterator.hasNext())
    {
      AnnotatedMethod localAnnotatedMethod = (AnnotatedMethod)localIterator.next();
      int i = localAnnotatedMethod.getParameterCount();
      if (i >= 1)
      {
        boolean bool = paramAnnotationIntrospector.hasCreatorAnnotation(localAnnotatedMethod);
        if (i == 1)
        {
          AnnotatedParameter localAnnotatedParameter2 = localAnnotatedMethod.getParameter(0);
          String str2 = paramAnnotationIntrospector.findPropertyNameForParam(localAnnotatedParameter2);
          if ((paramAnnotationIntrospector.findInjectableValueId(localAnnotatedParameter2) == null) && ((str2 == null) || (str2.length() == 0)))
            _handleSingleArgumentFactory(paramDeserializationConfig, paramBasicBeanDescription, paramVisibilityChecker, paramAnnotationIntrospector, paramCreatorCollector, localAnnotatedMethod, bool);
        }
        else if (paramAnnotationIntrospector.hasCreatorAnnotation(localAnnotatedMethod))
        {
          CreatorProperty[] arrayOfCreatorProperty = new CreatorProperty[i];
          for (int j = 0; j < i; j++)
          {
            AnnotatedParameter localAnnotatedParameter1 = localAnnotatedMethod.getParameter(j);
            String str1 = paramAnnotationIntrospector.findPropertyNameForParam(localAnnotatedParameter1);
            Object localObject = paramAnnotationIntrospector.findInjectableValueId(localAnnotatedParameter1);
            if (((str1 == null) || (str1.length() == 0)) && (localObject == null))
              throw new IllegalArgumentException("Argument #" + j + " of factory method " + localAnnotatedMethod + " has no property name annotation; must have when multiple-paramater static method annotated as Creator");
            arrayOfCreatorProperty[j] = constructCreatorProperty(paramDeserializationConfig, paramBasicBeanDescription, str1, j, localAnnotatedParameter1, localObject);
          }
          paramCreatorCollector.addPropertyCreator(localAnnotatedMethod, arrayOfCreatorProperty);
        }
      }
    }
  }

  protected JsonDeserializer<?> _findCustomArrayDeserializer(ArrayType paramArrayType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException
  {
    Iterator localIterator = this._factoryConfig.deserializers().iterator();
    while (localIterator.hasNext())
    {
      JsonDeserializer localJsonDeserializer = ((Deserializers)localIterator.next()).findArrayDeserializer(paramArrayType, paramDeserializationConfig, paramDeserializerProvider, paramBeanProperty, paramTypeDeserializer, paramJsonDeserializer);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return null;
  }

  protected JsonDeserializer<Object> _findCustomBeanDeserializer(JavaType paramJavaType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Iterator localIterator = this._factoryConfig.deserializers().iterator();
    while (localIterator.hasNext())
    {
      JsonDeserializer localJsonDeserializer = ((Deserializers)localIterator.next()).findBeanDeserializer(paramJavaType, paramDeserializationConfig, paramDeserializerProvider, paramBasicBeanDescription, paramBeanProperty);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return null;
  }

  protected JsonDeserializer<?> _findCustomCollectionDeserializer(CollectionType paramCollectionType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException
  {
    Iterator localIterator = this._factoryConfig.deserializers().iterator();
    while (localIterator.hasNext())
    {
      JsonDeserializer localJsonDeserializer = ((Deserializers)localIterator.next()).findCollectionDeserializer(paramCollectionType, paramDeserializationConfig, paramDeserializerProvider, paramBasicBeanDescription, paramBeanProperty, paramTypeDeserializer, paramJsonDeserializer);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return null;
  }

  protected JsonDeserializer<?> _findCustomCollectionLikeDeserializer(CollectionLikeType paramCollectionLikeType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException
  {
    Iterator localIterator = this._factoryConfig.deserializers().iterator();
    while (localIterator.hasNext())
    {
      JsonDeserializer localJsonDeserializer = ((Deserializers)localIterator.next()).findCollectionLikeDeserializer(paramCollectionLikeType, paramDeserializationConfig, paramDeserializerProvider, paramBasicBeanDescription, paramBeanProperty, paramTypeDeserializer, paramJsonDeserializer);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return null;
  }

  protected JsonDeserializer<?> _findCustomEnumDeserializer(Class<?> paramClass, DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Iterator localIterator = this._factoryConfig.deserializers().iterator();
    while (localIterator.hasNext())
    {
      JsonDeserializer localJsonDeserializer = ((Deserializers)localIterator.next()).findEnumDeserializer(paramClass, paramDeserializationConfig, paramBasicBeanDescription, paramBeanProperty);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return null;
  }

  protected JsonDeserializer<?> _findCustomMapDeserializer(MapType paramMapType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, KeyDeserializer paramKeyDeserializer, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException
  {
    Iterator localIterator = this._factoryConfig.deserializers().iterator();
    while (localIterator.hasNext())
    {
      JsonDeserializer localJsonDeserializer = ((Deserializers)localIterator.next()).findMapDeserializer(paramMapType, paramDeserializationConfig, paramDeserializerProvider, paramBasicBeanDescription, paramBeanProperty, paramKeyDeserializer, paramTypeDeserializer, paramJsonDeserializer);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return null;
  }

  protected JsonDeserializer<?> _findCustomMapLikeDeserializer(MapLikeType paramMapLikeType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, KeyDeserializer paramKeyDeserializer, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException
  {
    Iterator localIterator = this._factoryConfig.deserializers().iterator();
    while (localIterator.hasNext())
    {
      JsonDeserializer localJsonDeserializer = ((Deserializers)localIterator.next()).findMapLikeDeserializer(paramMapLikeType, paramDeserializationConfig, paramDeserializerProvider, paramBasicBeanDescription, paramBeanProperty, paramKeyDeserializer, paramTypeDeserializer, paramJsonDeserializer);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return null;
  }

  protected JsonDeserializer<?> _findCustomTreeNodeDeserializer(Class<? extends JsonNode> paramClass, DeserializationConfig paramDeserializationConfig, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Iterator localIterator = this._factoryConfig.deserializers().iterator();
    while (localIterator.hasNext())
    {
      JsonDeserializer localJsonDeserializer = ((Deserializers)localIterator.next()).findTreeNodeDeserializer(paramClass, paramDeserializationConfig, paramBeanProperty);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return null;
  }

  protected boolean _handleSingleArgumentConstructor(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, VisibilityChecker<?> paramVisibilityChecker, AnnotationIntrospector paramAnnotationIntrospector, CreatorCollector paramCreatorCollector, AnnotatedConstructor paramAnnotatedConstructor, boolean paramBoolean1, boolean paramBoolean2)
    throws JsonMappingException
  {
    AnnotatedParameter localAnnotatedParameter = paramAnnotatedConstructor.getParameter(0);
    String str = paramAnnotationIntrospector.findPropertyNameForParam(localAnnotatedParameter);
    Object localObject = paramAnnotationIntrospector.findInjectableValueId(localAnnotatedParameter);
    if ((localObject != null) || ((str != null) && (str.length() > 0)))
    {
      CreatorProperty[] arrayOfCreatorProperty = new CreatorProperty[1];
      arrayOfCreatorProperty[0] = constructCreatorProperty(paramDeserializationConfig, paramBasicBeanDescription, str, 0, localAnnotatedParameter, localObject);
      paramCreatorCollector.addPropertyCreator(paramAnnotatedConstructor, arrayOfCreatorProperty);
      return true;
    }
    Class localClass = paramAnnotatedConstructor.getParameterClass(0);
    if (localClass == String.class)
    {
      if ((paramBoolean1) || (paramBoolean2))
        paramCreatorCollector.addStringCreator(paramAnnotatedConstructor);
      return true;
    }
    if ((localClass == Integer.TYPE) || (localClass == Integer.class))
    {
      if ((paramBoolean1) || (paramBoolean2))
        paramCreatorCollector.addIntCreator(paramAnnotatedConstructor);
      return true;
    }
    if ((localClass == Long.TYPE) || (localClass == Long.class))
    {
      if ((paramBoolean1) || (paramBoolean2))
        paramCreatorCollector.addLongCreator(paramAnnotatedConstructor);
      return true;
    }
    if ((localClass == Double.TYPE) || (localClass == Double.class))
    {
      if ((paramBoolean1) || (paramBoolean2))
        paramCreatorCollector.addDoubleCreator(paramAnnotatedConstructor);
      return true;
    }
    if (paramBoolean1)
    {
      paramCreatorCollector.addDelegatingCreator(paramAnnotatedConstructor);
      return true;
    }
    return false;
  }

  protected boolean _handleSingleArgumentFactory(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, VisibilityChecker<?> paramVisibilityChecker, AnnotationIntrospector paramAnnotationIntrospector, CreatorCollector paramCreatorCollector, AnnotatedMethod paramAnnotatedMethod, boolean paramBoolean)
    throws JsonMappingException
  {
    Class localClass = paramAnnotatedMethod.getParameterClass(0);
    if (localClass == String.class)
      if ((paramBoolean) || (paramVisibilityChecker.isCreatorVisible(paramAnnotatedMethod)))
        paramCreatorCollector.addStringCreator(paramAnnotatedMethod);
    do
    {
      do
      {
        do
        {
          do
          {
            return true;
            if ((localClass != Integer.TYPE) && (localClass != Integer.class))
              break;
          }
          while ((!paramBoolean) && (!paramVisibilityChecker.isCreatorVisible(paramAnnotatedMethod)));
          paramCreatorCollector.addIntCreator(paramAnnotatedMethod);
          return true;
          if ((localClass != Long.TYPE) && (localClass != Long.class))
            break;
        }
        while ((!paramBoolean) && (!paramVisibilityChecker.isCreatorVisible(paramAnnotatedMethod)));
        paramCreatorCollector.addLongCreator(paramAnnotatedMethod);
        return true;
        if ((localClass != Double.TYPE) && (localClass != Double.class))
          break;
      }
      while ((!paramBoolean) && (!paramVisibilityChecker.isCreatorVisible(paramAnnotatedMethod)));
      paramCreatorCollector.addDoubleCreator(paramAnnotatedMethod);
      return true;
      if ((localClass != Boolean.TYPE) && (localClass != Boolean.class))
        break;
    }
    while ((!paramBoolean) && (!paramVisibilityChecker.isCreatorVisible(paramAnnotatedMethod)));
    paramCreatorCollector.addBooleanCreator(paramAnnotatedMethod);
    return true;
    if (paramAnnotationIntrospector.hasCreatorAnnotation(paramAnnotatedMethod))
    {
      paramCreatorCollector.addDelegatingCreator(paramAnnotatedMethod);
      return true;
    }
    return false;
  }

  protected JavaType _mapAbstractType2(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
    throws JsonMappingException
  {
    Class localClass = paramJavaType.getRawClass();
    if (this._factoryConfig.hasAbstractTypeResolvers())
    {
      Iterator localIterator = this._factoryConfig.abstractTypeResolvers().iterator();
      while (localIterator.hasNext())
      {
        JavaType localJavaType = ((AbstractTypeResolver)localIterator.next()).findTypeMapping(paramDeserializationConfig, paramJavaType);
        if ((localJavaType != null) && (localJavaType.getRawClass() != localClass))
          return localJavaType;
      }
    }
    return null;
  }

  protected void addBeanProps(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, BeanDeserializerBuilder paramBeanDeserializerBuilder)
    throws JsonMappingException
  {
    List localList = paramBasicBeanDescription.findProperties();
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    Boolean localBoolean = localAnnotationIntrospector.findIgnoreUnknownProperties(paramBasicBeanDescription.getClassInfo());
    if (localBoolean != null)
      paramBeanDeserializerBuilder.setIgnoreUnknownProperties(localBoolean.booleanValue());
    HashSet localHashSet = ArrayBuilders.arrayToSet(localAnnotationIntrospector.findPropertiesToIgnore(paramBasicBeanDescription.getClassInfo()));
    Iterator localIterator1 = localHashSet.iterator();
    while (localIterator1.hasNext())
      paramBeanDeserializerBuilder.addIgnorable((String)localIterator1.next());
    AnnotatedMethod localAnnotatedMethod1 = paramBasicBeanDescription.findAnySetter();
    if (localAnnotatedMethod1 == null);
    for (Set localSet = paramBasicBeanDescription.getIgnoredPropertyNames(); localSet != null; localSet = paramBasicBeanDescription.getIgnoredPropertyNamesForDeser())
    {
      Iterator localIterator4 = localSet.iterator();
      while (localIterator4.hasNext())
        paramBeanDeserializerBuilder.addIgnorable((String)localIterator4.next());
    }
    HashMap localHashMap = new HashMap();
    Iterator localIterator2 = localList.iterator();
    while (localIterator2.hasNext())
    {
      BeanPropertyDefinition localBeanPropertyDefinition2 = (BeanPropertyDefinition)localIterator2.next();
      String str2 = localBeanPropertyDefinition2.getName();
      if (!localHashSet.contains(str2))
        if (localBeanPropertyDefinition2.hasConstructorParameter())
        {
          paramBeanDeserializerBuilder.addCreatorProperty(localBeanPropertyDefinition2);
        }
        else if (localBeanPropertyDefinition2.hasSetter())
        {
          AnnotatedMethod localAnnotatedMethod3 = localBeanPropertyDefinition2.getSetter();
          if (isIgnorableType(paramDeserializationConfig, paramBasicBeanDescription, localAnnotatedMethod3.getParameterClass(0), localHashMap))
          {
            paramBeanDeserializerBuilder.addIgnorable(str2);
          }
          else
          {
            SettableBeanProperty localSettableBeanProperty2 = constructSettableProperty(paramDeserializationConfig, paramBasicBeanDescription, str2, localAnnotatedMethod3);
            if (localSettableBeanProperty2 != null)
              paramBeanDeserializerBuilder.addProperty(localSettableBeanProperty2);
          }
        }
        else if (localBeanPropertyDefinition2.hasField())
        {
          AnnotatedField localAnnotatedField = localBeanPropertyDefinition2.getField();
          if (isIgnorableType(paramDeserializationConfig, paramBasicBeanDescription, localAnnotatedField.getRawType(), localHashMap))
          {
            paramBeanDeserializerBuilder.addIgnorable(str2);
          }
          else
          {
            SettableBeanProperty localSettableBeanProperty1 = constructSettableProperty(paramDeserializationConfig, paramBasicBeanDescription, str2, localAnnotatedField);
            if (localSettableBeanProperty1 != null)
              paramBeanDeserializerBuilder.addProperty(localSettableBeanProperty1);
          }
        }
    }
    if (localAnnotatedMethod1 != null)
      paramBeanDeserializerBuilder.setAnySetter(constructAnySetter(paramDeserializationConfig, paramBasicBeanDescription, localAnnotatedMethod1));
    if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.USE_GETTERS_AS_SETTERS))
    {
      Iterator localIterator3 = localList.iterator();
      while (localIterator3.hasNext())
      {
        BeanPropertyDefinition localBeanPropertyDefinition1 = (BeanPropertyDefinition)localIterator3.next();
        if (localBeanPropertyDefinition1.hasGetter())
        {
          String str1 = localBeanPropertyDefinition1.getName();
          if ((!paramBeanDeserializerBuilder.hasProperty(str1)) && (!localHashSet.contains(str1)))
          {
            AnnotatedMethod localAnnotatedMethod2 = localBeanPropertyDefinition1.getGetter();
            Class localClass = localAnnotatedMethod2.getRawType();
            if (((Collection.class.isAssignableFrom(localClass)) || (Map.class.isAssignableFrom(localClass))) && (!localHashSet.contains(str1)) && (!paramBeanDeserializerBuilder.hasProperty(str1)))
              paramBeanDeserializerBuilder.addProperty(constructSetterlessProperty(paramDeserializationConfig, paramBasicBeanDescription, str1, localAnnotatedMethod2));
          }
        }
      }
    }
  }

  protected void addInjectables(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, BeanDeserializerBuilder paramBeanDeserializerBuilder)
    throws JsonMappingException
  {
    Map localMap = paramBasicBeanDescription.findInjectables();
    if (localMap != null)
    {
      boolean bool = paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS);
      Iterator localIterator = localMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        AnnotatedMember localAnnotatedMember = (AnnotatedMember)localEntry.getValue();
        if (bool)
          localAnnotatedMember.fixAccess();
        paramBeanDeserializerBuilder.addInjectable(localAnnotatedMember.getName(), paramBasicBeanDescription.resolveType(localAnnotatedMember.getGenericType()), paramBasicBeanDescription.getClassAnnotations(), localAnnotatedMember, localEntry.getKey());
      }
    }
  }

  protected void addReferenceProperties(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, BeanDeserializerBuilder paramBeanDeserializerBuilder)
    throws JsonMappingException
  {
    Map localMap = paramBasicBeanDescription.findBackReferenceProperties();
    if (localMap != null)
    {
      Iterator localIterator = localMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        String str = (String)localEntry.getKey();
        AnnotatedMember localAnnotatedMember = (AnnotatedMember)localEntry.getValue();
        if ((localAnnotatedMember instanceof AnnotatedMethod))
          paramBeanDeserializerBuilder.addBackReferenceProperty(str, constructSettableProperty(paramDeserializationConfig, paramBasicBeanDescription, localAnnotatedMember.getName(), (AnnotatedMethod)localAnnotatedMember));
        else
          paramBeanDeserializerBuilder.addBackReferenceProperty(str, constructSettableProperty(paramDeserializationConfig, paramBasicBeanDescription, localAnnotatedMember.getName(), (AnnotatedField)localAnnotatedMember));
      }
    }
  }

  public JsonDeserializer<Object> buildBeanDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    ValueInstantiator localValueInstantiator = findValueInstantiator(paramDeserializationConfig, paramBasicBeanDescription);
    Object localObject;
    if ((paramJavaType.isAbstract()) && (!localValueInstantiator.canInstantiate()))
      localObject = new AbstractDeserializer(paramJavaType);
    while (true)
    {
      return localObject;
      BeanDeserializerBuilder localBeanDeserializerBuilder = constructBeanDeserializerBuilder(paramBasicBeanDescription);
      localBeanDeserializerBuilder.setValueInstantiator(localValueInstantiator);
      addBeanProps(paramDeserializationConfig, paramBasicBeanDescription, localBeanDeserializerBuilder);
      addReferenceProperties(paramDeserializationConfig, paramBasicBeanDescription, localBeanDeserializerBuilder);
      addInjectables(paramDeserializationConfig, paramBasicBeanDescription, localBeanDeserializerBuilder);
      if (this._factoryConfig.hasDeserializerModifiers())
      {
        Iterator localIterator2 = this._factoryConfig.deserializerModifiers().iterator();
        while (localIterator2.hasNext())
          localBeanDeserializerBuilder = ((BeanDeserializerModifier)localIterator2.next()).updateBuilder(paramDeserializationConfig, paramBasicBeanDescription, localBeanDeserializerBuilder);
      }
      localObject = localBeanDeserializerBuilder.build(paramBeanProperty);
      if (this._factoryConfig.hasDeserializerModifiers())
      {
        Iterator localIterator1 = this._factoryConfig.deserializerModifiers().iterator();
        while (localIterator1.hasNext())
          localObject = ((BeanDeserializerModifier)localIterator1.next()).modifyDeserializer(paramDeserializationConfig, paramBasicBeanDescription, (JsonDeserializer)localObject);
      }
    }
  }

  public JsonDeserializer<Object> buildThrowableDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    BeanDeserializerBuilder localBeanDeserializerBuilder = constructBeanDeserializerBuilder(paramBasicBeanDescription);
    localBeanDeserializerBuilder.setValueInstantiator(findValueInstantiator(paramDeserializationConfig, paramBasicBeanDescription));
    addBeanProps(paramDeserializationConfig, paramBasicBeanDescription, localBeanDeserializerBuilder);
    AnnotatedMethod localAnnotatedMethod = paramBasicBeanDescription.findMethod("initCause", INIT_CAUSE_PARAMS);
    if (localAnnotatedMethod != null)
    {
      SettableBeanProperty localSettableBeanProperty = constructSettableProperty(paramDeserializationConfig, paramBasicBeanDescription, "cause", localAnnotatedMethod);
      if (localSettableBeanProperty != null)
        localBeanDeserializerBuilder.addOrReplaceProperty(localSettableBeanProperty, true);
    }
    localBeanDeserializerBuilder.addIgnorable("localizedMessage");
    localBeanDeserializerBuilder.addIgnorable("message");
    if (this._factoryConfig.hasDeserializerModifiers())
    {
      Iterator localIterator2 = this._factoryConfig.deserializerModifiers().iterator();
      while (localIterator2.hasNext())
        localBeanDeserializerBuilder = ((BeanDeserializerModifier)localIterator2.next()).updateBuilder(paramDeserializationConfig, paramBasicBeanDescription, localBeanDeserializerBuilder);
    }
    Object localObject = localBeanDeserializerBuilder.build(paramBeanProperty);
    if ((localObject instanceof BeanDeserializer))
      localObject = new ThrowableDeserializer((BeanDeserializer)localObject);
    if (this._factoryConfig.hasDeserializerModifiers())
    {
      Iterator localIterator1 = this._factoryConfig.deserializerModifiers().iterator();
      while (localIterator1.hasNext())
        localObject = ((BeanDeserializerModifier)localIterator1.next()).modifyDeserializer(paramDeserializationConfig, paramBasicBeanDescription, (JsonDeserializer)localObject);
    }
    return localObject;
  }

  protected SettableAnyProperty constructAnySetter(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, AnnotatedMethod paramAnnotatedMethod)
    throws JsonMappingException
  {
    if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS))
      paramAnnotatedMethod.fixAccess();
    JavaType localJavaType1 = paramBasicBeanDescription.bindingsForBeanType().resolveType(paramAnnotatedMethod.getParameterType(1));
    BeanProperty.Std localStd = new BeanProperty.Std(paramAnnotatedMethod.getName(), localJavaType1, paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedMethod);
    JavaType localJavaType2 = resolveType(paramDeserializationConfig, paramBasicBeanDescription, localJavaType1, paramAnnotatedMethod, localStd);
    JsonDeserializer localJsonDeserializer = findDeserializerFromAnnotation(paramDeserializationConfig, paramAnnotatedMethod, localStd);
    if (localJsonDeserializer != null)
      return new SettableAnyProperty(localStd, paramAnnotatedMethod, localJavaType2, localJsonDeserializer);
    return new SettableAnyProperty(localStd, paramAnnotatedMethod, modifyTypeByAnnotation(paramDeserializationConfig, paramAnnotatedMethod, localJavaType2, localStd.getName()), null);
  }

  protected BeanDeserializerBuilder constructBeanDeserializerBuilder(BasicBeanDescription paramBasicBeanDescription)
  {
    return new BeanDeserializerBuilder(paramBasicBeanDescription);
  }

  protected CreatorProperty constructCreatorProperty(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, String paramString, int paramInt, AnnotatedParameter paramAnnotatedParameter, Object paramObject)
    throws JsonMappingException
  {
    JavaType localJavaType1 = paramDeserializationConfig.getTypeFactory().constructType(paramAnnotatedParameter.getParameterType(), paramBasicBeanDescription.bindingsForBeanType());
    BeanProperty.Std localStd = new BeanProperty.Std(paramString, localJavaType1, paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedParameter);
    JavaType localJavaType2 = resolveType(paramDeserializationConfig, paramBasicBeanDescription, localJavaType1, paramAnnotatedParameter, localStd);
    if (localJavaType2 != localJavaType1)
      localStd = localStd.withType(localJavaType2);
    JsonDeserializer localJsonDeserializer = findDeserializerFromAnnotation(paramDeserializationConfig, paramAnnotatedParameter, localStd);
    JavaType localJavaType3 = modifyTypeByAnnotation(paramDeserializationConfig, paramAnnotatedParameter, localJavaType2, paramString);
    TypeDeserializer localTypeDeserializer = (TypeDeserializer)localJavaType3.getTypeHandler();
    if (localTypeDeserializer == null)
      localTypeDeserializer = findTypeDeserializer(paramDeserializationConfig, localJavaType3, localStd);
    CreatorProperty localCreatorProperty = new CreatorProperty(paramString, localJavaType3, localTypeDeserializer, paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedParameter, paramInt, paramObject);
    if (localJsonDeserializer != null)
      localCreatorProperty = localCreatorProperty.withValueDeserializer(localJsonDeserializer);
    return localCreatorProperty;
  }

  protected ValueInstantiator constructDefaultValueInstantiator(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription)
    throws JsonMappingException
  {
    boolean bool = paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS);
    CreatorCollector localCreatorCollector = new CreatorCollector(paramBasicBeanDescription, bool);
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    if (paramBasicBeanDescription.getType().isConcrete())
    {
      AnnotatedConstructor localAnnotatedConstructor = paramBasicBeanDescription.findDefaultConstructor();
      if (localAnnotatedConstructor != null)
      {
        if (bool)
          ClassUtil.checkAndFixAccess(localAnnotatedConstructor.getAnnotated());
        localCreatorCollector.setDefaultConstructor(localAnnotatedConstructor);
      }
    }
    VisibilityChecker localVisibilityChecker1 = paramDeserializationConfig.getDefaultVisibilityChecker();
    VisibilityChecker localVisibilityChecker2 = paramDeserializationConfig.getAnnotationIntrospector().findAutoDetectVisibility(paramBasicBeanDescription.getClassInfo(), localVisibilityChecker1);
    _addDeserializerFactoryMethods(paramDeserializationConfig, paramBasicBeanDescription, localVisibilityChecker2, localAnnotationIntrospector, localCreatorCollector);
    _addDeserializerConstructors(paramDeserializationConfig, paramBasicBeanDescription, localVisibilityChecker2, localAnnotationIntrospector, localCreatorCollector);
    return localCreatorCollector.constructValueInstantiator(paramDeserializationConfig);
  }

  protected SettableBeanProperty constructSettableProperty(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, String paramString, AnnotatedField paramAnnotatedField)
    throws JsonMappingException
  {
    if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS))
      paramAnnotatedField.fixAccess();
    JavaType localJavaType1 = paramBasicBeanDescription.bindingsForBeanType().resolveType(paramAnnotatedField.getGenericType());
    BeanProperty.Std localStd = new BeanProperty.Std(paramString, localJavaType1, paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedField);
    JavaType localJavaType2 = resolveType(paramDeserializationConfig, paramBasicBeanDescription, localJavaType1, paramAnnotatedField, localStd);
    if (localJavaType2 != localJavaType1)
      localStd = localStd.withType(localJavaType2);
    JsonDeserializer localJsonDeserializer = findDeserializerFromAnnotation(paramDeserializationConfig, paramAnnotatedField, localStd);
    JavaType localJavaType3 = modifyTypeByAnnotation(paramDeserializationConfig, paramAnnotatedField, localJavaType2, paramString);
    Object localObject = new SettableBeanProperty.FieldProperty(paramString, localJavaType3, (TypeDeserializer)localJavaType3.getTypeHandler(), paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedField);
    if (localJsonDeserializer != null)
      localObject = ((SettableBeanProperty)localObject).withValueDeserializer(localJsonDeserializer);
    AnnotationIntrospector.ReferenceProperty localReferenceProperty = paramDeserializationConfig.getAnnotationIntrospector().findReferenceType(paramAnnotatedField);
    if ((localReferenceProperty != null) && (localReferenceProperty.isManagedReference()))
      ((SettableBeanProperty)localObject).setManagedReferenceName(localReferenceProperty.getName());
    return localObject;
  }

  protected SettableBeanProperty constructSettableProperty(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, String paramString, AnnotatedMethod paramAnnotatedMethod)
    throws JsonMappingException
  {
    if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS))
      paramAnnotatedMethod.fixAccess();
    JavaType localJavaType1 = paramBasicBeanDescription.bindingsForBeanType().resolveType(paramAnnotatedMethod.getParameterType(0));
    BeanProperty.Std localStd = new BeanProperty.Std(paramString, localJavaType1, paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedMethod);
    JavaType localJavaType2 = resolveType(paramDeserializationConfig, paramBasicBeanDescription, localJavaType1, paramAnnotatedMethod, localStd);
    if (localJavaType2 != localJavaType1)
      localStd = localStd.withType(localJavaType2);
    JsonDeserializer localJsonDeserializer = findDeserializerFromAnnotation(paramDeserializationConfig, paramAnnotatedMethod, localStd);
    JavaType localJavaType3 = modifyTypeByAnnotation(paramDeserializationConfig, paramAnnotatedMethod, localJavaType2, paramString);
    Object localObject = new SettableBeanProperty.MethodProperty(paramString, localJavaType3, (TypeDeserializer)localJavaType3.getTypeHandler(), paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedMethod);
    if (localJsonDeserializer != null)
      localObject = ((SettableBeanProperty)localObject).withValueDeserializer(localJsonDeserializer);
    AnnotationIntrospector.ReferenceProperty localReferenceProperty = paramDeserializationConfig.getAnnotationIntrospector().findReferenceType(paramAnnotatedMethod);
    if ((localReferenceProperty != null) && (localReferenceProperty.isManagedReference()))
      ((SettableBeanProperty)localObject).setManagedReferenceName(localReferenceProperty.getName());
    return localObject;
  }

  protected SettableBeanProperty constructSetterlessProperty(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, String paramString, AnnotatedMethod paramAnnotatedMethod)
    throws JsonMappingException
  {
    if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS))
      paramAnnotatedMethod.fixAccess();
    JavaType localJavaType1 = paramAnnotatedMethod.getType(paramBasicBeanDescription.bindingsForBeanType());
    JsonDeserializer localJsonDeserializer = findDeserializerFromAnnotation(paramDeserializationConfig, paramAnnotatedMethod, new BeanProperty.Std(paramString, localJavaType1, paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedMethod));
    JavaType localJavaType2 = modifyTypeByAnnotation(paramDeserializationConfig, paramAnnotatedMethod, localJavaType1, paramString);
    Object localObject = new SettableBeanProperty.SetterlessProperty(paramString, localJavaType2, (TypeDeserializer)localJavaType2.getTypeHandler(), paramBasicBeanDescription.getClassAnnotations(), paramAnnotatedMethod);
    if (localJsonDeserializer != null)
      localObject = ((SettableBeanProperty)localObject).withValueDeserializer(localJsonDeserializer);
    return localObject;
  }

  public JsonDeserializer<Object> createBeanDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    if (paramJavaType.isAbstract())
      paramJavaType = mapAbstractType(paramDeserializationConfig, paramJavaType);
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspect(paramJavaType);
    JsonDeserializer localJsonDeserializer1 = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    JavaType localJavaType1 = modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramJavaType, null);
    if (localJavaType1.getRawClass() != paramJavaType.getRawClass())
    {
      paramJavaType = localJavaType1;
      localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspect(paramJavaType);
    }
    JsonDeserializer localJsonDeserializer2 = _findCustomBeanDeserializer(paramJavaType, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty);
    if (localJsonDeserializer2 != null)
      return localJsonDeserializer2;
    if (paramJavaType.isThrowable())
      return buildThrowableDeserializer(paramDeserializationConfig, paramJavaType, localBasicBeanDescription, paramBeanProperty);
    if (paramJavaType.isAbstract())
    {
      JavaType localJavaType2 = materializeAbstractType(paramDeserializationConfig, localBasicBeanDescription);
      if (localJavaType2 != null)
        return buildBeanDeserializer(paramDeserializationConfig, localJavaType2, (BasicBeanDescription)paramDeserializationConfig.introspect(localJavaType2), paramBeanProperty);
    }
    JsonDeserializer localJsonDeserializer3 = findStdBeanDeserializer(paramDeserializationConfig, paramDeserializerProvider, paramJavaType, paramBeanProperty);
    if (localJsonDeserializer3 != null)
      return localJsonDeserializer3;
    if (!isPotentialBeanType(paramJavaType.getRawClass()))
      return null;
    return buildBeanDeserializer(paramDeserializationConfig, paramJavaType, localBasicBeanDescription, paramBeanProperty);
  }

  public KeyDeserializer createKeyDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    KeyDeserializer localKeyDeserializer1;
    if (this._factoryConfig.hasKeyDeserializers())
    {
      BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectClassAnnotations(paramJavaType.getRawClass());
      Iterator localIterator = this._factoryConfig.keyDeserializers().iterator();
      while (localIterator.hasNext())
      {
        KeyDeserializer localKeyDeserializer2 = ((KeyDeserializers)localIterator.next()).findKeyDeserializer(paramJavaType, paramDeserializationConfig, localBasicBeanDescription, paramBeanProperty);
        if (localKeyDeserializer2 != null)
          localKeyDeserializer1 = localKeyDeserializer2;
      }
    }
    do
    {
      return localKeyDeserializer1;
      Class localClass = paramJavaType.getRawClass();
      if ((localClass == String.class) || (localClass == Object.class))
        return StdKeyDeserializers.constructStringKeyDeserializer(paramDeserializationConfig, paramJavaType);
      localKeyDeserializer1 = (KeyDeserializer)_keyDeserializers.get(paramJavaType);
    }
    while (localKeyDeserializer1 != null);
    if (paramJavaType.isEnumType())
      return _createEnumKeyDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
    return StdKeyDeserializers.findStringBasedKeyDeserializer(paramDeserializationConfig, paramJavaType);
  }

  public ValueInstantiator findValueInstantiator(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription)
    throws JsonMappingException
  {
    AnnotatedClass localAnnotatedClass = paramBasicBeanDescription.getClassInfo();
    Object localObject = paramDeserializationConfig.getAnnotationIntrospector().findValueInstantiator(localAnnotatedClass);
    ValueInstantiator localValueInstantiator;
    if (localObject != null)
      if ((localObject instanceof ValueInstantiator))
        localValueInstantiator = (ValueInstantiator)localObject;
    while (this._factoryConfig.hasValueInstantiators())
    {
      Iterator localIterator = this._factoryConfig.valueInstantiators().iterator();
      ValueInstantiators localValueInstantiators;
      do
      {
        if (!localIterator.hasNext())
          break;
        localValueInstantiators = (ValueInstantiators)localIterator.next();
        localValueInstantiator = localValueInstantiators.findValueInstantiator(paramDeserializationConfig, paramBasicBeanDescription, localValueInstantiator);
      }
      while (localValueInstantiator != null);
      throw new JsonMappingException("Broken registered ValueInstantiators (of type " + localValueInstantiators.getClass().getName() + "): returned null ValueInstantiator");
      if (!(localObject instanceof Class))
        throw new IllegalStateException("Invalid value instantiator returned for type " + paramBasicBeanDescription + ": neither a Class nor ValueInstantiator");
      Class localClass = (Class)localObject;
      if (!ValueInstantiator.class.isAssignableFrom(localClass))
        throw new IllegalStateException("Invalid instantiator Class<?> returned for type " + paramBasicBeanDescription + ": " + localClass.getName() + " not a ValueInstantiator");
      localValueInstantiator = paramDeserializationConfig.valueInstantiatorInstance(localAnnotatedClass, localClass);
      continue;
      localValueInstantiator = constructDefaultValueInstantiator(paramDeserializationConfig, paramBasicBeanDescription);
    }
    return localValueInstantiator;
  }

  public final DeserializerFactory.Config getConfig()
  {
    return this._factoryConfig;
  }

  protected boolean isIgnorableType(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, Class<?> paramClass, Map<Class<?>, Boolean> paramMap)
  {
    Boolean localBoolean = (Boolean)paramMap.get(paramClass);
    if (localBoolean == null)
    {
      BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectClassAnnotations(paramClass);
      localBoolean = paramDeserializationConfig.getAnnotationIntrospector().isIgnorableType(localBasicBeanDescription.getClassInfo());
      if (localBoolean == null)
        localBoolean = Boolean.FALSE;
    }
    return localBoolean.booleanValue();
  }

  protected boolean isPotentialBeanType(Class<?> paramClass)
  {
    String str1 = ClassUtil.canBeABeanType(paramClass);
    if (str1 != null)
      throw new IllegalArgumentException("Can not deserialize Class " + paramClass.getName() + " (of type " + str1 + ") as a Bean");
    if (ClassUtil.isProxyType(paramClass))
      throw new IllegalArgumentException("Can not deserialize Proxy class " + paramClass.getName() + " as a Bean");
    String str2 = ClassUtil.isLocalType(paramClass, true);
    if (str2 != null)
      throw new IllegalArgumentException("Can not deserialize Class " + paramClass.getName() + " (of type " + str2 + ") as a Bean");
    return true;
  }

  public JavaType mapAbstractType(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
    throws JsonMappingException
  {
    while (true)
    {
      JavaType localJavaType = _mapAbstractType2(paramDeserializationConfig, paramJavaType);
      if (localJavaType == null)
        return paramJavaType;
      Class localClass1 = paramJavaType.getRawClass();
      Class localClass2 = localJavaType.getRawClass();
      if ((localClass1 == localClass2) || (!localClass1.isAssignableFrom(localClass2)))
        throw new IllegalArgumentException("Invalid abstract type resolution from " + paramJavaType + " to " + localJavaType + ": latter is not a subtype of former");
      paramJavaType = localJavaType;
    }
  }

  protected JavaType materializeAbstractType(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription)
    throws JsonMappingException
  {
    JavaType localJavaType1 = paramBasicBeanDescription.getType();
    Iterator localIterator = this._factoryConfig.abstractTypeResolvers().iterator();
    while (localIterator.hasNext())
    {
      JavaType localJavaType2 = ((AbstractTypeResolver)localIterator.next()).resolveAbstractType(paramDeserializationConfig, localJavaType1);
      if (localJavaType2 != null)
        return localJavaType2;
    }
    return null;
  }

  public DeserializerFactory withConfig(DeserializerFactory.Config paramConfig)
  {
    if (this._factoryConfig == paramConfig)
      return this;
    if (getClass() != BeanDeserializerFactory.class)
      throw new IllegalStateException("Subtype of BeanDeserializerFactory (" + getClass().getName() + ") has not properly overridden method 'withAdditionalDeserializers': can not instantiate subtype with " + "additional deserializer definitions");
    return new BeanDeserializerFactory(paramConfig);
  }

  public static class ConfigImpl extends DeserializerFactory.Config
  {
    protected static final AbstractTypeResolver[] NO_ABSTRACT_TYPE_RESOLVERS = new AbstractTypeResolver[0];
    protected static final KeyDeserializers[] NO_KEY_DESERIALIZERS = new KeyDeserializers[0];
    protected static final BeanDeserializerModifier[] NO_MODIFIERS = new BeanDeserializerModifier[0];
    protected static final ValueInstantiators[] NO_VALUE_INSTANTIATORS = new ValueInstantiators[0];
    protected final AbstractTypeResolver[] _abstractTypeResolvers;
    protected final Deserializers[] _additionalDeserializers;
    protected final KeyDeserializers[] _additionalKeyDeserializers;
    protected final BeanDeserializerModifier[] _modifiers;
    protected final ValueInstantiators[] _valueInstantiators;

    public ConfigImpl()
    {
      this(null, null, null, null, null);
    }

    protected ConfigImpl(Deserializers[] paramArrayOfDeserializers, KeyDeserializers[] paramArrayOfKeyDeserializers, BeanDeserializerModifier[] paramArrayOfBeanDeserializerModifier, AbstractTypeResolver[] paramArrayOfAbstractTypeResolver, ValueInstantiators[] paramArrayOfValueInstantiators)
    {
      if (paramArrayOfDeserializers == null)
        paramArrayOfDeserializers = BeanDeserializerFactory.NO_DESERIALIZERS;
      this._additionalDeserializers = paramArrayOfDeserializers;
      if (paramArrayOfKeyDeserializers == null)
        paramArrayOfKeyDeserializers = NO_KEY_DESERIALIZERS;
      this._additionalKeyDeserializers = paramArrayOfKeyDeserializers;
      if (paramArrayOfBeanDeserializerModifier == null)
        paramArrayOfBeanDeserializerModifier = NO_MODIFIERS;
      this._modifiers = paramArrayOfBeanDeserializerModifier;
      if (paramArrayOfAbstractTypeResolver == null)
        paramArrayOfAbstractTypeResolver = NO_ABSTRACT_TYPE_RESOLVERS;
      this._abstractTypeResolvers = paramArrayOfAbstractTypeResolver;
      if (paramArrayOfValueInstantiators == null)
        paramArrayOfValueInstantiators = NO_VALUE_INSTANTIATORS;
      this._valueInstantiators = paramArrayOfValueInstantiators;
    }

    public Iterable<AbstractTypeResolver> abstractTypeResolvers()
    {
      return ArrayBuilders.arrayAsIterable(this._abstractTypeResolvers);
    }

    public Iterable<BeanDeserializerModifier> deserializerModifiers()
    {
      return ArrayBuilders.arrayAsIterable(this._modifiers);
    }

    public Iterable<Deserializers> deserializers()
    {
      return ArrayBuilders.arrayAsIterable(this._additionalDeserializers);
    }

    public boolean hasAbstractTypeResolvers()
    {
      return this._abstractTypeResolvers.length > 0;
    }

    public boolean hasDeserializerModifiers()
    {
      return this._modifiers.length > 0;
    }

    public boolean hasDeserializers()
    {
      return this._additionalDeserializers.length > 0;
    }

    public boolean hasKeyDeserializers()
    {
      return this._additionalKeyDeserializers.length > 0;
    }

    public boolean hasValueInstantiators()
    {
      return this._valueInstantiators.length > 0;
    }

    public Iterable<KeyDeserializers> keyDeserializers()
    {
      return ArrayBuilders.arrayAsIterable(this._additionalKeyDeserializers);
    }

    public Iterable<ValueInstantiators> valueInstantiators()
    {
      return ArrayBuilders.arrayAsIterable(this._valueInstantiators);
    }

    public DeserializerFactory.Config withAbstractTypeResolver(AbstractTypeResolver paramAbstractTypeResolver)
    {
      if (paramAbstractTypeResolver == null)
        throw new IllegalArgumentException("Can not pass null resolver");
      AbstractTypeResolver[] arrayOfAbstractTypeResolver = (AbstractTypeResolver[])ArrayBuilders.insertInListNoDup(this._abstractTypeResolvers, paramAbstractTypeResolver);
      return new ConfigImpl(this._additionalDeserializers, this._additionalKeyDeserializers, this._modifiers, arrayOfAbstractTypeResolver, this._valueInstantiators);
    }

    public DeserializerFactory.Config withAdditionalDeserializers(Deserializers paramDeserializers)
    {
      if (paramDeserializers == null)
        throw new IllegalArgumentException("Can not pass null Deserializers");
      return new ConfigImpl((Deserializers[])ArrayBuilders.insertInListNoDup(this._additionalDeserializers, paramDeserializers), this._additionalKeyDeserializers, this._modifiers, this._abstractTypeResolvers, this._valueInstantiators);
    }

    public DeserializerFactory.Config withAdditionalKeyDeserializers(KeyDeserializers paramKeyDeserializers)
    {
      if (paramKeyDeserializers == null)
        throw new IllegalArgumentException("Can not pass null KeyDeserializers");
      KeyDeserializers[] arrayOfKeyDeserializers = (KeyDeserializers[])ArrayBuilders.insertInListNoDup(this._additionalKeyDeserializers, paramKeyDeserializers);
      return new ConfigImpl(this._additionalDeserializers, arrayOfKeyDeserializers, this._modifiers, this._abstractTypeResolvers, this._valueInstantiators);
    }

    public DeserializerFactory.Config withDeserializerModifier(BeanDeserializerModifier paramBeanDeserializerModifier)
    {
      if (paramBeanDeserializerModifier == null)
        throw new IllegalArgumentException("Can not pass null modifier");
      BeanDeserializerModifier[] arrayOfBeanDeserializerModifier = (BeanDeserializerModifier[])ArrayBuilders.insertInListNoDup(this._modifiers, paramBeanDeserializerModifier);
      return new ConfigImpl(this._additionalDeserializers, this._additionalKeyDeserializers, arrayOfBeanDeserializerModifier, this._abstractTypeResolvers, this._valueInstantiators);
    }

    public DeserializerFactory.Config withValueInstantiators(ValueInstantiators paramValueInstantiators)
    {
      if (paramValueInstantiators == null)
        throw new IllegalArgumentException("Can not pass null resolver");
      ValueInstantiators[] arrayOfValueInstantiators = (ValueInstantiators[])ArrayBuilders.insertInListNoDup(this._valueInstantiators, paramValueInstantiators);
      return new ConfigImpl(this._additionalDeserializers, this._additionalKeyDeserializers, this._modifiers, this._abstractTypeResolvers, arrayOfValueInstantiators);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.BeanDeserializerFactory
 * JD-Core Version:    0.6.2
 */