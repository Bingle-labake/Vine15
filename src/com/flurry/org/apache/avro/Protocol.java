package com.flurry.org.apache.avro;

import com.flurry.org.codehaus.jackson.JsonFactory;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.map.ObjectMapper;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.io.StringWriter;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class Protocol
{
  private static final Set<String> MESSAGE_RESERVED = new HashSet();
  private static final Set<String> PROTOCOL_RESERVED;
  public static final Schema SYSTEM_ERROR;
  public static final Schema SYSTEM_ERRORS;
  public static final long VERSION = 1L;
  private String doc;
  private byte[] md5;
  private Map<String, Message> messages = new LinkedHashMap();
  private String name;
  private String namespace;
  Schema.Props props = new Schema.Props(PROTOCOL_RESERVED);
  private Schema.Names types = new Schema.Names();

  static
  {
    Collections.addAll(MESSAGE_RESERVED, new String[] { "doc", "response", "request", "errors", "one-way" });
    SYSTEM_ERROR = Schema.create(Schema.Type.STRING);
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(SYSTEM_ERROR);
    SYSTEM_ERRORS = Schema.createUnion(localArrayList);
    PROTOCOL_RESERVED = new HashSet();
    Collections.addAll(PROTOCOL_RESERVED, new String[] { "namespace", "protocol", "doc", "messages", "types", "errors" });
  }

  private Protocol()
  {
  }

  public Protocol(String paramString1, String paramString2)
  {
    this(paramString1, null, paramString2);
  }

  public Protocol(String paramString1, String paramString2, String paramString3)
  {
    this.name = paramString1;
    this.doc = paramString2;
    this.namespace = paramString3;
  }

  public static void main(String[] paramArrayOfString)
    throws Exception
  {
    System.out.println(parse(new File(paramArrayOfString[0])));
  }

  private static Protocol parse(JsonParser paramJsonParser)
  {
    try
    {
      Protocol localProtocol = new Protocol();
      localProtocol.parse(Schema.MAPPER.readTree(paramJsonParser));
      return localProtocol;
    }
    catch (IOException localIOException)
    {
      throw new SchemaParseException(localIOException);
    }
  }

  public static Protocol parse(File paramFile)
    throws IOException
  {
    return parse(Schema.FACTORY.createJsonParser(paramFile));
  }

  public static Protocol parse(InputStream paramInputStream)
    throws IOException
  {
    return parse(Schema.FACTORY.createJsonParser(paramInputStream));
  }

  public static Protocol parse(String paramString)
  {
    try
    {
      Protocol localProtocol = parse(Schema.FACTORY.createJsonParser(new ByteArrayInputStream(paramString.getBytes("UTF-8"))));
      return localProtocol;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
  }

  private void parse(JsonNode paramJsonNode)
  {
    parseNamespace(paramJsonNode);
    parseName(paramJsonNode);
    parseTypes(paramJsonNode);
    parseMessages(paramJsonNode);
    parseDoc(paramJsonNode);
    parseProps(paramJsonNode);
  }

  private void parseDoc(JsonNode paramJsonNode)
  {
    this.doc = parseDocNode(paramJsonNode);
  }

  private String parseDocNode(JsonNode paramJsonNode)
  {
    JsonNode localJsonNode = paramJsonNode.get("doc");
    if (localJsonNode == null)
      return null;
    return localJsonNode.getTextValue();
  }

  private Message parseMessage(String paramString, JsonNode paramJsonNode)
  {
    String str1 = parseDocNode(paramJsonNode);
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    Iterator localIterator1 = paramJsonNode.getFieldNames();
    while (localIterator1.hasNext())
    {
      String str3 = (String)localIterator1.next();
      if (!MESSAGE_RESERVED.contains(str3))
      {
        JsonNode localJsonNode8 = paramJsonNode.get(str3);
        if ((localJsonNode8.isValueNode()) && (localJsonNode8.isTextual()))
          localLinkedHashMap.put(str3, localJsonNode8.getTextValue());
      }
    }
    JsonNode localJsonNode1 = paramJsonNode.get("request");
    if ((localJsonNode1 == null) || (!localJsonNode1.isArray()))
      throw new SchemaParseException("No request specified: " + paramJsonNode);
    ArrayList localArrayList1 = new ArrayList();
    Iterator localIterator2 = localJsonNode1.iterator();
    while (localIterator2.hasNext())
    {
      JsonNode localJsonNode5 = (JsonNode)localIterator2.next();
      JsonNode localJsonNode6 = localJsonNode5.get("name");
      if (localJsonNode6 == null)
        throw new SchemaParseException("No param name: " + localJsonNode5);
      JsonNode localJsonNode7 = localJsonNode5.get("type");
      if (localJsonNode7 == null)
        throw new SchemaParseException("No param type: " + localJsonNode5);
      localArrayList1.add(new Schema.Field(localJsonNode6.getTextValue(), Schema.parse(localJsonNode7, this.types), null, localJsonNode5.get("default")));
    }
    Schema localSchema1 = Schema.createRecord(localArrayList1);
    JsonNode localJsonNode2 = paramJsonNode.get("one-way");
    boolean bool = false;
    if (localJsonNode2 != null)
    {
      if (!localJsonNode2.isBoolean())
        throw new SchemaParseException("one-way must be boolean: " + paramJsonNode);
      bool = localJsonNode2.getBooleanValue();
    }
    JsonNode localJsonNode3 = paramJsonNode.get("response");
    if ((!bool) && (localJsonNode3 == null))
      throw new SchemaParseException("No response specified: " + paramJsonNode);
    JsonNode localJsonNode4 = paramJsonNode.get("errors");
    if (bool)
    {
      if (localJsonNode4 != null)
        throw new SchemaParseException("one-way can't have errors: " + paramJsonNode);
      if ((localJsonNode3 != null) && (Schema.parse(localJsonNode3, this.types).getType() != Schema.Type.NULL))
        throw new SchemaParseException("One way response must be null: " + paramJsonNode);
      return new Message(paramString, str1, localLinkedHashMap, localSchema1, null);
    }
    Schema localSchema2 = Schema.parse(localJsonNode3, this.types);
    ArrayList localArrayList2 = new ArrayList();
    localArrayList2.add(SYSTEM_ERROR);
    if (localJsonNode4 != null)
    {
      if (!localJsonNode4.isArray())
        throw new SchemaParseException("Errors not an array: " + paramJsonNode);
      Iterator localIterator3 = localJsonNode4.iterator();
      while (localIterator3.hasNext())
      {
        String str2 = ((JsonNode)localIterator3.next()).getTextValue();
        Schema localSchema3 = this.types.get(str2);
        if (localSchema3 == null)
          throw new SchemaParseException("Undefined error: " + str2);
        if (!localSchema3.isError())
          throw new SchemaParseException("Not an error: " + str2);
        localArrayList2.add(localSchema3);
      }
    }
    return new TwoWayMessage(paramString, str1, localLinkedHashMap, localSchema1, localSchema2, Schema.createUnion(localArrayList2), null);
  }

  private void parseMessages(JsonNode paramJsonNode)
  {
    JsonNode localJsonNode = paramJsonNode.get("messages");
    if (localJsonNode == null);
    while (true)
    {
      return;
      Iterator localIterator = localJsonNode.getFieldNames();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        this.messages.put(str, parseMessage(str, localJsonNode.get(str)));
      }
    }
  }

  private void parseName(JsonNode paramJsonNode)
  {
    JsonNode localJsonNode = paramJsonNode.get("protocol");
    if (localJsonNode == null)
      throw new SchemaParseException("No protocol name specified: " + paramJsonNode);
    this.name = localJsonNode.getTextValue();
  }

  private void parseNamespace(JsonNode paramJsonNode)
  {
    JsonNode localJsonNode = paramJsonNode.get("namespace");
    if (localJsonNode == null)
      return;
    this.namespace = localJsonNode.getTextValue();
    this.types.space(this.namespace);
  }

  private void parseProps(JsonNode paramJsonNode)
  {
    Iterator localIterator = paramJsonNode.getFieldNames();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if (!PROTOCOL_RESERVED.contains(str))
      {
        JsonNode localJsonNode = paramJsonNode.get(str);
        if ((localJsonNode.isValueNode()) && (localJsonNode.isTextual()))
          addProp(str, localJsonNode.getTextValue());
      }
    }
  }

  private void parseTypes(JsonNode paramJsonNode)
  {
    JsonNode localJsonNode1 = paramJsonNode.get("types");
    if (localJsonNode1 == null);
    while (true)
    {
      return;
      if (!localJsonNode1.isArray())
        throw new SchemaParseException("Types not an array: " + localJsonNode1);
      Iterator localIterator = localJsonNode1.iterator();
      while (localIterator.hasNext())
      {
        JsonNode localJsonNode2 = (JsonNode)localIterator.next();
        if (!localJsonNode2.isObject())
          throw new SchemaParseException("Type not an object: " + localJsonNode2);
        Schema.parse(localJsonNode2, this.types);
      }
    }
  }

  public void addProp(String paramString1, String paramString2)
  {
    try
    {
      this.props.add(paramString1, paramString2);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  @Deprecated
  public Message createMessage(String paramString1, String paramString2, Schema paramSchema)
  {
    return createMessage(paramString1, paramString2, new LinkedHashMap(), paramSchema);
  }

  @Deprecated
  public Message createMessage(String paramString1, String paramString2, Schema paramSchema1, Schema paramSchema2, Schema paramSchema3)
  {
    return createMessage(paramString1, paramString2, new LinkedHashMap(), paramSchema1, paramSchema2, paramSchema3);
  }

  public Message createMessage(String paramString1, String paramString2, Map<String, String> paramMap, Schema paramSchema)
  {
    return new Message(paramString1, paramString2, paramMap, paramSchema, null);
  }

  public Message createMessage(String paramString1, String paramString2, Map<String, String> paramMap, Schema paramSchema1, Schema paramSchema2, Schema paramSchema3)
  {
    return new TwoWayMessage(paramString1, paramString2, paramMap, paramSchema1, paramSchema2, paramSchema3, null);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    Protocol localProtocol;
    do
    {
      return true;
      if (!(paramObject instanceof Protocol))
        return false;
      localProtocol = (Protocol)paramObject;
    }
    while ((this.name.equals(localProtocol.name)) && (this.namespace.equals(localProtocol.namespace)) && (this.types.equals(localProtocol.types)) && (this.messages.equals(localProtocol.messages)) && (this.props.equals(this.props)));
    return false;
  }

  public String getDoc()
  {
    return this.doc;
  }

  public byte[] getMD5()
  {
    if (this.md5 == null);
    try
    {
      this.md5 = MessageDigest.getInstance("MD5").digest(toString().getBytes("UTF-8"));
      return this.md5;
    }
    catch (Exception localException)
    {
      throw new AvroRuntimeException(localException);
    }
  }

  public Map<String, Message> getMessages()
  {
    return this.messages;
  }

  public String getName()
  {
    return this.name;
  }

  public String getNamespace()
  {
    return this.namespace;
  }

  public String getProp(String paramString)
  {
    try
    {
      String str = (String)this.props.get(paramString);
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Map<String, String> getProps()
  {
    return Collections.unmodifiableMap(this.props);
  }

  public Schema getType(String paramString)
  {
    return this.types.get(paramString);
  }

  public Collection<Schema> getTypes()
  {
    return this.types.values();
  }

  public int hashCode()
  {
    return this.name.hashCode() + this.namespace.hashCode() + this.types.hashCode() + this.messages.hashCode() + this.props.hashCode();
  }

  public void setTypes(Collection<Schema> paramCollection)
  {
    this.types = new Schema.Names();
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext())
    {
      Schema localSchema = (Schema)localIterator.next();
      this.types.add(localSchema);
    }
  }

  void toJson(JsonGenerator paramJsonGenerator)
    throws IOException
  {
    this.types.space(this.namespace);
    paramJsonGenerator.writeStartObject();
    paramJsonGenerator.writeStringField("protocol", this.name);
    paramJsonGenerator.writeStringField("namespace", this.namespace);
    if (this.doc != null)
      paramJsonGenerator.writeStringField("doc", this.doc);
    this.props.write(paramJsonGenerator);
    paramJsonGenerator.writeArrayFieldStart("types");
    Schema.Names localNames = new Schema.Names(this.namespace);
    Iterator localIterator1 = this.types.values().iterator();
    while (localIterator1.hasNext())
    {
      Schema localSchema = (Schema)localIterator1.next();
      if (!localNames.contains(localSchema))
        localSchema.toJson(localNames, paramJsonGenerator);
    }
    paramJsonGenerator.writeEndArray();
    paramJsonGenerator.writeObjectFieldStart("messages");
    Iterator localIterator2 = this.messages.entrySet().iterator();
    while (localIterator2.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator2.next();
      paramJsonGenerator.writeFieldName((String)localEntry.getKey());
      ((Message)localEntry.getValue()).toJson(paramJsonGenerator);
    }
    paramJsonGenerator.writeEndObject();
    paramJsonGenerator.writeEndObject();
  }

  public String toString()
  {
    return toString(false);
  }

  public String toString(boolean paramBoolean)
  {
    try
    {
      StringWriter localStringWriter = new StringWriter();
      JsonGenerator localJsonGenerator = Schema.FACTORY.createJsonGenerator(localStringWriter);
      if (paramBoolean)
        localJsonGenerator.useDefaultPrettyPrinter();
      toJson(localJsonGenerator);
      localJsonGenerator.flush();
      String str = localStringWriter.toString();
      return str;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
  }

  public class Message
  {
    private String doc;
    private String name;
    private final Schema.Props props = new Schema.Props(Protocol.MESSAGE_RESERVED);
    private Schema request;

    private Message(String paramMap, Map<String, String> paramSchema, Schema arg4)
    {
      this.name = paramMap;
      this.doc = paramSchema;
      Object localObject2;
      this.request = localObject2;
      Object localObject1;
      if (localObject1 != null)
      {
        Iterator localIterator = localObject1.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          addProp((String)localEntry.getKey(), (String)localEntry.getValue());
        }
      }
    }

    public void addProp(String paramString1, String paramString2)
    {
      try
      {
        this.props.add(paramString1, paramString2);
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      Message localMessage;
      do
      {
        return true;
        if (!(paramObject instanceof Message))
          return false;
        localMessage = (Message)paramObject;
      }
      while ((this.name.equals(localMessage.name)) && (this.request.equals(localMessage.request)) && (this.props.equals(localMessage.props)));
      return false;
    }

    public String getDoc()
    {
      return this.doc;
    }

    public Schema getErrors()
    {
      return Schema.createUnion(new ArrayList());
    }

    public String getName()
    {
      return this.name;
    }

    public String getProp(String paramString)
    {
      try
      {
        String str = (String)this.props.get(paramString);
        return str;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    public Map<String, String> getProps()
    {
      return Collections.unmodifiableMap(this.props);
    }

    public Schema getRequest()
    {
      return this.request;
    }

    public Schema getResponse()
    {
      return Schema.create(Schema.Type.NULL);
    }

    public int hashCode()
    {
      return this.name.hashCode() + this.request.hashCode() + this.props.hashCode();
    }

    public boolean isOneWay()
    {
      return true;
    }

    void toJson(JsonGenerator paramJsonGenerator)
      throws IOException
    {
      paramJsonGenerator.writeStartObject();
      if (this.doc != null)
        paramJsonGenerator.writeStringField("doc", this.doc);
      this.props.write(paramJsonGenerator);
      paramJsonGenerator.writeFieldName("request");
      this.request.fieldsToJson(Protocol.this.types, paramJsonGenerator);
      toJson1(paramJsonGenerator);
      paramJsonGenerator.writeEndObject();
    }

    void toJson1(JsonGenerator paramJsonGenerator)
      throws IOException
    {
      paramJsonGenerator.writeStringField("response", "null");
      paramJsonGenerator.writeBooleanField("one-way", true);
    }

    public String toString()
    {
      try
      {
        StringWriter localStringWriter = new StringWriter();
        JsonGenerator localJsonGenerator = Schema.FACTORY.createJsonGenerator(localStringWriter);
        toJson(localJsonGenerator);
        localJsonGenerator.flush();
        String str = localStringWriter.toString();
        return str;
      }
      catch (IOException localIOException)
      {
        throw new AvroRuntimeException(localIOException);
      }
    }
  }

  private class TwoWayMessage extends Protocol.Message
  {
    private Schema errors;
    private Schema response;

    private TwoWayMessage(String paramMap, Map<String, String> paramSchema1, Schema paramSchema2, Schema paramSchema3, Schema arg6)
    {
      super(paramMap, paramSchema1, paramSchema2, paramSchema3, null);
      Object localObject1;
      this.response = localObject1;
      Object localObject2;
      this.errors = localObject2;
    }

    public boolean equals(Object paramObject)
    {
      if (!super.equals(paramObject));
      TwoWayMessage localTwoWayMessage;
      do
      {
        do
          return false;
        while (!(paramObject instanceof TwoWayMessage));
        localTwoWayMessage = (TwoWayMessage)paramObject;
      }
      while ((!this.response.equals(localTwoWayMessage.response)) || (!this.errors.equals(localTwoWayMessage.errors)));
      return true;
    }

    public Schema getErrors()
    {
      return this.errors;
    }

    public Schema getResponse()
    {
      return this.response;
    }

    public int hashCode()
    {
      return super.hashCode() + this.response.hashCode() + this.errors.hashCode();
    }

    public boolean isOneWay()
    {
      return false;
    }

    void toJson1(JsonGenerator paramJsonGenerator)
      throws IOException
    {
      paramJsonGenerator.writeFieldName("response");
      this.response.toJson(Protocol.this.types, paramJsonGenerator);
      List localList = this.errors.getTypes();
      if (localList.size() > 1)
      {
        Schema localSchema = Schema.createUnion(localList.subList(1, localList.size()));
        paramJsonGenerator.writeFieldName("errors");
        localSchema.toJson(Protocol.this.types, paramJsonGenerator);
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.Protocol
 * JD-Core Version:    0.6.2
 */