package com.flurry.org.codehaus.jackson.map.ser;

import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector.ReferenceProperty;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.BeanProperty.Std;
import com.flurry.org.codehaus.jackson.map.BeanPropertyDefinition;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializationConfig;
import com.flurry.org.codehaus.jackson.map.SerializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.SerializerFactory;
import com.flurry.org.codehaus.jackson.map.SerializerFactory.Config;
import com.flurry.org.codehaus.jackson.map.Serializers;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedField;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMember;
import com.flurry.org.codehaus.jackson.map.introspect.AnnotatedMethod;
import com.flurry.org.codehaus.jackson.map.introspect.BasicBeanDescription;
import com.flurry.org.codehaus.jackson.map.jsontype.SubtypeResolver;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import com.flurry.org.codehaus.jackson.map.ser.std.MapSerializer;
import com.flurry.org.codehaus.jackson.map.type.TypeBindings;
import com.flurry.org.codehaus.jackson.map.util.ArrayBuilders;
import com.flurry.org.codehaus.jackson.map.util.ClassUtil;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

public class BeanSerializerFactory extends BasicSerializerFactory
{
  public static final BeanSerializerFactory instance = new BeanSerializerFactory(null);
  protected final SerializerFactory.Config _factoryConfig;

  protected BeanSerializerFactory(SerializerFactory.Config paramConfig)
  {
    if (paramConfig == null)
      paramConfig = new ConfigImpl();
    this._factoryConfig = paramConfig;
  }

  protected BeanPropertyWriter _constructWriter(SerializationConfig paramSerializationConfig, TypeBindings paramTypeBindings, PropertyBuilder paramPropertyBuilder, boolean paramBoolean, String paramString, AnnotatedMember paramAnnotatedMember)
    throws JsonMappingException
  {
    if (paramSerializationConfig.isEnabled(SerializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS))
      paramAnnotatedMember.fixAccess();
    JavaType localJavaType = paramAnnotatedMember.getType(paramTypeBindings);
    BeanProperty.Std localStd = new BeanProperty.Std(paramString, localJavaType, paramPropertyBuilder.getClassAnnotations(), paramAnnotatedMember);
    JsonSerializer localJsonSerializer = findSerializerFromAnnotation(paramSerializationConfig, paramAnnotatedMember, localStd);
    boolean bool = ClassUtil.isCollectionMapOrArray(localJavaType.getRawClass());
    TypeSerializer localTypeSerializer = null;
    if (bool)
      localTypeSerializer = findPropertyContentTypeSerializer(localJavaType, paramSerializationConfig, paramAnnotatedMember, localStd);
    BeanPropertyWriter localBeanPropertyWriter = paramPropertyBuilder.buildWriter(paramString, localJavaType, localJsonSerializer, findPropertyTypeSerializer(localJavaType, paramSerializationConfig, paramAnnotatedMember, localStd), localTypeSerializer, paramAnnotatedMember, paramBoolean);
    localBeanPropertyWriter.setViews(paramSerializationConfig.getAnnotationIntrospector().findSerializationViews(paramAnnotatedMember));
    return localBeanPropertyWriter;
  }

