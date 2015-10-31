package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;

public class AbstractDeserializer extends JsonDeserializer<Object>
{
  protected final boolean _acceptBoolean;
  protected final boolean _acceptDouble;
  protected final boolean _acceptInt;
  protected final boolean _acceptString;
  protected final JavaType _baseType;

  public AbstractDeserializer(JavaType paramJavaType)
  {
    this._baseType = paramJavaType;
    Class localClass = paramJavaType.getRawClass();
    this._acceptString = localClass.isAssignableFrom(String.class);
    boolean bool1;
    if ((localClass == Boolean.TYPE) || (localClass.isAssignableFrom(Boolean.class)))
    {
      bool1 = true;
      this._acceptBoolean = bool1;
      if ((localClass != Integer.TYPE) && (!localClass.isAssignableFrom(Integer.class)))
        break label110;
    }
    label110: for (boolean bool2 = true; ; bool2 = false)
    {
      this._acceptInt = bool2;
      boolean bool3;
      if (localClass != Double.TYPE)
      {
        boolean bool4 = localClass.isAssignableFrom(Double.class);
        bool3 = false;
        if (!bool4);
      }
      else
      {
        bool3 = true;
      }
      this._acceptDouble = bool3;
      return;
      bool1 = false;
      break;
    }
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
            while (!this._acceptString);
            return paramJsonParser.getText();
          }
          while (!this._acceptInt);
          return Integer.valueOf(paramJsonParser.getIntValue());
        }
        while (!this._acceptDouble);
        return Double.valueOf(paramJsonParser.getDoubleValue());
      }
      while (!this._acceptBoolean);
      return Boolean.TRUE;
    }
    while (!this._acceptBoolean);
    return Boolean.FALSE;
  }

  public Object deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    throw paramDeserializationContext.instantiationException(this._baseType.getRawClass(), "abstract types can only be instantiated with additional type information");
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    Object localObject = _deserializeIfNatural(paramJsonParser, paramDeserializationContext);
    if (localObject != null)
      return localObject;
    return paramTypeDeserializer.deserializeTypedFromObject(paramJsonParser, paramDeserializationContext);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.AbstractDeserializer
 * JD-Core Version:    0.6.2
 */