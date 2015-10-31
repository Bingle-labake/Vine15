package com.flurry.org.codehaus.jackson.map.ser;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.ContextualSerializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.ResolvableSerializer;
import com.flurry.org.codehaus.jackson.map.SerializationConfig;
import com.flurry.org.codehaus.jackson.map.SerializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.SerializerFactory;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.ser.impl.FailingSerializer;
import com.flurry.org.codehaus.jackson.map.ser.impl.ReadOnlyClassToSerializerMap;
import com.flurry.org.codehaus.jackson.map.ser.impl.SerializerCache;
import com.flurry.org.codehaus.jackson.map.ser.impl.UnknownSerializer;
import com.flurry.org.codehaus.jackson.map.ser.std.NullSerializer;
import com.flurry.org.codehaus.jackson.map.ser.std.StdKeySerializer;
import com.flurry.org.codehaus.jackson.map.ser.std.StdKeySerializers;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.map.util.RootNameLookup;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import com.flurry.org.codehaus.jackson.schema.JsonSchema;
import com.flurry.org.codehaus.jackson.schema.SchemaAware;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;

public class StdSerializerProvider extends SerializerProvider
{
  static final boolean CACHE_UNKNOWN_MAPPINGS;

  @Deprecated
  public static final JsonSerializer<Object> DEFAULT_KEY_SERIALIZER = new StdKeySerializer();
  public static final JsonSerializer<Object> DEFAULT_NULL_KEY_SERIALIZER = new FailingSerializer("Null key for a Map not allowed in JSON (use a converting NullKeySerializer?)");
  public static final JsonSerializer<Object> DEFAULT_UNKNOWN_SERIALIZER = new UnknownSerializer();
  protected DateFormat _dateFormat;
  protected JsonSerializer<Object> _keySerializer;
  protected final ReadOnlyClassToSerializerMap _knownSerializers;
  protected JsonSerializer<Object> _nullKeySerializer = DEFAULT_NULL_KEY_SERIALIZER;
  protected JsonSerializer<Object> _nullValueSerializer = NullSerializer.instance;
  protected final RootNameLookup _rootNames;
  protected final SerializerCache _serializerCache;
  protected final SerializerFactory _serializerFactory;
  protected JsonSerializer<Object> _unknownTypeSerializer = DEFAULT_UNKNOWN_SERIALIZER;

  public StdSerializerProvider()
  {
    super(null);
    this._serializerFactory = null;
    this._serializerCache = new SerializerCache();
    this._knownSerializers = null;
    this._rootNames = new RootNameLookup();
  }

  protected StdSerializerProvider(SerializationConfig paramSerializationConfig, StdSerializerProvider paramStdSerializerProvider, SerializerFactory paramSerializerFactory)
  {
    super(paramSerializationConfig);
    if (paramSerializationConfig == null)
      throw new NullPointerException();
    this._serializerFactory = paramSerializerFactory;
    this._serializerCache = paramStdSerializerProvider._serializerCache;
    this._unknownTypeSerializer = paramStdSerializerProvider._unknownTypeSerializer;
    this._keySerializer = paramStdSerializerProvider._keySerializer;
    this._nullValueSerializer = paramStdSerializerProvider._nullValueSerializer;
    this._nullKeySerializer = paramStdSerializerProvider._nullKeySerializer;
    this._rootNames = paramStdSerializerProvider._rootNames;
    this._knownSerializers = this._serializerCache.getReadOnlyLookupMap();
  }

  protected JsonSerializer<Object> _createAndCacheUntypedSerializer(JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    try
    {
      JsonSerializer localJsonSerializer = _createUntypedSerializer(paramJavaType, paramBeanProperty);
      if (localJsonSerializer != null)
        this._serializerCache.addAndResolveNonTypedSerializer(paramJavaType, localJsonSerializer, this);
      return localJsonSerializer;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw new JsonMappingException(localIllegalArgumentException.getMessage(), null, localIllegalArgumentException);
    }
  }