  protected JsonSerializer<Object> constructBeanSerializer(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    if (paramBasicBeanDescription.getBeanClass() == Object.class)
      throw new IllegalArgumentException("Can not create bean serializer for Object.class");
    BeanSerializerBuilder localBeanSerializerBuilder = constructBeanSerializerBuilder(paramBasicBeanDescription);
    Object localObject1 = findBeanProperties(paramSerializationConfig, paramBasicBeanDescription);
    if (localObject1 == null)
      localObject1 = new ArrayList();
    if (this._factoryConfig.hasSerializerModifiers())
    {
      Iterator localIterator3 = this._factoryConfig.serializerModifiers().iterator();
      while (localIterator3.hasNext())
        localObject1 = ((BeanSerializerModifier)localIterator3.next()).changeProperties(paramSerializationConfig, paramBasicBeanDescription, (List)localObject1);
    }
    List localList = sortBeanProperties(paramSerializationConfig, paramBasicBeanDescription, filterBeanProperties(paramSerializationConfig, paramBasicBeanDescription, (List)localObject1));
    if (this._factoryConfig.hasSerializerModifiers())
    {
      Iterator localIterator2 = this._factoryConfig.serializerModifiers().iterator();
      while (localIterator2.hasNext())
        localList = ((BeanSerializerModifier)localIterator2.next()).orderProperties(paramSerializationConfig, paramBasicBeanDescription, localList);
    }
    localBeanSerializerBuilder.setProperties(localList);
    localBeanSerializerBuilder.setFilterId(findFilterId(paramSerializationConfig, paramBasicBeanDescription));
    AnnotatedMethod localAnnotatedMethod = paramBasicBeanDescription.findAnyGetter();
    if (localAnnotatedMethod != null)
    {
      if (paramSerializationConfig.isEnabled(SerializationConfig.Feature.CAN_OVERRIDE_ACCESS_MODIFIERS))
        localAnnotatedMethod.fixAccess();
      JavaType localJavaType = localAnnotatedMethod.getType(paramBasicBeanDescription.bindingsForBeanType());
      localBeanSerializerBuilder.setAnyGetter(new AnyGetterWriter(localAnnotatedMethod, MapSerializer.construct(null, localJavaType, paramSerializationConfig.isEnabled(SerializationConfig.Feature.USE_STATIC_TYPING), createTypeSerializer(paramSerializationConfig, localJavaType.getContentType(), paramBeanProperty), paramBeanProperty, null, null)));
    }
    processViews(paramSerializationConfig, localBeanSerializerBuilder);
    if (this._factoryConfig.hasSerializerModifiers())
    {
      Iterator localIterator1 = this._factoryConfig.serializerModifiers().iterator();
      while (localIterator1.hasNext())
        localBeanSerializerBuilder = ((BeanSerializerModifier)localIterator1.next()).updateBuilder(paramSerializationConfig, paramBasicBeanDescription, localBeanSerializerBuilder);
    }
    Object localObject2 = localBeanSerializerBuilder.build();
    if ((localObject2 == null) && (paramBasicBeanDescription.hasKnownClassAnnotations()))
      localObject2 = localBeanSerializerBuilder.createDummy();
    return localObject2;
  }

  protected BeanSerializerBuilder constructBeanSerializerBuilder(BasicBeanDescription paramBasicBeanDescription)
  {
    return new BeanSerializerBuilder(paramBasicBeanDescription);
  }

  protected BeanPropertyWriter constructFilteredBeanWriter(BeanPropertyWriter paramBeanPropertyWriter, Class<?>[] paramArrayOfClass)
  {
    return FilteredBeanPropertyWriter.constructViewBased(paramBeanPropertyWriter, paramArrayOfClass);
  }

  protected PropertyBuilder constructPropertyBuilder(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription)
  {
    return new PropertyBuilder(paramSerializationConfig, paramBasicBeanDescription);
  }

