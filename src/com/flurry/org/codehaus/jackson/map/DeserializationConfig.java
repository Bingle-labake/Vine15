package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.Base64Variant;
import com.flurry.org.codehaus.jackson.Base64Variants;
import com.flurry.org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;
import com.flurry.org.codehaus.jackson.annotate.JsonMethod;
import com.flurry.org.codehaus.jackson.map.deser.ValueInstantiator;
import com.flurry.org.codehaus.jackson.map.introspect.Annotated;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedClass;
import com.flurry.org.codehaus.jackson.map.introspect.NopAnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.introspect.VisibilityChecker;
import com.flurry.org.codehaus.jackson.map.jsontype.SubtypeResolver;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import com.flurry.org.codehaus.jackson.map.type.ClassKey;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.map.util.LinkedNode;
import com.flurry.org.codehaus.jackson.node.JsonNodeFactory;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.text.DateFormat;
import java.util.HashMap;

public class DeserializationConfig extends MapperConfig.Impl<Feature, DeserializationConfig>
{
  protected final JsonNodeFactory _nodeFactory;
  protected LinkedNode<DeserializationProblemHandler> _problemHandlers;
  protected boolean _sortPropertiesAlphabetically;

  public DeserializationConfig(ClassIntrospector<? extends BeanDescription> paramClassIntrospector, AnnotationIntrospector paramAnnotationIntrospector, VisibilityChecker<?> paramVisibilityChecker, SubtypeResolver paramSubtypeResolver, PropertyNamingStrategy paramPropertyNamingStrategy, TypeFactory paramTypeFactory, HandlerInstantiator paramHandlerInstantiator)
  {
    super(paramClassIntrospector, paramAnnotationIntrospector, paramVisibilityChecker, paramSubtypeResolver, paramPropertyNamingStrategy, paramTypeFactory, paramHandlerInstantiator, collectFeatureDefaults(Feature.class));
    this._nodeFactory = JsonNodeFactory.instance;
  }

  protected DeserializationConfig(DeserializationConfig paramDeserializationConfig)
  {
    this(paramDeserializationConfig, paramDeserializationConfig._base);
  }

  protected DeserializationConfig(DeserializationConfig paramDeserializationConfig, int paramInt)
  {
    super(paramDeserializationConfig, paramInt);
    this._problemHandlers = paramDeserializationConfig._problemHandlers;
    this._nodeFactory = paramDeserializationConfig._nodeFactory;
    this._sortPropertiesAlphabetically = paramDeserializationConfig._sortPropertiesAlphabetically;
  }

  protected DeserializationConfig(DeserializationConfig paramDeserializationConfig, MapperConfig.Base paramBase)
  {
    super(paramDeserializationConfig, paramBase, paramDeserializationConfig._subtypeResolver);
    this._problemHandlers = paramDeserializationConfig._problemHandlers;
    this._nodeFactory = paramDeserializationConfig._nodeFactory;
    this._sortPropertiesAlphabetically = paramDeserializationConfig._sortPropertiesAlphabetically;
  }

  protected DeserializationConfig(DeserializationConfig paramDeserializationConfig, JsonNodeFactory paramJsonNodeFactory)
  {
    super(paramDeserializationConfig);
    this._problemHandlers = paramDeserializationConfig._problemHandlers;
    this._nodeFactory = paramJsonNodeFactory;
    this._sortPropertiesAlphabetically = paramDeserializationConfig._sortPropertiesAlphabetically;
  }

  private DeserializationConfig(DeserializationConfig paramDeserializationConfig, HashMap<ClassKey, Class<?>> paramHashMap, SubtypeResolver paramSubtypeResolver)
  {
    this(paramDeserializationConfig, paramDeserializationConfig._base);
    this._mixInAnnotations = paramHashMap;
    this._subtypeResolver = paramSubtypeResolver;
  }

  public void addHandler(DeserializationProblemHandler paramDeserializationProblemHandler)
  {
    if (!LinkedNode.contains(this._problemHandlers, paramDeserializationProblemHandler))
      this._problemHandlers = new LinkedNode(paramDeserializationProblemHandler, this._problemHandlers);
  }

  public boolean canOverrideAccessModifiers()
  {
    return isEnabled(Feature.CAN_OVERRIDE_ACCESS_MODIFIERS);
  }

  public void clearHandlers()
  {
    this._problemHandlers = null;
  }

  public DeserializationConfig createUnshared(SubtypeResolver paramSubtypeResolver)
  {
    HashMap localHashMap = this._mixInAnnotations;
    this._mixInAnnotationsShared = true;
    return new DeserializationConfig(this, localHashMap, paramSubtypeResolver);
  }

