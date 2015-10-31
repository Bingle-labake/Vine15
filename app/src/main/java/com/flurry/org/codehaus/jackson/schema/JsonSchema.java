package com.flurry.org.codehaus.jackson.schema;

import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.annotate.JsonCreator;
import com.flurry.org.codehaus.jackson.annotate.JsonValue;
import com.flurry.org.codehaus.jackson.node.JsonNodeFactory;
import com.flurry.org.codehaus.jackson.node.ObjectNode;

public class JsonSchema
{
  private final ObjectNode schema;

  @JsonCreator
  public JsonSchema(ObjectNode paramObjectNode)
  {
    this.schema = paramObjectNode;
  }

  public static JsonNode getDefaultSchemaNode()
  {
    ObjectNode localObjectNode = JsonNodeFactory.instance.objectNode();
    localObjectNode.put("type", "any");
    return localObjectNode;
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    JsonSchema localJsonSchema;
    do
    {
      return true;
      if (paramObject == null)
        return false;
      if (!(paramObject instanceof JsonSchema))
        return false;
      localJsonSchema = (JsonSchema)paramObject;
      if (this.schema != null)
        break;
    }
    while (localJsonSchema.schema == null);
    return false;
    return this.schema.equals(localJsonSchema.schema);
  }

  @JsonValue
  public ObjectNode getSchemaNode()
  {
    return this.schema;
  }

  public String toString()
  {
    return this.schema.toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.schema.JsonSchema
 * JD-Core Version:    0.6.2
 */