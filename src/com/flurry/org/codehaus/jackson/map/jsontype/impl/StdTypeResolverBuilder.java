package com.flurry.org.codehaus.jackson.map.jsontype.impl;

import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.As;
import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.Id;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig;
import com.flurry.org.codehaus.jackson.map.MapperConfig;
import com.flurry.org.codehaus.jackson.map.SerializationConfig;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.jsontype.NamedType;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeIdResolver;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.util.Collection;

public class StdTypeResolverBuilder
  implements TypeResolverBuilder<StdTypeResolverBuilder>
{
  protected TypeIdResolver _customIdResolver;
  protected Class<?> _defaultImpl;
  protected JsonTypeInfo.Id _idType;
  protected JsonTypeInfo.As _includeAs;
  protected String _typeProperty;

  public static StdTypeResolverBuilder noTypeInfoBuilder()
  {
    return new StdTypeResolverBuilder().init(JsonTypeInfo.Id.NONE, null);
  }

  public TypeDeserializer buildTypeDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, Collection<NamedType> paramCollection, BeanProperty paramBeanProperty)
  {
    if (this._idType == JsonTypeInfo.Id.NONE)
      return null;
    TypeIdResolver localTypeIdResolver = idResolver(paramDeserializationConfig, paramJavaType, paramCollection, false, true);
    switch (1.$SwitchMap$org$codehaus$jackson$annotate$JsonTypeInfo$As[this._includeAs.ordinal()])
    {
    default:
      throw new IllegalStateException("Do not know how to construct standard type serializer for inclusion type: " + this._includeAs);
    case 1:
      return new AsArrayTypeDeserializer(paramJavaType, localTypeIdResolver, paramBeanProperty, this._defaultImpl);
    case 2:
      return new AsPropertyTypeDeserializer(paramJavaType, localTypeIdResolver, paramBeanProperty, this._defaultImpl, this._typeProperty);
    case 3:
      return new AsWrapperTypeDeserializer(paramJavaType, localTypeIdResolver, paramBeanProperty, this._defaultImpl);
    case 4:
    }
    return new AsExternalTypeDeserializer(paramJavaType, localTypeIdResolver, paramBeanProperty, this._defaultImpl, this._typeProperty);
  }

  public TypeSerializer buildTypeSerializer(SerializationConfig paramSerializationConfig, JavaType paramJavaType, Collection<NamedType> paramCollection, BeanProperty paramBeanProperty)
  {
    if (this._idType == JsonTypeInfo.Id.NONE)
      return null;
    TypeIdResolver localTypeIdResolver = idResolver(paramSerializationConfig, paramJavaType, paramCollection, true, false);
    switch (1.$SwitchMap$org$codehaus$jackson$annotate$JsonTypeInfo$As[this._includeAs.ordinal()])
    {
    default:
      throw new IllegalStateException("Do not know how to construct standard type serializer for inclusion type: " + this._includeAs);
    case 1:
      return new AsArrayTypeSerializer(localTypeIdResolver, paramBeanProperty);
    case 2:
      return new AsPropertyTypeSerializer(localTypeIdResolver, paramBeanProperty, this._typeProperty);
    case 3:
      return new AsWrapperTypeSerializer(localTypeIdResolver, paramBeanProperty);
    case 4:
    }
    return new AsExternalTypeSerializer(localTypeIdResolver, paramBeanProperty, this._typeProperty);
  }

  public StdTypeResolverBuilder defaultImpl(Class<?> paramClass)
  {
    this._defaultImpl = paramClass;
    return this;
  }

  public Class<?> getDefaultImpl()
  {
    return this._defaultImpl;
  }

  public String getTypeProperty()
  {
    return this._typeProperty;
  }

  protected TypeIdResolver idResolver(MapperConfig<?> paramMapperConfig, JavaType paramJavaType, Collection<NamedType> paramCollection, boolean paramBoolean1, boolean paramBoolean2)
  {
    if (this._customIdResolver != null)
      return this._customIdResolver;
    if (this._idType == null)
      throw new IllegalStateException("Can not build, 'init()' not yet called");
    switch (1.$SwitchMap$org$codehaus$jackson$annotate$JsonTypeInfo$Id[this._idType.ordinal()])
    {
    default:
      throw new IllegalStateException("Do not know how to construct standard type id resolver for idType: " + this._idType);
    case 1:
      return new ClassNameIdResolver(paramJavaType, paramMapperConfig.getTypeFactory());
    case 2:
      return new MinimalClassNameIdResolver(paramJavaType, paramMapperConfig.getTypeFactory());
    case 3:
      return TypeNameIdResolver.construct(paramMapperConfig, paramJavaType, paramCollection, paramBoolean1, paramBoolean2);
    case 4:
    }
    return null;
  }

  public StdTypeResolverBuilder inclusion(JsonTypeInfo.As paramAs)
  {
    if (paramAs == null)
      throw new IllegalArgumentException("includeAs can not be null");
    this._includeAs = paramAs;
    return this;
  }

  public StdTypeResolverBuilder init(JsonTypeInfo.Id paramId, TypeIdResolver paramTypeIdResolver)
  {
    if (paramId == null)
      throw new IllegalArgumentException("idType can not be null");
    this._idType = paramId;
    this._customIdResolver = paramTypeIdResolver;
    this._typeProperty = paramId.getDefaultPropertyName();
    return this;
  }

  public StdTypeResolverBuilder typeProperty(String paramString)
  {
    if ((paramString == null) || (paramString.length() == 0))
      paramString = this._idType.getDefaultPropertyName();
    this._typeProperty = paramString;
    return this;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.jsontype.impl.StdTypeResolverBuilder
 * JD-Core Version:    0.6.2
 */