package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.ContextualDeserializer;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializerFactory;
import com.flurry.org.codehaus.jackson.map.DeserializerFactory.Config;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer.None;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.KeyDeserializer;
import com.flurry.org.codehaus.jackson.map.KeyDeserializer.None;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.AtomicReferenceDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.CollectionDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.EnumDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.EnumMapDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.EnumSetDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.JsonNodeDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.MapDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.ObjectArrayDeserializer;
import com.flurry.org.codehaus.jackson.map.deser.std.PrimitiveArrayDeserializers;
import com.flurry.org.codehaus.jackson.map.deser.std.StdKeyDeserializers;
import com.flurry.org.codehaus.jackson.map.deser.std.StringCollectionDeserializer;
import com.flurry.org.codehaus.jackson.map.ext.OptionalHandlerFactory;
import com.flurry.org.codehaus.jackson.map.introspect.Annotated;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedClass;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMember;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMethod;
import com.flurry.org.codehaus.jackson.map.introspect.BasicBeanDescription;
import com.flurry.org.codehaus.jackson.map.jsontype.SubtypeResolver;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import com.flurry.org.codehaus.jackson.map.type.ArrayType;
import com.flurry.org.codehaus.jackson.map.type.ClassKey;
import com.flurry.org.codehaus.jackson.map.type.CollectionLikeType;
import com.flurry.org.codehaus.jackson.map.type.CollectionType;
import com.flurry.org.codehaus.jackson.map.type.MapLikeType;
import com.flurry.org.codehaus.jackson.map.type.MapType;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.map.util.EnumResolver;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.util.ArrayList;
import java.util.Collection;
import java.util.EnumMap;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicReference;

public abstract class BasicDeserializerFactory extends DeserializerFactory
{
  protected static final HashMap<JavaType, JsonDeserializer<Object>> _arrayDeserializers;
  static final HashMap<String, Class<? extends Collection>> _collectionFallbacks;
  static final HashMap<JavaType, KeyDeserializer> _keyDeserializers;
  static final HashMap<String, Class<? extends Map>> _mapFallbacks;
  static final HashMap<ClassKey, JsonDeserializer<Object>> _simpleDeserializers = StdDeserializers.constructAll();
  protected OptionalHandlerFactory optionalHandlers = OptionalHandlerFactory.instance;

  static
  {
    _keyDeserializers = StdKeyDeserializers.constructAll();
    _mapFallbacks = new HashMap();
    _mapFallbacks.put(Map.class.getName(), LinkedHashMap.class);
    _mapFallbacks.put(ConcurrentMap.class.getName(), ConcurrentHashMap.class);
    _mapFallbacks.put(SortedMap.class.getName(), TreeMap.class);
    _mapFallbacks.put("java.util.NavigableMap", TreeMap.class);
    try
    {
      Class localClass1 = Class.forName("java.util.ConcurrentNavigableMap");
      Class localClass2 = Class.forName("java.util.ConcurrentSkipListMap");
      _mapFallbacks.put(localClass1.getName(), localClass2);
      label103: _collectionFallbacks = new HashMap();
      _collectionFallbacks.put(Collection.class.getName(), ArrayList.class);
      _collectionFallbacks.put(List.class.getName(), ArrayList.class);
      _collectionFallbacks.put(Set.class.getName(), HashSet.class);
      _collectionFallbacks.put(SortedSet.class.getName(), TreeSet.class);
      _collectionFallbacks.put(Queue.class.getName(), LinkedList.class);
      _collectionFallbacks.put("java.util.Deque", LinkedList.class);
      _collectionFallbacks.put("java.util.NavigableSet", TreeSet.class);
      _arrayDeserializers = PrimitiveArrayDeserializers.getAll();
      return;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      break label103;
    }
  }

  JsonDeserializer<Object> _constructDeserializer(DeserializationConfig paramDeserializationConfig, Annotated paramAnnotated, BeanProperty paramBeanProperty, Object paramObject)
    throws JsonMappingException
  {
    JsonDeserializer localJsonDeserializer;
    if ((paramObject instanceof JsonDeserializer))
    {
      localJsonDeserializer = (JsonDeserializer)paramObject;
      if ((localJsonDeserializer instanceof ContextualDeserializer))
        localJsonDeserializer = ((ContextualDeserializer)localJsonDeserializer).createContextual(paramDeserializationConfig, paramBeanProperty);
    }
    do
    {
      return localJsonDeserializer;
      if (!(paramObject instanceof Class))
        throw new IllegalStateException("AnnotationIntrospector returned deserializer definition of type " + paramObject.getClass().getName() + "; expected type JsonDeserializer or Class<JsonDeserializer> instead");
      Class localClass = (Class)paramObject;
      if (!JsonDeserializer.class.isAssignableFrom(localClass))
        throw new IllegalStateException("AnnotationIntrospector returned Class " + localClass.getName() + "; expected Class<JsonDeserializer>");
      localJsonDeserializer = paramDeserializationConfig.deserializerInstance(paramAnnotated, localClass);
    }
    while (!(localJsonDeserializer instanceof ContextualDeserializer));
    return ((ContextualDeserializer)localJsonDeserializer).createContextual(paramDeserializationConfig, paramBeanProperty);
  }

