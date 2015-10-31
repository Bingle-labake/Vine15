package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;
import com.flurry.org.codehaus.jackson.annotate.JsonMethod;
import com.flurry.org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import com.flurry.org.codehaus.jackson.map.annotate.JsonSerialize.Typing;
import com.flurry.org.codehaus.jackson.map.introspect.Annotated;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedClass;
import com.flurry.org.codehaus.jackson.map.introspect.VisibilityChecker;
import com.flurry.org.codehaus.jackson.map.jsontype.SubtypeResolver;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import com.flurry.org.codehaus.jackson.map.ser.FilterProvider;
import com.flurry.org.codehaus.jackson.map.type.ClassKey;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.text.DateFormat;
import java.util.HashMap;

public class SerializationConfig extends MapperConfig.Impl<Feature, SerializationConfig>
{
  protected FilterProvider _filterProvider;
  protected JsonSerialize.Inclusion _serializationInclusion = null;
  protected Class<?> _serializationView;

  public SerializationConfig(ClassIntrospector<? extends BeanDescription> paramClassIntrospector, AnnotationIntrospector paramAnnotationIntrospector, VisibilityChecker<?> paramVisibilityChecker, SubtypeResolver paramSubtypeResolver, PropertyNamingStrategy paramPropertyNamingStrategy, TypeFactory paramTypeFactory, HandlerInstantiator paramHandlerInstantiator)
  {
    super(paramClassIntrospector, paramAnnotationIntrospector, paramVisibilityChecker, paramSubtypeResolver, paramPropertyNamingStrategy, paramTypeFactory, paramHandlerInstantiator, collectFeatureDefaults(Feature.class));
    this._filterProvider = null;
  }

  protected SerializationConfig(SerializationConfig paramSerializationConfig)
  {
    this(paramSerializationConfig, paramSerializationConfig._base);
  }

  protected SerializationConfig(SerializationConfig paramSerializationConfig, int paramInt)
  {
    super(paramSerializationConfig, paramInt);
    this._serializationInclusion = paramSerializationConfig._serializationInclusion;
    this._serializationView = paramSerializationConfig._serializationView;
    this._filterProvider = paramSerializationConfig._filterProvider;
  }

  protected SerializationConfig(SerializationConfig paramSerializationConfig, MapperConfig.Base paramBase)
  {
    super(paramSerializationConfig, paramBase, paramSerializationConfig._subtypeResolver);
    this._serializationInclusion = paramSerializationConfig._serializationInclusion;
    this._serializationView = paramSerializationConfig._serializationView;
    this._filterProvider = paramSerializationConfig._filterProvider;
  }

  protected SerializationConfig(SerializationConfig paramSerializationConfig, JsonSerialize.Inclusion paramInclusion)
  {
    super(paramSerializationConfig);
    this._serializationInclusion = paramInclusion;
    if (paramInclusion == JsonSerialize.Inclusion.NON_NULL);
    for (this._featureFlags &= (0xFFFFFFFF ^ Feature.WRITE_NULL_PROPERTIES.getMask()); ; this._featureFlags |= Feature.WRITE_NULL_PROPERTIES.getMask())
    {
      this._serializationView = paramSerializationConfig._serializationView;
      this._filterProvider = paramSerializationConfig._filterProvider;
      return;
    }
  }

  protected SerializationConfig(SerializationConfig paramSerializationConfig, FilterProvider paramFilterProvider)
  {
    super(paramSerializationConfig);
    this._serializationInclusion = paramSerializationConfig._serializationInclusion;
    this._serializationView = paramSerializationConfig._serializationView;
    this._filterProvider = paramFilterProvider;
  }

  protected SerializationConfig(SerializationConfig paramSerializationConfig, Class<?> paramClass)
  {
    super(paramSerializationConfig);
    this._serializationInclusion = paramSerializationConfig._serializationInclusion;
    this._serializationView = paramClass;
    this._filterProvider = paramSerializationConfig._filterProvider;
  }

