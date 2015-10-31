package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonParser.NumberType;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.As;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.BeanDescription;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.BeanProperty.Std;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.DeserializerProvider;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.ResolvableDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.annotate.JsonCachable;
import com.flurry.org.codehaus.jackson.map.deser.impl.BeanPropertyMap;
import com.flurry.org.codehaus.jackson.map.deser.impl.CreatorCollector;
import com.flurry.org.codehaus.jackson.map.deser.impl.ExternalTypeHandler;
import com.flurry.org.codehaus.jackson.map.deser.impl.ExternalTypeHandler.Builder;
import com.flurry.org.codehaus.jackson.map.deser.impl.PropertyBasedCreator;
import com.flurry.org.codehaus.jackson.map.deser.impl.PropertyValueBuffer;
import com.flurry.org.codehaus.jackson.map.deser.impl.UnwrappedPropertyHandler;
import com.flurry.org.codehaus.jackson.map.deser.impl.ValueInjector;
import com.flurry.org.codehaus.jackson.map.deser.std.ContainerDeserializerBase;
import com.flurry.org.codehaus.jackson.map.deser.std.StdDeserializer;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedClass;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMember;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedWithParams;
import com.flurry.org.codehaus.jackson.map.type.ClassKey;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.type.JavaType;
import com.flurry.org.codehaus.jackson.util.TokenBuffer;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@JsonCachable
public class BeanDeserializer extends StdDeserializer<Object>
  implements ResolvableDeserializer
{
  protected SettableAnyProperty _anySetter;
  protected final Map<String, SettableBeanProperty> _backRefs;
  protected final BeanPropertyMap _beanProperties;
  protected final JavaType _beanType;
  protected JsonDeserializer<Object> _delegateDeserializer;
  protected ExternalTypeHandler _externalTypeIdHandler;
  protected final AnnotatedClass _forClass;
  protected final HashSet<String> _ignorableProps;
  protected final boolean _ignoreAllUnknown;
  protected final ValueInjector[] _injectables;
  protected boolean _nonStandardCreation;
  protected final BeanProperty _property;
  protected final PropertyBasedCreator _propertyBasedCreator;
  protected HashMap<ClassKey, JsonDeserializer<Object>> _subDeserializers;
  protected UnwrappedPropertyHandler _unwrappedPropertyHandler;
  protected final ValueInstantiator _valueInstantiator;

  public BeanDeserializer(BeanDescription paramBeanDescription, BeanProperty paramBeanProperty, ValueInstantiator paramValueInstantiator, BeanPropertyMap paramBeanPropertyMap, Map<String, SettableBeanProperty> paramMap, HashSet<String> paramHashSet, boolean paramBoolean, SettableAnyProperty paramSettableAnyProperty, List<ValueInjector> paramList)
  {
    this(paramBeanDescription.getClassInfo(), paramBeanDescription.getType(), paramBeanProperty, paramValueInstantiator, paramBeanPropertyMap, paramMap, paramHashSet, paramBoolean, paramSettableAnyProperty, paramList);
  }

  protected BeanDeserializer(BeanDeserializer paramBeanDeserializer)
  {
    this(paramBeanDeserializer, paramBeanDeserializer._ignoreAllUnknown);
  }

  protected BeanDeserializer(BeanDeserializer paramBeanDeserializer, boolean paramBoolean)
  {
    super(paramBeanDeserializer._beanType);
    this._forClass = paramBeanDeserializer._forClass;
    this._beanType = paramBeanDeserializer._beanType;
    this._property = paramBeanDeserializer._property;
    this._valueInstantiator = paramBeanDeserializer._valueInstantiator;
    this._delegateDeserializer = paramBeanDeserializer._delegateDeserializer;
    this._propertyBasedCreator = paramBeanDeserializer._propertyBasedCreator;
    this._beanProperties = paramBeanDeserializer._beanProperties;
    this._backRefs = paramBeanDeserializer._backRefs;
    this._ignorableProps = paramBeanDeserializer._ignorableProps;
    this._ignoreAllUnknown = paramBoolean;
    this._anySetter = paramBeanDeserializer._anySetter;
    this._injectables = paramBeanDeserializer._injectables;
    this._nonStandardCreation = paramBeanDeserializer._nonStandardCreation;
    this._unwrappedPropertyHandler = paramBeanDeserializer._unwrappedPropertyHandler;
  }

  protected BeanDeserializer(AnnotatedClass paramAnnotatedClass, JavaType paramJavaType, BeanProperty paramBeanProperty, ValueInstantiator paramValueInstantiator, BeanPropertyMap paramBeanPropertyMap, Map<String, SettableBeanProperty> paramMap, HashSet<String> paramHashSet, boolean paramBoolean, SettableAnyProperty paramSettableAnyProperty, List<ValueInjector> paramList)
  {
    super(paramJavaType);
    this._forClass = paramAnnotatedClass;
    this._beanType = paramJavaType;
    this._property = paramBeanProperty;
    this._valueInstantiator = paramValueInstantiator;
    ValueInjector[] arrayOfValueInjector;
    if (paramValueInstantiator.canCreateFromObjectWith())
    {
      this._propertyBasedCreator = new PropertyBasedCreator(paramValueInstantiator);
      this._beanProperties = paramBeanPropertyMap;
      this._backRefs = paramMap;
      this._ignorableProps = paramHashSet;
      this._ignoreAllUnknown = paramBoolean;
      this._anySetter = paramSettableAnyProperty;
      arrayOfValueInjector = null;
      if (paramList != null)
      {
        boolean bool2 = paramList.isEmpty();
        arrayOfValueInjector = null;
        if (!bool2)
          break label156;
      }
      label102: this._injectables = arrayOfValueInjector;
      if ((!paramValueInstantiator.canCreateUsingDelegate()) && (this._propertyBasedCreator == null) && (paramValueInstantiator.canCreateUsingDefault()) && (this._unwrappedPropertyHandler == null))
        break label181;
    }
    label156: label181: for (boolean bool1 = true; ; bool1 = false)
    {
      this._nonStandardCreation = bool1;
      return;
      this._propertyBasedCreator = null;
      break;
      arrayOfValueInjector = (ValueInjector[])paramList.toArray(new ValueInjector[paramList.size()]);
      break label102;
    }
  }

  @Deprecated
  public BeanDeserializer(AnnotatedClass paramAnnotatedClass, JavaType paramJavaType, BeanProperty paramBeanProperty, CreatorCollector paramCreatorCollector, BeanPropertyMap paramBeanPropertyMap, Map<String, SettableBeanProperty> paramMap, HashSet<String> paramHashSet, boolean paramBoolean, SettableAnyProperty paramSettableAnyProperty)
  {
    this(paramAnnotatedClass, paramJavaType, paramBeanProperty, paramCreatorCollector.constructValueInstantiator(null), paramBeanPropertyMap, paramMap, paramHashSet, paramBoolean, paramSettableAnyProperty, null);
  }

  private final void _handleUnknown(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject, String paramString)
    throws IOException, JsonProcessingException
  {
    if ((this._ignorableProps != null) && (this._ignorableProps.contains(paramString)))
    {
      paramJsonParser.skipChildren();
      return;
    }
    if (this._anySetter != null)
      try
      {
        this._anySetter.deserializeAndSet(paramJsonParser, paramDeserializationContext, paramObject, paramString);
        return;
      }
      catch (Exception localException)
      {
        wrapAndThrow(localException, paramObject, paramString, paramDeserializationContext);
        return;
      }
    handleUnknownProperty(paramJsonParser, paramDeserializationContext, paramObject, paramString);
  }

  protected final Object _deserializeUsingPropertyBased(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    PropertyBasedCreator localPropertyBasedCreator = this._propertyBasedCreator;
    PropertyValueBuffer localPropertyValueBuffer = localPropertyBasedCreator.startBuilding(paramJsonParser, paramDeserializationContext);
    TokenBuffer localTokenBuffer = null;
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    String str;
    if (localJsonToken == JsonToken.FIELD_NAME)
    {
      str = paramJsonParser.getCurrentName();
      paramJsonParser.nextToken();
      SettableBeanProperty localSettableBeanProperty1 = localPropertyBasedCreator.findCreatorProperty(str);
      if (localSettableBeanProperty1 != null)
      {
        Object localObject3 = localSettableBeanProperty1.deserialize(paramJsonParser, paramDeserializationContext);
        if (localPropertyValueBuffer.assignParameter(localSettableBeanProperty1.getPropertyIndex(), localObject3))
          paramJsonParser.nextToken();
      }
    }
    Object localObject2;
    while (true)
    {
      Object localObject5;
      try
      {
        Object localObject4 = localPropertyBasedCreator.build(localPropertyValueBuffer);
        localObject5 = localObject4;
        if (localObject5.getClass() != this._beanType.getRawClass())
        {
          localObject2 = handlePolymorphic(paramJsonParser, paramDeserializationContext, localObject5, localTokenBuffer);
          return localObject2;
        }
      }
      catch (Exception localException2)
      {
        wrapAndThrow(localException2, this._beanType.getRawClass(), str, paramDeserializationContext);
      }
      while (true)
      {
        localJsonToken = paramJsonParser.nextToken();
        break;
        if (localTokenBuffer != null)
          localObject5 = handleUnknownProperties(paramDeserializationContext, localObject5, localTokenBuffer);
        return deserialize(paramJsonParser, paramDeserializationContext, localObject5);
        SettableBeanProperty localSettableBeanProperty2 = this._beanProperties.find(str);
        if (localSettableBeanProperty2 != null)
        {
          localPropertyValueBuffer.bufferProperty(localSettableBeanProperty2, localSettableBeanProperty2.deserialize(paramJsonParser, paramDeserializationContext));
        }
        else if ((this._ignorableProps != null) && (this._ignorableProps.contains(str)))
        {
          paramJsonParser.skipChildren();
        }
        else if (this._anySetter != null)
        {
          localPropertyValueBuffer.bufferAnyProperty(this._anySetter, str, this._anySetter.deserialize(paramJsonParser, paramDeserializationContext));
        }
        else
        {
          if (localTokenBuffer == null)
            localTokenBuffer = new TokenBuffer(paramJsonParser.getCodec());
          localTokenBuffer.writeFieldName(str);
          localTokenBuffer.copyCurrentStructure(paramJsonParser);
        }
      }
      try
      {
        Object localObject1 = localPropertyBasedCreator.build(localPropertyValueBuffer);
        localObject2 = localObject1;
        if (localTokenBuffer != null)
          if (localObject2.getClass() != this._beanType.getRawClass())
            return handlePolymorphic(null, paramDeserializationContext, localObject2, localTokenBuffer);
      }
      catch (Exception localException1)
      {
        wrapInstantiationProblem(localException1, paramDeserializationContext);
        return null;
      }
    }
    return handleUnknownProperties(paramDeserializationContext, localObject2, localTokenBuffer);
  }

  protected JsonDeserializer<Object> _findSubclassDeserializer(DeserializationContext paramDeserializationContext, Object paramObject, TokenBuffer paramTokenBuffer)
    throws IOException, JsonProcessingException
  {
    Object localObject2;
    try
    {
      if (this._subDeserializers == null);
      for (localObject2 = null; ; localObject2 = (JsonDeserializer)this._subDeserializers.get(new ClassKey(paramObject.getClass())))
      {
        if (localObject2 == null)
          break;
        return localObject2;
      }
    }
    finally
    {
    }
    DeserializerProvider localDeserializerProvider = paramDeserializationContext.getDeserializerProvider();
    if (localDeserializerProvider != null)
    {
      JavaType localJavaType = paramDeserializationContext.constructType(paramObject.getClass());
      localObject2 = localDeserializerProvider.findValueDeserializer(paramDeserializationContext.getConfig(), localJavaType, this._property);
      if (localObject2 != null)
        try
        {
          if (this._subDeserializers == null)
            this._subDeserializers = new HashMap();
          this._subDeserializers.put(new ClassKey(paramObject.getClass()), localObject2);
        }
        finally
        {
        }
    }
    return localObject2;
  }

  protected SettableBeanProperty _resolveInnerClassValuedProperty(DeserializationConfig paramDeserializationConfig, SettableBeanProperty paramSettableBeanProperty)
  {
    JsonDeserializer localJsonDeserializer = paramSettableBeanProperty.getValueDeserializer();
    Class localClass2;
    Constructor[] arrayOfConstructor;
    int i;
    if (((localJsonDeserializer instanceof BeanDeserializer)) && (!((BeanDeserializer)localJsonDeserializer).getValueInstantiator().canCreateUsingDefault()))
    {
      Class localClass1 = paramSettableBeanProperty.getType().getRawClass();
      localClass2 = ClassUtil.getOuterClass(localClass1);
      if ((localClass2 != null) && (localClass2 == this._beanType.getRawClass()))
      {
        arrayOfConstructor = localClass1.getConstructors();
        i = arrayOfConstructor.length;
      }
    }
    for (int j = 0; ; j++)
      if (j < i)
      {
        Constructor localConstructor = arrayOfConstructor[j];
        Class[] arrayOfClass = localConstructor.getParameterTypes();
        if ((arrayOfClass.length == 1) && (arrayOfClass[0] == localClass2))
        {
          if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS))
            ClassUtil.checkAndFixAccess(localConstructor);
          paramSettableBeanProperty = new SettableBeanProperty.InnerClassProperty(paramSettableBeanProperty, localConstructor);
        }
      }
      else
      {
        return paramSettableBeanProperty;
      }
  }

  protected SettableBeanProperty _resolveManagedReferenceProperty(DeserializationConfig paramDeserializationConfig, SettableBeanProperty paramSettableBeanProperty)
  {
    String str = paramSettableBeanProperty.getManagedReferenceName();
    if (str == null)
      return paramSettableBeanProperty;
    JsonDeserializer localJsonDeserializer1 = paramSettableBeanProperty.getValueDeserializer();
    boolean bool = false;
    SettableBeanProperty localSettableBeanProperty;
    if ((localJsonDeserializer1 instanceof BeanDeserializer))
      localSettableBeanProperty = ((BeanDeserializer)localJsonDeserializer1).findBackReference(str);
    while (localSettableBeanProperty == null)
    {
      throw new IllegalArgumentException("Can not handle managed/back reference '" + str + "': no back reference property found from type " + paramSettableBeanProperty.getType());
      if ((localJsonDeserializer1 instanceof ContainerDeserializerBase))
      {
        JsonDeserializer localJsonDeserializer2 = ((ContainerDeserializerBase)localJsonDeserializer1).getContentDeserializer();
        if (!(localJsonDeserializer2 instanceof BeanDeserializer))
          throw new IllegalArgumentException("Can not handle managed/back reference '" + str + "': value deserializer is of type ContainerDeserializerBase, but content type is not handled by a BeanDeserializer " + " (instead it's of type " + localJsonDeserializer2.getClass().getName() + ")");
        localSettableBeanProperty = ((BeanDeserializer)localJsonDeserializer2).findBackReference(str);
        bool = true;
      }
      else
      {
        if ((localJsonDeserializer1 instanceof AbstractDeserializer))
          throw new IllegalArgumentException("Can not handle managed/back reference for abstract types (property " + this._beanType.getRawClass().getName() + "." + paramSettableBeanProperty.getName() + ")");
        throw new IllegalArgumentException("Can not handle managed/back reference '" + str + "': type for value deserializer is not BeanDeserializer or ContainerDeserializerBase, but " + localJsonDeserializer1.getClass().getName());
      }
    }
    JavaType localJavaType1 = this._beanType;
    JavaType localJavaType2 = localSettableBeanProperty.getType();
    if (!localJavaType2.getRawClass().isAssignableFrom(localJavaType1.getRawClass()))
      throw new IllegalArgumentException("Can not handle managed/back reference '" + str + "': back reference type (" + localJavaType2.getRawClass().getName() + ") not compatible with managed type (" + localJavaType1.getRawClass().getName() + ")");
    return new SettableBeanProperty.ManagedReferenceProperty(str, paramSettableBeanProperty, localSettableBeanProperty, this._forClass.getAnnotations(), bool);
  }

  protected SettableBeanProperty _resolveUnwrappedProperty(DeserializationConfig paramDeserializationConfig, SettableBeanProperty paramSettableBeanProperty)
  {
    AnnotatedMember localAnnotatedMember = paramSettableBeanProperty.getMember();
    if ((localAnnotatedMember != null) && (paramDeserializationConfig.getAnnotationIntrospector().shouldUnwrapProperty(localAnnotatedMember) == Boolean.TRUE))
    {
      JsonDeserializer localJsonDeserializer1 = paramSettableBeanProperty.getValueDeserializer();
      JsonDeserializer localJsonDeserializer2 = localJsonDeserializer1.unwrappingDeserializer();
      if ((localJsonDeserializer2 != localJsonDeserializer1) && (localJsonDeserializer2 != null))
        return paramSettableBeanProperty.withValueDeserializer(localJsonDeserializer2);
    }
    return null;
  }

  public final Object deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.START_OBJECT)
    {
      paramJsonParser.nextToken();
      return deserializeFromObject(paramJsonParser, paramDeserializationContext);
    }
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[localJsonToken.ordinal()])
    {
    default:
      throw paramDeserializationContext.mappingException(getBeanClass());
    case 1:
      return deserializeFromString(paramJsonParser, paramDeserializationContext);
    case 2:
      return deserializeFromNumber(paramJsonParser, paramDeserializationContext);
    case 3:
      return deserializeFromDouble(paramJsonParser, paramDeserializationContext);
    case 4:
      return paramJsonParser.getEmbeddedObject();
    case 5:
    case 6:
      return deserializeFromBoolean(paramJsonParser, paramDeserializationContext);
    case 7:
      return deserializeFromArray(paramJsonParser, paramDeserializationContext);
    case 8:
    case 9:
    }
    return deserializeFromObject(paramJsonParser, paramDeserializationContext);
  }

  public Object deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject)
    throws IOException, JsonProcessingException
  {
    if (this._injectables != null)
      injectValues(paramDeserializationContext, paramObject);
    if (this._unwrappedPropertyHandler != null)
      paramObject = deserializeWithUnwrapped(paramJsonParser, paramDeserializationContext, paramObject);
    JsonToken localJsonToken;
    do
    {
      return paramObject;
      if (this._externalTypeIdHandler != null)
        return deserializeWithExternalTypeId(paramJsonParser, paramDeserializationContext, paramObject);
      localJsonToken = paramJsonParser.getCurrentToken();
      if (localJsonToken == JsonToken.START_OBJECT)
        localJsonToken = paramJsonParser.nextToken();
    }
    while (localJsonToken != JsonToken.FIELD_NAME);
    String str = paramJsonParser.getCurrentName();
    paramJsonParser.nextToken();
    SettableBeanProperty localSettableBeanProperty = this._beanProperties.find(str);
    if (localSettableBeanProperty != null);
    while (true)
    {
      try
      {
        localSettableBeanProperty.deserializeAndSet(paramJsonParser, paramDeserializationContext, paramObject);
        localJsonToken = paramJsonParser.nextToken();
      }
      catch (Exception localException)
      {
        wrapAndThrow(localException, paramObject, str, paramDeserializationContext);
        continue;
      }
      if ((this._ignorableProps != null) && (this._ignorableProps.contains(str)))
        paramJsonParser.skipChildren();
      else if (this._anySetter != null)
        this._anySetter.deserializeAndSet(paramJsonParser, paramDeserializationContext, paramObject, str);
      else
        handleUnknownProperty(paramJsonParser, paramDeserializationContext, paramObject, str);
    }
  }

  public Object deserializeFromArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (this._delegateDeserializer != null)
      try
      {
        Object localObject = this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
        if (this._injectables != null)
          injectValues(paramDeserializationContext, localObject);
        return localObject;
      }
      catch (Exception localException)
      {
        wrapInstantiationProblem(localException, paramDeserializationContext);
      }
    throw paramDeserializationContext.mappingException(getBeanClass());
  }

  public Object deserializeFromBoolean(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if ((this._delegateDeserializer != null) && (!this._valueInstantiator.canCreateFromBoolean()))
    {
      Object localObject = this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
      if (this._injectables != null)
        injectValues(paramDeserializationContext, localObject);
      return localObject;
    }
    if (paramJsonParser.getCurrentToken() == JsonToken.VALUE_TRUE);
    for (boolean bool = true; ; bool = false)
      return this._valueInstantiator.createFromBoolean(bool);
  }

  public Object deserializeFromDouble(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    Object localObject;
    switch (1.$SwitchMap$org$codehaus$jackson$JsonParser$NumberType[paramJsonParser.getNumberType().ordinal()])
    {
    default:
      if (this._delegateDeserializer != null)
        localObject = this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
      break;
    case 3:
    case 4:
      do
      {
        return localObject;
        if ((this._delegateDeserializer == null) || (this._valueInstantiator.canCreateFromDouble()))
          break;
        localObject = this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
      }
      while (this._injectables == null);
      injectValues(paramDeserializationContext, localObject);
      return localObject;
      return this._valueInstantiator.createFromDouble(paramJsonParser.getDoubleValue());
    }
    throw paramDeserializationContext.instantiationException(getBeanClass(), "no suitable creator method found to deserialize from JSON floating-point number");
  }

  public Object deserializeFromNumber(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    Object localObject;
    switch (1.$SwitchMap$org$codehaus$jackson$JsonParser$NumberType[paramJsonParser.getNumberType().ordinal()])
    {
    default:
      if (this._delegateDeserializer == null)
        break label193;
      localObject = this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
      if (this._injectables != null)
        injectValues(paramDeserializationContext, localObject);
      break;
    case 1:
    case 2:
    }
    do
    {
      do
      {
        return localObject;
        if ((this._delegateDeserializer == null) || (this._valueInstantiator.canCreateFromInt()))
          break;
        localObject = this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
      }
      while (this._injectables == null);
      injectValues(paramDeserializationContext, localObject);
      return localObject;
      return this._valueInstantiator.createFromInt(paramJsonParser.getIntValue());
      if ((this._delegateDeserializer == null) || (this._valueInstantiator.canCreateFromInt()))
        break;
      localObject = this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
    }
    while (this._injectables == null);
    injectValues(paramDeserializationContext, localObject);
    return localObject;
    return this._valueInstantiator.createFromLong(paramJsonParser.getLongValue());
    label193: throw paramDeserializationContext.instantiationException(getBeanClass(), "no suitable creator method found to deserialize from JSON integer number");
  }

  public Object deserializeFromObject(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    Object localObject;
    if (this._nonStandardCreation)
      if (this._unwrappedPropertyHandler != null)
        localObject = deserializeWithUnwrapped(paramJsonParser, paramDeserializationContext);
    do
    {
      return localObject;
      if (this._externalTypeIdHandler != null)
        return deserializeWithExternalTypeId(paramJsonParser, paramDeserializationContext);
      return deserializeFromObjectUsingNonDefault(paramJsonParser, paramDeserializationContext);
      localObject = this._valueInstantiator.createUsingDefault();
      if (this._injectables != null)
        injectValues(paramDeserializationContext, localObject);
    }
    while (paramJsonParser.getCurrentToken() == JsonToken.END_OBJECT);
    String str = paramJsonParser.getCurrentName();
    paramJsonParser.nextToken();
    SettableBeanProperty localSettableBeanProperty = this._beanProperties.find(str);
    if (localSettableBeanProperty != null);
    while (true)
    {
      try
      {
        localSettableBeanProperty.deserializeAndSet(paramJsonParser, paramDeserializationContext, localObject);
        paramJsonParser.nextToken();
      }
      catch (Exception localException)
      {
        wrapAndThrow(localException, localObject, str, paramDeserializationContext);
        continue;
      }
      _handleUnknown(paramJsonParser, paramDeserializationContext, localObject, str);
    }
  }

  protected Object deserializeFromObjectUsingNonDefault(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (this._delegateDeserializer != null)
      return this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
    if (this._propertyBasedCreator != null)
      return _deserializeUsingPropertyBased(paramJsonParser, paramDeserializationContext);
    if (this._beanType.isAbstract())
      throw JsonMappingException.from(paramJsonParser, "Can not instantiate abstract type " + this._beanType + " (need to add/enable type information?)");
    throw JsonMappingException.from(paramJsonParser, "No suitable constructor found for type " + this._beanType + ": can not instantiate from JSON object (need to add/enable type information?)");
  }

  public Object deserializeFromString(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if ((this._delegateDeserializer != null) && (!this._valueInstantiator.canCreateFromString()))
    {
      Object localObject = this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
      if (this._injectables != null)
        injectValues(paramDeserializationContext, localObject);
      return localObject;
    }
    return this._valueInstantiator.createFromString(paramJsonParser.getText());
  }

  protected Object deserializeUsingPropertyBasedWithExternalTypeId(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    ExternalTypeHandler localExternalTypeHandler = this._externalTypeIdHandler.start();
    PropertyBasedCreator localPropertyBasedCreator = this._propertyBasedCreator;
    PropertyValueBuffer localPropertyValueBuffer = localPropertyBasedCreator.startBuilding(paramJsonParser, paramDeserializationContext);
    TokenBuffer localTokenBuffer = new TokenBuffer(paramJsonParser.getCodec());
    localTokenBuffer.writeStartObject();
    JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
    if (localJsonToken1 == JsonToken.FIELD_NAME)
    {
      String str = paramJsonParser.getCurrentName();
      paramJsonParser.nextToken();
      SettableBeanProperty localSettableBeanProperty1 = localPropertyBasedCreator.findCreatorProperty(str);
      Object localObject3;
      if (localSettableBeanProperty1 != null)
      {
        Object localObject2 = localSettableBeanProperty1.deserialize(paramJsonParser, paramDeserializationContext);
        if (localPropertyValueBuffer.assignParameter(localSettableBeanProperty1.getPropertyIndex(), localObject2))
        {
          JsonToken localJsonToken2 = paramJsonParser.nextToken();
          try
          {
            localObject3 = localPropertyBasedCreator.build(localPropertyValueBuffer);
            while (localJsonToken2 == JsonToken.FIELD_NAME)
            {
              paramJsonParser.nextToken();
              localTokenBuffer.copyCurrentStructure(paramJsonParser);
              localJsonToken2 = paramJsonParser.nextToken();
            }
          }
          catch (Exception localException2)
          {
            wrapAndThrow(localException2, this._beanType.getRawClass(), str, paramDeserializationContext);
          }
        }
      }
      while (true)
      {
        localJsonToken1 = paramJsonParser.nextToken();
        break;
        if (localObject3.getClass() != this._beanType.getRawClass())
          throw paramDeserializationContext.mappingException("Can not create polymorphic instances with unwrapped values");
        return localExternalTypeHandler.complete(paramJsonParser, paramDeserializationContext, localObject3);
        SettableBeanProperty localSettableBeanProperty2 = this._beanProperties.find(str);
        if (localSettableBeanProperty2 != null)
          localPropertyValueBuffer.bufferProperty(localSettableBeanProperty2, localSettableBeanProperty2.deserialize(paramJsonParser, paramDeserializationContext));
        else if (!localExternalTypeHandler.handleToken(paramJsonParser, paramDeserializationContext, str, null))
          if ((this._ignorableProps != null) && (this._ignorableProps.contains(str)))
            paramJsonParser.skipChildren();
          else if (this._anySetter != null)
            localPropertyValueBuffer.bufferAnyProperty(this._anySetter, str, this._anySetter.deserialize(paramJsonParser, paramDeserializationContext));
      }
    }
    try
    {
      Object localObject1 = localPropertyBasedCreator.build(localPropertyValueBuffer);
      return localExternalTypeHandler.complete(paramJsonParser, paramDeserializationContext, localObject1);
    }
    catch (Exception localException1)
    {
      wrapInstantiationProblem(localException1, paramDeserializationContext);
    }
    return null;
  }

  protected Object deserializeUsingPropertyBasedWithUnwrapped(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    PropertyBasedCreator localPropertyBasedCreator = this._propertyBasedCreator;
    PropertyValueBuffer localPropertyValueBuffer = localPropertyBasedCreator.startBuilding(paramJsonParser, paramDeserializationContext);
    TokenBuffer localTokenBuffer = new TokenBuffer(paramJsonParser.getCodec());
    localTokenBuffer.writeStartObject();
    JsonToken localJsonToken1 = paramJsonParser.getCurrentToken();
    if (localJsonToken1 == JsonToken.FIELD_NAME)
    {
      String str = paramJsonParser.getCurrentName();
      paramJsonParser.nextToken();
      SettableBeanProperty localSettableBeanProperty1 = localPropertyBasedCreator.findCreatorProperty(str);
      Object localObject3;
      if (localSettableBeanProperty1 != null)
      {
        Object localObject2 = localSettableBeanProperty1.deserialize(paramJsonParser, paramDeserializationContext);
        if (localPropertyValueBuffer.assignParameter(localSettableBeanProperty1.getPropertyIndex(), localObject2))
        {
          JsonToken localJsonToken2 = paramJsonParser.nextToken();
          try
          {
            localObject3 = localPropertyBasedCreator.build(localPropertyValueBuffer);
            while (localJsonToken2 == JsonToken.FIELD_NAME)
            {
              paramJsonParser.nextToken();
              localTokenBuffer.copyCurrentStructure(paramJsonParser);
              localJsonToken2 = paramJsonParser.nextToken();
            }
          }
          catch (Exception localException2)
          {
            wrapAndThrow(localException2, this._beanType.getRawClass(), str, paramDeserializationContext);
          }
        }
      }
      while (true)
      {
        localJsonToken1 = paramJsonParser.nextToken();
        break;
        localTokenBuffer.writeEndObject();
        if (localObject3.getClass() != this._beanType.getRawClass())
          throw paramDeserializationContext.mappingException("Can not create polymorphic instances with unwrapped values");
        return this._unwrappedPropertyHandler.processUnwrapped(paramJsonParser, paramDeserializationContext, localObject3, localTokenBuffer);
        SettableBeanProperty localSettableBeanProperty2 = this._beanProperties.find(str);
        if (localSettableBeanProperty2 != null)
        {
          localPropertyValueBuffer.bufferProperty(localSettableBeanProperty2, localSettableBeanProperty2.deserialize(paramJsonParser, paramDeserializationContext));
        }
        else if ((this._ignorableProps != null) && (this._ignorableProps.contains(str)))
        {
          paramJsonParser.skipChildren();
        }
        else
        {
          localTokenBuffer.writeFieldName(str);
          localTokenBuffer.copyCurrentStructure(paramJsonParser);
          if (this._anySetter != null)
            localPropertyValueBuffer.bufferAnyProperty(this._anySetter, str, this._anySetter.deserialize(paramJsonParser, paramDeserializationContext));
        }
      }
    }
    try
    {
      Object localObject1 = localPropertyBasedCreator.build(localPropertyValueBuffer);
      return this._unwrappedPropertyHandler.processUnwrapped(paramJsonParser, paramDeserializationContext, localObject1, localTokenBuffer);
    }
    catch (Exception localException1)
    {
      wrapInstantiationProblem(localException1, paramDeserializationContext);
    }
    return null;
  }

  protected Object deserializeWithExternalTypeId(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (this._propertyBasedCreator != null)
      return deserializeUsingPropertyBasedWithExternalTypeId(paramJsonParser, paramDeserializationContext);
    return deserializeWithExternalTypeId(paramJsonParser, paramDeserializationContext, this._valueInstantiator.createUsingDefault());
  }

  protected Object deserializeWithExternalTypeId(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject)
    throws IOException, JsonProcessingException
  {
    ExternalTypeHandler localExternalTypeHandler = this._externalTypeIdHandler.start();
    if (paramJsonParser.getCurrentToken() != JsonToken.END_OBJECT)
    {
      String str = paramJsonParser.getCurrentName();
      paramJsonParser.nextToken();
      SettableBeanProperty localSettableBeanProperty = this._beanProperties.find(str);
      if (localSettableBeanProperty != null);
      while (true)
      {
        try
        {
          localSettableBeanProperty.deserializeAndSet(paramJsonParser, paramDeserializationContext, paramObject);
          paramJsonParser.nextToken();
        }
        catch (Exception localException2)
        {
          wrapAndThrow(localException2, paramObject, str, paramDeserializationContext);
          continue;
        }
        if ((this._ignorableProps != null) && (this._ignorableProps.contains(str)))
          paramJsonParser.skipChildren();
        else if (!localExternalTypeHandler.handleToken(paramJsonParser, paramDeserializationContext, str, paramObject))
          if (this._anySetter != null)
            try
            {
              this._anySetter.deserializeAndSet(paramJsonParser, paramDeserializationContext, paramObject, str);
            }
            catch (Exception localException1)
            {
              wrapAndThrow(localException1, paramObject, str, paramDeserializationContext);
            }
          else
            handleUnknownProperty(paramJsonParser, paramDeserializationContext, paramObject, str);
      }
    }
    return localExternalTypeHandler.complete(paramJsonParser, paramDeserializationContext, paramObject);
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromObject(paramJsonParser, paramDeserializationContext);
  }

  protected Object deserializeWithUnwrapped(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (this._delegateDeserializer != null)
      return this._valueInstantiator.createUsingDelegate(this._delegateDeserializer.deserialize(paramJsonParser, paramDeserializationContext));
    if (this._propertyBasedCreator != null)
      return deserializeUsingPropertyBasedWithUnwrapped(paramJsonParser, paramDeserializationContext);
    TokenBuffer localTokenBuffer = new TokenBuffer(paramJsonParser.getCodec());
    localTokenBuffer.writeStartObject();
    Object localObject = this._valueInstantiator.createUsingDefault();
    if (this._injectables != null)
      injectValues(paramDeserializationContext, localObject);
    if (paramJsonParser.getCurrentToken() != JsonToken.END_OBJECT)
    {
      String str = paramJsonParser.getCurrentName();
      paramJsonParser.nextToken();
      SettableBeanProperty localSettableBeanProperty = this._beanProperties.find(str);
      if (localSettableBeanProperty != null);
      while (true)
      {
        try
        {
          localSettableBeanProperty.deserializeAndSet(paramJsonParser, paramDeserializationContext, localObject);
          paramJsonParser.nextToken();
        }
        catch (Exception localException2)
        {
          wrapAndThrow(localException2, localObject, str, paramDeserializationContext);
          continue;
        }
        if ((this._ignorableProps != null) && (this._ignorableProps.contains(str)))
        {
          paramJsonParser.skipChildren();
        }
        else
        {
          localTokenBuffer.writeFieldName(str);
          localTokenBuffer.copyCurrentStructure(paramJsonParser);
          if (this._anySetter != null)
            try
            {
              this._anySetter.deserializeAndSet(paramJsonParser, paramDeserializationContext, localObject, str);
            }
            catch (Exception localException1)
            {
              wrapAndThrow(localException1, localObject, str, paramDeserializationContext);
            }
        }
      }
    }
    localTokenBuffer.writeEndObject();
    this._unwrappedPropertyHandler.processUnwrapped(paramJsonParser, paramDeserializationContext, localObject, localTokenBuffer);
    return localObject;
  }

  protected Object deserializeWithUnwrapped(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.START_OBJECT)
      localJsonToken = paramJsonParser.nextToken();
    TokenBuffer localTokenBuffer = new TokenBuffer(paramJsonParser.getCodec());
    localTokenBuffer.writeStartObject();
    if (localJsonToken == JsonToken.FIELD_NAME)
    {
      String str = paramJsonParser.getCurrentName();
      SettableBeanProperty localSettableBeanProperty = this._beanProperties.find(str);
      paramJsonParser.nextToken();
      if (localSettableBeanProperty != null);
      while (true)
      {
        try
        {
          localSettableBeanProperty.deserializeAndSet(paramJsonParser, paramDeserializationContext, paramObject);
          localJsonToken = paramJsonParser.nextToken();
        }
        catch (Exception localException)
        {
          wrapAndThrow(localException, paramObject, str, paramDeserializationContext);
          continue;
        }
        if ((this._ignorableProps != null) && (this._ignorableProps.contains(str)))
        {
          paramJsonParser.skipChildren();
        }
        else
        {
          localTokenBuffer.writeFieldName(str);
          localTokenBuffer.copyCurrentStructure(paramJsonParser);
          if (this._anySetter != null)
            this._anySetter.deserializeAndSet(paramJsonParser, paramDeserializationContext, paramObject, str);
        }
      }
    }
    localTokenBuffer.writeEndObject();
    this._unwrappedPropertyHandler.processUnwrapped(paramJsonParser, paramDeserializationContext, paramObject, localTokenBuffer);
    return paramObject;
  }

  public SettableBeanProperty findBackReference(String paramString)
  {
    if (this._backRefs == null)
      return null;
    return (SettableBeanProperty)this._backRefs.get(paramString);
  }

  public final Class<?> getBeanClass()
  {
    return this._beanType.getRawClass();
  }

  public int getPropertyCount()
  {
    return this._beanProperties.size();
  }

  public ValueInstantiator getValueInstantiator()
  {
    return this._valueInstantiator;
  }

  public JavaType getValueType()
  {
    return this._beanType;
  }

  protected Object handlePolymorphic(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject, TokenBuffer paramTokenBuffer)
    throws IOException, JsonProcessingException
  {
    JsonDeserializer localJsonDeserializer = _findSubclassDeserializer(paramDeserializationContext, paramObject, paramTokenBuffer);
    if (localJsonDeserializer != null)
    {
      if (paramTokenBuffer != null)
      {
        paramTokenBuffer.writeEndObject();
        JsonParser localJsonParser = paramTokenBuffer.asParser();
        localJsonParser.nextToken();
        paramObject = localJsonDeserializer.deserialize(localJsonParser, paramDeserializationContext, paramObject);
      }
      if (paramJsonParser != null)
        paramObject = localJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext, paramObject);
      return paramObject;
    }
    if (paramTokenBuffer != null)
      paramObject = handleUnknownProperties(paramDeserializationContext, paramObject, paramTokenBuffer);
    if (paramJsonParser != null)
      paramObject = deserialize(paramJsonParser, paramDeserializationContext, paramObject);
    return paramObject;
  }

  protected Object handleUnknownProperties(DeserializationContext paramDeserializationContext, Object paramObject, TokenBuffer paramTokenBuffer)
    throws IOException, JsonProcessingException
  {
    paramTokenBuffer.writeEndObject();
    JsonParser localJsonParser = paramTokenBuffer.asParser();
    while (localJsonParser.nextToken() != JsonToken.END_OBJECT)
    {
      String str = localJsonParser.getCurrentName();
      localJsonParser.nextToken();
      handleUnknownProperty(localJsonParser, paramDeserializationContext, paramObject, str);
    }
    return paramObject;
  }

  protected void handleUnknownProperty(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, Object paramObject, String paramString)
    throws IOException, JsonProcessingException
  {
    if ((this._ignoreAllUnknown) || ((this._ignorableProps != null) && (this._ignorableProps.contains(paramString))))
    {
      paramJsonParser.skipChildren();
      return;
    }
    super.handleUnknownProperty(paramJsonParser, paramDeserializationContext, paramObject, paramString);
  }

  public boolean hasProperty(String paramString)
  {
    return this._beanProperties.find(paramString) != null;
  }

  protected void injectValues(DeserializationContext paramDeserializationContext, Object paramObject)
    throws IOException, JsonProcessingException
  {
    ValueInjector[] arrayOfValueInjector = this._injectables;
    int i = arrayOfValueInjector.length;
    for (int j = 0; j < i; j++)
      arrayOfValueInjector[j].inject(paramDeserializationContext, paramObject);
  }

  public Iterator<SettableBeanProperty> properties()
  {
    if (this._beanProperties == null)
      throw new IllegalStateException("Can only call before BeanDeserializer has been resolved");
    return this._beanProperties.allProperties();
  }

  public void resolve(DeserializationConfig paramDeserializationConfig, DeserializerProvider paramDeserializerProvider)
    throws JsonMappingException
  {
    Iterator localIterator1 = this._beanProperties.allProperties();
    UnwrappedPropertyHandler localUnwrappedPropertyHandler = null;
    ExternalTypeHandler.Builder localBuilder = null;
    while (localIterator1.hasNext())
    {
      SettableBeanProperty localSettableBeanProperty2 = (SettableBeanProperty)localIterator1.next();
      SettableBeanProperty localSettableBeanProperty3 = localSettableBeanProperty2;
      if (!localSettableBeanProperty3.hasValueDeserializer())
        localSettableBeanProperty3 = localSettableBeanProperty3.withValueDeserializer(findDeserializer(paramDeserializationConfig, paramDeserializerProvider, localSettableBeanProperty3.getType(), localSettableBeanProperty3));
      Object localObject = _resolveManagedReferenceProperty(paramDeserializationConfig, localSettableBeanProperty3);
      SettableBeanProperty localSettableBeanProperty4 = _resolveUnwrappedProperty(paramDeserializationConfig, (SettableBeanProperty)localObject);
      if (localSettableBeanProperty4 != null)
      {
        localObject = localSettableBeanProperty4;
        if (localUnwrappedPropertyHandler == null)
          localUnwrappedPropertyHandler = new UnwrappedPropertyHandler();
        localUnwrappedPropertyHandler.addProperty((SettableBeanProperty)localObject);
      }
      SettableBeanProperty localSettableBeanProperty5 = _resolveInnerClassValuedProperty(paramDeserializationConfig, (SettableBeanProperty)localObject);
      if (localSettableBeanProperty5 != localSettableBeanProperty2)
        this._beanProperties.replace(localSettableBeanProperty5);
      if (localSettableBeanProperty5.hasValueTypeDeserializer())
      {
        TypeDeserializer localTypeDeserializer = localSettableBeanProperty5.getValueTypeDeserializer();
        if (localTypeDeserializer.getTypeInclusion() == JsonTypeInfo.As.EXTERNAL_PROPERTY)
        {
          if (localBuilder == null)
            localBuilder = new ExternalTypeHandler.Builder();
          localBuilder.addExternal(localSettableBeanProperty5, localTypeDeserializer.getPropertyName());
          this._beanProperties.remove(localSettableBeanProperty5);
        }
      }
    }
    if ((this._anySetter != null) && (!this._anySetter.hasValueDeserializer()))
      this._anySetter = this._anySetter.withValueDeserializer(findDeserializer(paramDeserializationConfig, paramDeserializerProvider, this._anySetter.getType(), this._anySetter.getProperty()));
    if (this._valueInstantiator.canCreateUsingDelegate())
    {
      JavaType localJavaType = this._valueInstantiator.getDelegateType();
      if (localJavaType == null)
        throw new IllegalArgumentException("Invalid delegate-creator definition for " + this._beanType + ": value instantiator (" + this._valueInstantiator.getClass().getName() + ") returned true for 'canCreateUsingDelegate()', but null for 'getDelegateType()'");
      AnnotatedWithParams localAnnotatedWithParams = this._valueInstantiator.getDelegateCreator();
      this._delegateDeserializer = findDeserializer(paramDeserializationConfig, paramDeserializerProvider, localJavaType, new BeanProperty.Std(null, localJavaType, this._forClass.getAnnotations(), localAnnotatedWithParams));
    }
    if (this._propertyBasedCreator != null)
    {
      Iterator localIterator2 = this._propertyBasedCreator.getCreatorProperties().iterator();
      while (localIterator2.hasNext())
      {
        SettableBeanProperty localSettableBeanProperty1 = (SettableBeanProperty)localIterator2.next();
        if (!localSettableBeanProperty1.hasValueDeserializer())
          this._propertyBasedCreator.assignDeserializer(localSettableBeanProperty1, findDeserializer(paramDeserializationConfig, paramDeserializerProvider, localSettableBeanProperty1.getType(), localSettableBeanProperty1));
      }
    }
    if (localBuilder != null)
    {
      this._externalTypeIdHandler = localBuilder.build();
      this._nonStandardCreation = true;
    }
    this._unwrappedPropertyHandler = localUnwrappedPropertyHandler;
    if (localUnwrappedPropertyHandler != null)
      this._nonStandardCreation = true;
  }

  public JsonDeserializer<Object> unwrappingDeserializer()
  {
    if (getClass() != BeanDeserializer.class)
      return this;
    return new BeanDeserializer(this, true);
  }

  @Deprecated
  public void wrapAndThrow(Throwable paramThrowable, Object paramObject, int paramInt)
    throws IOException
  {
    wrapAndThrow(paramThrowable, paramObject, paramInt, null);
  }

  public void wrapAndThrow(Throwable paramThrowable, Object paramObject, int paramInt, DeserializationContext paramDeserializationContext)
    throws IOException
  {
    while (((paramThrowable instanceof InvocationTargetException)) && (paramThrowable.getCause() != null))
      paramThrowable = paramThrowable.getCause();
    if ((paramThrowable instanceof Error))
      throw ((Error)paramThrowable);
    if ((paramDeserializationContext == null) || (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.WRAP_EXCEPTIONS)));
    for (int i = 1; (paramThrowable instanceof IOException); i = 0)
    {
      if ((i != 0) && ((paramThrowable instanceof JsonMappingException)))
        break label100;
      throw ((IOException)paramThrowable);
    }
    if ((i == 0) && ((paramThrowable instanceof RuntimeException)))
      throw ((RuntimeException)paramThrowable);
    label100: throw JsonMappingException.wrapWithPath(paramThrowable, paramObject, paramInt);
  }

  @Deprecated
  public void wrapAndThrow(Throwable paramThrowable, Object paramObject, String paramString)
    throws IOException
  {
    wrapAndThrow(paramThrowable, paramObject, paramString, null);
  }

  public void wrapAndThrow(Throwable paramThrowable, Object paramObject, String paramString, DeserializationContext paramDeserializationContext)
    throws IOException
  {
    while (((paramThrowable instanceof InvocationTargetException)) && (paramThrowable.getCause() != null))
      paramThrowable = paramThrowable.getCause();
    if ((paramThrowable instanceof Error))
      throw ((Error)paramThrowable);
    if ((paramDeserializationContext == null) || (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.WRAP_EXCEPTIONS)));
    for (int i = 1; (paramThrowable instanceof IOException); i = 0)
    {
      if ((i != 0) && ((paramThrowable instanceof JsonMappingException)))
        break label100;
      throw ((IOException)paramThrowable);
    }
    if ((i == 0) && ((paramThrowable instanceof RuntimeException)))
      throw ((RuntimeException)paramThrowable);
    label100: throw JsonMappingException.wrapWithPath(paramThrowable, paramObject, paramString);
  }

  protected void wrapInstantiationProblem(Throwable paramThrowable, DeserializationContext paramDeserializationContext)
    throws IOException
  {
    while (((paramThrowable instanceof InvocationTargetException)) && (paramThrowable.getCause() != null))
      paramThrowable = paramThrowable.getCause();
    if ((paramThrowable instanceof Error))
      throw ((Error)paramThrowable);
    if ((paramDeserializationContext == null) || (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.WRAP_EXCEPTIONS)));
    for (int i = 1; (paramThrowable instanceof IOException); i = 0)
      throw ((IOException)paramThrowable);
    if ((i == 0) && ((paramThrowable instanceof RuntimeException)))
      throw ((RuntimeException)paramThrowable);
    throw paramDeserializationContext.instantiationException(this._beanType.getRawClass(), paramThrowable);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.BeanDeserializer
 * JD-Core Version:    0.6.2
 */