package com.flurry.org.codehaus.jackson.map.deser.std;

import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.map.JsonDeserializer;
import com.flurry.org.codehaus.jackson.node.ArrayNode;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import java.io.IOException;

public class JsonNodeDeserializer extends BaseNodeDeserializer<JsonNode>
{
  private static final JsonNodeDeserializer instance = new JsonNodeDeserializer();

  protected JsonNodeDeserializer()
  {
    super(JsonNode.class);
  }

  public static JsonDeserializer<? extends JsonNode> getDeserializer(Class<?> paramClass)
  {
    if (paramClass == ObjectNode.class)
      return ObjectDeserializer.getInstance();
    if (paramClass == ArrayNode.class)
      return ArrayDeserializer.getInstance();
    return instance;
  }

  public JsonNode deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonParser.getCurrentToken().ordinal()])
    {
    default:
      return deserializeAny(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
    case 1:
      return deserializeObject(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
    case 2:
    }
    return deserializeArray(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
  }

  static final class ArrayDeserializer extends BaseNodeDeserializer<ArrayNode>
  {
    protected static final ArrayDeserializer _instance = new ArrayDeserializer();

    protected ArrayDeserializer()
    {
      super();
    }

    public static ArrayDeserializer getInstance()
    {
      return _instance;
    }

    public ArrayNode deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (paramJsonParser.isExpectedStartArrayToken())
        return deserializeArray(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
      throw paramDeserializationContext.mappingException(ArrayNode.class);
    }
  }

  static final class ObjectDeserializer extends BaseNodeDeserializer<ObjectNode>
  {
    protected static final ObjectDeserializer _instance = new ObjectDeserializer();

    protected ObjectDeserializer()
    {
      super();
    }

    public static ObjectDeserializer getInstance()
    {
      return _instance;
    }

    public ObjectNode deserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
      throws IOException, JsonProcessingException
    {
      if (paramJsonParser.getCurrentToken() == JsonToken.START_OBJECT)
      {
        paramJsonParser.nextToken();
        return deserializeObject(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
      }
      if (paramJsonParser.getCurrentToken() == JsonToken.FIELD_NAME)
        return deserializeObject(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
      throw paramDeserializationContext.mappingException(ObjectNode.class);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.std.JsonNodeDeserializer
 * JD-Core Version:    0.6.2
 */