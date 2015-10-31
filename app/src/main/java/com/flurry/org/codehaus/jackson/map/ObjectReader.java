package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.FormatSchema;
import com.flurry.org.codehaus.jackson.JsonFactory;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParseException;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.ObjectCodec;
import com.flurry.org.codehaus.jackson.Version;
import com.flurry.org.codehaus.jackson.Versioned;
import com.flurry.org.codehaus.jackson.io.SerializedString;
import com.flurry.org.codehaus.jackson.map.deser.StdDeserializationContext;
import com.flurry.org.codehaus.jackson.map.type.SimpleType;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.node.JsonNodeFactory;
import com.flurry.org.codehaus.jackson.node.NullNode;
import com.flurry.org.codehaus.jackson.node.TreeTraversingParser;
import com.flurry.org.codehaus.jackson.type.JavaType;
import com.flurry.org.codehaus.jackson.type.TypeReference;
import com.flurry.org.codehaus.jackson.util.VersionUtil;
import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.lang.reflect.Type;
import java.net.URL;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;

public class ObjectReader extends ObjectCodec
  implements Versioned
{
  private static final JavaType JSON_NODE_TYPE = SimpleType.constructUnsafe(JsonNode.class);
  protected final DeserializationConfig _config;
  protected final InjectableValues _injectableValues;
  protected final JsonFactory _jsonFactory;
  protected final DeserializerProvider _provider;
  protected final ConcurrentHashMap<JavaType, JsonDeserializer<Object>> _rootDeserializers;
  protected final FormatSchema _schema;
  protected final boolean _unwrapRoot;
  protected final Object _valueToUpdate;
  protected final JavaType _valueType;

  protected ObjectReader(ObjectMapper paramObjectMapper, DeserializationConfig paramDeserializationConfig)
  {
    this(paramObjectMapper, paramDeserializationConfig, null, null, null, null);
  }

  protected ObjectReader(ObjectMapper paramObjectMapper, DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, Object paramObject, FormatSchema paramFormatSchema, InjectableValues paramInjectableValues)
  {
    this._config = paramDeserializationConfig;
    this._rootDeserializers = paramObjectMapper._rootDeserializers;
    this._provider = paramObjectMapper._deserializerProvider;
    this._jsonFactory = paramObjectMapper._jsonFactory;
    this._valueType = paramJavaType;
    this._valueToUpdate = paramObject;
    if ((paramObject != null) && (paramJavaType.isArrayType()))
      throw new IllegalArgumentException("Can not update an array value");
    this._schema = paramFormatSchema;
    this._injectableValues = paramInjectableValues;
    this._unwrapRoot = paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.UNWRAP_ROOT_VALUE);
  }

  protected ObjectReader(ObjectReader paramObjectReader, DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, Object paramObject, FormatSchema paramFormatSchema, InjectableValues paramInjectableValues)
  {
    this._config = paramDeserializationConfig;
    this._rootDeserializers = paramObjectReader._rootDeserializers;
    this._provider = paramObjectReader._provider;
    this._jsonFactory = paramObjectReader._jsonFactory;
    this._valueType = paramJavaType;
    this._valueToUpdate = paramObject;
    if ((paramObject != null) && (paramJavaType.isArrayType()))
      throw new IllegalArgumentException("Can not update an array value");
    this._schema = paramFormatSchema;
    this._injectableValues = paramInjectableValues;
    this._unwrapRoot = paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.UNWRAP_ROOT_VALUE);
  }

  protected static JsonToken _initForReading(JsonParser paramJsonParser)
    throws IOException, JsonParseException, JsonMappingException
  {
    JsonToken localJsonToken = paramJsonParser.getCurrentToken();
    if (localJsonToken == null)
    {
      localJsonToken = paramJsonParser.nextToken();
      if (localJsonToken == null)
        throw new EOFException("No content to map to Object due to end of input");
    }
    return localJsonToken;
  }

  protected Object _bind(JsonParser paramJsonParser)
    throws IOException, JsonParseException, JsonMappingException
  {
    JsonToken localJsonToken = _initForReading(paramJsonParser);
    Object localObject;
    if (localJsonToken == JsonToken.VALUE_NULL)
      if (this._valueToUpdate == null)
        localObject = _findRootDeserializer(this._config, this._valueType).getNullValue();
    while (true)
    {
      paramJsonParser.clearCurrentToken();
      return localObject;
      localObject = this._valueToUpdate;
      continue;
      if ((localJsonToken == JsonToken.END_ARRAY) || (localJsonToken == JsonToken.END_OBJECT))
      {
        localObject = this._valueToUpdate;
      }
      else
      {
        DeserializationContext localDeserializationContext = _createDeserializationContext(paramJsonParser, this._config);
        JsonDeserializer localJsonDeserializer = _findRootDeserializer(this._config, this._valueType);
        if (this._unwrapRoot)
        {
          localObject = _unwrapAndDeserialize(paramJsonParser, localDeserializationContext, this._valueType, localJsonDeserializer);
        }
        else if (this._valueToUpdate == null)
        {
          localObject = localJsonDeserializer.deserialize(paramJsonParser, localDeserializationContext);
        }
        else
        {
          localJsonDeserializer.deserialize(paramJsonParser, localDeserializationContext, this._valueToUpdate);
          localObject = this._valueToUpdate;
        }
      }
    }
  }

  // ERROR //
  protected Object _bindAndClose(JsonParser paramJsonParser)
    throws IOException, JsonParseException, JsonMappingException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 79	com/flurry/org/codehaus/jackson/map/ObjectReader:_schema	Lcom/flurry/org/codehaus/jackson/FormatSchema;
    //   4: ifnull +11 -> 15
    //   7: aload_1
    //   8: aload_0
    //   9: getfield 79	com/flurry/org/codehaus/jackson/map/ObjectReader:_schema	Lcom/flurry/org/codehaus/jackson/FormatSchema;
    //   12: invokevirtual 167	com/flurry/org/codehaus/jackson/JsonParser:setSchema	(Lcom/flurry/org/codehaus/jackson/FormatSchema;)V
    //   15: aload_1
    //   16: invokestatic 122	com/flurry/org/codehaus/jackson/map/ObjectReader:_initForReading	(Lcom/flurry/org/codehaus/jackson/JsonParser;)Lcom/flurry/org/codehaus/jackson/JsonToken;
    //   19: astore 4
    //   21: aload 4
    //   23: getstatic 128	com/flurry/org/codehaus/jackson/JsonToken:VALUE_NULL	Lcom/flurry/org/codehaus/jackson/JsonToken;
    //   26: if_acmpne +47 -> 73
    //   29: aload_0
    //   30: getfield 64	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueToUpdate	Ljava/lang/Object;
    //   33: ifnonnull +31 -> 64
    //   36: aload_0
    //   37: aload_0
    //   38: getfield 47	com/flurry/org/codehaus/jackson/map/ObjectReader:_config	Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;
    //   41: aload_0
    //   42: getfield 62	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueType	Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   45: invokevirtual 132	com/flurry/org/codehaus/jackson/map/ObjectReader:_findRootDeserializer	(Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;Lcom/flurry/org/codehaus/jackson/type/JavaType;)Lcom/flurry/org/codehaus/jackson/map/JsonDeserializer;
    //   48: invokevirtual 138	com/flurry/org/codehaus/jackson/map/JsonDeserializer:getNullValue	()Ljava/lang/Object;
    //   51: astore 10
    //   53: aload 10
    //   55: astore 5
    //   57: aload_1
    //   58: invokevirtual 170	com/flurry/org/codehaus/jackson/JsonParser:close	()V
    //   61: aload 5
    //   63: areturn
    //   64: aload_0
    //   65: getfield 64	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueToUpdate	Ljava/lang/Object;
    //   68: astore 5
    //   70: goto -13 -> 57
    //   73: aload 4
    //   75: getstatic 144	com/flurry/org/codehaus/jackson/JsonToken:END_ARRAY	Lcom/flurry/org/codehaus/jackson/JsonToken;
    //   78: if_acmpeq +11 -> 89
    //   81: aload 4
    //   83: getstatic 147	com/flurry/org/codehaus/jackson/JsonToken:END_OBJECT	Lcom/flurry/org/codehaus/jackson/JsonToken;
    //   86: if_acmpne +12 -> 98
    //   89: aload_0
    //   90: getfield 64	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueToUpdate	Ljava/lang/Object;
    //   93: astore 5
    //   95: goto -38 -> 57
    //   98: aload_0
    //   99: aload_1
    //   100: aload_0
    //   101: getfield 47	com/flurry/org/codehaus/jackson/map/ObjectReader:_config	Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;
    //   104: invokevirtual 151	com/flurry/org/codehaus/jackson/map/ObjectReader:_createDeserializationContext	(Lcom/flurry/org/codehaus/jackson/JsonParser;Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;)Lcom/flurry/org/codehaus/jackson/map/DeserializationContext;
    //   107: astore 7
    //   109: aload_0
    //   110: aload_0
    //   111: getfield 47	com/flurry/org/codehaus/jackson/map/ObjectReader:_config	Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;
    //   114: aload_0
    //   115: getfield 62	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueType	Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   118: invokevirtual 132	com/flurry/org/codehaus/jackson/map/ObjectReader:_findRootDeserializer	(Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;Lcom/flurry/org/codehaus/jackson/type/JavaType;)Lcom/flurry/org/codehaus/jackson/map/JsonDeserializer;
    //   121: astore 8
    //   123: aload_0
    //   124: getfield 95	com/flurry/org/codehaus/jackson/map/ObjectReader:_unwrapRoot	Z
    //   127: ifeq +21 -> 148
    //   130: aload_0
    //   131: aload_1
    //   132: aload 7
    //   134: aload_0
    //   135: getfield 62	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueType	Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   138: aload 8
    //   140: invokevirtual 155	com/flurry/org/codehaus/jackson/map/ObjectReader:_unwrapAndDeserialize	(Lcom/flurry/org/codehaus/jackson/JsonParser;Lcom/flurry/org/codehaus/jackson/map/DeserializationContext;Lcom/flurry/org/codehaus/jackson/type/JavaType;Lcom/flurry/org/codehaus/jackson/map/JsonDeserializer;)Ljava/lang/Object;
    //   143: astore 5
    //   145: goto -88 -> 57
    //   148: aload_0
    //   149: getfield 64	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueToUpdate	Ljava/lang/Object;
    //   152: ifnonnull +16 -> 168
    //   155: aload 8
    //   157: aload_1
    //   158: aload 7
    //   160: invokevirtual 159	com/flurry/org/codehaus/jackson/map/JsonDeserializer:deserialize	(Lcom/flurry/org/codehaus/jackson/JsonParser;Lcom/flurry/org/codehaus/jackson/map/DeserializationContext;)Ljava/lang/Object;
    //   163: astore 5
    //   165: goto -108 -> 57
    //   168: aload 8
    //   170: aload_1
    //   171: aload 7
    //   173: aload_0
    //   174: getfield 64	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueToUpdate	Ljava/lang/Object;
    //   177: invokevirtual 162	com/flurry/org/codehaus/jackson/map/JsonDeserializer:deserialize	(Lcom/flurry/org/codehaus/jackson/JsonParser;Lcom/flurry/org/codehaus/jackson/map/DeserializationContext;Ljava/lang/Object;)Ljava/lang/Object;
    //   180: pop
    //   181: aload_0
    //   182: getfield 64	com/flurry/org/codehaus/jackson/map/ObjectReader:_valueToUpdate	Ljava/lang/Object;
    //   185: astore 5
    //   187: goto -130 -> 57
    //   190: astore_2
    //   191: aload_1
    //   192: invokevirtual 170	com/flurry/org/codehaus/jackson/JsonParser:close	()V
    //   195: aload_2
    //   196: athrow
    //   197: astore 6
    //   199: aload 5
    //   201: areturn
    //   202: astore_3
    //   203: goto -8 -> 195
    //
    // Exception table:
    //   from	to	target	type
    //   15	53	190	finally
    //   64	70	190	finally
    //   73	89	190	finally
    //   89	95	190	finally
    //   98	145	190	finally
    //   148	165	190	finally
    //   168	187	190	finally
    //   57	61	197	java/io/IOException
    //   191	195	202	java/io/IOException
  }

  // ERROR //
  protected JsonNode _bindAndCloseAsTree(JsonParser paramJsonParser)
    throws IOException, JsonParseException, JsonMappingException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 79	com/flurry/org/codehaus/jackson/map/ObjectReader:_schema	Lcom/flurry/org/codehaus/jackson/FormatSchema;
    //   4: ifnull +11 -> 15
    //   7: aload_1
    //   8: aload_0
    //   9: getfield 79	com/flurry/org/codehaus/jackson/map/ObjectReader:_schema	Lcom/flurry/org/codehaus/jackson/FormatSchema;
    //   12: invokevirtual 167	com/flurry/org/codehaus/jackson/JsonParser:setSchema	(Lcom/flurry/org/codehaus/jackson/FormatSchema;)V
    //   15: aload_0
    //   16: aload_1
    //   17: invokevirtual 175	com/flurry/org/codehaus/jackson/map/ObjectReader:_bindAsTree	(Lcom/flurry/org/codehaus/jackson/JsonParser;)Lcom/flurry/org/codehaus/jackson/JsonNode;
    //   20: astore 4
    //   22: aload_1
    //   23: invokevirtual 170	com/flurry/org/codehaus/jackson/JsonParser:close	()V
    //   26: aload 4
    //   28: areturn
    //   29: astore_2
    //   30: aload_1
    //   31: invokevirtual 170	com/flurry/org/codehaus/jackson/JsonParser:close	()V
    //   34: aload_2
    //   35: athrow
    //   36: astore 5
    //   38: aload 4
    //   40: areturn
    //   41: astore_3
    //   42: goto -8 -> 34
    //
    // Exception table:
    //   from	to	target	type
    //   15	22	29	finally
    //   22	26	36	java/io/IOException
    //   30	34	41	java/io/IOException
  }

  protected JsonNode _bindAsTree(JsonParser paramJsonParser)
    throws IOException, JsonParseException, JsonMappingException
  {
    JsonToken localJsonToken = _initForReading(paramJsonParser);
    Object localObject;
    if ((localJsonToken == JsonToken.VALUE_NULL) || (localJsonToken == JsonToken.END_ARRAY) || (localJsonToken == JsonToken.END_OBJECT))
      localObject = NullNode.instance;
    while (true)
    {
      paramJsonParser.clearCurrentToken();
      return localObject;
      DeserializationContext localDeserializationContext = _createDeserializationContext(paramJsonParser, this._config);
      JsonDeserializer localJsonDeserializer = _findRootDeserializer(this._config, JSON_NODE_TYPE);
      if (this._unwrapRoot)
        localObject = (JsonNode)_unwrapAndDeserialize(paramJsonParser, localDeserializationContext, JSON_NODE_TYPE, localJsonDeserializer);
      else
        localObject = (JsonNode)localJsonDeserializer.deserialize(paramJsonParser, localDeserializationContext);
    }
  }

  protected DeserializationContext _createDeserializationContext(JsonParser paramJsonParser, DeserializationConfig paramDeserializationConfig)
  {
    return new StdDeserializationContext(paramDeserializationConfig, paramJsonParser, this._provider, this._injectableValues);
  }

  protected JsonDeserializer<Object> _findRootDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
    throws JsonMappingException
  {
    if (paramJavaType == null)
      throw new JsonMappingException("No value type configured for ObjectReader");
    JsonDeserializer localJsonDeserializer1 = (JsonDeserializer)this._rootDeserializers.get(paramJavaType);
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    JsonDeserializer localJsonDeserializer2 = this._provider.findTypedValueDeserializer(paramDeserializationConfig, paramJavaType, null);
    if (localJsonDeserializer2 == null)
      throw new JsonMappingException("Can not find a deserializer for type " + paramJavaType);
    this._rootDeserializers.put(paramJavaType, localJsonDeserializer2);
    return localJsonDeserializer2;
  }

  protected Object _unwrapAndDeserialize(JsonParser paramJsonParser, DeserializationContext paramDeserializationContext, JavaType paramJavaType, JsonDeserializer<Object> paramJsonDeserializer)
    throws IOException, JsonParseException, JsonMappingException
  {
    SerializedString localSerializedString = this._provider.findExpectedRootName(paramDeserializationContext.getConfig(), paramJavaType);
    if (paramJsonParser.getCurrentToken() != JsonToken.START_OBJECT)
      throw JsonMappingException.from(paramJsonParser, "Current token not START_OBJECT (needed to unwrap root name '" + localSerializedString + "'), but " + paramJsonParser.getCurrentToken());
    if (paramJsonParser.nextToken() != JsonToken.FIELD_NAME)
      throw JsonMappingException.from(paramJsonParser, "Current token not FIELD_NAME (to contain expected root name '" + localSerializedString + "'), but " + paramJsonParser.getCurrentToken());
    String str = paramJsonParser.getCurrentName();
    if (!localSerializedString.getValue().equals(str))
      throw JsonMappingException.from(paramJsonParser, "Root name '" + str + "' does not match expected ('" + localSerializedString + "') for type " + paramJavaType);
    paramJsonParser.nextToken();
    if (this._valueToUpdate == null);
    for (Object localObject = paramJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext); paramJsonParser.nextToken() != JsonToken.END_OBJECT; localObject = this._valueToUpdate)
    {
      throw JsonMappingException.from(paramJsonParser, "Current token not END_OBJECT (to match wrapper object with root name '" + localSerializedString + "'), but " + paramJsonParser.getCurrentToken());
      paramJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext, this._valueToUpdate);
    }
    return localObject;
  }

  public JsonNode createArrayNode()
  {
    return this._config.getNodeFactory().arrayNode();
  }

  public JsonNode createObjectNode()
  {
    return this._config.getNodeFactory().objectNode();
  }

  public JsonNode readTree(JsonParser paramJsonParser)
    throws IOException, JsonProcessingException
  {
    return _bindAsTree(paramJsonParser);
  }

  public JsonNode readTree(InputStream paramInputStream)
    throws IOException, JsonProcessingException
  {
    return _bindAndCloseAsTree(this._jsonFactory.createJsonParser(paramInputStream));
  }

  public JsonNode readTree(Reader paramReader)
    throws IOException, JsonProcessingException
  {
    return _bindAndCloseAsTree(this._jsonFactory.createJsonParser(paramReader));
  }

  public JsonNode readTree(String paramString)
    throws IOException, JsonProcessingException
  {
    return _bindAndCloseAsTree(this._jsonFactory.createJsonParser(paramString));
  }

  public <T> T readValue(JsonNode paramJsonNode)
    throws IOException, JsonProcessingException
  {
    return _bindAndClose(treeAsTokens(paramJsonNode));
  }

  public <T> T readValue(JsonParser paramJsonParser)
    throws IOException, JsonProcessingException
  {
    return _bind(paramJsonParser);
  }

  public <T> T readValue(JsonParser paramJsonParser, JavaType paramJavaType)
    throws IOException, JsonProcessingException
  {
    return withType(paramJavaType).readValue(paramJsonParser);
  }

  public <T> T readValue(JsonParser paramJsonParser, TypeReference<?> paramTypeReference)
    throws IOException, JsonProcessingException
  {
    return withType(paramTypeReference).readValue(paramJsonParser);
  }

  public <T> T readValue(JsonParser paramJsonParser, Class<T> paramClass)
    throws IOException, JsonProcessingException
  {
    return withType(paramClass).readValue(paramJsonParser);
  }

  public <T> T readValue(File paramFile)
    throws IOException, JsonProcessingException
  {
    return _bindAndClose(this._jsonFactory.createJsonParser(paramFile));
  }

  public <T> T readValue(InputStream paramInputStream)
    throws IOException, JsonProcessingException
  {
    return _bindAndClose(this._jsonFactory.createJsonParser(paramInputStream));
  }

  public <T> T readValue(Reader paramReader)
    throws IOException, JsonProcessingException
  {
    return _bindAndClose(this._jsonFactory.createJsonParser(paramReader));
  }

  public <T> T readValue(String paramString)
    throws IOException, JsonProcessingException
  {
    return _bindAndClose(this._jsonFactory.createJsonParser(paramString));
  }

  public <T> T readValue(URL paramURL)
    throws IOException, JsonProcessingException
  {
    return _bindAndClose(this._jsonFactory.createJsonParser(paramURL));
  }

  public <T> T readValue(byte[] paramArrayOfByte)
    throws IOException, JsonProcessingException
  {
    return _bindAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte));
  }

  public <T> T readValue(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonProcessingException
  {
    return _bindAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte, paramInt1, paramInt2));
  }

  public <T> MappingIterator<T> readValues(JsonParser paramJsonParser)
    throws IOException, JsonProcessingException
  {
    DeserializationContext localDeserializationContext = _createDeserializationContext(paramJsonParser, this._config);
    return new MappingIterator(this._valueType, paramJsonParser, localDeserializationContext, _findRootDeserializer(this._config, this._valueType), false, this._valueToUpdate);
  }

  public <T> MappingIterator<T> readValues(File paramFile)
    throws IOException, JsonProcessingException
  {
    JsonParser localJsonParser = this._jsonFactory.createJsonParser(paramFile);
    if (this._schema != null)
      localJsonParser.setSchema(this._schema);
    DeserializationContext localDeserializationContext = _createDeserializationContext(localJsonParser, this._config);
    return new MappingIterator(this._valueType, localJsonParser, localDeserializationContext, _findRootDeserializer(this._config, this._valueType), true, this._valueToUpdate);
  }

  public <T> MappingIterator<T> readValues(InputStream paramInputStream)
    throws IOException, JsonProcessingException
  {
    JsonParser localJsonParser = this._jsonFactory.createJsonParser(paramInputStream);
    if (this._schema != null)
      localJsonParser.setSchema(this._schema);
    DeserializationContext localDeserializationContext = _createDeserializationContext(localJsonParser, this._config);
    return new MappingIterator(this._valueType, localJsonParser, localDeserializationContext, _findRootDeserializer(this._config, this._valueType), true, this._valueToUpdate);
  }

  public <T> MappingIterator<T> readValues(Reader paramReader)
    throws IOException, JsonProcessingException
  {
    JsonParser localJsonParser = this._jsonFactory.createJsonParser(paramReader);
    if (this._schema != null)
      localJsonParser.setSchema(this._schema);
    DeserializationContext localDeserializationContext = _createDeserializationContext(localJsonParser, this._config);
    return new MappingIterator(this._valueType, localJsonParser, localDeserializationContext, _findRootDeserializer(this._config, this._valueType), true, this._valueToUpdate);
  }

  public <T> MappingIterator<T> readValues(String paramString)
    throws IOException, JsonProcessingException
  {
    JsonParser localJsonParser = this._jsonFactory.createJsonParser(paramString);
    if (this._schema != null)
      localJsonParser.setSchema(this._schema);
    DeserializationContext localDeserializationContext = _createDeserializationContext(localJsonParser, this._config);
    return new MappingIterator(this._valueType, localJsonParser, localDeserializationContext, _findRootDeserializer(this._config, this._valueType), true, this._valueToUpdate);
  }

  public <T> MappingIterator<T> readValues(URL paramURL)
    throws IOException, JsonProcessingException
  {
    JsonParser localJsonParser = this._jsonFactory.createJsonParser(paramURL);
    if (this._schema != null)
      localJsonParser.setSchema(this._schema);
    DeserializationContext localDeserializationContext = _createDeserializationContext(localJsonParser, this._config);
    return new MappingIterator(this._valueType, localJsonParser, localDeserializationContext, _findRootDeserializer(this._config, this._valueType), true, this._valueToUpdate);
  }

  public final <T> MappingIterator<T> readValues(byte[] paramArrayOfByte)
    throws IOException, JsonProcessingException
  {
    return readValues(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public <T> MappingIterator<T> readValues(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException, JsonProcessingException
  {
    JsonParser localJsonParser = this._jsonFactory.createJsonParser(paramArrayOfByte, paramInt1, paramInt2);
    if (this._schema != null)
      localJsonParser.setSchema(this._schema);
    DeserializationContext localDeserializationContext = _createDeserializationContext(localJsonParser, this._config);
    return new MappingIterator(this._valueType, localJsonParser, localDeserializationContext, _findRootDeserializer(this._config, this._valueType), true, this._valueToUpdate);
  }

  public <T> Iterator<T> readValues(JsonParser paramJsonParser, JavaType paramJavaType)
    throws IOException, JsonProcessingException
  {
    return withType(paramJavaType).readValues(paramJsonParser);
  }

  public <T> Iterator<T> readValues(JsonParser paramJsonParser, TypeReference<?> paramTypeReference)
    throws IOException, JsonProcessingException
  {
    return withType(paramTypeReference).readValues(paramJsonParser);
  }

  public <T> Iterator<T> readValues(JsonParser paramJsonParser, Class<T> paramClass)
    throws IOException, JsonProcessingException
  {
    return withType(paramClass).readValues(paramJsonParser);
  }

  public JsonParser treeAsTokens(JsonNode paramJsonNode)
  {
    return new TreeTraversingParser(paramJsonNode, this);
  }

  public <T> T treeToValue(JsonNode paramJsonNode, Class<T> paramClass)
    throws IOException, JsonProcessingException
  {
    return readValue(treeAsTokens(paramJsonNode), paramClass);
  }

  public Version version()
  {
    return VersionUtil.versionFor(getClass());
  }

  public ObjectReader withInjectableValues(InjectableValues paramInjectableValues)
  {
    if (this._injectableValues == paramInjectableValues)
      return this;
    return new ObjectReader(this, this._config, this._valueType, this._valueToUpdate, this._schema, paramInjectableValues);
  }

  public ObjectReader withNodeFactory(JsonNodeFactory paramJsonNodeFactory)
  {
    if (paramJsonNodeFactory == this._config.getNodeFactory())
      return this;
    return new ObjectReader(this, this._config.withNodeFactory(paramJsonNodeFactory), this._valueType, this._valueToUpdate, this._schema, this._injectableValues);
  }

  public ObjectReader withSchema(FormatSchema paramFormatSchema)
  {
    if (this._schema == paramFormatSchema)
      return this;
    return new ObjectReader(this, this._config, this._valueType, this._valueToUpdate, paramFormatSchema, this._injectableValues);
  }

  public ObjectReader withType(JavaType paramJavaType)
  {
    if (paramJavaType == this._valueType)
      return this;
    return new ObjectReader(this, this._config, paramJavaType, this._valueToUpdate, this._schema, this._injectableValues);
  }

  public ObjectReader withType(TypeReference<?> paramTypeReference)
  {
    return withType(this._config.getTypeFactory().constructType(paramTypeReference.getType()));
  }

  public ObjectReader withType(Class<?> paramClass)
  {
    return withType(this._config.constructType(paramClass));
  }

  public ObjectReader withType(Type paramType)
  {
    return withType(this._config.getTypeFactory().constructType(paramType));
  }

  public ObjectReader withValueToUpdate(Object paramObject)
  {
    if (paramObject == this._valueToUpdate)
      return this;
    if (paramObject == null)
      throw new IllegalArgumentException("cat not update null value");
    if (this._valueType == null);
    for (JavaType localJavaType = this._config.constructType(paramObject.getClass()); ; localJavaType = this._valueType)
      return new ObjectReader(this, this._config, localJavaType, paramObject, this._schema, this._injectableValues);
  }

  public void writeTree(JsonGenerator paramJsonGenerator, JsonNode paramJsonNode)
    throws IOException, JsonProcessingException
  {
    throw new UnsupportedOperationException("Not implemented for ObjectReader");
  }

  public void writeValue(JsonGenerator paramJsonGenerator, Object paramObject)
    throws IOException, JsonProcessingException
  {
    throw new UnsupportedOperationException("Not implemented for ObjectReader");
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ObjectReader
 * JD-Core Version:    0.6.2
 */