package com.flurry.org.apache.avro.data;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.io.DatumReader;
import com.flurry.org.apache.avro.io.DatumWriter;
import com.flurry.org.apache.avro.io.Decoder;
import com.flurry.org.apache.avro.io.DecoderFactory;
import com.flurry.org.apache.avro.io.Encoder;
import com.flurry.org.apache.avro.io.ResolvingDecoder;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.node.ArrayNode;
import com.flurry.org.codehaus.jackson.node.BooleanNode;
import com.flurry.org.codehaus.jackson.node.DoubleNode;
import com.flurry.org.codehaus.jackson.node.JsonNodeFactory;
import com.flurry.org.codehaus.jackson.node.LongNode;
import com.flurry.org.codehaus.jackson.node.NullNode;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import com.flurry.org.codehaus.jackson.node.TextNode;
import java.io.IOException;
import java.util.Iterator;

public class Json
{
  public static final Schema SCHEMA;

  static
  {
    try
    {
      SCHEMA = Schema.parse(Json.class.getResourceAsStream("/com/flurry/org/apache/avro/data/Json.avsc"));
      return;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
  }

  public static JsonNode read(Decoder paramDecoder)
    throws IOException
  {
    switch (1.$SwitchMap$org$apache$avro$data$Json$JsonType[JsonType.values()[paramDecoder.readIndex()].ordinal()])
    {
    default:
      throw new AvroRuntimeException("Unexpected Json node type");
    case 1:
      return new LongNode(paramDecoder.readLong());
    case 2:
      return new DoubleNode(paramDecoder.readDouble());
    case 3:
      return new TextNode(paramDecoder.readString());
    case 4:
      if (paramDecoder.readBoolean())
        return BooleanNode.TRUE;
      return BooleanNode.FALSE;
    case 5:
      paramDecoder.readNull();
      return NullNode.getInstance();
    case 6:
      ArrayNode localArrayNode = JsonNodeFactory.instance.arrayNode();
      for (long l3 = paramDecoder.readArrayStart(); l3 > 0L; l3 = paramDecoder.arrayNext())
        for (long l4 = 0L; l4 < l3; l4 += 1L)
          localArrayNode.add(read(paramDecoder));
      return localArrayNode;
    case 7:
    }
    ObjectNode localObjectNode = JsonNodeFactory.instance.objectNode();
    for (long l1 = paramDecoder.readMapStart(); l1 > 0L; l1 = paramDecoder.mapNext())
      for (long l2 = 0L; l2 < l1; l2 += 1L)
        localObjectNode.put(paramDecoder.readString(), read(paramDecoder));
    return localObjectNode;
  }

  public static void write(JsonNode paramJsonNode, Encoder paramEncoder)
    throws IOException
  {
    switch (1.$SwitchMap$org$codehaus$jackson$JsonToken[paramJsonNode.asToken().ordinal()])
    {
    default:
      throw new AvroRuntimeException(paramJsonNode.asToken() + " unexpected: " + paramJsonNode);
    case 1:
      paramEncoder.writeIndex(JsonType.LONG.ordinal());
      paramEncoder.writeLong(paramJsonNode.getLongValue());
      return;
    case 2:
      paramEncoder.writeIndex(JsonType.DOUBLE.ordinal());
      paramEncoder.writeDouble(paramJsonNode.getDoubleValue());
      return;
    case 3:
      paramEncoder.writeIndex(JsonType.STRING.ordinal());
      paramEncoder.writeString(paramJsonNode.getTextValue());
      return;
    case 4:
      paramEncoder.writeIndex(JsonType.BOOLEAN.ordinal());
      paramEncoder.writeBoolean(true);
      return;
    case 5:
      paramEncoder.writeIndex(JsonType.BOOLEAN.ordinal());
      paramEncoder.writeBoolean(false);
      return;
    case 6:
      paramEncoder.writeIndex(JsonType.NULL.ordinal());
      paramEncoder.writeNull();
      return;
    case 7:
      paramEncoder.writeIndex(JsonType.ARRAY.ordinal());
      paramEncoder.writeArrayStart();
      paramEncoder.setItemCount(paramJsonNode.size());
      Iterator localIterator2 = paramJsonNode.iterator();
      while (localIterator2.hasNext())
      {
        JsonNode localJsonNode = (JsonNode)localIterator2.next();
        paramEncoder.startItem();
        write(localJsonNode, paramEncoder);
      }
      paramEncoder.writeArrayEnd();
      return;
    case 8:
    }
    paramEncoder.writeIndex(JsonType.OBJECT.ordinal());
    paramEncoder.writeMapStart();
    paramEncoder.setItemCount(paramJsonNode.size());
    Iterator localIterator1 = paramJsonNode.getFieldNames();
    while (localIterator1.hasNext())
    {
      paramEncoder.startItem();
      String str = (String)localIterator1.next();
      paramEncoder.writeString(str);
      write(paramJsonNode.get(str), paramEncoder);
    }
    paramEncoder.writeMapEnd();
  }

  private static enum JsonType
  {
    static
    {
      DOUBLE = new JsonType("DOUBLE", 1);
      STRING = new JsonType("STRING", 2);
      BOOLEAN = new JsonType("BOOLEAN", 3);
      NULL = new JsonType("NULL", 4);
      ARRAY = new JsonType("ARRAY", 5);
      OBJECT = new JsonType("OBJECT", 6);
      JsonType[] arrayOfJsonType = new JsonType[7];
      arrayOfJsonType[0] = LONG;
      arrayOfJsonType[1] = DOUBLE;
      arrayOfJsonType[2] = STRING;
      arrayOfJsonType[3] = BOOLEAN;
      arrayOfJsonType[4] = NULL;
      arrayOfJsonType[5] = ARRAY;
      arrayOfJsonType[6] = OBJECT;
    }
  }

  public static class Reader
    implements DatumReader<JsonNode>
  {
    private ResolvingDecoder resolver;
    private Schema written;

    public JsonNode read(JsonNode paramJsonNode, Decoder paramDecoder)
      throws IOException
    {
      if (this.written == null)
        return Json.read(paramDecoder);
      if (this.resolver == null)
        this.resolver = DecoderFactory.get().resolvingDecoder(this.written, Json.SCHEMA, null);
      this.resolver.configure(paramDecoder);
      JsonNode localJsonNode = Json.read(this.resolver);
      this.resolver.drain();
      return localJsonNode;
    }

    public void setSchema(Schema paramSchema)
    {
      if (Json.SCHEMA.equals(this.written))
        paramSchema = null;
      this.written = paramSchema;
    }
  }

  public static class Writer
    implements DatumWriter<JsonNode>
  {
    public void setSchema(Schema paramSchema)
    {
      if (!Json.SCHEMA.equals(paramSchema))
        throw new RuntimeException("Not the Json schema: " + paramSchema);
    }

    public void write(JsonNode paramJsonNode, Encoder paramEncoder)
      throws IOException
    {
      Json.write(paramJsonNode, paramEncoder);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.data.Json
 * JD-Core Version:    0.6.2
 */