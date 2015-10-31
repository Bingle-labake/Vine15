package com.flurry.org.apache.avro;

import com.flurry.org.codehaus.jackson.JsonFactory;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParseException;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonParser.Feature;
import com.flurry.org.codehaus.jackson.map.ObjectMapper;
import com.flurry.org.codehaus.jackson.node.DoubleNode;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public abstract class Schema
{
  static final JsonFactory FACTORY = new JsonFactory();
  private static final Set<String> FIELD_RESERVED;
  static final ObjectMapper MAPPER = new ObjectMapper(FACTORY);
  private static final int NO_HASHCODE = -2147483648;
  static final Map<String, Type> PRIMITIVES;
  private static final Set<String> SCHEMA_RESERVED;
  private static final ThreadLocal<Set> SEEN_EQUALS;
  private static final ThreadLocal<Map> SEEN_HASHCODE;
  private static ThreadLocal<Boolean> validateNames = new ThreadLocal()
  {
    protected Boolean initialValue()
    {
      return Boolean.valueOf(true);
    }
  };
  int hashCode = -2147483648;
  Props props = new Props(SCHEMA_RESERVED);
  private final Type type;

  static
  {
    FACTORY.enable(JsonParser.Feature.ALLOW_COMMENTS);
    FACTORY.setCodec(MAPPER);
    SCHEMA_RESERVED = new HashSet();
    Collections.addAll(SCHEMA_RESERVED, new String[] { "doc", "fields", "items", "name", "namespace", "size", "symbols", "values", "type" });
    FIELD_RESERVED = new HashSet();
    Collections.addAll(FIELD_RESERVED, new String[] { "default", "doc", "name", "order", "type" });
    SEEN_EQUALS = new ThreadLocal()
    {
      protected Set initialValue()
      {
        return new HashSet();
      }
    };
    SEEN_HASHCODE = new ThreadLocal()
    {
      protected Map initialValue()
      {
        return new IdentityHashMap();
      }
    };
    PRIMITIVES = new HashMap();
    PRIMITIVES.put("string", Type.STRING);
    PRIMITIVES.put("bytes", Type.BYTES);
    PRIMITIVES.put("int", Type.INT);
    PRIMITIVES.put("long", Type.LONG);
    PRIMITIVES.put("float", Type.FLOAT);
    PRIMITIVES.put("double", Type.DOUBLE);
    PRIMITIVES.put("boolean", Type.BOOLEAN);
    PRIMITIVES.put("null", Type.NULL);
  }

  Schema(Type paramType)
  {
    this.type = paramType;
  }

  public static Schema applyAliases(Schema paramSchema1, Schema paramSchema2)
  {
    if (paramSchema1 == paramSchema2);
    IdentityHashMap localIdentityHashMap;
    HashMap localHashMap1;
    HashMap localHashMap2;
    do
    {
      return paramSchema1;
      localIdentityHashMap = new IdentityHashMap(1);
      localHashMap1 = new HashMap(1);
      localHashMap2 = new HashMap(1);
      getAliases(paramSchema2, localIdentityHashMap, localHashMap1, localHashMap2);
    }
    while ((localHashMap1.size() == 0) && (localHashMap2.size() == 0));
    localIdentityHashMap.clear();
    return applyAliases(paramSchema1, localIdentityHashMap, localHashMap1, localHashMap2);
  }

  private static Schema applyAliases(Schema paramSchema, Map<Schema, Schema> paramMap, Map<Name, Name> paramMap1, Map<Name, Map<String, String>> paramMap2)
  {
    Name localName;
    Schema localSchema1;
    if ((paramSchema instanceof NamedSchema))
    {
      localName = ((NamedSchema)paramSchema).name;
      localSchema1 = paramSchema;
      switch (4.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
      {
      default:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      }
    }
    while (true)
    {
      if (localSchema1 != paramSchema)
        localSchema1.props.putAll(paramSchema.props);
      return localSchema1;
      localName = null;
      break;
      if (paramMap.containsKey(paramSchema))
        return (Schema)paramMap.get(paramSchema);
      if (paramMap1.containsKey(localName))
        localName = (Name)paramMap1.get(localName);
      localSchema1 = createRecord(localName.full, paramSchema.getDoc(), null, paramSchema.isError());
      paramMap.put(paramSchema, localSchema1);
      ArrayList localArrayList2 = new ArrayList();
      Iterator localIterator2 = paramSchema.getFields().iterator();
      while (localIterator2.hasNext())
      {
        Field localField1 = (Field)localIterator2.next();
        Schema localSchema4 = applyAliases(localField1.schema, paramMap, paramMap1, paramMap2);
        Field localField2 = new Field(getFieldAlias(localName, localField1.name, paramMap2), localSchema4, localField1.doc, localField1.defaultValue, localField1.order);
        localField2.props.putAll(localField1.props);
        localArrayList2.add(localField2);
      }
      localSchema1.setFields(localArrayList2);
      continue;
      if (paramMap1.containsKey(localName))
      {
        localSchema1 = createEnum(((Name)paramMap1.get(localName)).full, paramSchema.getDoc(), null, paramSchema.getEnumSymbols());
        continue;
        Schema localSchema3 = applyAliases(paramSchema.getElementType(), paramMap, paramMap1, paramMap2);
        if (localSchema3 != paramSchema.getElementType())
        {
          localSchema1 = createArray(localSchema3);
          continue;
          Schema localSchema2 = applyAliases(paramSchema.getValueType(), paramMap, paramMap1, paramMap2);
          if (localSchema2 != paramSchema.getValueType())
          {
            localSchema1 = createMap(localSchema2);
            continue;
            ArrayList localArrayList1 = new ArrayList();
            Iterator localIterator1 = paramSchema.getTypes().iterator();
            while (localIterator1.hasNext())
              localArrayList1.add(applyAliases((Schema)localIterator1.next(), paramMap, paramMap1, paramMap2));
            localSchema1 = createUnion(localArrayList1);
            continue;
            if (paramMap1.containsKey(localName))
              localSchema1 = createFixed(((Name)paramMap1.get(localName)).full, paramSchema.getDoc(), null, paramSchema.getFixedSize());
          }
        }
      }
    }
  }

  public static Schema create(Type paramType)
  {
    switch (4.$SwitchMap$org$apache$avro$Schema$Type[paramType.ordinal()])
    {
    default:
      throw new AvroRuntimeException("Can't create a: " + paramType);
    case 1:
      return new StringSchema();
    case 2:
      return new BytesSchema();
    case 3:
      return new IntSchema();
    case 4:
      return new LongSchema();
    case 5:
      return new FloatSchema();
    case 6:
      return new DoubleSchema();
    case 7:
      return new BooleanSchema();
    case 8:
    }
    return new NullSchema();
  }

  public static Schema createArray(Schema paramSchema)
  {
    return new ArraySchema(paramSchema);
  }

  public static Schema createEnum(String paramString1, String paramString2, String paramString3, List<String> paramList)
  {
    return new EnumSchema(new Name(paramString1, paramString3), paramString2, new LockableArrayList(paramList));
  }

  public static Schema createFixed(String paramString1, String paramString2, String paramString3, int paramInt)
  {
    return new FixedSchema(new Name(paramString1, paramString3), paramString2, paramInt);
  }

  public static Schema createMap(Schema paramSchema)
  {
    return new MapSchema(paramSchema);
  }

  public static Schema createRecord(String paramString1, String paramString2, String paramString3, boolean paramBoolean)
  {
    return new RecordSchema(new Name(paramString1, paramString3), paramString2, paramBoolean);
  }

  public static Schema createRecord(List<Field> paramList)
  {
    Schema localSchema = createRecord(null, null, null, false);
    localSchema.setFields(paramList);
    return localSchema;
  }

  public static Schema createUnion(List<Schema> paramList)
  {
    return new UnionSchema(new LockableArrayList(paramList));
  }

  private static void getAliases(Schema paramSchema, Map<Schema, Schema> paramMap, Map<Name, Name> paramMap1, Map<Name, Map<String, String>> paramMap2)
  {
    if ((paramSchema instanceof NamedSchema))
    {
      NamedSchema localNamedSchema = (NamedSchema)paramSchema;
      if (localNamedSchema.aliases != null)
      {
        Iterator localIterator5 = localNamedSchema.aliases.iterator();
        while (localIterator5.hasNext())
          paramMap1.put((Name)localIterator5.next(), localNamedSchema.name);
      }
    }
    switch (4.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
    {
    case 10:
    default:
    case 9:
    case 11:
    case 12:
    case 13:
    }
    while (true)
    {
      return;
      if (!paramMap.containsKey(paramSchema))
      {
        paramMap.put(paramSchema, paramSchema);
        RecordSchema localRecordSchema = (RecordSchema)paramSchema;
        Iterator localIterator2 = paramSchema.getFields().iterator();
        while (localIterator2.hasNext())
        {
          Field localField = (Field)localIterator2.next();
          if (localField.aliases != null)
          {
            Iterator localIterator4 = localField.aliases.iterator();
            while (localIterator4.hasNext())
            {
              String str = (String)localIterator4.next();
              Object localObject = (Map)paramMap2.get(localRecordSchema.name);
              if (localObject == null)
              {
                Name localName = localRecordSchema.name;
                localObject = new HashMap();
                paramMap2.put(localName, localObject);
              }
              ((Map)localObject).put(str, localField.name);
            }
          }
          getAliases(localField.schema, paramMap, paramMap1, paramMap2);
        }
        if ((localRecordSchema.aliases != null) && (paramMap2.containsKey(localRecordSchema.name)))
        {
          Iterator localIterator3 = localRecordSchema.aliases.iterator();
          while (localIterator3.hasNext())
            paramMap2.put((Name)localIterator3.next(), paramMap2.get(localRecordSchema.name));
          continue;
          getAliases(paramSchema.getElementType(), paramMap, paramMap1, paramMap2);
          return;
          getAliases(paramSchema.getValueType(), paramMap, paramMap1, paramMap2);
          return;
          Iterator localIterator1 = paramSchema.getTypes().iterator();
          while (localIterator1.hasNext())
            getAliases((Schema)localIterator1.next(), paramMap, paramMap1, paramMap2);
        }
      }
    }
  }

  private static String getFieldAlias(Name paramName, String paramString, Map<Name, Map<String, String>> paramMap)
  {
    Map localMap = (Map)paramMap.get(paramName);
    if (localMap == null);
    String str;
    do
    {
      return paramString;
      str = (String)localMap.get(paramString);
    }
    while (str == null);
    return str;
  }

  private static String getOptionalText(JsonNode paramJsonNode, String paramString)
  {
    JsonNode localJsonNode = paramJsonNode.get(paramString);
    if (localJsonNode != null)
      return localJsonNode.getTextValue();
    return null;
  }

  private static String getRequiredText(JsonNode paramJsonNode, String paramString1, String paramString2)
  {
    String str = getOptionalText(paramJsonNode, paramString1);
    if (str == null)
      throw new SchemaParseException(paramString2 + ": " + paramJsonNode);
    return str;
  }

  static Schema parse(JsonNode paramJsonNode, Names paramNames)
  {
    Object localObject1;
    if (paramJsonNode.isTextual())
    {
      localObject1 = paramNames.get(paramJsonNode.getTextValue());
      if (localObject1 == null)
        throw new SchemaParseException("Undefined name: " + paramJsonNode);
    }
    else if (paramJsonNode.isObject())
    {
      String str1 = getRequiredText(paramJsonNode, "type", "No type");
      String str3;
      Name localName;
      String str6;
      if ((!str1.equals("record")) && (!str1.equals("error")) && (!str1.equals("enum")))
      {
        boolean bool2 = str1.equals("fixed");
        str3 = null;
        localName = null;
        str6 = null;
        if (!bool2);
      }
      else
      {
        String str2 = getOptionalText(paramJsonNode, "namespace");
        str3 = getOptionalText(paramJsonNode, "doc");
        if (str2 == null)
          str2 = paramNames.space();
        String str4 = getRequiredText(paramJsonNode, "name", "No name in schema");
        localName = new Name(str4, str2);
        String str5 = localName.space;
        str6 = null;
        if (str5 != null)
        {
          str6 = paramNames.space();
          paramNames.space(localName.space);
        }
      }
      if (PRIMITIVES.containsKey(str1))
        localObject1 = create((Type)PRIMITIVES.get(str1));
      while (true)
      {
        Iterator localIterator3 = paramJsonNode.getFieldNames();
        while (localIterator3.hasNext())
        {
          String str8 = (String)localIterator3.next();
          String str9 = paramJsonNode.get(str8).getTextValue();
          if ((!SCHEMA_RESERVED.contains(str8)) && (str9 != null))
            ((Schema)localObject1).addProp(str8, str9);
        }
        if ((str1.equals("record")) || (str1.equals("error")))
        {
          ArrayList localArrayList = new ArrayList();
          boolean bool1 = str1.equals("error");
          localObject1 = new RecordSchema(localName, str3, bool1);
          if (localName != null)
            paramNames.add((Schema)localObject1);
          JsonNode localJsonNode1 = paramJsonNode.get("fields");
          if ((localJsonNode1 == null) || (!localJsonNode1.isArray()))
            throw new SchemaParseException("Record has no fields: " + paramJsonNode);
          Iterator localIterator2 = localJsonNode1.iterator();
          while (localIterator2.hasNext())
          {
            JsonNode localJsonNode2 = (JsonNode)localIterator2.next();
            String str10 = getRequiredText(localJsonNode2, "name", "No field name");
            String str11 = getOptionalText(localJsonNode2, "doc");
            JsonNode localJsonNode3 = localJsonNode2.get("type");
            if (localJsonNode3 == null)
              throw new SchemaParseException("No field type: " + localJsonNode2);
            if ((localJsonNode3.isTextual()) && (paramNames.get(localJsonNode3.getTextValue()) == null))
              throw new SchemaParseException(localJsonNode3 + " is not a defined name." + " The type of the \"" + str10 + "\" field must be" + " a defined name or a {\"type\": ...} expression.");
            Schema localSchema1 = parse(localJsonNode3, paramNames);
            Schema.Field.Order localOrder = Schema.Field.Order.ASCENDING;
            JsonNode localJsonNode4 = localJsonNode2.get("order");
            if (localJsonNode4 != null)
              localOrder = Schema.Field.Order.valueOf(localJsonNode4.getTextValue().toUpperCase());
            Object localObject2 = localJsonNode2.get("default");
            if ((localObject2 != null) && ((Type.FLOAT.equals(localSchema1.getType())) || (Type.DOUBLE.equals(localSchema1.getType()))) && (((JsonNode)localObject2).isTextual()))
              localObject2 = new DoubleNode(Double.valueOf(((JsonNode)localObject2).getTextValue()).doubleValue());
            Field localField = new Field(str10, localSchema1, str11, (JsonNode)localObject2, localOrder);
            Iterator localIterator5 = localJsonNode2.getFieldNames();
            while (localIterator5.hasNext())
            {
              String str12 = (String)localIterator5.next();
              String str13 = localJsonNode2.get(str12).getTextValue();
              if ((!FIELD_RESERVED.contains(str12)) && (str13 != null))
                localField.addProp(str12, str13);
            }
            Field.access$1302(localField, parseAliases(localJsonNode2));
            localArrayList.add(localField);
          }
          ((Schema)localObject1).setFields(localArrayList);
        }
        else if (str1.equals("enum"))
        {
          JsonNode localJsonNode8 = paramJsonNode.get("symbols");
          if ((localJsonNode8 == null) || (!localJsonNode8.isArray()))
            throw new SchemaParseException("Enum has no symbols: " + paramJsonNode);
          LockableArrayList localLockableArrayList2 = new LockableArrayList();
          Iterator localIterator6 = localJsonNode8.iterator();
          while (localIterator6.hasNext())
            localLockableArrayList2.add(((JsonNode)localIterator6.next()).getTextValue());
          localObject1 = new EnumSchema(localName, str3, localLockableArrayList2);
          if (localName != null)
            paramNames.add((Schema)localObject1);
        }
        else if (str1.equals("array"))
        {
          JsonNode localJsonNode7 = paramJsonNode.get("items");
          if (localJsonNode7 == null)
            throw new SchemaParseException("Array has no items type: " + paramJsonNode);
          Schema localSchema3 = parse(localJsonNode7, paramNames);
          localObject1 = new ArraySchema(localSchema3);
        }
        else if (str1.equals("map"))
        {
          JsonNode localJsonNode6 = paramJsonNode.get("values");
          if (localJsonNode6 == null)
            throw new SchemaParseException("Map has no values type: " + paramJsonNode);
          Schema localSchema2 = parse(localJsonNode6, paramNames);
          localObject1 = new MapSchema(localSchema2);
        }
        else
        {
          if (!str1.equals("fixed"))
            break;
          JsonNode localJsonNode5 = paramJsonNode.get("size");
          if ((localJsonNode5 == null) || (!localJsonNode5.isInt()))
            throw new SchemaParseException("Invalid or no size: " + paramJsonNode);
          int i = localJsonNode5.getIntValue();
          localObject1 = new FixedSchema(localName, str3, i);
          if (localName != null)
            paramNames.add((Schema)localObject1);
        }
      }
      throw new SchemaParseException("Type not supported: " + str1);
      if (str6 != null)
        paramNames.space(str6);
      if ((localObject1 instanceof NamedSchema))
      {
        Set localSet = parseAliases(paramJsonNode);
        if (localSet != null)
        {
          Iterator localIterator4 = localSet.iterator();
          while (localIterator4.hasNext())
          {
            String str7 = (String)localIterator4.next();
            ((Schema)localObject1).addAlias(str7);
          }
        }
      }
    }
    else
    {
      if (!paramJsonNode.isArray())
        break label1369;
      LockableArrayList localLockableArrayList1 = new LockableArrayList(paramJsonNode.size());
      Iterator localIterator1 = paramJsonNode.iterator();
      while (localIterator1.hasNext())
        localLockableArrayList1.add(parse((JsonNode)localIterator1.next(), paramNames));
      localObject1 = new UnionSchema(localLockableArrayList1);
    }
    return localObject1;
    label1369: throw new SchemaParseException("Schema not yet supported: " + paramJsonNode);
  }

  public static Schema parse(File paramFile)
    throws IOException
  {
    return new Parser().parse(paramFile);
  }

  public static Schema parse(InputStream paramInputStream)
    throws IOException
  {
    return new Parser().parse(paramInputStream);
  }

  public static Schema parse(String paramString)
  {
    return new Parser().parse(paramString);
  }

  public static Schema parse(String paramString, boolean paramBoolean)
  {
    return new Parser().setValidate(paramBoolean).parse(paramString);
  }

  private static Set<String> parseAliases(JsonNode paramJsonNode)
  {
    JsonNode localJsonNode1 = paramJsonNode.get("aliases");
    Object localObject;
    if (localJsonNode1 == null)
      localObject = null;
    while (true)
    {
      return localObject;
      if (!localJsonNode1.isArray())
        throw new SchemaParseException("aliases not an array: " + paramJsonNode);
      localObject = new LinkedHashSet();
      Iterator localIterator = localJsonNode1.iterator();
      while (localIterator.hasNext())
      {
        JsonNode localJsonNode2 = (JsonNode)localIterator.next();
        if (!localJsonNode2.isTextual())
          throw new SchemaParseException("alias not a string: " + localJsonNode2);
        ((Set)localObject).add(localJsonNode2.getTextValue());
      }
    }
  }

  static JsonNode parseJson(String paramString)
  {
    try
    {
      JsonNode localJsonNode = MAPPER.readTree(FACTORY.createJsonParser(new StringReader(paramString)));
      return localJsonNode;
    }
    catch (JsonParseException localJsonParseException)
    {
      throw new RuntimeException(localJsonParseException);
    }
    catch (IOException localIOException)
    {
      throw new RuntimeException(localIOException);
    }
  }

  private static String validateName(String paramString)
  {
    if (!((Boolean)validateNames.get()).booleanValue());
    while (true)
    {
      return paramString;
      int i = paramString.length();
      if (i == 0)
        throw new SchemaParseException("Empty name");
      char c1 = paramString.charAt(0);
      if ((!Character.isLetter(c1)) && (c1 != '_'))
        throw new SchemaParseException("Illegal initial character: " + paramString);
      for (int j = 1; j < i; j++)
      {
        char c2 = paramString.charAt(j);
        if ((!Character.isLetterOrDigit(c2)) && (c2 != '_'))
          throw new SchemaParseException("Illegal character in: " + paramString);
      }
    }
  }

  public void addAlias(String paramString)
  {
    throw new AvroRuntimeException("Not a named type: " + this);
  }

  public void addProp(String paramString1, String paramString2)
  {
    try
    {
      this.props.add(paramString1, paramString2);
      this.hashCode = -2147483648;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  int computeHash()
  {
    return getType().hashCode() + this.props.hashCode();
  }

  final boolean equalCachedHash(Schema paramSchema)
  {
    return (this.hashCode == paramSchema.hashCode) || (this.hashCode == -2147483648) || (paramSchema.hashCode == -2147483648);
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    Schema localSchema;
    do
    {
      return true;
      if (!(paramObject instanceof Schema))
        return false;
      localSchema = (Schema)paramObject;
      if (this.type != localSchema.type)
        return false;
    }
    while ((equalCachedHash(localSchema)) && (this.props.equals(localSchema.props)));
    return false;
  }

  void fieldsToJson(Names paramNames, JsonGenerator paramJsonGenerator)
    throws IOException
  {
    throw new AvroRuntimeException("Not a record: " + this);
  }

  public Set<String> getAliases()
  {
    throw new AvroRuntimeException("Not a named type: " + this);
  }

  public String getDoc()
  {
    return null;
  }

  public Schema getElementType()
  {
    throw new AvroRuntimeException("Not an array: " + this);
  }

  public int getEnumOrdinal(String paramString)
  {
    throw new AvroRuntimeException("Not an enum: " + this);
  }

  public List<String> getEnumSymbols()
  {
    throw new AvroRuntimeException("Not an enum: " + this);
  }

  public Field getField(String paramString)
  {
    throw new AvroRuntimeException("Not a record: " + this);
  }

  public List<Field> getFields()
  {
    throw new AvroRuntimeException("Not a record: " + this);
  }

  public int getFixedSize()
  {
    throw new AvroRuntimeException("Not fixed: " + this);
  }

  public String getFullName()
  {
    return getName();
  }

  public Integer getIndexNamed(String paramString)
  {
    throw new AvroRuntimeException("Not a union: " + this);
  }

  public String getName()
  {
    return this.type.name;
  }

  public String getNamespace()
  {
    throw new AvroRuntimeException("Not a named type: " + this);
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

  public Type getType()
  {
    return this.type;
  }

  public List<Schema> getTypes()
  {
    throw new AvroRuntimeException("Not a union: " + this);
  }

  public Schema getValueType()
  {
    throw new AvroRuntimeException("Not a map: " + this);
  }

  public boolean hasEnumSymbol(String paramString)
  {
    throw new AvroRuntimeException("Not an enum: " + this);
  }

  public final int hashCode()
  {
    if (this.hashCode == -2147483648)
      this.hashCode = computeHash();
    return this.hashCode;
  }

  public boolean isError()
  {
    throw new AvroRuntimeException("Not a record: " + this);
  }

  public void setFields(List<Field> paramList)
  {
    throw new AvroRuntimeException("Not a record: " + this);
  }

  void toJson(Names paramNames, JsonGenerator paramJsonGenerator)
    throws IOException
  {
    if (this.props.size() == 0)
    {
      paramJsonGenerator.writeString(getName());
      return;
    }
    paramJsonGenerator.writeStartObject();
    paramJsonGenerator.writeStringField("type", getName());
    this.props.write(paramJsonGenerator);
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
      JsonGenerator localJsonGenerator = FACTORY.createJsonGenerator(localStringWriter);
      if (paramBoolean)
        localJsonGenerator.useDefaultPrettyPrinter();
      toJson(new Names(), localJsonGenerator);
      localJsonGenerator.flush();
      String str = localStringWriter.toString();
      return str;
    }
    catch (IOException localIOException)
    {
      throw new AvroRuntimeException(localIOException);
    }
  }

  private static class ArraySchema extends Schema
  {
    private final Schema elementType;

    public ArraySchema(Schema paramSchema)
    {
      super();
      this.elementType = paramSchema;
    }

    int computeHash()
    {
      return super.computeHash() + this.elementType.computeHash();
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      ArraySchema localArraySchema;
      do
      {
        return true;
        if (!(paramObject instanceof ArraySchema))
          return false;
        localArraySchema = (ArraySchema)paramObject;
      }
      while ((equalCachedHash(localArraySchema)) && (this.elementType.equals(localArraySchema.elementType)) && (this.props.equals(localArraySchema.props)));
      return false;
    }

    public Schema getElementType()
    {
      return this.elementType;
    }

    void toJson(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      paramJsonGenerator.writeStartObject();
      paramJsonGenerator.writeStringField("type", "array");
      paramJsonGenerator.writeFieldName("items");
      this.elementType.toJson(paramNames, paramJsonGenerator);
      this.props.write(paramJsonGenerator);
      paramJsonGenerator.writeEndObject();
    }
  }

  private static class BooleanSchema extends Schema
  {
    public BooleanSchema()
    {
      super();
    }
  }

  private static class BytesSchema extends Schema
  {
    public BytesSchema()
    {
      super();
    }
  }

  private static class DoubleSchema extends Schema
  {
    public DoubleSchema()
    {
      super();
    }
  }

  private static class EnumSchema extends Schema.NamedSchema
  {
    private final Map<String, Integer> ordinals;
    private final List<String> symbols;

    public EnumSchema(Schema.Name paramName, String paramString, Schema.LockableArrayList<String> paramLockableArrayList)
    {
      super(paramName, paramString);
      this.symbols = paramLockableArrayList.lock();
      this.ordinals = new HashMap();
      int i = 0;
      Iterator localIterator = paramLockableArrayList.iterator();
      while (localIterator.hasNext())
      {
        String str1 = (String)localIterator.next();
        Map localMap = this.ordinals;
        String str2 = Schema.validateName(str1);
        int j = i + 1;
        if (localMap.put(str2, Integer.valueOf(i)) != null)
          throw new SchemaParseException("Duplicate enum symbol: " + str1);
        i = j;
      }
    }

    int computeHash()
    {
      return super.computeHash() + this.symbols.hashCode();
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      EnumSchema localEnumSchema;
      do
      {
        return true;
        if (!(paramObject instanceof EnumSchema))
          return false;
        localEnumSchema = (EnumSchema)paramObject;
      }
      while ((equalCachedHash(localEnumSchema)) && (equalNames(localEnumSchema)) && (this.symbols.equals(localEnumSchema.symbols)) && (this.props.equals(localEnumSchema.props)));
      return false;
    }

    public int getEnumOrdinal(String paramString)
    {
      return ((Integer)this.ordinals.get(paramString)).intValue();
    }

    public List<String> getEnumSymbols()
    {
      return this.symbols;
    }

    public boolean hasEnumSymbol(String paramString)
    {
      return this.ordinals.containsKey(paramString);
    }

    void toJson(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      if (writeNameRef(paramNames, paramJsonGenerator))
        return;
      paramJsonGenerator.writeStartObject();
      paramJsonGenerator.writeStringField("type", "enum");
      writeName(paramNames, paramJsonGenerator);
      if (getDoc() != null)
        paramJsonGenerator.writeStringField("doc", getDoc());
      paramJsonGenerator.writeArrayFieldStart("symbols");
      Iterator localIterator = this.symbols.iterator();
      while (localIterator.hasNext())
        paramJsonGenerator.writeString((String)localIterator.next());
      paramJsonGenerator.writeEndArray();
      this.props.write(paramJsonGenerator);
      aliasesToJson(paramJsonGenerator);
      paramJsonGenerator.writeEndObject();
    }
  }

  public static class Field
  {
    private Set<String> aliases;
    private final JsonNode defaultValue;
    private final String doc;
    private final String name;
    private final Order order;
    private transient int position = -1;
    private final Schema.Props props = new Schema.Props(Schema.FIELD_RESERVED);
    private final Schema schema;

    public Field(String paramString1, Schema paramSchema, String paramString2, JsonNode paramJsonNode)
    {
      this(paramString1, paramSchema, paramString2, paramJsonNode, Order.ASCENDING);
    }

    public Field(String paramString1, Schema paramSchema, String paramString2, JsonNode paramJsonNode, Order paramOrder)
    {
      this.name = Schema.validateName(paramString1);
      this.schema = paramSchema;
      this.doc = paramString2;
      this.defaultValue = paramJsonNode;
      this.order = paramOrder;
    }

    private boolean defaultValueEquals(JsonNode paramJsonNode)
    {
      if (this.defaultValue == null)
        return paramJsonNode == null;
      if (Double.isNaN(this.defaultValue.getValueAsDouble()))
        return Double.isNaN(paramJsonNode.getValueAsDouble());
      return this.defaultValue.equals(paramJsonNode);
    }

    public void addAlias(String paramString)
    {
      if (this.aliases == null)
        this.aliases = new LinkedHashSet();
      this.aliases.add(paramString);
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

    public Set<String> aliases()
    {
      if (this.aliases == null)
        return Collections.emptySet();
      return Collections.unmodifiableSet(this.aliases);
    }

    public JsonNode defaultValue()
    {
      return this.defaultValue;
    }

    public String doc()
    {
      return this.doc;
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      Field localField;
      do
      {
        return true;
        if (!(paramObject instanceof Field))
          return false;
        localField = (Field)paramObject;
      }
      while ((this.name.equals(localField.name)) && (this.schema.equals(localField.schema)) && (defaultValueEquals(localField.defaultValue)) && (this.props.equals(localField.props)));
      return false;
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

    public int hashCode()
    {
      return this.name.hashCode() + this.schema.computeHash();
    }

    public String name()
    {
      return this.name;
    }

    public Order order()
    {
      return this.order;
    }

    public int pos()
    {
      return this.position;
    }

    public Map<String, String> props()
    {
      return Collections.unmodifiableMap(this.props);
    }

    public Schema schema()
    {
      return this.schema;
    }

    public String toString()
    {
      return this.name + " type:" + this.schema.type + " pos:" + this.position;
    }

    public static enum Order
    {
      private String name = name().toLowerCase();

      static
      {
        Order[] arrayOfOrder = new Order[3];
        arrayOfOrder[0] = ASCENDING;
        arrayOfOrder[1] = DESCENDING;
        arrayOfOrder[2] = IGNORE;
      }
    }
  }

  private static class FixedSchema extends Schema.NamedSchema
  {
    private final int size;

    public FixedSchema(Schema.Name paramName, String paramString, int paramInt)
    {
      super(paramName, paramString);
      if (paramInt < 0)
        throw new IllegalArgumentException("Invalid fixed size: " + paramInt);
      this.size = paramInt;
    }

    int computeHash()
    {
      return super.computeHash() + this.size;
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      FixedSchema localFixedSchema;
      do
      {
        return true;
        if (!(paramObject instanceof FixedSchema))
          return false;
        localFixedSchema = (FixedSchema)paramObject;
      }
      while ((equalCachedHash(localFixedSchema)) && (equalNames(localFixedSchema)) && (this.size == localFixedSchema.size) && (this.props.equals(localFixedSchema.props)));
      return false;
    }

    public int getFixedSize()
    {
      return this.size;
    }

    void toJson(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      if (writeNameRef(paramNames, paramJsonGenerator))
        return;
      paramJsonGenerator.writeStartObject();
      paramJsonGenerator.writeStringField("type", "fixed");
      writeName(paramNames, paramJsonGenerator);
      if (getDoc() != null)
        paramJsonGenerator.writeStringField("doc", getDoc());
      paramJsonGenerator.writeNumberField("size", this.size);
      this.props.write(paramJsonGenerator);
      aliasesToJson(paramJsonGenerator);
      paramJsonGenerator.writeEndObject();
    }
  }

  private static class FloatSchema extends Schema
  {
    public FloatSchema()
    {
      super();
    }
  }

  private static class IntSchema extends Schema
  {
    public IntSchema()
    {
      super();
    }
  }

  static class LockableArrayList<E> extends ArrayList<E>
  {
    private static final long serialVersionUID = 1L;
    private boolean locked = false;

    public LockableArrayList()
    {
    }

    public LockableArrayList(int paramInt)
    {
      super();
    }

    public LockableArrayList(List<E> paramList)
    {
      super();
    }

    private void ensureUnlocked()
    {
      if (this.locked)
        throw new IllegalStateException();
    }

    public boolean add(E paramE)
    {
      ensureUnlocked();
      return super.add(paramE);
    }

    public boolean addAll(int paramInt, Collection<? extends E> paramCollection)
    {
      ensureUnlocked();
      return super.addAll(paramInt, paramCollection);
    }

    public boolean addAll(Collection<? extends E> paramCollection)
    {
      ensureUnlocked();
      return super.addAll(paramCollection);
    }

    public void clear()
    {
      ensureUnlocked();
      super.clear();
    }

    public List<E> lock()
    {
      this.locked = true;
      return this;
    }

    public E remove(int paramInt)
    {
      ensureUnlocked();
      return super.remove(paramInt);
    }

    public boolean remove(Object paramObject)
    {
      ensureUnlocked();
      return super.remove(paramObject);
    }

    public boolean removeAll(Collection<?> paramCollection)
    {
      ensureUnlocked();
      return super.removeAll(paramCollection);
    }

    public boolean retainAll(Collection<?> paramCollection)
    {
      ensureUnlocked();
      return super.retainAll(paramCollection);
    }
  }

  private static class LongSchema extends Schema
  {
    public LongSchema()
    {
      super();
    }
  }

  private static class MapSchema extends Schema
  {
    private final Schema valueType;

    public MapSchema(Schema paramSchema)
    {
      super();
      this.valueType = paramSchema;
    }

    int computeHash()
    {
      return super.computeHash() + this.valueType.computeHash();
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      MapSchema localMapSchema;
      do
      {
        return true;
        if (!(paramObject instanceof MapSchema))
          return false;
        localMapSchema = (MapSchema)paramObject;
      }
      while ((equalCachedHash(localMapSchema)) && (this.valueType.equals(localMapSchema.valueType)) && (this.props.equals(localMapSchema.props)));
      return false;
    }

    public Schema getValueType()
    {
      return this.valueType;
    }

    void toJson(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      paramJsonGenerator.writeStartObject();
      paramJsonGenerator.writeStringField("type", "map");
      paramJsonGenerator.writeFieldName("values");
      this.valueType.toJson(paramNames, paramJsonGenerator);
      this.props.write(paramJsonGenerator);
      paramJsonGenerator.writeEndObject();
    }
  }

  private static class Name
  {
    private final String full;
    private final String name;
    private final String space;

    public Name(String paramString1, String paramString2)
    {
      if (paramString1 == null)
      {
        this.full = null;
        this.space = null;
        this.name = null;
        return;
      }
      int i = paramString1.lastIndexOf('.');
      if (i < 0)
      {
        this.space = paramString2;
        this.name = Schema.validateName(paramString1);
        if (this.space != null)
          break label99;
      }
      label99: for (String str = this.name; ; str = this.space + "." + this.name)
      {
        this.full = str;
        return;
        this.space = paramString1.substring(0, i);
        this.name = Schema.validateName(paramString1.substring(i + 1, paramString1.length()));
        break;
      }
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      Name localName;
      do
      {
        return true;
        if (!(paramObject instanceof Name))
          return false;
        localName = (Name)paramObject;
        if (this.full != null)
          break;
      }
      while (localName.full == null);
      return false;
      return this.full.equals(localName.full);
    }

    public String getQualified(String paramString)
    {
      if ((this.space == null) || (this.space.equals(paramString)))
        return this.name;
      return this.full;
    }

    public int hashCode()
    {
      if (this.full == null)
        return 0;
      return this.full.hashCode();
    }

    public String toString()
    {
      return this.full;
    }

    public void writeName(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      if (this.name != null)
        paramJsonGenerator.writeStringField("name", this.name);
      if (this.space != null)
      {
        if (!this.space.equals(paramNames.space()))
          paramJsonGenerator.writeStringField("namespace", this.space);
        if (paramNames.space() == null)
          paramNames.space(this.space);
      }
    }
  }

  private static abstract class NamedSchema extends Schema
  {
    Set<Schema.Name> aliases;
    final String doc;
    final Schema.Name name;

    public NamedSchema(Schema.Type paramType, Schema.Name paramName, String paramString)
    {
      super();
      this.name = paramName;
      this.doc = paramString;
      if (PRIMITIVES.containsKey(paramName.full))
        throw new AvroTypeException("Schemas may not be named after primitives: " + paramName.full);
    }

    public void addAlias(String paramString)
    {
      if (this.aliases == null)
        this.aliases = new LinkedHashSet();
      this.aliases.add(new Schema.Name(paramString, this.name.space));
    }

    public void aliasesToJson(JsonGenerator paramJsonGenerator)
      throws IOException
    {
      if ((this.aliases == null) || (this.aliases.size() == 0))
        return;
      paramJsonGenerator.writeFieldName("aliases");
      paramJsonGenerator.writeStartArray();
      Iterator localIterator = this.aliases.iterator();
      while (localIterator.hasNext())
        paramJsonGenerator.writeString(((Schema.Name)localIterator.next()).getQualified(this.name.space));
      paramJsonGenerator.writeEndArray();
    }

    int computeHash()
    {
      return super.computeHash() + this.name.hashCode();
    }

    public boolean equalNames(NamedSchema paramNamedSchema)
    {
      return this.name.equals(paramNamedSchema.name);
    }

    public Set<String> getAliases()
    {
      LinkedHashSet localLinkedHashSet = new LinkedHashSet();
      if (this.aliases != null)
      {
        Iterator localIterator = this.aliases.iterator();
        while (localIterator.hasNext())
          localLinkedHashSet.add(((Schema.Name)localIterator.next()).full);
      }
      return localLinkedHashSet;
    }

    public String getDoc()
    {
      return this.doc;
    }

    public String getFullName()
    {
      return this.name.full;
    }

    public String getName()
    {
      return this.name.name;
    }

    public String getNamespace()
    {
      return this.name.space;
    }

    public void writeName(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      this.name.writeName(paramNames, paramJsonGenerator);
    }

    public boolean writeNameRef(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      if (equals(paramNames.get(this.name)))
      {
        paramJsonGenerator.writeString(this.name.getQualified(paramNames.space()));
        return true;
      }
      if (this.name.name != null)
        paramNames.put(this.name, this);
      return false;
    }
  }

  static class Names extends LinkedHashMap<Schema.Name, Schema>
  {
    private String space;

    public Names()
    {
    }

    public Names(String paramString)
    {
      this.space = paramString;
    }

    public void add(Schema paramSchema)
    {
      put(((Schema.NamedSchema)paramSchema).name, paramSchema);
    }

    public boolean contains(Schema paramSchema)
    {
      return get(((Schema.NamedSchema)paramSchema).name) != null;
    }

    public Schema get(Object paramObject)
    {
      if ((paramObject instanceof String))
      {
        Schema.Type localType = (Schema.Type)Schema.PRIMITIVES.get((String)paramObject);
        if (localType != null)
          return Schema.create(localType);
      }
      for (Schema.Name localName = new Schema.Name((String)paramObject, this.space); ; localName = (Schema.Name)paramObject)
        return (Schema)super.get(localName);
    }

    public Schema put(Schema.Name paramName, Schema paramSchema)
    {
      if (containsKey(paramName))
        throw new SchemaParseException("Can't redefine: " + paramName);
      return (Schema)super.put(paramName, paramSchema);
    }

    public String space()
    {
      return this.space;
    }

    public void space(String paramString)
    {
      this.space = paramString;
    }
  }

  private static class NullSchema extends Schema
  {
    public NullSchema()
    {
      super();
    }
  }

  public static class Parser
  {
    private Schema.Names names = new Schema.Names();
    private boolean validate = true;

    private Schema parse(JsonParser paramJsonParser)
      throws IOException
    {
      boolean bool = ((Boolean)Schema.validateNames.get()).booleanValue();
      try
      {
        Schema.validateNames.set(Boolean.valueOf(this.validate));
        Schema localSchema = Schema.parse(Schema.MAPPER.readTree(paramJsonParser), this.names);
        return localSchema;
      }
      catch (JsonParseException localJsonParseException)
      {
        throw new SchemaParseException(localJsonParseException);
      }
      finally
      {
        Schema.validateNames.set(Boolean.valueOf(bool));
      }
    }

    public Parser addTypes(Map<String, Schema> paramMap)
    {
      Iterator localIterator = paramMap.values().iterator();
      while (localIterator.hasNext())
      {
        Schema localSchema = (Schema)localIterator.next();
        this.names.add(localSchema);
      }
      return this;
    }

    public Map<String, Schema> getTypes()
    {
      LinkedHashMap localLinkedHashMap = new LinkedHashMap();
      Iterator localIterator = this.names.values().iterator();
      while (localIterator.hasNext())
      {
        Schema localSchema = (Schema)localIterator.next();
        localLinkedHashMap.put(localSchema.getFullName(), localSchema);
      }
      return localLinkedHashMap;
    }

    public boolean getValidate()
    {
      return this.validate;
    }

    public Schema parse(File paramFile)
      throws IOException
    {
      return parse(Schema.FACTORY.createJsonParser(paramFile));
    }

    public Schema parse(InputStream paramInputStream)
      throws IOException
    {
      return parse(Schema.FACTORY.createJsonParser(paramInputStream));
    }

    public Schema parse(String paramString)
    {
      try
      {
        Schema localSchema = parse(Schema.FACTORY.createJsonParser(new StringReader(paramString)));
        return localSchema;
      }
      catch (IOException localIOException)
      {
        throw new SchemaParseException(localIOException);
      }
    }

    public Parser setValidate(boolean paramBoolean)
    {
      this.validate = paramBoolean;
      return this;
    }
  }

  static final class Props extends LinkedHashMap<String, String>
  {
    private Set<String> reserved;

    public Props(Set<String> paramSet)
    {
      super();
      this.reserved = paramSet;
    }

    public void add(String paramString1, String paramString2)
    {
      if (this.reserved.contains(paramString1))
        throw new AvroRuntimeException("Can't set reserved property: " + paramString1);
      if (paramString2 == null)
        throw new AvroRuntimeException("Can't set a property to null: " + paramString1);
      String str = (String)get(paramString1);
      if (str == null)
        put(paramString1, paramString2);
      while (str.equals(paramString2))
        return;
      throw new AvroRuntimeException("Can't overwrite property: " + paramString1);
    }

    public void write(JsonGenerator paramJsonGenerator)
      throws IOException
    {
      Iterator localIterator = entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        paramJsonGenerator.writeStringField((String)localEntry.getKey(), (String)localEntry.getValue());
      }
    }
  }

  private static class RecordSchema extends Schema.NamedSchema
  {
    private Map<String, Schema.Field> fieldMap;
    private List<Schema.Field> fields;
    private final boolean isError;

    public RecordSchema(Schema.Name paramName, String paramString, boolean paramBoolean)
    {
      super(paramName, paramString);
      this.isError = paramBoolean;
    }

    int computeHash()
    {
      Map localMap = (Map)Schema.SEEN_HASHCODE.get();
      int k;
      if (localMap.containsKey(this))
        k = 0;
      while (true)
      {
        return k;
        boolean bool = localMap.isEmpty();
        try
        {
          localMap.put(this, this);
          int i = super.computeHash();
          int j = this.fields.hashCode();
          k = i + j;
          return k;
        }
        finally
        {
          if (bool)
            localMap.clear();
        }
      }
    }

    public boolean equals(Object paramObject)
    {
      boolean bool1 = true;
      if (paramObject == this);
      while (true)
      {
        return bool1;
        if (!(paramObject instanceof RecordSchema))
          return false;
        RecordSchema localRecordSchema = (RecordSchema)paramObject;
        if (!equalCachedHash(localRecordSchema))
          return false;
        if (!equalNames(localRecordSchema))
          return false;
        if (!this.props.equals(localRecordSchema.props))
          return false;
        Set localSet = (Set)Schema.SEEN_EQUALS.get();
        Schema.SeenPair localSeenPair = new Schema.SeenPair(this, paramObject, null);
        if (localSet.contains(localSeenPair))
          continue;
        boolean bool2 = localSet.isEmpty();
        try
        {
          localSet.add(localSeenPair);
          boolean bool3 = this.fields.equals(((RecordSchema)paramObject).fields);
          bool1 = bool3;
          return bool1;
        }
        finally
        {
          if (bool2)
            localSet.clear();
        }
      }
    }

    void fieldsToJson(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      paramJsonGenerator.writeStartArray();
      Iterator localIterator1 = this.fields.iterator();
      while (localIterator1.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator1.next();
        paramJsonGenerator.writeStartObject();
        paramJsonGenerator.writeStringField("name", localField.name());
        paramJsonGenerator.writeFieldName("type");
        localField.schema().toJson(paramNames, paramJsonGenerator);
        if (localField.doc() != null)
          paramJsonGenerator.writeStringField("doc", localField.doc());
        if (localField.defaultValue() != null)
        {
          paramJsonGenerator.writeFieldName("default");
          paramJsonGenerator.writeTree(localField.defaultValue());
        }
        if (localField.order() != Schema.Field.Order.ASCENDING)
          paramJsonGenerator.writeStringField("order", localField.order().name);
        if ((localField.aliases != null) && (localField.aliases.size() != 0))
        {
          paramJsonGenerator.writeFieldName("aliases");
          paramJsonGenerator.writeStartArray();
          Iterator localIterator2 = localField.aliases.iterator();
          while (localIterator2.hasNext())
            paramJsonGenerator.writeString((String)localIterator2.next());
          paramJsonGenerator.writeEndArray();
        }
        localField.props.write(paramJsonGenerator);
        paramJsonGenerator.writeEndObject();
      }
      paramJsonGenerator.writeEndArray();
    }

    public Schema.Field getField(String paramString)
    {
      if (this.fieldMap == null)
        throw new AvroRuntimeException("Schema fields not set yet");
      return (Schema.Field)this.fieldMap.get(paramString);
    }

    public List<Schema.Field> getFields()
    {
      if (this.fields == null)
        throw new AvroRuntimeException("Schema fields not set yet");
      return this.fields;
    }

    public boolean isError()
    {
      return this.isError;
    }

    public void setFields(List<Schema.Field> paramList)
    {
      if (this.fields != null)
        throw new AvroRuntimeException("Fields are already set");
      int i = 0;
      this.fieldMap = new HashMap();
      Schema.LockableArrayList localLockableArrayList = new Schema.LockableArrayList();
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        Schema.Field localField = (Schema.Field)localIterator.next();
        if (localField.position != -1)
          throw new AvroRuntimeException("Field already used: " + localField);
        int j = i + 1;
        Schema.Field.access$702(localField, i);
        this.fieldMap.put(localField.name(), localField);
        localLockableArrayList.add(localField);
        i = j;
      }
      this.fields = localLockableArrayList.lock();
      this.hashCode = -2147483648;
    }

    void toJson(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      if (writeNameRef(paramNames, paramJsonGenerator))
        return;
      String str1 = paramNames.space;
      paramJsonGenerator.writeStartObject();
      if (this.isError);
      for (String str2 = "error"; ; str2 = "record")
      {
        paramJsonGenerator.writeStringField("type", str2);
        writeName(paramNames, paramJsonGenerator);
        Schema.Names.access$1102(paramNames, this.name.space);
        if (getDoc() != null)
          paramJsonGenerator.writeStringField("doc", getDoc());
        paramJsonGenerator.writeFieldName("fields");
        fieldsToJson(paramNames, paramJsonGenerator);
        this.props.write(paramJsonGenerator);
        aliasesToJson(paramJsonGenerator);
        paramJsonGenerator.writeEndObject();
        Schema.Names.access$1102(paramNames, str1);
        return;
      }
    }
  }

  private static class SeenPair
  {
    private Object s1;
    private Object s2;

    private SeenPair(Object paramObject1, Object paramObject2)
    {
      this.s1 = paramObject1;
      this.s2 = paramObject2;
    }

    public boolean equals(Object paramObject)
    {
      return (this.s1 == ((SeenPair)paramObject).s1) && (this.s2 == ((SeenPair)paramObject).s2);
    }

    public int hashCode()
    {
      return System.identityHashCode(this.s1) + System.identityHashCode(this.s2);
    }
  }

  private static class StringSchema extends Schema
  {
    public StringSchema()
    {
      super();
    }
  }

  public static enum Type
  {
    private String name = name().toLowerCase();

    static
    {
      ENUM = new Type("ENUM", 1);
      ARRAY = new Type("ARRAY", 2);
      MAP = new Type("MAP", 3);
      UNION = new Type("UNION", 4);
      FIXED = new Type("FIXED", 5);
      STRING = new Type("STRING", 6);
      BYTES = new Type("BYTES", 7);
      INT = new Type("INT", 8);
      LONG = new Type("LONG", 9);
      FLOAT = new Type("FLOAT", 10);
      DOUBLE = new Type("DOUBLE", 11);
      BOOLEAN = new Type("BOOLEAN", 12);
      NULL = new Type("NULL", 13);
      Type[] arrayOfType = new Type[14];
      arrayOfType[0] = RECORD;
      arrayOfType[1] = ENUM;
      arrayOfType[2] = ARRAY;
      arrayOfType[3] = MAP;
      arrayOfType[4] = UNION;
      arrayOfType[5] = FIXED;
      arrayOfType[6] = STRING;
      arrayOfType[7] = BYTES;
      arrayOfType[8] = INT;
      arrayOfType[9] = LONG;
      arrayOfType[10] = FLOAT;
      arrayOfType[11] = DOUBLE;
      arrayOfType[12] = BOOLEAN;
      arrayOfType[13] = NULL;
    }

    public String getName()
    {
      return this.name;
    }
  }

  private static class UnionSchema extends Schema
  {
    private final Map<String, Integer> indexByName = new HashMap();
    private final List<Schema> types;

    public UnionSchema(Schema.LockableArrayList<Schema> paramLockableArrayList)
    {
      super();
      this.types = paramLockableArrayList.lock();
      int i = 0;
      Iterator localIterator = paramLockableArrayList.iterator();
      while (localIterator.hasNext())
      {
        Schema localSchema = (Schema)localIterator.next();
        if (localSchema.getType() == Schema.Type.UNION)
          throw new AvroRuntimeException("Nested union: " + this);
        String str = localSchema.getFullName();
        if (str == null)
          throw new AvroRuntimeException("Nameless in union:" + this);
        Map localMap = this.indexByName;
        int j = i + 1;
        if (localMap.put(str, Integer.valueOf(i)) != null)
          throw new AvroRuntimeException("Duplicate in union:" + str);
        i = j;
      }
    }

    public void addProp(String paramString1, String paramString2)
    {
      throw new AvroRuntimeException("Can't set properties on a union: " + this);
    }

    int computeHash()
    {
      int i = super.computeHash();
      Iterator localIterator = this.types.iterator();
      while (localIterator.hasNext())
        i += ((Schema)localIterator.next()).computeHash();
      return i;
    }

    public boolean equals(Object paramObject)
    {
      if (paramObject == this);
      UnionSchema localUnionSchema;
      do
      {
        return true;
        if (!(paramObject instanceof UnionSchema))
          return false;
        localUnionSchema = (UnionSchema)paramObject;
      }
      while ((equalCachedHash(localUnionSchema)) && (this.types.equals(localUnionSchema.types)) && (this.props.equals(localUnionSchema.props)));
      return false;
    }

    public Integer getIndexNamed(String paramString)
    {
      return (Integer)this.indexByName.get(paramString);
    }

    public List<Schema> getTypes()
    {
      return this.types;
    }

    void toJson(Schema.Names paramNames, JsonGenerator paramJsonGenerator)
      throws IOException
    {
      paramJsonGenerator.writeStartArray();
      Iterator localIterator = this.types.iterator();
      while (localIterator.hasNext())
        ((Schema)localIterator.next()).toJson(paramNames, paramJsonGenerator);
      paramJsonGenerator.writeEndArray();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.Schema
 * JD-Core Version:    0.6.2
 */