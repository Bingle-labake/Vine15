package com.flurry.org.codehaus.jackson.map.jsontype.impl;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.As;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeIdResolver;
import com.flurry.org.codehaus.jackson.type.JavaType;
import com.flurry.org.codehaus.jackson.util.JsonParserSequence;
import com.flurry.org.codehaus.jackson.util.TokenBuffer;
import java.io.IOException;

public class AsPropertyTypeDeserializer extends AsArrayTypeDeserializer
{
  protected final String _typePropertyName;

  public AsPropertyTypeDeserializer(JavaType paramJavaType, TypeIdResolver paramTypeIdResolver, BeanProperty paramBeanProperty, Class<?> paramClass, String paramString)
  {
    super(paramJavaType, paramTypeIdResolver, paramBeanProperty, paramClass);
    this._typePropertyName = paramString;
  }

  @Deprecated
  public AsPropertyTypeDeserializer(JavaType paramJavaType, TypeIdResolver paramTypeIdResolver, BeanProperty paramBeanProperty, String paramString)
  {
    this(paramJavaType, paramTypeIdResolver, paramBeanProperty, null, paramString);
  }

  protected Object _deserializeIfNatural(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
    {
    default:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    }
    do
    {
      do
      {
        do
        {
          do
          {
            do
              return null;
            while (!this._baseType.getRawClass().isAssignableFrom(String.class));
            return paramJsonParser.getText();
          }
          while (!this._baseType.getRawClass().isAssignableFrom(Integer.class));
          return Integer.valueOf(paramJsonParser.getIntValue());
        }
        while (!this._baseType.getRawClass().isAssignableFrom(Double.class));
        return Double.valueOf(paramJsonParser.getDoubleValue());
      }
      while (!this._baseType.getRawClass().isAssignableFrom(Boolean.class));
      return Boolean.TRUE;
    }
    while (!this._baseType.getRawClass().isAssignableFrom(Boolean.class));
    return Boolean.FALSE;
  }

  protected Object _deserializeTypedUsingDefaultImpl(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TokenBuffer paramTokenBuffer)
    throws IOException, JsonProcessingException
  {
    Object localObject;
    if (this._defaultImpl != null)
    {
      JsonDeserializer localJsonDeserializer = _findDefaultImplDeserializer(paramDeserializationContext);
      if (paramTokenBuffer != null)
      {
        paramTokenBuffer.writeEndObject();
        paramJsonParser = paramTokenBuffer.asParser(paramJsonParser);
        paramJsonParser.nextToken();
      }
      localObject = localJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
    }
    do
    {
      return localObject;
      localObject = _deserializeIfNatural(paramJsonParser, paramDeserializationContext);
    }
    while (localObject != null);
    if (paramJsonParser.getCurrentToken() == JsonToken.START_ARRAY)
      return super.deserializeTypedFromAny(paramJsonParser, paramDeserializationContext);
    throw paramDeserializationContext.wrongTokenException(paramJsonParser, JsonToken.FIELD_NAME, "missing property '" + this._typePropertyName + "' that is to contain type id  (for class " + baseTypeName() + ")");
  }

  public Object deserializeTypedFromAny(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (paramJsonParser.getCurrentToken() == JsonToken.START_ARRAY)
      return super.deserializeTypedFromArray(paramJsonParser, paramDeserializationContext);
    return deserializeTypedFromObject(paramJsonParser, paramDeserializationContext);
  }

  public Object deserializeTypedFromObject(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    TokenBuffer localTokenBuffer;
    if (localJsonToken == JsonToken.START_OBJECT)
    {
      localJsonToken = paramJsonParser.nextToken();
      localTokenBuffer = null;
    }
    while (true)
    {
      if (localJsonToken != JsonToken.FIELD_NAME)
        break label156;
      String str = paramJsonParser.getCurrentName();
      paramJsonParser.nextToken();
      if (this._typePropertyName.equals(str))
      {
        JsonDeserializer localJsonDeserializer = _findDeserializer(paramDeserializationContext, paramJsonParser.getText());
        if (localTokenBuffer != null)
          paramJsonParser = JsonParserSequence.createFlattened(localTokenBuffer.asParser(paramJsonParser), paramJsonParser);
        paramJsonParser.nextToken();
        return localJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
        if (localJsonToken == JsonToken.START_ARRAY)
          return _deserializeTypedUsingDefaultImpl(paramJsonParser, paramDeserializationContext, null);
        if (localJsonToken == JsonToken.FIELD_NAME)
          break;
        return _deserializeTypedUsingDefaultImpl(paramJsonParser, paramDeserializationContext, null);
      }
      if (localTokenBuffer == null)
        localTokenBuffer = new TokenBuffer(null);
      localTokenBuffer.writeFieldName(str);
      localTokenBuffer.copyCurrentStructure(paramJsonParser);
      localJsonToken = paramJsonParser.nextToken();
    }
    label156: return _deserializeTypedUsingDefaultImpl(paramJsonParser, paramDeserializationContext, localTokenBuffer);
  }

  public String getPropertyName()
  {
    return this._typePropertyName;
  }

  public JsonTypeInfo.As getTypeInclusion()
  {
    return JsonTypeInfo.As.PROPERTY;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.jsontype.impl.AsPropertyTypeDeserializer
 * JD-Core Version:    0.6.2
 */