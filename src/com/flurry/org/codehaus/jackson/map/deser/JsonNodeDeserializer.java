package com.flurry.org.codehaus.jackson.map.deser;

import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.map.DeserializationContext;
import com.flurry.org.codehaus.jackson.node.ArrayNode;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import java.io.IOException;

@Deprecated
public class JsonNodeDeserializer extends com.flurry.org.codehaus.jackson.map.deser.std.JsonNodeDeserializer
{

  @Deprecated
  public static final JsonNodeDeserializer instance = new JsonNodeDeserializer();

  @Deprecated
  protected final JsonNode deserializeAny(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    return deserializeAny(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
  }

  @Deprecated
  protected final ArrayNode deserializeArray(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    return deserializeArray(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
  }

  @Deprecated
  protected final ObjectNode deserializeObject(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext)
    throws IOException, JsonProcessingException
  {
    return deserializeObject(paramJsonParser, paramDeserializationContext, paramDeserializationContext.getNodeFactory());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.deser.JsonNodeDeserializer
 * JD-Core Version:    0.6.2
 */