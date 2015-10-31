package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonParser.NumberType;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.TypeDeserializer;
import com.flurry.org.codehaus.jackson.node.ArrayNode;
import com.flurry.org.codehaus.jackson.node.JsonNodeFactory;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import java.io.IOException;

abstract class BaseNodeDeserializer<N extends JsonNode> extends StdDeserializer<N>
{
  public BaseNodeDeserializer(Class<N> paramClass)
  {
    super(paramClass);
  }

  protected void _handleDuplicateField(String paramString, ObjectNode paramObjectNode, JsonNode paramJsonNode1, JsonNode paramJsonNode2)
    throws JsonProcessingException
  {
  }

  protected void _reportProblem(JsonParser paramJsonParser, String paramString)
    throws JsonMappingException
  {
    throw new JsonMappingException(paramString, paramJsonParser.getTokenLocation());
  }

  protected final JsonNode deserializeAny(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, JsonNodeFactory paramJsonNodeFactory)
    throws IOException, JsonProcessingException
  {
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
    {
    case 4:
    default:
      throw paramDeserializationContext.mappingException(getValueClass());
    case 1:
      return deserializeObject(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory);
    case 2:
      return deserializeArray(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory);
    case 5:
      return deserializeObject(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory);
    case 6:
      Object localObject = paramJsonParser.getEmbeddedObject();
      if (localObject == null)
        return paramJsonNodeFactory.nullNode();
      if (localObject.getClass() == [B.class)
        return paramJsonNodeFactory.binaryNode((byte[])localObject);
      return paramJsonNodeFactory.POJONode(localObject);
    case 3:
      return paramJsonNodeFactory.textNode(paramJsonParser.getText());
    case 7:
      JsonParser.NumberType localNumberType = paramJsonParser.getNumberType();
      if ((localNumberType == JsonParser.NumberType.BIG_INTEGER) || (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_INTEGER_FOR_INTS)))
        return paramJsonNodeFactory.numberNode(paramJsonParser.getBigIntegerValue());
      if (localNumberType == JsonParser.NumberType.INT)
        return paramJsonNodeFactory.numberNode(paramJsonParser.getIntValue());
      return paramJsonNodeFactory.numberNode(paramJsonParser.getLongValue());
    case 8:
      if ((paramJsonParser.getNumberType() == JsonParser.NumberType.BIG_DECIMAL) || (paramDeserializationContext.isEnabled(DeserializationConfig.Feature.USE_BIG_DECIMAL_FOR_FLOATS)))
        return paramJsonNodeFactory.numberNode(paramJsonParser.getDecimalValue());
      return paramJsonNodeFactory.numberNode(paramJsonParser.getDoubleValue());
    case 9:
      return paramJsonNodeFactory.booleanNode(true);
    case 10:
      return paramJsonNodeFactory.booleanNode(false);
    case 11:
    }
    return paramJsonNodeFactory.nullNode();
  }

  protected final ArrayNode deserializeArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, JsonNodeFactory paramJsonNodeFactory)
    throws IOException, JsonProcessingException
  {
    ArrayNode localArrayNode = paramJsonNodeFactory.arrayNode();
    while (true)
      switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.nextToken().ordinal()])
      {
      default:
        localArrayNode.add(deserializeAny(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory));
        break;
      case 1:
        localArrayNode.add(deserializeObject(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory));
        break;
      case 2:
        localArrayNode.add(deserializeArray(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory));
        break;
      case 3:
        localArrayNode.add(paramJsonNodeFactory.textNode(paramJsonParser.getText()));
      case 4:
      }
    return localArrayNode;
  }

  protected final ObjectNode deserializeObject(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, JsonNodeFactory paramJsonNodeFactory)
    throws IOException, JsonProcessingException
  {
    ObjectNode localObjectNode = paramJsonNodeFactory.objectNode();
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == JsonToken.START_OBJECT)
      localJsonToken = paramJsonParser.nextToken();
    if (localJsonToken == JsonToken.FIELD_NAME)
    {
      String str = paramJsonParser.getCurrentName();
      Object localObject;
      switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.nextToken().ordinal()])
      {
      default:
        localObject = deserializeAny(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory);
      case 1:
      case 2:
      case 3:
      }
      while (true)
      {
        JsonNode localJsonNode = localObjectNode.put(str, (JsonNode)localObject);
        if (localJsonNode != null)
          _handleDuplicateField(str, localObjectNode, localJsonNode, (JsonNode)localObject);
        localJsonToken = paramJsonParser.nextToken();
        break;
        localObject = deserializeObject(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory);
        continue;
        localObject = deserializeArray(paramJsonParser, paramDeserializationContext, paramJsonNodeFactory);
        continue;
        localObject = paramJsonNodeFactory.textNode(paramJsonParser.getText());
      }
    }
    return localObjectNode;
  }

  public Object deserializeWithType(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, TypeDeserializer paramTypeDeserializer)
    throws IOException, JsonProcessingException
  {
    return paramTypeDeserializer.deserializeTypedFromAny(paramJsonParser, paramDeserializationContext);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.BaseNodeDeserializer
 * JD-Core Version:    0.6.2
 */