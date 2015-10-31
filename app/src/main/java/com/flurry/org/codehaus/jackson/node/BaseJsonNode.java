package com.flurry.org.codehaus.jackson.node;

import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonParser.NumberType;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.map.JsonSerializableWithType;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import java.io.IOException;
import java.util.List;

public abstract class BaseJsonNode extends JsonNode
  implements JsonSerializableWithType
{
  public abstract JsonToken asToken();

  public ObjectNode findParent(String paramString)
  {
    return null;
  }

  public List<JsonNode> findParents(String paramString, List<JsonNode> paramList)
  {
    return paramList;
  }

  public final JsonNode findPath(String paramString)
  {
    Object localObject = findValue(paramString);
    if (localObject == null)
      localObject = MissingNode.getInstance();
    return localObject;
  }

  public JsonNode findValue(String paramString)
  {
    return null;
  }

  public List<JsonNode> findValues(String paramString, List<JsonNode> paramList)
  {
    return paramList;
  }

  public List<String> findValuesAsText(String paramString, List<String> paramList)
  {
    return paramList;
  }

  public JsonParser.NumberType getNumberType()
  {
    return null;
  }

  public abstract void serialize(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonProcessingException;

  public abstract void serializeWithType(JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
    throws IOException, JsonProcessingException;

  public JsonParser traverse()
  {
    return new TreeTraversingParser(this);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.node.BaseJsonNode
 * JD-Core Version:    0.6.2
 */