  protected SerializationConfig(SerializationConfig paramSerializationConfig, HashMap<ClassKey, Class<?>> paramHashMap, SubtypeResolver paramSubtypeResolver)
  {
    this(paramSerializationConfig, paramSerializationConfig._base);
    this._mixInAnnotations = paramHashMap;
    this._subtypeResolver = paramSubtypeResolver;
  }

  public boolean canOverrideAccessModifiers()
  {
    return isEnabled(Feature.CAN_OVERRIDE_ACCESS_MODIFIERS);
  }

  public SerializationConfig createUnshared(SubtypeResolver paramSubtypeResolver)
  {
    HashMap localHashMap = this._mixInAnnotations;
    this._mixInAnnotationsShared = true;
    return new SerializationConfig(this, localHashMap, paramSubtypeResolver);
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
    this._base = this._base.withVisibilityChecker(localAnnotationIntrospector.findAutoDetectVisibility(localAnnotatedClass, getDefaultVisibilityChecker()));
    JsonSerialize.Inclusion localInclusion = localAnnotationIntrospector.findSerializationInclusion(localAnnotatedClass, null);
    if (localInclusion != this._serializationInclusion)
      setSerializationInclusion(localInclusion);
    JsonSerialize.Typing localTyping = localAnnotationIntrospector.findSerializationTyping(localAnnotatedClass);
    Feature localFeature;
    if (localTyping != null)
    {
      localFeature = Feature.USE_STATIC_TYPING;
      if (localTyping != JsonSerialize.Typing.STATIC)
        break label92;
    }
    label92: for (boolean bool = true; ; bool = false)
    {
      set(localFeature, bool);
      return;
    }
  }

  public AnnotationIntrospector getAnnotationIntrospector()
  {
    if (isEnabled(Feature.USE_ANNOTATIONS))
      return super.getAnnotationIntrospector();
    return AnnotationIntrospector.nopInstance();
  }

  public VisibilityChecker<?> getDefaultVisibilityChecker()
  {
    VisibilityChecker localVisibilityChecker = super.getDefaultVisibilityChecker();
    if (!isEnabled(Feature.AUTO_DETECT_GETTERS))
      localVisibilityChecker = localVisibilityChecker.withGetterVisibility(JsonAutoDetect.Visibility.NONE);
    if (!isEnabled(Feature.AUTO_DETECT_IS_GETTERS))
      localVisibilityChecker = localVisibilityChecker.withIsGetterVisibility(JsonAutoDetect.Visibility.NONE);
    if (!isEnabled(Feature.AUTO_DETECT_FIELDS))
      localVisibilityChecker = localVisibilityChecker.withFieldVisibility(JsonAutoDetect.Visibility.NONE);
    return localVisibilityChecker;
  }

  public FilterProvider getFilterProvider()
  {
    return this._filterProvider;
  }

  public JsonSerialize.Inclusion getSerializationInclusion()
  {
    if (this._serializationInclusion != null)
      return this._serializationInclusion;
    if (isEnabled(Feature.WRITE_NULL_PROPERTIES))
      return JsonSerialize.Inclusion.ALWAYS;
    return JsonSerialize.Inclusion.NON_NULL;
  }

  public Class<?> getSerializationView()
  {
    return this._serializationView;
  }

  public <T extends BeanDescription> T introspect(JavaType paramJavaType)
  {
    return getClassIntrospector().forSerialization(this, paramJavaType, this);
  }

  public <T extends BeanDescription> T introspectClassAnnotations(JavaType paramJavaType)
  {
    return getClassIntrospector().forClassAnnotations(this, paramJavaType, this);
  }

  public <T extends BeanDescription> T introspectDirectClassAnnotations(JavaType paramJavaType)
  {
    return getClassIntrospector().forDirectClassAnnotations(this, paramJavaType, this);
  }