  public JsonDeserializer<Object> deserializerInstance(Annotated paramAnnotated, Class<? extends JsonDeserializer<?>> paramClass)
  {
    HandlerInstantiator localHandlerInstantiator = getHandlerInstantiator();
    if (localHandlerInstantiator != null)
    {
      JsonDeserializer localJsonDeserializer = localHandlerInstantiator.deserializerInstance(this, paramAnnotated, paramClass);
      if (localJsonDeserializer != null)
        return localJsonDeserializer;
    }
    return (JsonDeserializer)ClassUtil.createInstance(paramClass, canOverrideAccessModifiers());
  }

  @Deprecated
  public void disable(Feature paramFeature)
  {
    super.disable(paramFeature);
  }

  @Deprecated
  public void enable(Feature paramFeature)
  {
    super.enable(paramFeature);
  }

  @Deprecated
  public void fromAnnotations(Class<?> paramClass)
  {
    AnnotationIntrospector localAnnotationIntrospector = getAnnotationIntrospector();
    AnnotatedClass localAnnotatedClass = AnnotatedClass.construct(paramClass, localAnnotationIntrospector, null);
    VisibilityChecker localVisibilityChecker = getDefaultVisibilityChecker();
    this._base = this._base.withVisibilityChecker(localAnnotationIntrospector.findAutoDetectVisibility(localAnnotatedClass, localVisibilityChecker));
  }

  public AnnotationIntrospector getAnnotationIntrospector()
  {
    if (isEnabled(Feature.USE_ANNOTATIONS))
      return super.getAnnotationIntrospector();
    return NopAnnotationIntrospector.instance;
  }

  public Base64Variant getBase64Variant()
  {
    return Base64Variants.getDefaultVariant();
  }

  public VisibilityChecker<?> getDefaultVisibilityChecker()
  {
    VisibilityChecker localVisibilityChecker = super.getDefaultVisibilityChecker();
    if (!isEnabled(Feature.AUTO_DETECT_SETTERS))
      localVisibilityChecker = localVisibilityChecker.withSetterVisibility(JsonAutoDetect.Visibility.NONE);
    if (!isEnabled(Feature.AUTO_DETECT_CREATORS))
      localVisibilityChecker = localVisibilityChecker.withCreatorVisibility(JsonAutoDetect.Visibility.NONE);
    if (!isEnabled(Feature.AUTO_DETECT_FIELDS))
      localVisibilityChecker = localVisibilityChecker.withFieldVisibility(JsonAutoDetect.Visibility.NONE);
    return localVisibilityChecker;
  }

  public final JsonNodeFactory getNodeFactory()
  {
    return this._nodeFactory;
  }

  public LinkedNode<DeserializationProblemHandler> getProblemHandlers()
  {
    return this._problemHandlers;
  }

  public <T extends BeanDescription> T introspect(JavaType paramJavaType)
  {
    return getClassIntrospector().forDeserialization(this, paramJavaType, this);
  }

  public <T extends BeanDescription> T introspectClassAnnotations(JavaType paramJavaType)
  {
    return getClassIntrospector().forClassAnnotations(this, paramJavaType, this);
  }

  public <T extends BeanDescription> T introspectDirectClassAnnotations(JavaType paramJavaType)
  {
    return getClassIntrospector().forDirectClassAnnotations(this, paramJavaType, this);
  }

  public <T extends BeanDescription> T introspectForCreation(JavaType paramJavaType)
  {
    return getClassIntrospector().forCreation(this, paramJavaType, this);
  }

  public boolean isAnnotationProcessingEnabled()
  {
    return isEnabled(Feature.USE_ANNOTATIONS);
  }

  public boolean isEnabled(Feature paramFeature)
  {
    return (this._featureFlags & paramFeature.getMask()) != 0;
  }

  public KeyDeserializer keyDeserializerInstance(Annotated paramAnnotated, Class<? extends KeyDeserializer> paramClass)
  {
    HandlerInstantiator localHandlerInstantiator = getHandlerInstantiator();
    if (localHandlerInstantiator != null)
    {
      KeyDeserializer localKeyDeserializer = localHandlerInstantiator.keyDeserializerInstance(this, paramAnnotated, paramClass);
      if (localKeyDeserializer != null)
        return localKeyDeserializer;
    }
    return (KeyDeserializer)ClassUtil.createInstance(paramClass, canOverrideAccessModifiers());
  }

  protected DeserializationConfig passSerializationFeatures(int paramInt)
  {
    if ((paramInt & SerializationConfig.Feature.SORT_PROPERTIES_ALPHABETICALLY.getMask()) != 0);
    for (boolean bool = true; ; bool = false)
    {
      this._sortPropertiesAlphabetically = bool;
      return this;
    }
  }

