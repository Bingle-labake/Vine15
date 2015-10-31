package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.map.util.ObjectBuffer;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

@JacksonStdImpl
public class UntypedObjectDeserializer extends StdDeserializer<Object>
{
  private static final Object[] NO_OBJECTS = new Object[0];

  public UntypedObjectDeserializer()
  {
    super(Object.class);
  }

  public Object deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
    {
    case 2:
    case 4:
    default:
      throw paramDeserializationContext.mappingException(Object.class);
    case 1:
      return mapObject(paramJsonParser, paramDeserializationContext);
    case 3:
      return mapArray(paramJsonParser, paramDeserializationContext);
    case 5:
      return mapObject(paramJsonParser, paramDeserializationContext);
    case 6:
      return paramJsonParser.getEmbeddedObject();
    case 7:
      return paramJsonParser.getText();
    case 8:
      if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_INTEGER_FOR_INTS))
        return paramJsonParser.getBigIntegerValue();
      return paramJsonParser.getNumberValue();
    case 9:
      if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_DECIMAL_FOR_FLOATS))
        return paramJsonParser.getDecimalValue();
      return Double.valueOf(paramJsonParser.getDoubleValue());
    case 10:
      return Boolean.TRUE;
    case 11:
      return Boolean.FALSE;
    case 12:
    }
    return null;
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[localJsonToken.ordinal()])
    {
    case 2:
    case 4:
    default:
      throw paramDeserializationContext.mappingException(Object.class);
    case 1:
    case 3:
    case 5:
      return paramTypeDeserializer.deserializeTypedFromAny(paramJsonParser, paramDeserializationContext);
    case 7:
      return paramJsonParser.getText();
    case 8:
      if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_INTEGER_FOR_INTS))
        return paramJsonParser.getBigIntegerValue();
      return Integer.valueOf(paramJsonParser.getIntValue());
    case 9:
      if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_DECIMAL_FOR_FLOATS))
        return paramJsonParser.getDecimalValue();
      return Double.valueOf(paramJsonParser.getDoubleValue());
    case 10:
      return Boolean.TRUE;
    case 11:
      return Boolean.FALSE;
    case 6:
      return paramJsonParser.getEmbeddedObject();
    case 12:
    }
    return null;
  }

  protected Object mapArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_JAVA_ARRAY_FOR_JSON_ARRAY))
      return mapArrayToArray(paramJsonParser, paramDeserializationContext);
    if (paramJsonParser.nextToken() == JsonToken.END_ARRAY)
      return new ArrayList(4);
    ObjectBuffer localObjectBuffer = paramDeserializationContext.leaseObjectBuffer();
    Object[] arrayOfObject = localObjectBuffer.resetAndStart();
    int i = 0;
    int j = 0;
    while (true)
    {
      Object localObject = deserialize(paramJsonParser, paramDeserializationContext);
      j++;
      if (i >= arrayOfObject.length)
      {
        arrayOfObject = localObjectBuffer.appendCompletedChunk(arrayOfObject);
        i = 0;
      }
      int k = i + 1;
      arrayOfObject[i] = localObject;
      if (paramJsonParser.nextToken() == JsonToken.END_ARRAY)
      {
        ArrayList localArrayList = new ArrayList(1 + (j + (j >> 3)));
        localObjectBuffer.completeAndClearBuffer(arrayOfObject, k, localArrayList);
        return localArrayList;
      }
      i = k;
    }
  }

  protected Object[] mapArrayToArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    if (paramJsonParser.nextToken() == JsonToken.END_ARRAY)
      return NO_OBJECTS;
    ObjectBuffer localObjectBuffer = paramDeserializationContext.leaseObjectBuffer();
    Object[] arrayOfObject = localObjectBuffer.resetAndStart();
    int j;
    for (int i = 0; ; i = j)
    {
      Object localObject = deserialize(paramJsonParser, paramDeserializationContext);
      if (i >= arrayOfObject.length)
      {
        arrayOfObject = localObjectBuffer.appendCompletedChunk(arrayOfObject);
        i = 0;
      }
      j = i + 1;
      arrayOfObject[i] = localObject;
      if (paramJsonParser.nextToken() == JsonToken.END_ARRAY)
        return localObjectBuffer.completeAndClearBuffer(arrayOfObject, j);
    }
  }

  protected Object mapObject(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.START_OBJECT)
      localJsonToken = paramJsonParser.nextToken();
    if (localJsonToken != JsonToken.FIELD_NAME)
      return new LinkedHashMap(4);
    String str1 = paramJsonParser.getText();
    paramJsonParser.nextToken();
    Object localObject1 = deserialize(paramJsonParser, paramDeserializationContext);
    if (paramJsonParser.nextToken() != JsonToken.FIELD_NAME)
    {
      LinkedHashMap localLinkedHashMap1 = new LinkedHashMap(4);
      localLinkedHashMap1.put(str1, localObject1);
      return localLinkedHashMap1;
    }
    String str2 = paramJsonParser.getText();
    paramJsonParser.nextToken();
    Object localObject2 = deserialize(paramJsonParser, paramDeserializationContext);
    if (paramJsonParser.nextToken() != JsonToken.FIELD_NAME)
    {
      LinkedHashMap localLinkedHashMap2 = new LinkedHashMap(4);
      localLinkedHashMap2.put(str1, localObject1);
      localLinkedHashMap2.put(str2, localObject2);
      return localLinkedHashMap2;
    }
    LinkedHashMap localLinkedHashMap3 = new LinkedHashMap();
    localLinkedHashMap3.put(str1, localObject1);
    localLinkedHashMap3.put(str2, localObject2);
    do
    {
      String str3 = paramJsonParser.getText();
      paramJsonParser.nextToken();
      localLinkedHashMap3.put(str3, deserialize(paramJsonParser, paramDeserializationContext));
    }
    while (paramJsonParser.nextToken() != JsonToken.END_OBJECT);
    return localLinkedHashMap3;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.UntypedObjectDeserializer
 * JD-Core Version:    0.6.2
 */