  protected JsonSerializer<Object> _createAndCacheUntypedSerializer(Class<?> paramClass, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    try
    {
      JsonSerializer localJsonSerializer = _createUntypedSerializer(this._config.constructType(paramClass), paramBeanProperty);
      if (localJsonSerializer != null)
        this._serializerCache.addAndResolveNonTypedSerializer(paramClass, localJsonSerializer, this);
      return localJsonSerializer;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw new JsonMappingException(localIllegalArgumentException.getMessage(), null, localIllegalArgumentException);
    }
  }

  protected JsonSerializer<Object> _createUntypedSerializer(JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    return this._serializerFactory.createSerializer(this._config, paramJavaType, paramBeanProperty);
  }

  protected JsonSerializer<Object> _findExplicitUntypedSerializer(Class<?> paramClass, BeanProperty paramBeanProperty)
  {
    JsonSerializer localJsonSerializer1 = this._knownSerializers.untypedValueSerializer(paramClass);
    if (localJsonSerializer1 != null)
      return localJsonSerializer1;
    JsonSerializer localJsonSerializer2 = this._serializerCache.untypedValueSerializer(paramClass);
    if (localJsonSerializer2 != null)
      return localJsonSerializer2;
    try
    {
      JsonSerializer localJsonSerializer3 = _createAndCacheUntypedSerializer(paramClass, paramBeanProperty);
      return localJsonSerializer3;
    }
    catch (Exception localException)
    {
    }
    return null;
  }

  protected JsonSerializer<Object> _handleContextualResolvable(JsonSerializer<Object> paramJsonSerializer, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    if (!(paramJsonSerializer instanceof ContextualSerializer))
      return paramJsonSerializer;
    JsonSerializer localJsonSerializer = ((ContextualSerializer)paramJsonSerializer).createContextual(this._config, paramBeanProperty);
    if (localJsonSerializer != paramJsonSerializer)
    {
      if ((localJsonSerializer instanceof ResolvableSerializer))
        ((ResolvableSerializer)localJsonSerializer).resolve(this);
      paramJsonSerializer = localJsonSerializer;
    }
    return paramJsonSerializer;
  }

  protected void _reportIncompatibleRootType(Object paramObject, JavaType paramJavaType)
    throws IOException, JsonProcessingException
  {
    if ((paramJavaType.isPrimitive()) && (ClassUtil.wrapperType(paramJavaType.getRawClass()).isAssignableFrom(paramObject.getClass())))
      return;
    throw new JsonMappingException("Incompatible types: declared root type (" + paramJavaType + ") vs " + paramObject.getClass().getName());
  }

  protected void _serializeValue(JsonGenerator paramJsonGenerator, Object paramObject)
    throws IOException, JsonProcessingException
  {
    JsonSerializer localJsonSerializer;
    boolean bool;
    if (paramObject == null)
    {
      localJsonSerializer = getNullValueSerializer();
      bool = false;
    }
    try
    {
      while (true)
      {
        localJsonSerializer.serialize(paramObject, paramJsonGenerator, this);
        if (bool)
          paramJsonGenerator.writeEndObject();
        return;
        localJsonSerializer = findTypedValueSerializer(paramObject.getClass(), true, null);
        bool = this._config.isEnabled(SerializationConfig.Feature.WRAP_ROOT_VALUE);
        if (bool)
        {
          paramJsonGenerator.writeStartObject();
          paramJsonGenerator.writeFieldName(this._rootNames.findRootName(paramObject.getClass(), this._config));
        }
      }
    }
    catch (IOException localIOException)
    {
      throw localIOException;
    }
    catch (Exception localException)
    {
      String str = localException.getMessage();
      if (str == null)
        str = "[no message for " + localException.getClass().getName() + "]";
      throw new JsonMappingException(str, localException);
    }
  }

  protected void _serializeValue(JsonGenerator paramJsonGenerator, Object paramObject, JavaType paramJavaType)
    throws IOException, JsonProcessingException
  {
    JsonSerializer localJsonSerializer;
    boolean bool;
    if (paramObject == null)
    {
      localJsonSerializer = getNullValueSerializer();
      bool = false;
    }
    try
    {
      while (true)
      {
        localJsonSerializer.serialize(paramObject, paramJsonGenerator, this);
        if (bool)
          paramJsonGenerator.writeEndObject();
        return;
        if (!paramJavaType.getRawClass().isAssignableFrom(paramObject.getClass()))
          _reportIncompatibleRootType(paramObject, paramJavaType);
        localJsonSerializer = findTypedValueSerializer(paramJavaType, true, null);
        bool = this._config.isEnabled(SerializationConfig.Feature.WRAP_ROOT_VALUE);
        if (bool)
        {
          paramJsonGenerator.writeStartObject();
          paramJsonGenerator.writeFieldName(this._rootNames.findRootName(paramJavaType, this._config));
        }
      }
    }
    catch (IOException localIOException)
    {
      throw localIOException;
    }
    catch (Exception localException)
    {
      String str = localException.getMessage();
      if (str == null)
        str = "[no message for " + localException.getClass().getName() + "]";
      throw new JsonMappingException(str, localException);
    }
  }