  public JsonSerializer<Object> createKeySerializer(SerializationConfig paramSerializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
  {
    Object localObject;
    if (!this._factoryConfig.hasKeySerializers())
      localObject = null;
    do
    {
      BasicBeanDescription localBasicBeanDescription;
      Iterator localIterator;
      while (!localIterator.hasNext())
      {
        return localObject;
        localBasicBeanDescription = (BasicBeanDescription)paramSerializationConfig.introspectClassAnnotations(paramJavaType.getRawClass());
        localObject = null;
        localIterator = this._factoryConfig.keySerializers().iterator();
      }
      localObject = ((Serializers)localIterator.next()).findSerializer(paramSerializationConfig, paramJavaType, localBasicBeanDescription, paramBeanProperty);
    }
    while (localObject == null);
    return localObject;
  }

  public JsonSerializer<Object> createSerializer(SerializationConfig paramSerializationConfig, JavaType paramJavaType, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    BasicBeanDescription localBasicBeanDescription = (BasicBeanDescription)paramSerializationConfig.introspect(paramJavaType);
    JsonSerializer localJsonSerializer1 = findSerializerFromAnnotation(paramSerializationConfig, localBasicBeanDescription.getClassInfo(), paramBeanProperty);
    if (localJsonSerializer1 != null)
      return localJsonSerializer1;
    JavaType localJavaType = modifyTypeByAnnotation(paramSerializationConfig, localBasicBeanDescription.getClassInfo(), paramJavaType);
    if (localJavaType != paramJavaType);
    for (boolean bool = true; paramJavaType.isContainerType(); bool = false)
      return buildContainerSerializer(paramSerializationConfig, localJavaType, localBasicBeanDescription, paramBeanProperty, bool);
    Iterator localIterator = this._factoryConfig.serializers().iterator();
    while (localIterator.hasNext())
    {
      JsonSerializer localJsonSerializer3 = ((Serializers)localIterator.next()).findSerializer(paramSerializationConfig, localJavaType, localBasicBeanDescription, paramBeanProperty);
      if (localJsonSerializer3 != null)
        return localJsonSerializer3;
    }
    JsonSerializer localJsonSerializer2 = findSerializerByLookup(localJavaType, paramSerializationConfig, localBasicBeanDescription, paramBeanProperty, bool);
    if (localJsonSerializer2 == null)
    {
      localJsonSerializer2 = findSerializerByPrimaryType(localJavaType, paramSerializationConfig, localBasicBeanDescription, paramBeanProperty, bool);
      if (localJsonSerializer2 == null)
      {
        localJsonSerializer2 = findBeanSerializer(paramSerializationConfig, localJavaType, localBasicBeanDescription, paramBeanProperty);
        if (localJsonSerializer2 == null)
          localJsonSerializer2 = findSerializerByAddonType(paramSerializationConfig, localJavaType, localBasicBeanDescription, paramBeanProperty, bool);
      }
    }
    return localJsonSerializer2;
  }

  protected Iterable<Serializers> customSerializers()
  {
    return this._factoryConfig.serializers();
  }

  protected List<BeanPropertyWriter> filterBeanProperties(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, List<BeanPropertyWriter> paramList)
  {
    String[] arrayOfString = paramSerializationConfig.getAnnotationIntrospector().findPropertiesToIgnore(paramBasicBeanDescription.getClassInfo());
    if ((arrayOfString != null) && (arrayOfString.length > 0))
    {
      HashSet localHashSet = ArrayBuilders.arrayToSet(arrayOfString);
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
        if (localHashSet.contains(((BeanPropertyWriter)localIterator.next()).getName()))
          localIterator.remove();
    }
    return paramList;
  }

  protected List<BeanPropertyWriter> findBeanProperties(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription)
    throws JsonMappingException
  {
    List localList = paramBasicBeanDescription.findProperties();
    AnnotationIntrospector localAnnotationIntrospector = paramSerializationConfig.getAnnotationIntrospector();
    removeIgnorableTypes(paramSerializationConfig, paramBasicBeanDescription, localList);
    if (paramSerializationConfig.isEnabled(SerializationConfig.Feature.REQUIRE_SETTERS_FOR_GETTERS))
      removeSetterlessGetters(paramSerializationConfig, paramBasicBeanDescription, localList);
    Object localObject;
    if (localList.isEmpty())
      localObject = null;
    while (true)
    {
      return localObject;
      boolean bool = usesStaticTyping(paramSerializationConfig, paramBasicBeanDescription, null, null);
      PropertyBuilder localPropertyBuilder = constructPropertyBuilder(paramSerializationConfig, paramBasicBeanDescription);
      int i = localList.size();
      localObject = new ArrayList(i);
      TypeBindings localTypeBindings = paramBasicBeanDescription.bindingsForBeanType();
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        BeanPropertyDefinition localBeanPropertyDefinition = (BeanPropertyDefinition)localIterator.next();
        AnnotatedMember localAnnotatedMember = localBeanPropertyDefinition.getAccessor();
        AnnotationIntrospector.ReferenceProperty localReferenceProperty = localAnnotationIntrospector.findReferenceType(localAnnotatedMember);
        if ((localReferenceProperty == null) || (!localReferenceProperty.isBackReference()))
        {
          String str = localBeanPropertyDefinition.getName();
          if ((localAnnotatedMember instanceof AnnotatedMethod))
          {
            BeanPropertyWriter localBeanPropertyWriter2 = _constructWriter(paramSerializationConfig, localTypeBindings, localPropertyBuilder, bool, str, (AnnotatedMethod)localAnnotatedMember);
            ((ArrayList)localObject).add(localBeanPropertyWriter2);
          }
          else
          {
            BeanPropertyWriter localBeanPropertyWriter1 = _constructWriter(paramSerializationConfig, localTypeBindings, localPropertyBuilder, bool, str, (AnnotatedField)localAnnotatedMember);
            ((ArrayList)localObject).add(localBeanPropertyWriter1);
          }
        }
      }
    }
  }

  public JsonSerializer<Object> findBeanSerializer(SerializationConfig paramSerializationConfig, JavaType paramJavaType, BasicBeanDescription paramBasicBeanDescription, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    Object localObject;
    if (!isPotentialBeanType(paramJavaType.getRawClass()))
      localObject = null;
    while (true)
    {
      return localObject;
      localObject = constructBeanSerializer(paramSerializationConfig, paramBasicBeanDescription, paramBeanProperty);
      if (this._factoryConfig.hasSerializerModifiers())
      {
        Iterator localIterator = this._factoryConfig.serializerModifiers().iterator();
        while (localIterator.hasNext())
          localObject = ((BeanSerializerModifier)localIterator.next()).modifySerializer(paramSerializationConfig, paramBasicBeanDescription, (JsonSerializer)localObject);
      }
    }
  }