  @Deprecated
  public void set(Feature paramFeature, boolean paramBoolean)
  {
    super.set(paramFeature, paramBoolean);
  }

  public boolean shouldSortPropertiesAlphabetically()
  {
    return this._sortPropertiesAlphabetically;
  }

  public ValueInstantiator valueInstantiatorInstance(Annotated paramAnnotated, Class<? extends ValueInstantiator> paramClass)
  {
    HandlerInstantiator localHandlerInstantiator = getHandlerInstantiator();
    if (localHandlerInstantiator != null)
    {
      ValueInstantiator localValueInstantiator = localHandlerInstantiator.valueInstantiatorInstance(this, paramAnnotated, paramClass);
      if (localValueInstantiator != null)
        return localValueInstantiator;
    }
    return (ValueInstantiator)ClassUtil.createInstance(paramClass, canOverrideAccessModifiers());
  }

  public DeserializationConfig with(Feature[] paramArrayOfFeature)
  {
    int i = this._featureFlags;
    int j = paramArrayOfFeature.length;
    for (int k = 0; k < j; k++)
      i |= paramArrayOfFeature[k].getMask();
    return new DeserializationConfig(this, i);
  }

  public DeserializationConfig withAnnotationIntrospector(AnnotationIntrospector paramAnnotationIntrospector)
  {
    return new DeserializationConfig(this, this._base.withAnnotationIntrospector(paramAnnotationIntrospector));
  }

  public DeserializationConfig withAppendedAnnotationIntrospector(AnnotationIntrospector paramAnnotationIntrospector)
  {
    return new DeserializationConfig(this, this._base.withAppendedAnnotationIntrospector(paramAnnotationIntrospector));
  }

  public DeserializationConfig withClassIntrospector(ClassIntrospector<? extends BeanDescription> paramClassIntrospector)
  {
    return new DeserializationConfig(this, this._base.withClassIntrospector(paramClassIntrospector));
  }

  public DeserializationConfig withDateFormat(DateFormat paramDateFormat)
  {
    if (paramDateFormat == this._base.getDateFormat())
      return this;
    return new DeserializationConfig(this, this._base.withDateFormat(paramDateFormat));
  }

  public DeserializationConfig withHandlerInstantiator(HandlerInstantiator paramHandlerInstantiator)
  {
    if (paramHandlerInstantiator == this._base.getHandlerInstantiator())
      return this;
    return new DeserializationConfig(this, this._base.withHandlerInstantiator(paramHandlerInstantiator));
  }

  public DeserializationConfig withInsertedAnnotationIntrospector(AnnotationIntrospector paramAnnotationIntrospector)
  {
    return new DeserializationConfig(this, this._base.withInsertedAnnotationIntrospector(paramAnnotationIntrospector));
  }

  public DeserializationConfig withNodeFactory(JsonNodeFactory paramJsonNodeFactory)
  {
    return new DeserializationConfig(this, paramJsonNodeFactory);
  }

  public DeserializationConfig withPropertyNamingStrategy(PropertyNamingStrategy paramPropertyNamingStrategy)
  {
    return new DeserializationConfig(this, this._base.withPropertyNamingStrategy(paramPropertyNamingStrategy));
  }

  public DeserializationConfig withSubtypeResolver(SubtypeResolver paramSubtypeResolver)
  {
    DeserializationConfig localDeserializationConfig = new DeserializationConfig(this);
    localDeserializationConfig._subtypeResolver = paramSubtypeResolver;
    return localDeserializationConfig;
  }

  public DeserializationConfig withTypeFactory(TypeFactory paramTypeFactory)
  {
    if (paramTypeFactory == this._base.getTypeFactory())
      return this;
    return new DeserializationConfig(this, this._base.withTypeFactory(paramTypeFactory));
  }

  public DeserializationConfig withTypeResolverBuilder(TypeResolverBuilder<?> paramTypeResolverBuilder)
  {
    return new DeserializationConfig(this, this._base.withTypeResolverBuilder(paramTypeResolverBuilder));
  }

  public DeserializationConfig withVisibility(JsonMethod paramJsonMethod, JsonAutoDetect.Visibility paramVisibility)
  {
    return new DeserializationConfig(this, this._base.withVisibility(paramJsonMethod, paramVisibility));
  }

  public DeserializationConfig withVisibilityChecker(VisibilityChecker<?> paramVisibilityChecker)
  {
    return new DeserializationConfig(this, this._base.withVisibilityChecker(paramVisibilityChecker));
  }

