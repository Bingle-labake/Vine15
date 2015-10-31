package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.BeanProperty.Std;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.KeyDeserializer;
import com.flurry.org.codehaus.jackson.map.ResolvableDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.map.deser.SettableBeanProperty;
import com.flurry.org.codehaus.jackson.map.deser.ValueInstantiator;
import com.flurry.org.codehaus.jackson.map.deser.impl.PropertyBasedCreator;
import com.flurry.org.codehaus.jackson.map.deser.impl.PropertyValueBuffer;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedConstructor;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;

@JacksonStdImpl
public class MapDeserializer extends ContainerDeserializerBase<Map<Object, Object>>
  implements ResolvableDeserializer
{
  protected JsonDeserializer<Object> _delegateDeserializer;
  protected final boolean _hasDefaultCreator;
  protected HashSet<String> _ignorableProperties;
  protected final KeyDeserializer _keyDeserializer;
  protected final JavaType _mapType;
  protected PropertyBasedCreator _propertyBasedCreator;
  protected final JsonDeserializer<Object> _valueDeserializer;
  protected final ValueInstantiator _valueInstantiator;
  protected final TypeDeserializer _valueTypeDeserializer;

  protected MapDeserializer(MapDeserializer paramMapDeserializer)
  {
    super(paramMapDeserializer._valueClass);
    this._mapType = paramMapDeserializer._mapType;
    this._keyDeserializer = paramMapDeserializer._keyDeserializer;
    this._valueDeserializer = paramMapDeserializer._valueDeserializer;
    this._valueTypeDeserializer = paramMapDeserializer._valueTypeDeserializer;
    this._valueInstantiator = paramMapDeserializer._valueInstantiator;
    this._propertyBasedCreator = paramMapDeserializer._propertyBasedCreator;
    this._delegateDeserializer = paramMapDeserializer._delegateDeserializer;
    this._hasDefaultCreator = paramMapDeserializer._hasDefaultCreator;
    this._ignorableProperties = paramMapDeserializer._ignorableProperties;
  }

  public MapDeserializer(JavaType paramJavaType, ValueInstantiator paramValueInstantiator, KeyDeserializer paramKeyDeserializer, JsonDeserializer<Object> paramJsonDeserializer, TypeDeserializer paramTypeDeserializer)
  {
    super(Map.class);
    this._mapType = paramJavaType;
    this._keyDeserializer = paramKeyDeserializer;
    this._valueDeserializer = paramJsonDeserializer;
    this._valueTypeDeserializer = paramTypeDeserializer;
    this._valueInstantiator = paramValueInstantiator;
    if (paramValueInstantiator.canCreateFromObjectWith());
    for (this._propertyBasedCreator = new PropertyBasedCreator(paramValueInstantiator); ; this._propertyBasedCreator = null)
    {
      this._hasDefaultCreator = paramValueInstantiator.canCreateUsingDefault();
      return;
    }
  }

  @Deprecated
  protected MapDeserializer(JavaType paramJavaType, Constructor<Map<Object, Object>> paramConstructor, KeyDeserializer paramKeyDeserializer, JsonDeserializer<Object> paramJsonDeserializer, TypeDeserializer paramTypeDeserializer)
  {
    super(Map.class);
    this._mapType = paramJavaType;
    this._keyDeserializer = paramKeyDeserializer;
    this._valueDeserializer = paramJsonDeserializer;
    this._valueTypeDeserializer = paramTypeDeserializer;
    StdValueInstantiator localStdValueInstantiator = new StdValueInstantiator(null, paramJavaType);
    if (paramConstructor != null)
      localStdValueInstantiator.configureFromObjectSettings(new AnnotatedConstructor(paramConstructor, null, null), null, null, null, null);
    if (paramConstructor != null);
    for (boolean bool = true; ; bool = false)
    {
      this._hasDefaultCreator = bool;
      this._valueInstantiator = localStdValueInstantiator;
      return;
    }
  }

  public Map<Object, Object> _deserializeUsingCreator(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    PropertyBasedCreator localPropertyBasedCreator = this._propertyBasedCreator;
    PropertyValueBuffer localPropertyValueBuffer = localPropertyBasedCreator.startBuilding(paramJsonParser, paramDeserializationContext);
    JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
    if (localJsonToken1 == JsonToken.START_OBJECT)
      localJsonToken1 = paramJsonParser.nextToken();
    JsonDeserializer localJsonDeserializer = this._valueDeserializer;
    TypeDeserializer localTypeDeserializer = this._valueTypeDeserializer;
    if (localJsonToken1 == JsonToken.FIELD_NAME)
    {
      String str1 = paramJsonParser.getCurrentName();
      JsonToken localJsonToken2 = paramJsonParser.nextToken();
      if ((this._ignorableProperties != null) && (this._ignorableProperties.contains(str1)))
        paramJsonParser.skipChildren();
      SettableBeanProperty localSettableBeanProperty;
      Object localObject3;
      do
      {
        localJsonToken1 = paramJsonParser.nextToken();
        break;
        localSettableBeanProperty = localPropertyBasedCreator.findCreatorProperty(str1);
        if (localSettableBeanProperty == null)
          break label179;
        localObject3 = localSettableBeanProperty.deserialize(paramJsonParser, paramDeserializationContext);
      }
      while (!localPropertyValueBuffer.assignParameter(localSettableBeanProperty.getPropertyIndex(), localObject3));
      paramJsonParser.nextToken();
      try
      {
        Map localMap2 = (Map)localPropertyBasedCreator.build(localPropertyValueBuffer);
        _readAndBind(paramJsonParser, paramDeserializationContext, localMap2);
        return localMap2;
      }
      catch (Exception localException2)
      {
        wrapAndThrow(localException2, this._mapType.getRawClass());
        return null;
      }
      label179: String str2 = paramJsonParser.getCurrentName();
      Object localObject1 = this._keyDeserializer.deserializeKey(str2, paramDeserializationContext);
      Object localObject2;
      if (localJsonToken2 == JsonToken.VALUE_NULL)
        localObject2 = null;
      while (true)
      {
        localPropertyValueBuffer.bufferMapProperty(localObject1, localObject2);
        break;
        if (localTypeDeserializer == null)
          localObject2 = localJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
        else
          localObject2 = localJsonDeserializer.deserializeWithType(paramJsonParser, paramDeserializationContext, localTypeDeserializer);
      }
    }
    try
    {
      Map localMap1 = (Map)localPropertyBasedCreator.build(localPropertyValueBuffer);
      return localMap1;
    }
    catch (Exception localException1)
    {
      wrapAndThrow(localException1, this._mapType.getRawClass());
    }
    return null;
  }

  protected final void _readAndBind(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Map<Object, Object> paramMap)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
    if (localJsonToken1 == JsonToken.START_OBJECT)
      localJsonToken1 = paramJsonParser.nextToken();
    KeyDeserializer localKeyDeserializer = this._keyDeserializer;
    JsonDeserializer localJsonDeserializer = this._valueDeserializer;
    TypeDeserializer localTypeDeserializer = this._valueTypeDeserializer;
    while (localJsonToken1 == JsonToken.FIELD_NAME)
    {
      String str = paramJsonParser.getCurrentName();
      Object localObject1 = localKeyDeserializer.deserializeKey(str, paramDeserializationContext);
      JsonToken localJsonToken2 = paramJsonParser.nextToken();
      if ((this._ignorableProperties != null) && (this._ignorableProperties.contains(str)))
      {
        paramJsonParser.skipChildren();
        localJsonToken1 = paramJsonParser.nextToken();
      }
      else
      {
        Object localObject2;
        if (localJsonToken2 == JsonToken.VALUE_NULL)
          localObject2 = null;
        while (true)
        {
          paramMap.put(localObject1, localObject2);
          break;
          if (localTypeDeserializer == null)
            localObject2 = localJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
          else
            localObject2 = localJsonDeserializer.deserializeWithType(paramJsonParser, paramDeserializationContext, localTypeDeserializer);
        }
      }
    }
  }

  public Map<Object, Object> deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (this._propertyBasedCreator != null)
      return _deserializeUsingCreator(paramJsonParser, paramDeserializationContext);
    if (this._delegateDeserializer != null)
      return (Map)this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
    if (!this._hasDefaultCreator)
      throw paramDeserializationContext.instantiationException(getMapClass(), "No default constructor found");
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken != JsonToken.START_OBJECT) && (localJsonToken != JsonToken.FIELD_NAME) && (localJsonToken != JsonToken.END_OBJECT))
    {
      if (localJsonToken == JsonToken.VALUE_STRING)
        return (Map)this._valueInstantiator.createFromString(paramJsonParser.getText());
      throw paramDeserializationContext.mappingException(getMapClass());
    }
    Map localMap = (Map)this._valueInstantiator.createUsingDefault();
    _readAndBind(paramJsonParser, paramDeserializationContext, localMap);
    return localMap;
  }

  public Map<Object, Object> deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Map<Object, Object> paramMap)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if ((localJsonToken != JsonToken.START_OBJECT) && (localJsonToken != JsonToken.FIELD_NAME))
      throw paramDeserializationContext.mappingException(getMapClass());
    _readAndBind(paramJsonParser, paramDeserializationContext, paramMap);
    return paramMap;
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromObject(paramJsonParser, paramDeserializationContext);
  }

  public JsonDeserializer<Object> getContentDeserializer()
  {
    return this._valueDeserializer;
  }

  public JavaType getContentType()
  {
    return this._mapType.getContentType();
  }

  public final Class<?> getMapClass()
  {
    return this._mapType.getRawClass();
  }

  public JavaType getValueType()
  {
    return this._mapType;
  }

  public void resolve(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider)
    throws JsonMappingException
  {
    if (this._valueInstantiator.canCreateUsingDelegate())
    {
      JavaType localJavaType = this._valueInstantiator.getDelegateType();
      if (localJavaType == null)
        throw new IllegalArgumentException("Invalid delegate-creator definition for " + this._mapType + ": value instantiator (" + this._valueInstantiator.getClass().getName() + ") returned true for 'canCreateUsingDelegate()', but null for 'getDelegateType()'");
      this._delegateDeserializer = findDeserializer(paramDeserializationConfig, paramDeserializerProvider, localJavaType, new BeanProperty.Std(null, localJavaType, null, this._valueInstantiator.getDelegateCreator()));
    }
    if (this._propertyBasedCreator != null)
    {
      Iterator localIterator = this._propertyBasedCreator.getCreatorProperties().iterator();
      while (localIterator.hasNext())
      {
        SettableBeanProperty localSettableBeanProperty = (SettableBeanProperty)localIterator.next();
        if (!localSettableBeanProperty.hasValueDeserializer())
          this._propertyBasedCreator.assignDeserializer(localSettableBeanProperty, findDeserializer(paramDeserializationConfig, paramDeserializerProvider, localSettableBeanProperty.getType(), localSettableBeanProperty));
      }
    }
  }

  public void setIgnorableProperties(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0));
    for (HashSet localHashSet = null; ; localHashSet = ArrayBuilders.arrayToSet(paramArrayOfString))
    {
      this._ignorableProperties = localHashSet;
      return;
    }
  }

  protected void wrapAndThrow(Throwable paramThrowable, Object paramObject)
    throws IOException
  {
    while (((paramThrowable instanceof InvocationTargetException)) && (paramThrowable.getCause() != null))
      paramThrowable = paramThrowable.getCause();
    if ((paramThrowable instanceof Error))
      throw ((Error)paramThrowable);
    if (((paramThrowable instanceof IOException)) && (!(paramThrowable instanceof JsonMappingException)))
      throw ((IOException)paramThrowable);
    throw JsonMappingException.wrapWithPath(paramThrowable, paramObject, null);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.MapDeserializer
 * JD-Core Version:    0.6.2
 */