  public int cachedSerializersCount()
  {
    return this._serializerCache.size();
  }

  protected StdSerializerProvider createInstance(SerializationConfig paramSerializationConfig, SerializerFactory paramSerializerFactory)
  {
    return new StdSerializerProvider(paramSerializationConfig, this, paramSerializerFactory);
  }

  public void defaultSerializeDateKey(long paramLong, JsonGenerator paramJsonGenerator)
    throws IOException, JsonProcessingException
  {
    if (isEnabled(SerializationConfig.Feature.WRITE_DATE_KEYS_AS_TIMESTAMPS))
    {
      paramJsonGenerator.writeFieldName(String.valueOf(paramLong));
      return;
    }
    if (this._dateFormat == null)
      this._dateFormat = ((DateFormat)this._config.getDateFormat().clone());
    paramJsonGenerator.writeFieldName(this._dateFormat.format(new Date(paramLong)));
  }

  public void defaultSerializeDateKey(Date paramDate, JsonGenerator paramJsonGenerator)
    throws IOException, JsonProcessingException
  {
    if (isEnabled(SerializationConfig.Feature.WRITE_DATE_KEYS_AS_TIMESTAMPS))
    {
      paramJsonGenerator.writeFieldName(String.valueOf(paramDate.getTime()));
      return;
    }
    if (this._dateFormat == null)
      this._dateFormat = ((DateFormat)this._config.getDateFormat().clone());
    paramJsonGenerator.writeFieldName(this._dateFormat.format(paramDate));
  }

  public final void defaultSerializeDateValue(long paramLong, JsonGenerator paramJsonGenerator)
    throws IOException, JsonProcessingException
  {
    if (isEnabled(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS))
    {
      paramJsonGenerator.writeNumber(paramLong);
      return;
    }
    if (this._dateFormat == null)
      this._dateFormat = ((DateFormat)this._config.getDateFormat().clone());
    paramJsonGenerator.writeString(this._dateFormat.format(new Date(paramLong)));
  }

  public final void defaultSerializeDateValue(Date paramDate, JsonGenerator paramJsonGenerator)
    throws IOException, JsonProcessingException
  {
    if (isEnabled(SerializationConfig.Feature.WRITE_DATES_AS_TIMESTAMPS))
    {
      paramJsonGenerator.writeNumber(paramDate.getTime());
      return;
    }
    if (this._dateFormat == null)
      this._dateFormat = ((DateFormat)this._config.getDateFormat().clone());
    paramJsonGenerator.writeString(this._dateFormat.format(paramDate));
  }

  public JsonSerializer<Object> findKeySerializer(JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JsonSerializer localJsonSerializer = this._serializerFactory.createKeySerializer(this._config, paramJavaType, paramBeanProperty);
    if (localJsonSerializer == null)
      if (this._keySerializer != null)
        break label54;
    label54: for (localJsonSerializer = StdKeySerializers.getStdKeySerializer(paramJavaType); ; localJsonSerializer = this._keySerializer)
    {
      if ((localJsonSerializer instanceof ContextualSerializer))
        localJsonSerializer = ((ContextualSerializer)localJsonSerializer).createContextual(this._config, paramBeanProperty);
      return localJsonSerializer;
    }
  }