  public boolean isAnnotationProcessingEnabled()
  {
    return isEnabled(Feature.USE_ANNOTATIONS);
  }

  public boolean isEnabled(Feature paramFeature)
  {
    return (this._featureFlags & paramFeature.getMask()) != 0;
  }

  public JsonSerializer<Object> serializerInstance(Annotated paramAnnotated, Class<? extends JsonSerializer<?>> paramClass)
  {
    HandlerInstantiator localHandlerInstantiator = getHandlerInstantiator();
    if (localHandlerInstantiator != null)
    {
      JsonSerializer localJsonSerializer = localHandlerInstantiator.serializerInstance(this, paramAnnotated, paramClass);
      if (localJsonSerializer != null)
        return localJsonSerializer;
    }
    return (JsonSerializer)ClassUtil.createInstance(paramClass, canOverrideAccessModifiers());
  }

  @Deprecated
  public void set(Feature paramFeature, boolean paramBoolean)
  {
    super.set(paramFeature, paramBoolean);
  }

  @Deprecated
  public final void setDateFormat(DateFormat paramDateFormat)
  {
    super.setDateFormat(paramDateFormat);
    Feature localFeature = Feature.WRITE_DATES_AS_TIMESTAMPS;
    if (paramDateFormat == null);
    for (boolean bool = true; ; bool = false)
    {
      set(localFeature, bool);
      return;
    }
  }

  @Deprecated
  public void setSerializationInclusion(JsonSerialize.Inclusion paramInclusion)
  {
    this._serializationInclusion = paramInclusion;
    if (paramInclusion == JsonSerialize.Inclusion.NON_NULL)
    {
      disable(Feature.WRITE_NULL_PROPERTIES);
      return;
    }
    enable(Feature.WRITE_NULL_PROPERTIES);
  }

  @Deprecated
  public void setSerializationView(Class<?> paramClass)
  {
    this._serializationView = paramClass;
  }

  public boolean shouldSortPropertiesAlphabetically()
  {
    return isEnabled(Feature.SORT_PROPERTIES_ALPHABETICALLY);
  }

  public String toString()
  {
    return "[SerializationConfig: flags=0x" + Integer.toHexString(this._featureFlags) + "]";
  }

  public SerializationConfig with(Feature[] paramArrayOfFeature)
  {
    int i = this._featureFlags;
    int j = paramArrayOfFeature.length;
    for (int k = 0; k < j; k++)
      i |= paramArrayOfFeature[k].getMask();
    return new SerializationConfig(this, i);
  }

  public SerializationConfig withAnnotationIntrospector(AnnotationIntrospector paramAnnotationIntrospector)
  {
    return new SerializationConfig(this, this._base.withAnnotationIntrospector(paramAnnotationIntrospector));
  }

  public SerializationConfig withAppendedAnnotationIntrospector(AnnotationIntrospector paramAnnotationIntrospector)
  {
    return new SerializationConfig(this, this._base.withAppendedAnnotationIntrospector(paramAnnotationIntrospector));
  }

  public SerializationConfig withClassIntrospector(ClassIntrospector<? extends BeanDescription> paramClassIntrospector)
  {
    return new SerializationConfig(this, this._base.withClassIntrospector(paramClassIntrospector));
  }

  public SerializationConfig withDateFormat(DateFormat paramDateFormat)
  {
    SerializationConfig localSerializationConfig = new SerializationConfig(this, this._base.withDateFormat(paramDateFormat));
    if (paramDateFormat == null)
    {
      Feature[] arrayOfFeature2 = new Feature[1];
      arrayOfFeature2[0] = Feature.WRITE_DATES_AS_TIMESTAMPS;
      return localSerializationConfig.with(arrayOfFeature2);
    }
    Feature[] arrayOfFeature1 = new Feature[1];
    arrayOfFeature1[0] = Feature.WRITE_DATES_AS_TIMESTAMPS;
    return localSerializationConfig.without(arrayOfFeature1);
  }