  protected Object findFilterId(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription)
  {
    return paramSerializationConfig.getAnnotationIntrospector().findFilterId(paramBasicBeanDescription.getClassInfo());
  }

  public TypeSerializer findPropertyContentTypeSerializer(JavaType paramJavaType, SerializationConfig paramSerializationConfig, AnnotatedMember paramAnnotatedMember, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    JavaType localJavaType = paramJavaType.getContentType();
    AnnotationIntrospector localAnnotationIntrospector = paramSerializationConfig.getAnnotationIntrospector();
    TypeResolverBuilder localTypeResolverBuilder = localAnnotationIntrospector.findPropertyContentTypeResolver(paramSerializationConfig, paramAnnotatedMember, paramJavaType);
    if (localTypeResolverBuilder == null)
      return createTypeSerializer(paramSerializationConfig, localJavaType, paramBeanProperty);
    return localTypeResolverBuilder.buildTypeSerializer(paramSerializationConfig, localJavaType, paramSerializationConfig.getSubtypeResolver().collectAndResolveSubtypes(paramAnnotatedMember, paramSerializationConfig, localAnnotationIntrospector), paramBeanProperty);
  }

  public TypeSerializer findPropertyTypeSerializer(JavaType paramJavaType, SerializationConfig paramSerializationConfig, AnnotatedMember paramAnnotatedMember, BeanProperty paramBeanProperty)
    throws JsonMappingException
  {
    AnnotationIntrospector localAnnotationIntrospector = paramSerializationConfig.getAnnotationIntrospector();
    TypeResolverBuilder localTypeResolverBuilder = localAnnotationIntrospector.findPropertyTypeResolver(paramSerializationConfig, paramAnnotatedMember, paramJavaType);
    if (localTypeResolverBuilder == null)
      return createTypeSerializer(paramSerializationConfig, paramJavaType, paramBeanProperty);
    return localTypeResolverBuilder.buildTypeSerializer(paramSerializationConfig, paramJavaType, paramSerializationConfig.getSubtypeResolver().collectAndResolveSubtypes(paramAnnotatedMember, paramSerializationConfig, localAnnotationIntrospector), paramBeanProperty);
  }

  public SerializerFactory.Config getConfig()
  {
    return this._factoryConfig;
  }

  protected boolean isPotentialBeanType(Class<?> paramClass)
  {
    return (ClassUtil.canBeABeanType(paramClass) == null) && (!ClassUtil.isProxyType(paramClass));
  }

  protected void processViews(SerializationConfig paramSerializationConfig, BeanSerializerBuilder paramBeanSerializerBuilder)
  {
    List localList = paramBeanSerializerBuilder.getProperties();
    boolean bool = paramSerializationConfig.isEnabled(SerializationConfig.Feature.DEFAULT_VIEW_INCLUSION);
    int i = localList.size();
    int j = 0;
    BeanPropertyWriter[] arrayOfBeanPropertyWriter = new BeanPropertyWriter[i];
    int k = 0;
    if (k < i)
    {
      BeanPropertyWriter localBeanPropertyWriter = (BeanPropertyWriter)localList.get(k);
      Class[] arrayOfClass = localBeanPropertyWriter.getViews();
      if (arrayOfClass == null)
        if (bool)
          arrayOfBeanPropertyWriter[k] = localBeanPropertyWriter;
      while (true)
      {
        k++;
        break;
        j++;
        arrayOfBeanPropertyWriter[k] = constructFilteredBeanWriter(localBeanPropertyWriter, arrayOfClass);
      }
    }
    if ((bool) && (j == 0))
      return;
    paramBeanSerializerBuilder.setFilteredProperties(arrayOfBeanPropertyWriter);
  }