  public JsonSerializer<Object> findTypedValueSerializer(JavaType paramJavaType, boolean paramBoolean, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JsonSerializer localJsonSerializer1 = this._knownSerializers.typedValueSerializer(paramJavaType);
    if (localJsonSerializer1 != null)
      return localJsonSerializer1;
    JsonSerializer localJsonSerializer2 = this._serializerCache.typedValueSerializer(paramJavaType);
    if (localJsonSerializer2 != null)
      return localJsonSerializer2;
    Object localObject = findValueSerializer(paramJavaType, paramBeanProperty);
    TypeSerializer localTypeSerializer = this._serializerFactory.createTypeSerializer(this._config, paramJavaType, paramBeanProperty);
    if (localTypeSerializer != null)
      localObject = new WrappedSerializer(localTypeSerializer, (JsonSerializer)localObject);
    if (paramBoolean)
      this._serializerCache.addTypedSerializer(paramJavaType, (JsonSerializer)localObject);
    return localObject;
  }

  public JsonSerializer<Object> findTypedValueSerializer(Class<?> paramClass, boolean paramBoolean, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JsonSerializer localJsonSerializer1 = this._knownSerializers.typedValueSerializer(paramClass);
    if (localJsonSerializer1 != null)
      return localJsonSerializer1;
    JsonSerializer localJsonSerializer2 = this._serializerCache.typedValueSerializer(paramClass);
    if (localJsonSerializer2 != null)
      return localJsonSerializer2;
    Object localObject = findValueSerializer(paramClass, paramBeanProperty);
    TypeSerializer localTypeSerializer = this._serializerFactory.createTypeSerializer(this._config, this._config.constructType(paramClass), paramBeanProperty);
    if (localTypeSerializer != null)
      localObject = new WrappedSerializer(localTypeSerializer, (JsonSerializer)localObject);
    if (paramBoolean)
      this._serializerCache.addTypedSerializer(paramClass, (JsonSerializer)localObject);
    return localObject;
  }

  public JsonSerializer<Object> findValueSerializer(JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JsonSerializer localJsonSerializer = this._knownSerializers.untypedValueSerializer(paramJavaType);
    if (localJsonSerializer == null)
    {
      localJsonSerializer = this._serializerCache.untypedValueSerializer(paramJavaType);
      if (localJsonSerializer == null)
      {
        localJsonSerializer = _createAndCacheUntypedSerializer(paramJavaType, paramBeanProperty);
        if (localJsonSerializer == null)
          return getUnknownTypeSerializer(paramJavaType.getRawClass());
      }
    }
    return _handleContextualResolvable(localJsonSerializer, paramBeanProperty);
  }

  public JsonSerializer<Object> findValueSerializer(Class<?> paramClass, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JsonSerializer localJsonSerializer = this._knownSerializers.untypedValueSerializer(paramClass);
    if (localJsonSerializer == null)
    {
      localJsonSerializer = this._serializerCache.untypedValueSerializer(paramClass);
      if (localJsonSerializer == null)
      {
        localJsonSerializer = this._serializerCache.untypedValueSerializer(this._config.constructType(paramClass));
        if (localJsonSerializer == null)
        {
          localJsonSerializer = _createAndCacheUntypedSerializer(paramClass, paramBeanProperty);
          if (localJsonSerializer == null)
            return getUnknownTypeSerializer(paramClass);
        }
      }
    }
    return _handleContextualResolvable(localJsonSerializer, paramBeanProperty);
  }

  public void flushCachedSerializers()
  {
    this._serializerCache.flush();
  }

  public JsonSchema generateJsonSchema(Class<?> paramClass, SerializationConfig paramSerializationConfig, SerializerFactory paramSerializerFactory)
    throws JsonMappingException
  {
    if (paramClass == null)
      throw new IllegalArgumentException("A class must be provided");
    StdSerializerProvider localStdSerializerProvider = createInstance(paramSerializationConfig, paramSerializerFactory);
    if (localStdSerializerProvider.getClass() != getClass())
      throw new IllegalStateException("Broken serializer provider: createInstance returned instance of type " + localStdSerializerProvider.getClass() + "; blueprint of type " + getClass());
    JsonSerializer localJsonSerializer = localStdSerializerProvider.findValueSerializer(paramClass, null);
    if ((localJsonSerializer instanceof SchemaAware));
    for (JsonNode localJsonNode = ((SchemaAware)localJsonSerializer).getSchema(localStdSerializerProvider, null); !(localJsonNode instanceof ObjectNode); localJsonNode = JsonSchema.getDefaultSchemaNode())
      throw new IllegalArgumentException("Class " + paramClass.getName() + " would not be serialized as a JSON object and therefore has no schema");
    return new JsonSchema((ObjectNode)localJsonNode);
  }

