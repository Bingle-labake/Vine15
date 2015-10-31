package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.io.SerializedString;
import com.flurry.org.codehaus.jackson.map.AbstractTypeResolver;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.ContextualDeserializer;
import com.flurry.org.codehaus.jackson.map.ContextualKeyDeserializer;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.DeserializerFactory;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.Deserializers;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.KeyDeserializer;
import com.flurry.org.codehaus.jackson.map.KeyDeserializers;
import com.flurry.org.codehaus.jackson.map.ResolvableDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedClass;
import com.flurry.org.codehaus.jackson.map.type.ArrayType;
import com.flurry.org.codehaus.jackson.map.type.CollectionLikeType;
import com.flurry.org.codehaus.jackson.map.type.CollectionType;
import com.flurry.org.codehaus.jackson.map.type.MapLikeType;
import com.flurry.org.codehaus.jackson.map.type.MapType;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.map.util.RootNameLookup;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.HashMap;
import java.util.concurrent.ConcurrentHashMap;

public class StdDeserializerProvider extends DeserializerProvider
{
  protected final ConcurrentHashMap<JavaType, JsonDeserializer<Object>> _cachedDeserializers = new ConcurrentHashMap(64, 0.75F, 2);
  protected DeserializerFactory _factory;
  protected final HashMap<JavaType, JsonDeserializer<Object>> _incompleteDeserializers = new HashMap(8);
  protected final RootNameLookup _rootNames;

  public StdDeserializerProvider()
  {
    this(BeanDeserializerFactory.instance);
  }

  public StdDeserializerProvider(DeserializerFactory paramDeserializerFactory)
  {
    this._factory = paramDeserializerFactory;
    this._rootNames = new RootNameLookup();
  }

