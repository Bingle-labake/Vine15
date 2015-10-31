package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.map.type.ArrayType;
import com.flurry.org.codehaus.jackson.map.util.ObjectBuffer;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.lang.reflect.Array;

@JacksonStdImpl
public class ObjectArrayDeserializer extends ContainerDeserializerBase<Object[]>
{
  protected final JavaType _arrayType;
  protected final Class<?> _elementClass;
  protected final JsonDeserializer<Object> _elementDeserializer;
  protected final TypeDeserializer _elementTypeDeserializer;
  protected final boolean _untyped;

  public ObjectArrayDeserializer(ArrayType paramArrayType, JsonDeserializer<Object> paramJsonDeserializer, TypeDeserializer paramTypeDeserializer)
  {
    super([Ljava.lang.Object.class);
    this._arrayType = paramArrayType;
    this._elementClass = paramArrayType.getContentType().getRawClass();
    if (this._elementClass == Object.class);
    for (boolean bool = true; ; bool = false)
    {
      this._untyped = bool;
      this._elementDeserializer = paramJsonDeserializer;
      this._elementTypeDeserializer = paramTypeDeserializer;
      return;
    }
  }

  private final Object[] handleNonArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) && (paramJsonParser.getText().length() == 0))
      return null;
    if (!paramDeserializationContext.isEnabled(DeserializationConfig.Feature.ACCEPT_SINGLE_VALUE_AS_ARRAY))
    {
      if ((paramJsonParser.getCurrentToken() == JsonToken.VALUE_STRING) && (this._elementClass == Byte.class))
        return deserializeFromBase64(paramJsonParser, paramDeserializationContext);
      throw paramDeserializationContext.mappingException(this._arrayType.getRawClass());
    }
    Object localObject;
    if (paramJsonParser.getCurrentToken() == JsonToken.VALUE_NULL)
    {
      localObject = null;
      if (!this._untyped)
        break label150;
    }
    label150: for (Object[] arrayOfObject = new Object[1]; ; arrayOfObject = (Object[])Array.newInstance(this._elementClass, 1))
    {
      arrayOfObject[0] = localObject;
      return arrayOfObject;
      if (this._elementTypeDeserializer == null)
      {
        localObject = this._elementDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
        break;
      }
      localObject = this._elementDeserializer.deserializeWithType(paramJsonParser, paramDeserializationContext, this._elementTypeDeserializer);
      break;
    }
  }

  public Object[] deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (!paramJsonParser.isExpectedStartArrayToken())
      return handleNonArray(paramJsonParser, paramDeserializationContext);
    ObjectBuffer localObjectBuffer = paramDeserializationContext.leaseObjectBuffer();
    Object[] arrayOfObject1 = localObjectBuffer.resetAndStart();
    int i = 0;
    TypeDeserializer localTypeDeserializer = this._elementTypeDeserializer;
    JsonToken localJsonToken = paramJsonParser.nextToken();
    if (localJsonToken != JsonToken.END_ARRAY)
    {
      Object localObject;
      if (localJsonToken == JsonToken.VALUE_NULL)
        localObject = null;
      while (true)
      {
        if (i >= arrayOfObject1.length)
        {
          arrayOfObject1 = localObjectBuffer.appendCompletedChunk(arrayOfObject1);
          i = 0;
        }
        int j = i + 1;
        arrayOfObject1[i] = localObject;
        i = j;
        break;
        if (localTypeDeserializer == null)
          localObject = this._elementDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
        else
          localObject = this._elementDeserializer.deserializeWithType(paramJsonParser, paramDeserializationContext, localTypeDeserializer);
      }
    }
    if (this._untyped);
    for (Object[] arrayOfObject2 = localObjectBuffer.completeAndClearBuffer(arrayOfObject1, i); ; arrayOfObject2 = localObjectBuffer.completeAndClearBuffer(arrayOfObject1, i, this._elementClass))
    {
      paramDeserializationContext.returnObjectBuffer(localObjectBuffer);
      return arrayOfObject2;
    }
  }

  protected Byte[] deserializeFromBase64(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    byte[] arrayOfByte = paramJsonParser.getBinaryValue(paramDeserializationContext.getBase64Variant());
    Byte[] arrayOfByte1 = new Byte[arrayOfByte.length];
    int i = 0;
    int j = arrayOfByte.length;
    while (i < j)
    {
      arrayOfByte1[i] = Byte.valueOf(arrayOfByte[i]);
      i++;
    }
    return arrayOfByte1;
  }

  public Object[] deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return (Object[])paramTypeDeserializer.deserializeTypedFromArray(paramJsonParser, paramDeserializationContext);
  }

  public JsonDeserializer<Object> getContentDeserializer()
  {
    return this._elementDeserializer;
  }

  public JavaType getContentType()
  {
    return this._arrayType.getContentType();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.ObjectArrayDeserializer
 * JD-Core Version:    0.6.2
 */