  public SerializationConfig withFilters(FilterProvider paramFilterProvider)
  {
    return new SerializationConfig(this, paramFilterProvider);
  }

  public SerializationConfig withHandlerInstantiator(HandlerInstantiator paramHandlerInstantiator)
  {
    return new SerializationConfig(this, this._base.withHandlerInstantiator(paramHandlerInstantiator));
  }

  public SerializationConfig withInsertedAnnotationIntrospector(AnnotationIntrospector paramAnnotationIntrospector)
  {
    return new SerializationConfig(this, this._base.withInsertedAnnotationIntrospector(paramAnnotationIntrospector));
  }

  public SerializationConfig withPropertyNamingStrategy(PropertyNamingStrategy paramPropertyNamingStrategy)
  {
    return new SerializationConfig(this, this._base.withPropertyNamingStrategy(paramPropertyNamingStrategy));
  }

  public SerializationConfig withSerializationInclusion(JsonSerialize.Inclusion paramInclusion)
  {
    return new SerializationConfig(this, paramInclusion);
  }

  public SerializationConfig withSubtypeResolver(SubtypeResolver paramSubtypeResolver)
  {
    SerializationConfig localSerializationConfig = new SerializationConfig(this);
    localSerializationConfig._subtypeResolver = paramSubtypeResolver;
    return localSerializationConfig;
  }

  public SerializationConfig withTypeFactory(TypeFactory paramTypeFactory)
  {
    return new SerializationConfig(this, this._base.withTypeFactory(paramTypeFactory));
  }

  public SerializationConfig withTypeResolverBuilder(TypeResolverBuilder<?> paramTypeResolverBuilder)
  {
    return new SerializationConfig(this, this._base.withTypeResolverBuilder(paramTypeResolverBuilder));
  }

  public SerializationConfig withView(Class<?> paramClass)
  {
    return new SerializationConfig(this, paramClass);
  }

  public SerializationConfig withVisibility(JsonMethod paramJsonMethod, JsonAutoDetect.Visibility paramVisibility)
  {
    return new SerializationConfig(this, this._base.withVisibility(paramJsonMethod, paramVisibility));
  }

  public SerializationConfig withVisibilityChecker(VisibilityChecker<?> paramVisibilityChecker)
  {
    return new SerializationConfig(this, this._base.withVisibilityChecker(paramVisibilityChecker));
  }

  public SerializationConfig without(Feature[] paramArrayOfFeature)
  {
    int i = this._featureFlags;
    int j = paramArrayOfFeature.length;
    for (int k = 0; k < j; k++)
      i &= (0xFFFFFFFF ^ paramArrayOfFeature[k].getMask());
    return new SerializationConfig(this, i);
  }