  protected abstract JsonDeserializer<?> _findCustomArrayDeserializer(ArrayType paramArrayType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;

  protected abstract JsonDeserializer<?> _findCustomCollectionDeserializer(CollectionType paramCollectionType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;

  protected abstract JsonDeserializer<?> _findCustomCollectionLikeDeserializer(CollectionLikeType paramCollectionLikeType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;

  protected abstract JsonDeserializer<?> _findCustomEnumDeserializer(Class<?> paramClass, DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException;

  protected abstract JsonDeserializer<?> _findCustomMapDeserializer(MapType paramMapType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, KeyDeserializer paramKeyDeserializer, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;

  protected abstract JsonDeserializer<?> _findCustomMapLikeDeserializer(MapLikeType paramMapLikeType, DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty, KeyDeserializer paramKeyDeserializer, TypeDeserializer paramTypeDeserializer, JsonDeserializer<?> paramJsonDeserializer)
    throws JsonMappingException;

  protected abstract JsonDeserializer<?> _findCustomTreeNodeDeserializer(Class<? extends JsonNode> paramClass, DeserializationConfig paramDeserializationConfig, BeanProperty paramBeanProperty)
    throws JsonMappingException;

  protected EnumResolver<?> constructEnumResolver(Class<?> paramClass, DeserializationConfig paramDeserializationConfig)
  {
    if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.READ_ENUMS_USING_TO_STRING))
      return EnumResolver.constructUnsafeUsingToString(paramClass);
    return EnumResolver.constructUnsafe(paramClass, paramDeserializationConfig.getAnnotationIntrospector());
  }

  public JsonDeserializer<?> createArrayDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, ArrayType paramArrayType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JavaType localJavaType = paramArrayType.getContentType();
    JsonDeserializer localJsonDeserializer1 = (JsonDeserializer)localJavaType.getValueHandler();
    if (localJsonDeserializer1 == null)
    {
      Object localObject = (JsonDeserializer)_arrayDeserializers.get(localJavaType);
      if (localObject != null)
      {
        JsonDeserializer localJsonDeserializer3 = _findCustomArrayDeserializer(paramArrayType, paramDeserializationConfig, paramDeserializerProvider, paramBeanProperty, null, null);
        if (localJsonDeserializer3 != null)
          localObject = localJsonDeserializer3;
        return localObject;
      }
      if (localJavaType.isPrimitive())
        throw new IllegalArgumentException("Internal error: primitive type (" + paramArrayType + ") passed, no array deserializer found");
    }
    TypeDeserializer localTypeDeserializer = (TypeDeserializer)localJavaType.getTypeHandler();
    if (localTypeDeserializer == null)
      localTypeDeserializer = findTypeDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    JsonDeserializer localJsonDeserializer2 = _findCustomArrayDeserializer(paramArrayType, paramDeserializationConfig, paramDeserializerProvider, paramBeanProperty, localTypeDeserializer, localJsonDeserializer1);
    if (localJsonDeserializer2 != null)
      return localJsonDeserializer2;
    if (localJsonDeserializer1 == null)
      localJsonDeserializer1 = paramDeserializerProvider.findValueDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    return new ObjectArrayDeserializer(paramArrayType, localJsonDeserializer1, localTypeDeserializer);
  }

  public JsonDeserializer<?> createCollectionDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, CollectionType paramCollectionType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    CollectionType localCollectionType1 = (CollectionType)mapAbstractType(paramDeserializationConfig, paramCollectionType);
    Class localClass1 = localCollectionType1.getRawClass();
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(localCollectionType1);
    JsonDeserializer localJsonDeserializer1 = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    CollectionType localCollectionType2 = (CollectionType)modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), localCollectionType1, null);
    JavaType localJavaType = localCollectionType2.getContentType();
    JsonDeserializer localJsonDeserializer2 = (JsonDeserializer)localJavaType.getValueHandler();
    TypeDeserializer localTypeDeserializer = (TypeDeserializer)localJavaType.getTypeHandler();
    if (localTypeDeserializer == null)
      localTypeDeserializer = findTypeDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    JsonDeserializer localJsonDeserializer3 = _findCustomCollectionDeserializer(localCollectionType2, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty, localTypeDeserializer, localJsonDeserializer2);
    if (localJsonDeserializer3 != null)
      return localJsonDeserializer3;
    if (localJsonDeserializer2 == null)
    {
      if (EnumSet.class.isAssignableFrom(localClass1))
        return new EnumSetDeserializer(localJavaType.getRawClass(), createEnumDeserializer(paramDeserializationConfig, paramDeserializerProvider, localJavaType, paramBeanProperty));
      localJsonDeserializer2 = paramDeserializerProvider.findValueDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    }
    if ((localCollectionType2.isInterface()) || (localCollectionType2.isAbstract()))
    {
      Class localClass2 = (Class)_collectionFallbacks.get(localClass1.getName());
      if (localClass2 == null)
        throw new IllegalArgumentException("Can not find a deserializer for non-concrete Collection type " + localCollectionType2);
      localCollectionType2 = (CollectionType)paramDeserializationConfig.constructSpecializedType(localCollectionType2, localClass2);
      localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(localCollectionType2);
    }
    ValueInstantiator localValueInstantiator = findValueInstantiator(paramDeserializationConfig, localBasicBeanDescription);
    if (localJavaType.getRawClass() == String.class)
      return new StringCollectionDeserializer(localCollectionType2, localJsonDeserializer2, localValueInstantiator);
    return new CollectionDeserializer(localCollectionType2, localJsonDeserializer2, localTypeDeserializer, localValueInstantiator);
  }

  public JsonDeserializer<?> createCollectionLikeDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, CollectionLikeType paramCollectionLikeType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    CollectionLikeType localCollectionLikeType1 = (CollectionLikeType)mapAbstractType(paramDeserializationConfig, paramCollectionLikeType);
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectClassAnnotations(localCollectionLikeType1.getRawClass());
    JsonDeserializer localJsonDeserializer1 = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    CollectionLikeType localCollectionLikeType2 = (CollectionLikeType)modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), localCollectionLikeType1, null);
    JavaType localJavaType = localCollectionLikeType2.getContentType();
    JsonDeserializer localJsonDeserializer2 = (JsonDeserializer)localJavaType.getValueHandler();
    TypeDeserializer localTypeDeserializer = (TypeDeserializer)localJavaType.getTypeHandler();
    if (localTypeDeserializer == null)
      localTypeDeserializer = findTypeDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    return _findCustomCollectionLikeDeserializer(localCollectionLikeType2, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty, localTypeDeserializer, localJsonDeserializer2);
  }

  public JsonDeserializer<?> createEnumDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(paramJavaType);
    JsonDeserializer localJsonDeserializer1 = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    Class localClass = paramJavaType.getRawClass();
    JsonDeserializer localJsonDeserializer2 = _findCustomEnumDeserializer(localClass, paramDeserializationConfig, localBasicBeanDescription, paramBeanProperty);
    if (localJsonDeserializer2 != null)
      return localJsonDeserializer2;
    Iterator localIterator = localBasicBeanDescription.getFactoryMethods().iterator();
    while (localIterator.hasNext())
    {
      AnnotatedMethod localAnnotatedMethod = (AnnotatedMethod)localIterator.next();
      if (paramDeserializationConfig.getAnnotationIntrospector().hasCreatorAnnotation(localAnnotatedMethod))
      {
        if ((localAnnotatedMethod.getParameterCount() == 1) && (localAnnotatedMethod.getRawType().isAssignableFrom(localClass)))
          return EnumDeserializer.deserializerForCreator(paramDeserializationConfig, localClass, localAnnotatedMethod);
        throw new IllegalArgumentException("Unsuitable method (" + localAnnotatedMethod + ") decorated with @JsonCreator (for Enum type " + localClass.getName() + ")");
      }
    }
    return new EnumDeserializer(constructEnumResolver(localClass, paramDeserializationConfig));
  }

  public JsonDeserializer<?> createMapDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, MapType paramMapType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    MapType localMapType1 = (MapType)mapAbstractType(paramDeserializationConfig, paramMapType);
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(localMapType1);
    JsonDeserializer localJsonDeserializer1 = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    MapType localMapType2 = (MapType)modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), localMapType1, null);
    JavaType localJavaType1 = localMapType2.getKeyType();
    JavaType localJavaType2 = localMapType2.getContentType();
    JsonDeserializer localJsonDeserializer2 = (JsonDeserializer)localJavaType2.getValueHandler();
    KeyDeserializer localKeyDeserializer = (KeyDeserializer)localJavaType1.getValueHandler();
    if (localKeyDeserializer == null)
      localKeyDeserializer = paramDeserializerProvider.findKeyDeserializer(paramDeserializationConfig, localJavaType1, paramBeanProperty);
    TypeDeserializer localTypeDeserializer = (TypeDeserializer)localJavaType2.getTypeHandler();
    if (localTypeDeserializer == null)
      localTypeDeserializer = findTypeDeserializer(paramDeserializationConfig, localJavaType2, paramBeanProperty);
    JsonDeserializer localJsonDeserializer3 = _findCustomMapDeserializer(localMapType2, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty, localKeyDeserializer, localTypeDeserializer, localJsonDeserializer2);
    if (localJsonDeserializer3 != null)
      return localJsonDeserializer3;
    if (localJsonDeserializer2 == null)
      localJsonDeserializer2 = paramDeserializerProvider.findValueDeserializer(paramDeserializationConfig, localJavaType2, paramBeanProperty);
    Class localClass1 = localMapType2.getRawClass();
    if (EnumMap.class.isAssignableFrom(localClass1))
    {
      Class localClass3 = localJavaType1.getRawClass();
      if ((localClass3 == null) || (!localClass3.isEnum()))
        throw new IllegalArgumentException("Can not construct EnumMap; generic (key) type not available");
      EnumMapDeserializer localEnumMapDeserializer = new EnumMapDeserializer(localJavaType1.getRawClass(), createEnumDeserializer(paramDeserializationConfig, paramDeserializerProvider, localJavaType1, paramBeanProperty), localJsonDeserializer2);
      return localEnumMapDeserializer;
    }
    if ((localMapType2.isInterface()) || (localMapType2.isAbstract()))
    {
      Class localClass2 = (Class)_mapFallbacks.get(localClass1.getName());
      if (localClass2 == null)
        throw new IllegalArgumentException("Can not find a deserializer for non-concrete Map type " + localMapType2);
      localMapType2 = (MapType)paramDeserializationConfig.constructSpecializedType(localMapType2, localClass2);
      localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(localMapType2);
    }
    ValueInstantiator localValueInstantiator = findValueInstantiator(paramDeserializationConfig, localBasicBeanDescription);
    MapDeserializer localMapDeserializer = new MapDeserializer(localMapType2, localValueInstantiator, localKeyDeserializer, localJsonDeserializer2, localTypeDeserializer);
    localMapDeserializer.setIgnorableProperties(paramDeserializationConfig.getAnnotationIntrospector().findPropertiesToIgnore(localBasicBeanDescription.getClassInfo()));
    return localMapDeserializer;
  }

  public JsonDeserializer<?> createMapLikeDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, MapLikeType paramMapLikeType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    MapLikeType localMapLikeType1 = (MapLikeType)mapAbstractType(paramDeserializationConfig, paramMapLikeType);
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramDeserializationConfig.introspectForCreation(localMapLikeType1);
    JsonDeserializer localJsonDeserializer1 = findDeserializerFromAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    MapLikeType localMapLikeType2 = (MapLikeType)modifyTypeByAnnotation(paramDeserializationConfig, localBasicBeanDescription.getClassInfo(), localMapLikeType1, null);
    JavaType localJavaType1 = localMapLikeType2.getKeyType();
    JavaType localJavaType2 = localMapLikeType2.getContentType();
    JsonDeserializer localJsonDeserializer2 = (JsonDeserializer)localJavaType2.getValueHandler();
    KeyDeserializer localKeyDeserializer = (KeyDeserializer)localJavaType1.getValueHandler();
    if (localKeyDeserializer == null)
      localKeyDeserializer = paramDeserializerProvider.findKeyDeserializer(paramDeserializationConfig, localJavaType1, paramBeanProperty);
    TypeDeserializer localTypeDeserializer = (TypeDeserializer)localJavaType2.getTypeHandler();
    if (localTypeDeserializer == null)
      localTypeDeserializer = findTypeDeserializer(paramDeserializationConfig, localJavaType2, paramBeanProperty);
    return _findCustomMapLikeDeserializer(localMapLikeType2, paramDeserializationConfig, paramDeserializerProvider, localBasicBeanDescription, paramBeanProperty, localKeyDeserializer, localTypeDeserializer, localJsonDeserializer2);
  }

  public JsonDeserializer<?> createTreeDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Class localClass = paramJavaType.getRawClass();
    JsonDeserializer localJsonDeserializer = _findCustomTreeNodeDeserializer(localClass, paramDeserializationConfig, paramBeanProperty);
    if (localJsonDeserializer != null)
      return localJsonDeserializer;
    return JsonNodeDeserializer.getDeserializer(localClass);
  }

  protected JsonDeserializer<Object> findDeserializerFromAnnotation(DeserializationConfig paramDeserializationConfig, Annotated paramAnnotated, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Object localObject = paramDeserializationConfig.getAnnotationIntrospector().findDeserializer(paramAnnotated);
    if (localObject != null)
      return _constructDeserializer(paramDeserializationConfig, paramAnnotated, paramBeanProperty, localObject);
    return null;
  }

  public TypeDeserializer findPropertyContentTypeDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, AnnotatedMember paramAnnotatedMember, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    TypeResolverBuilder localTypeResolverBuilder = localAnnotationIntrospector.findPropertyContentTypeResolver(paramDeserializationConfig, paramAnnotatedMember, paramJavaType);
    JavaType localJavaType = paramJavaType.getContentType();
    if (localTypeResolverBuilder == null)
      return findTypeDeserializer(paramDeserializationConfig, localJavaType, paramBeanProperty);
    return localTypeResolverBuilder.buildTypeDeserializer(paramDeserializationConfig, localJavaType, paramDeserializationConfig.getSubtypeResolver().collectAndResolveSubtypes(paramAnnotatedMember, paramDeserializationConfig, localAnnotationIntrospector), paramBeanProperty);
  }

  public TypeDeserializer findPropertyTypeDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, AnnotatedMember paramAnnotatedMember, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    TypeResolverBuilder localTypeResolverBuilder = localAnnotationIntrospector.findPropertyTypeResolver(paramDeserializationConfig, paramAnnotatedMember, paramJavaType);
    if (localTypeResolverBuilder == null)
      return findTypeDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
    return localTypeResolverBuilder.buildTypeDeserializer(paramDeserializationConfig, paramJavaType, paramDeserializationConfig.getSubtypeResolver().collectAndResolveSubtypes(paramAnnotatedMember, paramDeserializationConfig, localAnnotationIntrospector), paramBeanProperty);
  }

  protected JsonDeserializer<Object> findStdBeanDeserializer(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Class localClass = paramJavaType.getRawClass();
    JsonDeserializer localJsonDeserializer1 = (JsonDeserializer)_simpleDeserializers.get(new ClassKey(localClass));
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    if (AtomicReference.class.isAssignableFrom(localClass))
    {
      JavaType[] arrayOfJavaType = paramDeserializationConfig.getTypeFactory().findTypeParameters(paramJavaType, AtomicReference.class);
      if ((arrayOfJavaType == null) || (arrayOfJavaType.length < 1));
      for (JavaType localJavaType = TypeFactory.unknownType(); ; localJavaType = arrayOfJavaType[0])
        return new AtomicReferenceDeserializer(localJavaType, paramBeanProperty);
    }
    JsonDeserializer localJsonDeserializer2 = this.optionalHandlers.findDeserializer(paramJavaType, paramDeserializationConfig, paramDeserializerProvider);
    if (localJsonDeserializer2 != null)
      return localJsonDeserializer2;
    return null;
  }

  public TypeDeserializer findTypeDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    AnnotatedClass localAnnotatedClass = ((BasicBeanDescription)paramDeserializationConfig.introspectClassAnnotations(paramJavaType.getRawClass())).getClassInfo();
    AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
    TypeResolverBuilder localTypeResolverBuilder = localAnnotationIntrospector.findTypeResolver(paramDeserializationConfig, localAnnotatedClass, paramJavaType);
    Collection localCollection;
    if (localTypeResolverBuilder == null)
    {
      localTypeResolverBuilder = paramDeserializationConfig.getDefaultTyper(paramJavaType);
      localCollection = null;
      if (localTypeResolverBuilder == null)
        return null;
    }
    else
    {
      localCollection = paramDeserializationConfig.getSubtypeResolver().collectAndResolveSubtypes(localAnnotatedClass, paramDeserializationConfig, localAnnotationIntrospector);
    }
    if ((localTypeResolverBuilder.getDefaultImpl() == null) && (paramJavaType.isAbstract()))
    {
      JavaType localJavaType = mapAbstractType(paramDeserializationConfig, paramJavaType);
      if ((localJavaType != null) && (localJavaType.getRawClass() != paramJavaType.getRawClass()))
        localTypeResolverBuilder = localTypeResolverBuilder.defaultImpl(localJavaType.getRawClass());
    }
    return localTypeResolverBuilder.buildTypeDeserializer(paramDeserializationConfig, paramJavaType, localCollection, paramBeanProperty);
  }

  public abstract ValueInstantiator findValueInstantiator(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription)
    throws JsonMappingException;

  public abstract JavaType mapAbstractType(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
    throws JsonMappingException;

  // ERROR //
  protected <T extends JavaType> T modifyTypeByAnnotation(DeserializationConfig paramDeserializationConfig, Annotated paramAnnotated, T paramT, String paramString)
    throws JsonMappingException
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 199	com/flurry/org/codehaus/jackson/map/DeserializationConfig:getAnnotationIntrospector	()Lcom/flurry/org/codehaus/jackson/map/AnnotationIntrospector;
    //   4: astore 5
    //   6: aload 5
    //   8: aload_2
    //   9: aload_3
    //   10: aload 4
    //   12: invokevirtual 539	com/flurry/org/codehaus/jackson/map/AnnotationIntrospector:findDeserializationType	(Lcom/flurry/org/codehaus/jackson/map/introspect/Annotated;Lcom/flurry/org/codehaus/jackson/type/JavaType;Ljava/lang/String;)Ljava/lang/Class;
    //   15: astore 6
    //   17: aload 6
    //   19: ifnull +14 -> 33
    //   22: aload_3
    //   23: aload 6
    //   25: invokevirtual 543	com/flurry/org/codehaus/jackson/type/JavaType:narrowBy	(Ljava/lang/Class;)Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   28: astore 18
    //   30: aload 18
    //   32: astore_3
    //   33: aload_3
    //   34: invokevirtual 546	com/flurry/org/codehaus/jackson/type/JavaType:isContainerType	()Z
    //   37: ifeq +282 -> 319
    //   40: aload 5
    //   42: aload_2
    //   43: aload_3
    //   44: invokevirtual 547	com/flurry/org/codehaus/jackson/type/JavaType:getKeyType	()Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   47: aload 4
    //   49: invokevirtual 550	com/flurry/org/codehaus/jackson/map/AnnotationIntrospector:findDeserializationKeyType	(Lcom/flurry/org/codehaus/jackson/map/introspect/Annotated;Lcom/flurry/org/codehaus/jackson/type/JavaType;Ljava/lang/String;)Ljava/lang/Class;
    //   52: astore 7
    //   54: aload 7
    //   56: ifnull +132 -> 188
    //   59: aload_3
    //   60: instanceof 441
    //   63: ifne +111 -> 174
    //   66: new 116	com/flurry/org/codehaus/jackson/map/JsonMappingException
    //   69: dup
    //   70: new 128	java/lang/StringBuilder
    //   73: dup
    //   74: invokespecial 129	java/lang/StringBuilder:<init>	()V
    //   77: ldc_w 552
    //   80: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   83: aload_3
    //   84: invokevirtual 234	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   87: ldc_w 554
    //   90: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: invokevirtual 146	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   96: invokespecial 555	com/flurry/org/codehaus/jackson/map/JsonMappingException:<init>	(Ljava/lang/String;)V
    //   99: athrow
    //   100: astore 17
    //   102: new 116	com/flurry/org/codehaus/jackson/map/JsonMappingException
    //   105: dup
    //   106: new 128	java/lang/StringBuilder
    //   109: dup
    //   110: invokespecial 129	java/lang/StringBuilder:<init>	()V
    //   113: ldc_w 557
    //   116: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   119: aload_3
    //   120: invokevirtual 234	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   123: ldc_w 559
    //   126: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   129: aload 6
    //   131: invokevirtual 49	java/lang/Class:getName	()Ljava/lang/String;
    //   134: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   137: ldc_w 561
    //   140: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   143: aload_2
    //   144: invokevirtual 564	com/flurry/org/codehaus/jackson/map/introspect/Annotated:getName	()Ljava/lang/String;
    //   147: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   150: ldc_w 566
    //   153: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   156: aload 17
    //   158: invokevirtual 569	java/lang/IllegalArgumentException:getMessage	()Ljava/lang/String;
    //   161: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   164: invokevirtual 146	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   167: aconst_null
    //   168: aload 17
    //   170: invokespecial 572	com/flurry/org/codehaus/jackson/map/JsonMappingException:<init>	(Ljava/lang/String;Lcom/flurry/org/codehaus/jackson/JsonLocation;Ljava/lang/Throwable;)V
    //   173: athrow
    //   174: aload_3
    //   175: checkcast 441	com/flurry/org/codehaus/jackson/map/type/MapLikeType
    //   178: aload 7
    //   180: invokevirtual 575	com/flurry/org/codehaus/jackson/map/type/MapLikeType:narrowKey	(Ljava/lang/Class;)Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   183: astore 16
    //   185: aload 16
    //   187: astore_3
    //   188: aload_3
    //   189: invokevirtual 547	com/flurry/org/codehaus/jackson/type/JavaType:getKeyType	()Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   192: astore 8
    //   194: aload 8
    //   196: ifnull +44 -> 240
    //   199: aload 8
    //   201: invokevirtual 217	com/flurry/org/codehaus/jackson/type/JavaType:getValueHandler	()Ljava/lang/Object;
    //   204: ifnonnull +36 -> 240
    //   207: aload 5
    //   209: aload_2
    //   210: invokevirtual 578	com/flurry/org/codehaus/jackson/map/AnnotationIntrospector:findKeyDeserializer	(Lcom/flurry/org/codehaus/jackson/map/introspect/Annotated;)Ljava/lang/Class;
    //   213: astore 14
    //   215: aload 14
    //   217: ifnull +23 -> 240
    //   220: aload 14
    //   222: ldc_w 580
    //   225: if_acmpeq +15 -> 240
    //   228: aload 8
    //   230: aload_1
    //   231: aload_2
    //   232: aload 14
    //   234: invokevirtual 584	com/flurry/org/codehaus/jackson/map/DeserializationConfig:keyDeserializerInstance	(Lcom/flurry/org/codehaus/jackson/map/introspect/Annotated;Ljava/lang/Class;)Lcom/flurry/org/codehaus/jackson/map/KeyDeserializer;
    //   237: invokevirtual 588	com/flurry/org/codehaus/jackson/type/JavaType:setValueHandler	(Ljava/lang/Object;)V
    //   240: aload 5
    //   242: aload_2
    //   243: aload_3
    //   244: invokevirtual 467	com/flurry/org/codehaus/jackson/type/JavaType:getContentType	()Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   247: aload 4
    //   249: invokevirtual 591	com/flurry/org/codehaus/jackson/map/AnnotationIntrospector:findDeserializationContentType	(Lcom/flurry/org/codehaus/jackson/map/introspect/Annotated;Lcom/flurry/org/codehaus/jackson/type/JavaType;Ljava/lang/String;)Ljava/lang/Class;
    //   252: astore 9
    //   254: aload 9
    //   256: ifnull +14 -> 270
    //   259: aload_3
    //   260: aload 9
    //   262: invokevirtual 594	com/flurry/org/codehaus/jackson/type/JavaType:narrowContentsBy	(Ljava/lang/Class;)Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   265: astore 13
    //   267: aload 13
    //   269: astore_3
    //   270: aload_3
    //   271: invokevirtual 467	com/flurry/org/codehaus/jackson/type/JavaType:getContentType	()Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   274: invokevirtual 217	com/flurry/org/codehaus/jackson/type/JavaType:getValueHandler	()Ljava/lang/Object;
    //   277: ifnonnull +42 -> 319
    //   280: aload 5
    //   282: aload_2
    //   283: invokevirtual 597	com/flurry/org/codehaus/jackson/map/AnnotationIntrospector:findContentDeserializer	(Lcom/flurry/org/codehaus/jackson/map/introspect/Annotated;)Ljava/lang/Class;
    //   286: astore 10
    //   288: aload 10
    //   290: ifnull +29 -> 319
    //   293: aload 10
    //   295: ldc_w 599
    //   298: if_acmpeq +21 -> 319
    //   301: aload_1
    //   302: aload_2
    //   303: aload 10
    //   305: invokevirtual 163	com/flurry/org/codehaus/jackson/map/DeserializationConfig:deserializerInstance	(Lcom/flurry/org/codehaus/jackson/map/introspect/Annotated;Ljava/lang/Class;)Lcom/flurry/org/codehaus/jackson/map/JsonDeserializer;
    //   308: astore 11
    //   310: aload_3
    //   311: invokevirtual 467	com/flurry/org/codehaus/jackson/type/JavaType:getContentType	()Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   314: aload 11
    //   316: invokevirtual 588	com/flurry/org/codehaus/jackson/type/JavaType:setValueHandler	(Ljava/lang/Object;)V
    //   319: aload_3
    //   320: areturn
    //   321: astore 15
    //   323: new 116	com/flurry/org/codehaus/jackson/map/JsonMappingException
    //   326: dup
    //   327: new 128	java/lang/StringBuilder
    //   330: dup
    //   331: invokespecial 129	java/lang/StringBuilder:<init>	()V
    //   334: ldc_w 601
    //   337: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   340: aload_3
    //   341: invokevirtual 234	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   344: ldc_w 603
    //   347: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   350: aload 7
    //   352: invokevirtual 49	java/lang/Class:getName	()Ljava/lang/String;
    //   355: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   358: ldc_w 605
    //   361: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   364: aload 15
    //   366: invokevirtual 569	java/lang/IllegalArgumentException:getMessage	()Ljava/lang/String;
    //   369: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   372: invokevirtual 146	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   375: aconst_null
    //   376: aload 15
    //   378: invokespecial 572	com/flurry/org/codehaus/jackson/map/JsonMappingException:<init>	(Ljava/lang/String;Lcom/flurry/org/codehaus/jackson/JsonLocation;Ljava/lang/Throwable;)V
    //   381: athrow
    //   382: astore 12
    //   384: new 116	com/flurry/org/codehaus/jackson/map/JsonMappingException
    //   387: dup
    //   388: new 128	java/lang/StringBuilder
    //   391: dup
    //   392: invokespecial 129	java/lang/StringBuilder:<init>	()V
    //   395: ldc_w 607
    //   398: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   401: aload_3
    //   402: invokevirtual 234	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   405: ldc_w 609
    //   408: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   411: aload 9
    //   413: invokevirtual 49	java/lang/Class:getName	()Ljava/lang/String;
    //   416: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   419: ldc_w 605
    //   422: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   425: aload 12
    //   427: invokevirtual 569	java/lang/IllegalArgumentException:getMessage	()Ljava/lang/String;
    //   430: invokevirtual 135	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   433: invokevirtual 146	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   436: aconst_null
    //   437: aload 12
    //   439: invokespecial 572	com/flurry/org/codehaus/jackson/map/JsonMappingException:<init>	(Ljava/lang/String;Lcom/flurry/org/codehaus/jackson/JsonLocation;Ljava/lang/Throwable;)V
    //   442: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   22	30	100	java/lang/IllegalArgumentException
    //   174	185	321	java/lang/IllegalArgumentException
    //   259	267	382	java/lang/IllegalArgumentException
  }

  protected JavaType resolveType(DeserializationConfig paramDeserializationConfig, BasicBeanDescription paramBasicBeanDescription, JavaType paramJavaType, AnnotatedMember paramAnnotatedMember, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    if (paramJavaType.isContainerType())
    {
      AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
      JavaType localJavaType = paramJavaType.getKeyType();
      if (localJavaType != null)
      {
        Class localClass2 = localAnnotationIntrospector.findKeyDeserializer(paramAnnotatedMember);
        if ((localClass2 != null) && (localClass2 != KeyDeserializer.None.class))
          localJavaType.setValueHandler(paramDeserializationConfig.keyDeserializerInstance(paramAnnotatedMember, localClass2));
      }
      Class localClass1 = localAnnotationIntrospector.findContentDeserializer(paramAnnotatedMember);
      if ((localClass1 != null) && (localClass1 != JsonDeserializer.None.class))
      {
        JsonDeserializer localJsonDeserializer = paramDeserializationConfig.deserializerInstance(paramAnnotatedMember, localClass1);
        paramJavaType.getContentType().setValueHandler(localJsonDeserializer);
      }
      if ((paramAnnotatedMember instanceof AnnotatedMember))
      {
        TypeDeserializer localTypeDeserializer2 = findPropertyContentTypeDeserializer(paramDeserializationConfig, paramJavaType, paramAnnotatedMember, paramBeanProperty);
        if (localTypeDeserializer2 != null)
          paramJavaType = paramJavaType.withContentTypeHandler(localTypeDeserializer2);
      }
    }
    if ((paramAnnotatedMember instanceof AnnotatedMember));
    for (TypeDeserializer localTypeDeserializer1 = findPropertyTypeDeserializer(paramDeserializationConfig, paramJavaType, paramAnnotatedMember, paramBeanProperty); ; localTypeDeserializer1 = findTypeDeserializer(paramDeserializationConfig, paramJavaType, null))
    {
      if (localTypeDeserializer1 != null)
        paramJavaType = paramJavaType.withTypeHandler(localTypeDeserializer1);
      return paramJavaType;
    }
  }

  public abstract DeserializerFactory withConfig(DeserializerFactory.Config paramConfig);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.BasicDeserializerFactory
 * JD-Core Version:    0.6.2
 */