  protected void removeIgnorableTypes(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, List<BeanPropertyDefinition> paramList)
  {
    AnnotationIntrospector localAnnotationIntrospector = paramSerializationConfig.getAnnotationIntrospector();
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      AnnotatedMember localAnnotatedMember = ((BeanPropertyDefinition)localIterator.next()).getAccessor();
      if (localAnnotatedMember == null)
      {
        localIterator.remove();
      }
      else
      {
        Class localClass = localAnnotatedMember.getRawType();
        Boolean localBoolean = (Boolean)localHashMap.get(localClass);
        if (localBoolean == null)
        {
          localBoolean = localAnnotationIntrospector.isIgnorableType(((BasicBeanDescription)paramSerializationConfig.introspectClassAnnotations(localClass)).getClassInfo());
          if (localBoolean == null)
            localBoolean = Boolean.FALSE;
          localHashMap.put(localClass, localBoolean);
        }
        if (localBoolean.booleanValue())
          localIterator.remove();
      }
    }
  }

  protected void removeSetterlessGetters(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, List<BeanPropertyDefinition> paramList)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      if (!((BeanPropertyDefinition)localIterator.next()).couldDeserialize())
        localIterator.remove();
  }

  @Deprecated
  protected List<BeanPropertyWriter> sortBeanProperties(SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription, List<BeanPropertyWriter> paramList)
  {
    return paramList;
  }

  public SerializerFactory withConfig(SerializerFactory.Config paramConfig)
  {
    if (this._factoryConfig == paramConfig)
      return this;
    if (getClass() != BeanSerializerFactory.class)
      throw new IllegalStateException("Subtype of BeanSerializerFactory (" + getClass().getName() + ") has not properly overridden method 'withAdditionalSerializers': can not instantiate subtype with " + "additional serializer definitions");
    return new BeanSerializerFactory(paramConfig);
  }

  public static class ConfigImpl extends SerializerFactory.Config
  {
    protected static final BeanSerializerModifier[] NO_MODIFIERS = new BeanSerializerModifier[0];
    protected static final Serializers[] NO_SERIALIZERS = new Serializers[0];
    protected final Serializers[] _additionalKeySerializers;
    protected final Serializers[] _additionalSerializers;
    protected final BeanSerializerModifier[] _modifiers;

    public ConfigImpl()
    {
      this(null, null, null);
    }

    protected ConfigImpl(Serializers[] paramArrayOfSerializers1, Serializers[] paramArrayOfSerializers2, BeanSerializerModifier[] paramArrayOfBeanSerializerModifier)
    {
      if (paramArrayOfSerializers1 == null)
        paramArrayOfSerializers1 = NO_SERIALIZERS;
      this._additionalSerializers = paramArrayOfSerializers1;
      if (paramArrayOfSerializers2 == null)
        paramArrayOfSerializers2 = NO_SERIALIZERS;
      this._additionalKeySerializers = paramArrayOfSerializers2;
      if (paramArrayOfBeanSerializerModifier == null)
        paramArrayOfBeanSerializerModifier = NO_MODIFIERS;
      this._modifiers = paramArrayOfBeanSerializerModifier;
    }

    public boolean hasKeySerializers()
    {
      return this._additionalKeySerializers.length > 0;
    }

    public boolean hasSerializerModifiers()
    {
      return this._modifiers.length > 0;
    }

    public boolean hasSerializers()
    {
      return this._additionalSerializers.length > 0;
    }

    public Iterable<Serializers> keySerializers()
    {
      return ArrayBuilders.arrayAsIterable(this._additionalKeySerializers);
    }

    public Iterable<BeanSerializerModifier> serializerModifiers()
    {
      return ArrayBuilders.arrayAsIterable(this._modifiers);
    }

    public Iterable<Serializers> serializers()
    {
      return ArrayBuilders.arrayAsIterable(this._additionalSerializers);
    }

    public SerializerFactory.Config withAdditionalKeySerializers(Serializers paramSerializers)
    {
      if (paramSerializers == null)
        throw new IllegalArgumentException("Can not pass null Serializers");
      Serializers[] arrayOfSerializers = (Serializers[])ArrayBuilders.insertInListNoDup(this._additionalKeySerializers, paramSerializers);
      return new ConfigImpl(this._additionalSerializers, arrayOfSerializers, this._modifiers);
    }

    public SerializerFactory.Config withAdditionalSerializers(Serializers paramSerializers)
    {
      if (paramSerializers == null)
        throw new IllegalArgumentException("Can not pass null Serializers");
      return new ConfigImpl((Serializers[])ArrayBuilders.insertInListNoDup(this._additionalSerializers, paramSerializers), this._additionalKeySerializers, this._modifiers);
    }

    public SerializerFactory.Config withSerializerModifier(BeanSerializerModifier paramBeanSerializerModifier)
    {
      if (paramBeanSerializerModifier == null)
        throw new IllegalArgumentException("Can not pass null modifier");
      BeanSerializerModifier[] arrayOfBeanSerializerModifier = (BeanSerializerModifier[])ArrayBuilders.insertInListNoDup(this._modifiers, paramBeanSerializerModifier);
      return new ConfigImpl(this._additionalSerializers, this._additionalKeySerializers, arrayOfBeanSerializerModifier);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.BeanSerializerFactory
 * JD-Core Version:    0.6.2
 */