  public static enum Feature
    implements MapperConfig.ConfigFeature
  {
    final boolean _defaultState;

    static
    {
      AUTO_DETECT_GETTERS = new Feature("AUTO_DETECT_GETTERS", 1, true);
      AUTO_DETECT_IS_GETTERS = new Feature("AUTO_DETECT_IS_GETTERS", 2, true);
      AUTO_DETECT_FIELDS = new Feature("AUTO_DETECT_FIELDS", 3, true);
      CAN_OVERRIDE_ACCESS_MODIFIERS = new Feature("CAN_OVERRIDE_ACCESS_MODIFIERS", 4, true);
      REQUIRE_SETTERS_FOR_GETTERS = new Feature("REQUIRE_SETTERS_FOR_GETTERS", 5, false);
      WRITE_NULL_PROPERTIES = new Feature("WRITE_NULL_PROPERTIES", 6, true);
      USE_STATIC_TYPING = new Feature("USE_STATIC_TYPING", 7, false);
      DEFAULT_VIEW_INCLUSION = new Feature("DEFAULT_VIEW_INCLUSION", 8, true);
      WRAP_ROOT_VALUE = new Feature("WRAP_ROOT_VALUE", 9, false);
      INDENT_OUTPUT = new Feature("INDENT_OUTPUT", 10, false);
      SORT_PROPERTIES_ALPHABETICALLY = new Feature("SORT_PROPERTIES_ALPHABETICALLY", 11, false);
      FAIL_ON_EMPTY_BEANS = new Feature("FAIL_ON_EMPTY_BEANS", 12, true);
      WRAP_EXCEPTIONS = new Feature("WRAP_EXCEPTIONS", 13, true);
      CLOSE_CLOSEABLE = new Feature("CLOSE_CLOSEABLE", 14, false);
      FLUSH_AFTER_WRITE_VALUE = new Feature("FLUSH_AFTER_WRITE_VALUE", 15, true);
      WRITE_DATES_AS_TIMESTAMPS = new Feature("WRITE_DATES_AS_TIMESTAMPS", 16, true);
      WRITE_DATE_KEYS_AS_TIMESTAMPS = new Feature("WRITE_DATE_KEYS_AS_TIMESTAMPS", 17, false);
      WRITE_CHAR_ARRAYS_AS_JSON_ARRAYS = new Feature("WRITE_CHAR_ARRAYS_AS_JSON_ARRAYS", 18, false);
      WRITE_ENUMS_USING_TO_STRING = new Feature("WRITE_ENUMS_USING_TO_STRING", 19, false);
      WRITE_ENUMS_USING_INDEX = new Feature("WRITE_ENUMS_USING_INDEX", 20, false);
      WRITE_NULL_MAP_VALUES = new Feature("WRITE_NULL_MAP_VALUES", 21, true);
      WRITE_EMPTY_JSON_ARRAYS = new Feature("WRITE_EMPTY_JSON_ARRAYS", 22, true);
      Feature[] arrayOfFeature = new Feature[23];
      arrayOfFeature[0] = USE_ANNOTATIONS;
      arrayOfFeature[1] = AUTO_DETECT_GETTERS;
      arrayOfFeature[2] = AUTO_DETECT_IS_GETTERS;
      arrayOfFeature[3] = AUTO_DETECT_FIELDS;
      arrayOfFeature[4] = CAN_OVERRIDE_ACCESS_MODIFIERS;
      arrayOfFeature[5] = REQUIRE_SETTERS_FOR_GETTERS;
      arrayOfFeature[6] = WRITE_NULL_PROPERTIES;
      arrayOfFeature[7] = USE_STATIC_TYPING;
      arrayOfFeature[8] = DEFAULT_VIEW_INCLUSION;
      arrayOfFeature[9] = WRAP_ROOT_VALUE;
      arrayOfFeature[10] = INDENT_OUTPUT;
      arrayOfFeature[11] = SORT_PROPERTIES_ALPHABETICALLY;
      arrayOfFeature[12] = FAIL_ON_EMPTY_BEANS;
      arrayOfFeature[13] = WRAP_EXCEPTIONS;
      arrayOfFeature[14] = CLOSE_CLOSEABLE;
      arrayOfFeature[15] = FLUSH_AFTER_WRITE_VALUE;
      arrayOfFeature[16] = WRITE_DATES_AS_TIMESTAMPS;
      arrayOfFeature[17] = WRITE_DATE_KEYS_AS_TIMESTAMPS;
      arrayOfFeature[18] = WRITE_CHAR_ARRAYS_AS_JSON_ARRAYS;
      arrayOfFeature[19] = WRITE_ENUMS_USING_TO_STRING;
      arrayOfFeature[20] = WRITE_ENUMS_USING_INDEX;
      arrayOfFeature[21] = WRITE_NULL_MAP_VALUES;
      arrayOfFeature[22] = WRITE_EMPTY_JSON_ARRAYS;
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
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.SerializationConfig
 * JD-Core Version:    0.6.2
 */