  public DeserializationConfig without(Feature[] paramArrayOfFeature)
  {
    int i = this._featureFlags;
    int j = paramArrayOfFeature.length;
    for (int k = 0; k < j; k++)
      i &= (0xFFFFFFFF ^ paramArrayOfFeature[k].getMask());
    return new DeserializationConfig(this, i);
  }

  public static enum Feature
    implements MapperConfig.ConfigFeature
  {
    final boolean _defaultState;

    static
    {
      AUTO_DETECT_SETTERS = new Feature("AUTO_DETECT_SETTERS", 1, true);
      AUTO_DETECT_CREATORS = new Feature("AUTO_DETECT_CREATORS", 2, true);
      AUTO_DETECT_FIELDS = new Feature("AUTO_DETECT_FIELDS", 3, true);
      USE_GETTERS_AS_SETTERS = new Feature("USE_GETTERS_AS_SETTERS", 4, true);
      CAN_OVERRIDE_ACCESS_MODIFIERS = new Feature("CAN_OVERRIDE_ACCESS_MODIFIERS", 5, true);
      USE_BIG_DECIMAL_FOR_FLOATS = new Feature("USE_BIG_DECIMAL_FOR_FLOATS", 6, false);
      USE_BIG_INTEGER_FOR_INTS = new Feature("USE_BIG_INTEGER_FOR_INTS", 7, false);
      USE_JAVA_ARRAY_FOR_JSON_ARRAY = new Feature("USE_JAVA_ARRAY_FOR_JSON_ARRAY", 8, false);
      READ_ENUMS_USING_TO_STRING = new Feature("READ_ENUMS_USING_TO_STRING", 9, false);
      FAIL_ON_UNKNOWN_PROPERTIES = new Feature("FAIL_ON_UNKNOWN_PROPERTIES", 10, true);
      FAIL_ON_NULL_FOR_PRIMITIVES = new Feature("FAIL_ON_NULL_FOR_PRIMITIVES", 11, false);
      FAIL_ON_NUMBERS_FOR_ENUMS = new Feature("FAIL_ON_NUMBERS_FOR_ENUMS", 12, false);
      WRAP_EXCEPTIONS = new Feature("WRAP_EXCEPTIONS", 13, true);
      ACCEPT_SINGLE_VALUE_AS_ARRAY = new Feature("ACCEPT_SINGLE_VALUE_AS_ARRAY", 14, false);
      UNWRAP_ROOT_VALUE = new Feature("UNWRAP_ROOT_VALUE", 15, false);
      ACCEPT_EMPTY_STRING_AS_NULL_OBJECT = new Feature("ACCEPT_EMPTY_STRING_AS_NULL_OBJECT", 16, false);
      Feature[] arrayOfFeature = new Feature[17];
      arrayOfFeature[0] = USE_ANNOTATIONS;
      arrayOfFeature[1] = AUTO_DETECT_SETTERS;
      arrayOfFeature[2] = AUTO_DETECT_CREATORS;
      arrayOfFeature[3] = AUTO_DETECT_FIELDS;
      arrayOfFeature[4] = USE_GETTERS_AS_SETTERS;
      arrayOfFeature[5] = CAN_OVERRIDE_ACCESS_MODIFIERS;
      arrayOfFeature[6] = USE_BIG_DECIMAL_FOR_FLOATS;
      arrayOfFeature[7] = USE_BIG_INTEGER_FOR_INTS;
      arrayOfFeature[8] = USE_JAVA_ARRAY_FOR_JSON_ARRAY;
      arrayOfFeature[9] = READ_ENUMS_USING_TO_STRING;
      arrayOfFeature[10] = FAIL_ON_UNKNOWN_PROPERTIES;
      arrayOfFeature[11] = FAIL_ON_NULL_FOR_PRIMITIVES;
      arrayOfFeature[12] = FAIL_ON_NUMBERS_FOR_ENUMS;
      arrayOfFeature[13] = WRAP_EXCEPTIONS;
      arrayOfFeature[14] = ACCEPT_SINGLE_VALUE_AS_ARRAY;
      arrayOfFeature[15] = UNWRAP_ROOT_VALUE;
      arrayOfFeature[16] = ACCEPT_EMPTY_STRING_AS_NULL_OBJECT;
    }

    private Feature(boolean paramBoolean)
    {
      this._defaultState = paramBoolean;
    }

    public boolean enabledByDefault()
    {
      return this._defaultState;
    }

    public int getMask()
    {
      return 1 << ordinal();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.DeserializationConfig
 * JD-Core Version:    0.6.2
 */