  protected JsonDeserializer<Object> _createAndCache2(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JsonDeserializer localJsonDeserializer2;
    try
    {
      JsonDeserializer localJsonDeserializer1 = _createDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
      localJsonDeserializer2 = localJsonDeserializer1;
      if (localJsonDeserializer2 == null)
      {
        localJsonDeserializer2 = null;
        return localJsonDeserializer2;
      }
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw new JsonMappingException(localIllegalArgumentException.getMessage(), null, localIllegalArgumentException);
    }
    boolean bool1 = localJsonDeserializer2 instanceof ResolvableDeserializer;
    if (localJsonDeserializer2.getClass() == BeanDeserializer.class);
    for (boolean bool2 = true; ; bool2 = false)
    {
      if ((!bool2) && (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.USE_ANNOTATIONS)))
      {
        AnnotationIntrospector localAnnotationIntrospector = paramDeserializationConfig.getAnnotationIntrospector();
        Boolean localBoolean = localAnnotationIntrospector.findCachability(AnnotatedClass.construct(localJsonDeserializer2.getClass(), localAnnotationIntrospector, null));
        if (localBoolean != null)
          bool2 = localBoolean.booleanValue();
      }
      if (bool1)
      {
        this._incompleteDeserializers.put(paramJavaType, localJsonDeserializer2);
        _resolveDeserializer(paramDeserializationConfig, (ResolvableDeserializer)localJsonDeserializer2);
        this._incompleteDeserializers.remove(paramJavaType);
      }
      if (!bool2)
        break;
      this._cachedDeserializers.put(paramJavaType, localJsonDeserializer2);
      return localJsonDeserializer2;
    }
  }

  protected JsonDeserializer<Object> _createAndCacheValueDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    int i;
    synchronized (this._incompleteDeserializers)
    {
      JsonDeserializer localJsonDeserializer1 = _findCachedDeserializer(paramJavaType);
      if (localJsonDeserializer1 != null)
        return localJsonDeserializer1;
      i = this._incompleteDeserializers.size();
      if (i > 0)
      {
        JsonDeserializer localJsonDeserializer2 = (JsonDeserializer)this._incompleteDeserializers.get(paramJavaType);
        if (localJsonDeserializer2 != null)
          return localJsonDeserializer2;
      }
    }
    try
    {
      JsonDeserializer localJsonDeserializer3 = _createAndCache2(paramDeserializationConfig, paramJavaType, paramBeanProperty);
      if ((i == 0) && (this._incompleteDeserializers.size() > 0))
        this._incompleteDeserializers.clear();
      return localJsonDeserializer3;
      localObject1 = finally;
      throw localObject1;
    }
    finally
    {
      if ((i == 0) && (this._incompleteDeserializers.size() > 0))
        this._incompleteDeserializers.clear();
    }
  }

  protected JsonDeserializer<Object> _createDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    if (paramJavaType.isEnumType())
      return this._factory.createEnumDeserializer(paramDeserializationConfig, this, paramJavaType, paramBeanProperty);
    if (paramJavaType.isContainerType())
    {
      if (paramJavaType.isArrayType())
        return this._factory.createArrayDeserializer(paramDeserializationConfig, this, (ArrayType)paramJavaType, paramBeanProperty);
      if (paramJavaType.isMapLikeType())
      {
        MapLikeType localMapLikeType = (MapLikeType)paramJavaType;
        if (localMapLikeType.isTrueMapType())
          return this._factory.createMapDeserializer(paramDeserializationConfig, this, (MapType)localMapLikeType, paramBeanProperty);
        return this._factory.createMapLikeDeserializer(paramDeserializationConfig, this, localMapLikeType, paramBeanProperty);
      }
      if (paramJavaType.isCollectionLikeType())
      {
        CollectionLikeType localCollectionLikeType = (CollectionLikeType)paramJavaType;
        if (localCollectionLikeType.isTrueCollectionType())
          return this._factory.createCollectionDeserializer(paramDeserializationConfig, this, (CollectionType)localCollectionLikeType, paramBeanProperty);
        return this._factory.createCollectionLikeDeserializer(paramDeserializationConfig, this, localCollectionLikeType, paramBeanProperty);
      }
    }
    if (JsonNode.class.isAssignableFrom(paramJavaType.getRawClass()))
      return this._factory.createTreeDeserializer(paramDeserializationConfig, this, paramJavaType, paramBeanProperty);
    return this._factory.createBeanDeserializer(paramDeserializationConfig, this, paramJavaType, paramBeanProperty);
  }

  protected JsonDeserializer<Object> _findCachedDeserializer(JavaType paramJavaType)
  {
    if (paramJavaType == null)
      throw new IllegalArgumentException();
    return (JsonDeserializer)this._cachedDeserializers.get(paramJavaType);
  }

  protected KeyDeserializer _handleUnknownKeyDeserializer(JavaType paramJavaType)
    throws JsonMappingException
  {
    throw new JsonMappingException("Can not find a (Map) Key deserializer for type " + paramJavaType);
  }

  protected JsonDeserializer<Object> _handleUnknownValueDeserializer(JavaType paramJavaType)
    throws JsonMappingException
  {
    if (!ClassUtil.isConcrete(paramJavaType.getRawClass()))
      throw new JsonMappingException("Can not find a Value deserializer for abstract type " + paramJavaType);
    throw new JsonMappingException("Can not find a Value deserializer for type " + paramJavaType);
  }

  protected void _resolveDeserializer(DeserializationConfig paramDeserializationConfig, ResolvableDeserializer paramResolvableDeserializer)
    throws JsonMappingException
  {
    paramResolvableDeserializer.resolve(paramDeserializationConfig, this);
  }

  public int cachedDeserializersCount()
  {
    return this._cachedDeserializers.size();
  }

  public SerializedString findExpectedRootName(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
    throws JsonMappingException
  {
    return this._rootNames.findRootName(paramJavaType, paramDeserializationConfig);
  }

  public KeyDeserializer findKeyDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    KeyDeserializer localKeyDeserializer = this._factory.createKeyDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
    if ((localKeyDeserializer instanceof ContextualKeyDeserializer))
      localKeyDeserializer = ((ContextualKeyDeserializer)localKeyDeserializer).createContextual(paramDeserializationConfig, paramBeanProperty);
    if (localKeyDeserializer == null)
      localKeyDeserializer = _handleUnknownKeyDeserializer(paramJavaType);
    return localKeyDeserializer;
  }

  public JsonDeserializer<Object> findTypedValueDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Object localObject = findValueDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
    TypeDeserializer localTypeDeserializer = this._factory.findTypeDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
    if (localTypeDeserializer != null)
      localObject = new WrappedDeserializer(localTypeDeserializer, (JsonDeserializer)localObject);
    return localObject;
  }

  public JsonDeserializer<Object> findValueDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JsonDeserializer localJsonDeserializer1 = _findCachedDeserializer(paramJavaType);
    if (localJsonDeserializer1 != null)
    {
      if ((localJsonDeserializer1 instanceof ContextualDeserializer))
        localJsonDeserializer1 = ((ContextualDeserializer)localJsonDeserializer1).createContextual(paramDeserializationConfig, paramBeanProperty);
      return localJsonDeserializer1;
    }
    JsonDeserializer localJsonDeserializer2 = _createAndCacheValueDeserializer(paramDeserializationConfig, paramJavaType, paramBeanProperty);
    if (localJsonDeserializer2 == null)
      localJsonDeserializer2 = _handleUnknownValueDeserializer(paramJavaType);
    if ((localJsonDeserializer2 instanceof ContextualDeserializer))
      localJsonDeserializer2 = ((ContextualDeserializer)localJsonDeserializer2).createContextual(paramDeserializationConfig, paramBeanProperty);
    return localJsonDeserializer2;
  }

  public void flushCachedDeserializers()
  {
    this._cachedDeserializers.clear();
  }

  public boolean hasValueDeserializerFor(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
  {
    Object localObject = _findCachedDeserializer(paramJavaType);
    if (localObject == null);
    try
    {
      JsonDeserializer localJsonDeserializer = _createAndCacheValueDeserializer(paramDeserializationConfig, paramJavaType, null);
      localObject = localJsonDeserializer;
      boolean bool = false;
      if (localObject != null)
        bool = true;
      return bool;
    }
    catch (Exception localException)
    {
    }
    return false;
  }

  public JavaType mapAbstractType(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
    throws JsonMappingException
  {
    return this._factory.mapAbstractType(paramDeserializationConfig, paramJavaType);
  }

  public DeserializerProvider withAbstractTypeResolver(AbstractTypeResolver paramAbstractTypeResolver)
  {
    return withFactory(this._factory.withAbstractTypeResolver(paramAbstractTypeResolver));
  }

  public DeserializerProvider withAdditionalDeserializers(Deserializers paramDeserializers)
  {
    return withFactory(this._factory.withAdditionalDeserializers(paramDeserializers));
  }

  public DeserializerProvider withAdditionalKeyDeserializers(KeyDeserializers paramKeyDeserializers)
  {
    return withFactory(this._factory.withAdditionalKeyDeserializers(paramKeyDeserializers));
  }

  public DeserializerProvider withDeserializerModifier(BeanDeserializerModifier paramBeanDeserializerModifier)
  {
    return withFactory(this._factory.withDeserializerModifier(paramBeanDeserializerModifier));
  }

  public StdDeserializerProvider withFactory(DeserializerFactory paramDeserializerFactory)
  {
    if (getClass() != StdDeserializerProvider.class)
      throw new IllegalStateException("DeserializerProvider of type " + getClass().getName() + " does not override 'withFactory()' method");
    return new StdDeserializerProvider(paramDeserializerFactory);
  }

  public DeserializerProvider withValueInstantiators(ValueInstantiators paramValueInstantiators)
  {
    return withFactory(this._factory.withValueInstantiators(paramValueInstantiators));
  }

  protected static final class WrappedDeserializer extends JsonDeserializer<Object>
  {
    final JsonDeserializer<Object> _deserializer;
    final TypeDeserializer _typeDeserializer;

    public WrappedDeserializer(TypeDeserializer paramTypeDeserializer, JsonDeserializer<Object> paramJsonDeserializer)
    {
      this._typeDeserializer = paramTypeDeserializer;
      this._deserializer = paramJsonDeserializer;
    }

    public Object deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      return this._deserializer.deserializeWithType(paramJsonParser, paramDeserializationContext, this._typeDeserializer);
    }

    public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
      throws IOException, JsonProcessingException
    {
      throw new IllegalStateException("Type-wrapped deserializer's deserializeWithType should never get called");
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.StdDeserializerProvider
 * JD-Core Version:    0.6.2
 */