  public JsonSerializer<Object> getNullKeySerializer()
  {
    return this._nullKeySerializer;
  }

  public JsonSerializer<Object> getNullValueSerializer()
  {
    return this._nullValueSerializer;
  }

  public JsonSerializer<Object> getUnknownTypeSerializer(Class<?> paramClass)
  {
    return this._unknownTypeSerializer;
  }

  public boolean hasSerializerFor(SerializationConfig paramSerializationConfig, Class<?> paramClass, SerializerFactory paramSerializerFactory)
  {
    return createInstance(paramSerializationConfig, paramSerializerFactory)._findExplicitUntypedSerializer(paramClass, null) != null;
  }

  public final void serializeValue(SerializationConfig paramSerializationConfig, JsonGenerator paramJsonGenerator, Object paramObject, SerializerFactory paramSerializerFactory)
    throws IOException, JsonGenerationException
  {
    if (paramSerializerFactory == null)
      throw new IllegalArgumentException("Can not pass null serializerFactory");
    StdSerializerProvider localStdSerializerProvider = createInstance(paramSerializationConfig, paramSerializerFactory);
    if (localStdSerializerProvider.getClass() != getClass())
      throw new IllegalStateException("Broken serializer provider: createInstance returned instance of type " + localStdSerializerProvider.getClass() + "; blueprint of type " + getClass());
    localStdSerializerProvider._serializeValue(paramJsonGenerator, paramObject);
  }

  public final void serializeValue(SerializationConfig paramSerializationConfig, JsonGenerator paramJsonGenerator, Object paramObject, JavaType paramJavaType, SerializerFactory paramSerializerFactory)
    throws IOException, JsonGenerationException
  {
    if (paramSerializerFactory == null)
      throw new IllegalArgumentException("Can not pass null serializerFactory");
    StdSerializerProvider localStdSerializerProvider = createInstance(paramSerializationConfig, paramSerializerFactory);
    if (localStdSerializerProvider.getClass() != getClass())
      throw new IllegalStateException("Broken serializer provider: createInstance returned instance of type " + localStdSerializerProvider.getClass() + "; blueprint of type " + getClass());
    localStdSerializerProvider._serializeValue(paramJsonGenerator, paramObject, paramJavaType);
  }

  public void setDefaultKeySerializer(JsonSerializer<Object> paramJsonSerializer)
  {
    if (paramJsonSerializer == null)
      throw new IllegalArgumentException("Can not pass null JsonSerializer");
    this._keySerializer = paramJsonSerializer;
  }

  public void setNullKeySerializer(JsonSerializer<Object> paramJsonSerializer)
  {
    if (paramJsonSerializer == null)
      throw new IllegalArgumentException("Can not pass null JsonSerializer");
    this._nullKeySerializer = paramJsonSerializer;
  }

  public void setNullValueSerializer(JsonSerializer<Object> paramJsonSerializer)
  {
    if (paramJsonSerializer == null)
      throw new IllegalArgumentException("Can not pass null JsonSerializer");
    this._nullValueSerializer = paramJsonSerializer;
  }

  private static final class WrappedSerializer extends JsonSerializer<Object>
  {
    protected final JsonSerializer<Object> _serializer;
    protected final TypeSerializer _typeSerializer;

    public WrappedSerializer(TypeSerializer paramTypeSerializer, JsonSerializer<Object> paramJsonSerializer)
    {
      this._typeSerializer = paramTypeSerializer;
      this._serializer = paramJsonSerializer;
    }

    public Class<Object> handledType()
    {
      return Object.class;
    }

    public void serialize(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
      throws IOException, JsonProcessingException
    {
      this._serializer.serializeWithType(paramObject, paramJsonGenerator, paramSerializerProvider, this._typeSerializer);
    }

    public void serializeWithType(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
      throws IOException, JsonProcessingException
    {
      this._serializer.serializeWithType(paramObject, paramJsonGenerator, paramSerializerProvider, paramTypeSerializer);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.StdSerializerProvider
 * JD-Core Version:    0.6.2
 */