package com.flurry.org.codehaus.jackson.map;

import com.flurry.org.codehaus.jackson.FormatSchema;
import com.flurry.org.codehaus.jackson.JsonEncoding;
import com.flurry.org.codehaus.jackson.JsonFactory;
import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonGenerator.Feature;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.JsonParseException;
import com.flurry.org.codehaus.jackson.JsonParser;
import com.flurry.org.codehaus.jackson.JsonParser.Feature;
import com.flurry.org.codehaus.jackson.JsonProcessingException;
import com.flurry.org.codehaus.jackson.JsonToken;
import com.flurry.org.codehaus.jackson.ObjectCodec;
import com.flurry.org.codehaus.jackson.PrettyPrinter;
import com.flurry.org.codehaus.jackson.Version;
import com.flurry.org.codehaus.jackson.Versioned;
import com.flurry.org.codehaus.jackson.annotate.JsonAutoDetect.Visibility;
import com.flurry.org.codehaus.jackson.annotate.JsonMethod;
import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.As;
import com.flurry.org.codehaus.jackson.annotate.JsonTypeInfo.Id;
import com.flurry.org.codehaus.jackson.io.SegmentedStringWriter;
import com.flurry.org.codehaus.jackson.io.SerializedString;
import com.flurry.org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;
import com.flurry.org.codehaus.jackson.map.deser.BeanDeserializerModifier;
import com.flurry.org.codehaus.jackson.map.deser.StdDeserializationContext;
import com.flurry.org.codehaus.jackson.map.deser.StdDeserializerProvider;
import com.flurry.org.codehaus.jackson.map.deser.ValueInstantiators;
import com.flurry.org.codehaus.jackson.map.introspect.BasicClassIntrospector;
import com.flurry.org.codehaus.jackson.map.introspect.JacksonAnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.introspect.VisibilityChecker;
import com.flurry.org.codehaus.jackson.map.introspect.VisibilityChecker.Std;
import com.flurry.org.codehaus.jackson.map.jsontype.NamedType;
import com.flurry.org.codehaus.jackson.map.jsontype.SubtypeResolver;
import com.flurry.org.codehaus.jackson.map.jsontype.TypeResolverBuilder;
import com.flurry.org.codehaus.jackson.map.jsontype.impl.StdSubtypeResolver;
import com.flurry.org.codehaus.jackson.map.jsontype.impl.StdTypeResolverBuilder;
import com.flurry.org.codehaus.jackson.map.ser.BeanSerializerFactory;
import com.flurry.org.codehaus.jackson.map.ser.BeanSerializerModifier;
import com.flurry.org.codehaus.jackson.map.ser.FilterProvider;
import com.flurry.org.codehaus.jackson.map.ser.StdSerializerProvider;
import com.flurry.org.codehaus.jackson.map.type.SimpleType;
import com.flurry.org.codehaus.jackson.map.type.TypeFactory;
import com.flurry.org.codehaus.jackson.map.type.TypeModifier;
import com.flurry.org.codehaus.jackson.node.ArrayNode;
import com.flurry.org.codehaus.jackson.node.JsonNodeFactory;
import com.flurry.org.codehaus.jackson.node.NullNode;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import com.flurry.org.codehaus.jackson.node.TreeTraversingParser;
import com.flurry.org.codehaus.jackson.schema.JsonSchema;
import com.flurry.org.codehaus.jackson.type.JavaType;
import com.flurry.org.codehaus.jackson.type.TypeReference;
import com.flurry.org.codehaus.jackson.util.ByteArrayBuilder;
import com.flurry.org.codehaus.jackson.util.DefaultPrettyPrinter;
import com.flurry.org.codehaus.jackson.util.TokenBuffer;
import com.flurry.org.codehaus.jackson.util.VersionUtil;
import java.io.Closeable;
import java.io.EOFException;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.Writer;
import java.lang.reflect.Type;
import java.net.URL;
import java.text.DateFormat;
import java.util.Collection;
import java.util.concurrent.ConcurrentHashMap;

public class ObjectMapper extends ObjectCodec
  implements Versioned
{
  protected static final AnnotationIntrospector DEFAULT_ANNOTATION_INTROSPECTOR = new JacksonAnnotationIntrospector();
  protected static final ClassIntrospector<? extends BeanDescription> DEFAULT_INTROSPECTOR;
  private static final JavaType JSON_NODE_TYPE = SimpleType.constructUnsafe(JsonNode.class);
  protected static final VisibilityChecker<?> STD_VISIBILITY_CHECKER = VisibilityChecker.Std.defaultInstance();
  protected DeserializationConfig _deserializationConfig;
  protected DeserializerProvider _deserializerProvider;
  protected InjectableValues _injectableValues;
  protected final JsonFactory _jsonFactory;
  protected final ConcurrentHashMap<JavaType, JsonDeserializer<Object>> _rootDeserializers = new ConcurrentHashMap(64, 0.6F, 2);
  protected SerializationConfig _serializationConfig;
  protected SerializerFactory _serializerFactory;
  protected SerializerProvider _serializerProvider;
  protected SubtypeResolver _subtypeResolver;
  protected TypeFactory _typeFactory;

  static
  {
    DEFAULT_INTROSPECTOR = BasicClassIntrospector.instance;
  }

  public ObjectMapper()
  {
    this(null, null, null);
  }

  public ObjectMapper(JsonFactory paramJsonFactory)
  {
    this(paramJsonFactory, null, null);
  }

  public ObjectMapper(JsonFactory paramJsonFactory, SerializerProvider paramSerializerProvider, DeserializerProvider paramDeserializerProvider)
  {
    this(paramJsonFactory, paramSerializerProvider, paramDeserializerProvider, null, null);
  }

  public ObjectMapper(JsonFactory paramJsonFactory, SerializerProvider paramSerializerProvider, DeserializerProvider paramDeserializerProvider, SerializationConfig paramSerializationConfig, DeserializationConfig paramDeserializationConfig)
  {
    if (paramJsonFactory == null)
    {
      this._jsonFactory = new MappingJsonFactory(this);
      this._typeFactory = TypeFactory.defaultInstance();
      if (paramSerializationConfig == null)
        break label131;
      label48: this._serializationConfig = paramSerializationConfig;
      if (paramDeserializationConfig == null)
        break label159;
    }
    while (true)
    {
      this._deserializationConfig = paramDeserializationConfig;
      if (paramSerializerProvider == null)
        paramSerializerProvider = new StdSerializerProvider();
      this._serializerProvider = paramSerializerProvider;
      if (paramDeserializerProvider == null)
        paramDeserializerProvider = new StdDeserializerProvider();
      this._deserializerProvider = paramDeserializerProvider;
      this._serializerFactory = BeanSerializerFactory.instance;
      return;
      this._jsonFactory = paramJsonFactory;
      if (paramJsonFactory.getCodec() != null)
        break;
      this._jsonFactory.setCodec(this);
      break;
      label131: paramSerializationConfig = new SerializationConfig(DEFAULT_INTROSPECTOR, DEFAULT_ANNOTATION_INTROSPECTOR, STD_VISIBILITY_CHECKER, null, null, this._typeFactory, null);
      break label48;
      label159: paramDeserializationConfig = new DeserializationConfig(DEFAULT_INTROSPECTOR, DEFAULT_ANNOTATION_INTROSPECTOR, STD_VISIBILITY_CHECKER, null, null, this._typeFactory, null);
    }
  }

  @Deprecated
  public ObjectMapper(SerializerFactory paramSerializerFactory)
  {
    this(null, null, null);
    setSerializerFactory(paramSerializerFactory);
  }

  // ERROR //
  private final void _configAndWriteCloseable(JsonGenerator paramJsonGenerator, Object paramObject, SerializationConfig paramSerializationConfig)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    // Byte code:
    //   0: aload_2
    //   1: checkcast 157	java/io/Closeable
    //   4: astore 4
    //   6: aload_0
    //   7: getfield 111	com/flurry/org/codehaus/jackson/map/ObjectMapper:_serializerProvider	Lcom/flurry/org/codehaus/jackson/map/SerializerProvider;
    //   10: aload_3
    //   11: aload_1
    //   12: aload_2
    //   13: aload_0
    //   14: getfield 123	com/flurry/org/codehaus/jackson/map/ObjectMapper:_serializerFactory	Lcom/flurry/org/codehaus/jackson/map/SerializerFactory;
    //   17: invokevirtual 163	com/flurry/org/codehaus/jackson/map/SerializerProvider:serializeValue	(Lcom/flurry/org/codehaus/jackson/map/SerializationConfig;Lcom/flurry/org/codehaus/jackson/JsonGenerator;Ljava/lang/Object;Lcom/flurry/org/codehaus/jackson/map/SerializerFactory;)V
    //   20: aload_1
    //   21: astore 8
    //   23: aconst_null
    //   24: astore_1
    //   25: aload 8
    //   27: invokevirtual 168	com/flurry/org/codehaus/jackson/JsonGenerator:close	()V
    //   30: aload 4
    //   32: astore 9
    //   34: aconst_null
    //   35: astore 4
    //   37: aload 9
    //   39: invokeinterface 169 1 0
    //   44: iconst_0
    //   45: ifeq +7 -> 52
    //   48: aconst_null
    //   49: invokevirtual 168	com/flurry/org/codehaus/jackson/JsonGenerator:close	()V
    //   52: iconst_0
    //   53: ifeq +9 -> 62
    //   56: aconst_null
    //   57: invokeinterface 169 1 0
    //   62: return
    //   63: astore 5
    //   65: aload_1
    //   66: ifnull +7 -> 73
    //   69: aload_1
    //   70: invokevirtual 168	com/flurry/org/codehaus/jackson/JsonGenerator:close	()V
    //   73: aload 4
    //   75: ifnull +10 -> 85
    //   78: aload 4
    //   80: invokeinterface 169 1 0
    //   85: aload 5
    //   87: athrow
    //   88: astore 11
    //   90: goto -38 -> 52
    //   93: astore 10
    //   95: return
    //   96: astore 7
    //   98: goto -25 -> 73
    //   101: astore 6
    //   103: goto -18 -> 85
    //
    // Exception table:
    //   from	to	target	type
    //   6	20	63	finally
    //   25	30	63	finally
    //   37	44	63	finally
    //   48	52	88	java/io/IOException
    //   56	62	93	java/io/IOException
    //   69	73	96	java/io/IOException
    //   78	85	101	java/io/IOException
  }

  // ERROR //
  private final void _writeCloseableValue(JsonGenerator paramJsonGenerator, Object paramObject, SerializationConfig paramSerializationConfig)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    // Byte code:
    //   0: aload_2
    //   1: checkcast 157	java/io/Closeable
    //   4: astore 4
    //   6: aload_0
    //   7: getfield 111	com/flurry/org/codehaus/jackson/map/ObjectMapper:_serializerProvider	Lcom/flurry/org/codehaus/jackson/map/SerializerProvider;
    //   10: aload_3
    //   11: aload_1
    //   12: aload_2
    //   13: aload_0
    //   14: getfield 123	com/flurry/org/codehaus/jackson/map/ObjectMapper:_serializerFactory	Lcom/flurry/org/codehaus/jackson/map/SerializerFactory;
    //   17: invokevirtual 163	com/flurry/org/codehaus/jackson/map/SerializerProvider:serializeValue	(Lcom/flurry/org/codehaus/jackson/map/SerializationConfig;Lcom/flurry/org/codehaus/jackson/JsonGenerator;Ljava/lang/Object;Lcom/flurry/org/codehaus/jackson/map/SerializerFactory;)V
    //   20: aload_3
    //   21: getstatic 176	com/flurry/org/codehaus/jackson/map/SerializationConfig$Feature:FLUSH_AFTER_WRITE_VALUE	Lcom/flurry/org/codehaus/jackson/map/SerializationConfig$Feature;
    //   24: invokevirtual 180	com/flurry/org/codehaus/jackson/map/SerializationConfig:isEnabled	(Lcom/flurry/org/codehaus/jackson/map/SerializationConfig$Feature;)Z
    //   27: ifeq +7 -> 34
    //   30: aload_1
    //   31: invokevirtual 183	com/flurry/org/codehaus/jackson/JsonGenerator:flush	()V
    //   34: aload 4
    //   36: astore 7
    //   38: aconst_null
    //   39: astore 4
    //   41: aload 7
    //   43: invokeinterface 169 1 0
    //   48: iconst_0
    //   49: ifeq +9 -> 58
    //   52: aconst_null
    //   53: invokeinterface 169 1 0
    //   58: return
    //   59: astore 5
    //   61: aload 4
    //   63: ifnull +10 -> 73
    //   66: aload 4
    //   68: invokeinterface 169 1 0
    //   73: aload 5
    //   75: athrow
    //   76: astore 8
    //   78: return
    //   79: astore 6
    //   81: goto -8 -> 73
    //
    // Exception table:
    //   from	to	target	type
    //   6	34	59	finally
    //   41	48	59	finally
    //   52	58	76	java/io/IOException
    //   66	73	79	java/io/IOException
  }

  protected final void _configAndWriteValue(JsonGenerator paramJsonGenerator, Object paramObject)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    SerializationConfig localSerializationConfig = copySerializationConfig();
    if (localSerializationConfig.isEnabled(SerializationConfig.Feature.INDENT_OUTPUT))
      paramJsonGenerator.useDefaultPrettyPrinter();
    if ((localSerializationConfig.isEnabled(SerializationConfig.Feature.CLOSE_CLOSEABLE)) && ((paramObject instanceof Closeable)))
      _configAndWriteCloseable(paramJsonGenerator, paramObject, localSerializationConfig);
    while (true)
    {
      return;
      int i = 0;
      try
      {
        this._serializerProvider.serializeValue(localSerializationConfig, paramJsonGenerator, paramObject, this._serializerFactory);
        i = 1;
        paramJsonGenerator.close();
        if (i == 0)
          try
          {
            paramJsonGenerator.close();
            return;
          }
          catch (IOException localIOException2)
          {
            return;
          }
      }
      finally
      {
        if (i != 0);
      }
    }
    try
    {
      paramJsonGenerator.close();
      label93: throw localObject;
    }
    catch (IOException localIOException1)
    {
      break label93;
    }
  }

  protected final void _configAndWriteValue(JsonGenerator paramJsonGenerator, Object paramObject, Class<?> paramClass)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    SerializationConfig localSerializationConfig = copySerializationConfig().withView(paramClass);
    if (localSerializationConfig.isEnabled(SerializationConfig.Feature.INDENT_OUTPUT))
      paramJsonGenerator.useDefaultPrettyPrinter();
    if ((localSerializationConfig.isEnabled(SerializationConfig.Feature.CLOSE_CLOSEABLE)) && ((paramObject instanceof Closeable)))
      _configAndWriteCloseable(paramJsonGenerator, paramObject, localSerializationConfig);
    while (true)
    {
      return;
      int i = 0;
      try
      {
        this._serializerProvider.serializeValue(localSerializationConfig, paramJsonGenerator, paramObject, this._serializerFactory);
        i = 1;
        paramJsonGenerator.close();
        if (i == 0)
          try
          {
            paramJsonGenerator.close();
            return;
          }
          catch (IOException localIOException2)
          {
            return;
          }
      }
      finally
      {
        if (i != 0);
      }
    }
    try
    {
      paramJsonGenerator.close();
      label102: throw localObject;
    }
    catch (IOException localIOException1)
    {
      break label102;
    }
  }

  protected Object _convert(Object paramObject, JavaType paramJavaType)
    throws IllegalArgumentException
  {
    if (paramObject == null)
      return null;
    TokenBuffer localTokenBuffer = new TokenBuffer(this);
    try
    {
      writeValue(localTokenBuffer, paramObject);
      JsonParser localJsonParser = localTokenBuffer.asParser();
      Object localObject = readValue(localJsonParser, paramJavaType);
      localJsonParser.close();
      return localObject;
    }
    catch (IOException localIOException)
    {
      throw new IllegalArgumentException(localIOException.getMessage(), localIOException);
    }
  }

  protected DeserializationContext _createDeserializationContext(JsonParser paramJsonParser, DeserializationConfig paramDeserializationConfig)
  {
    return new StdDeserializationContext(paramDeserializationConfig, paramJsonParser, this._deserializerProvider, this._injectableValues);
  }

  protected PrettyPrinter _defaultPrettyPrinter()
  {
    return new DefaultPrettyPrinter();
  }

  protected JsonDeserializer<Object> _findRootDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType)
    throws JsonMappingException
  {
    JsonDeserializer localJsonDeserializer1 = (JsonDeserializer)this._rootDeserializers.get(paramJavaType);
    if (localJsonDeserializer1 != null)
      return localJsonDeserializer1;
    JsonDeserializer localJsonDeserializer2 = this._deserializerProvider.findTypedValueDeserializer(paramDeserializationConfig, paramJavaType, null);
    if (localJsonDeserializer2 == null)
      throw new JsonMappingException("Can not find a deserializer for type " + paramJavaType);
    this._rootDeserializers.put(paramJavaType, localJsonDeserializer2);
    return localJsonDeserializer2;
  }

  protected JsonToken _initForReading(JsonParser paramJsonParser)
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

  // ERROR //
  protected Object _readMapAndClose(JsonParser paramJsonParser, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    // Byte code:
    //   0: aload_0
    //   1: aload_1
    //   2: invokevirtual 305	com/flurry/org/codehaus/jackson/map/ObjectMapper:_initForReading	(Lcom/flurry/org/codehaus/jackson/JsonParser;)Lcom/flurry/org/codehaus/jackson/JsonToken;
    //   5: astore 5
    //   7: aload 5
    //   9: getstatic 311	com/flurry/org/codehaus/jackson/JsonToken:VALUE_NULL	Lcom/flurry/org/codehaus/jackson/JsonToken;
    //   12: if_acmpne +28 -> 40
    //   15: aload_0
    //   16: aload_0
    //   17: getfield 106	com/flurry/org/codehaus/jackson/map/ObjectMapper:_deserializationConfig	Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;
    //   20: aload_2
    //   21: invokevirtual 313	com/flurry/org/codehaus/jackson/map/ObjectMapper:_findRootDeserializer	(Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;Lcom/flurry/org/codehaus/jackson/type/JavaType;)Lcom/flurry/org/codehaus/jackson/map/JsonDeserializer;
    //   24: invokevirtual 317	com/flurry/org/codehaus/jackson/map/JsonDeserializer:getNullValue	()Ljava/lang/Object;
    //   27: astore 6
    //   29: aload_1
    //   30: invokevirtual 320	com/flurry/org/codehaus/jackson/JsonParser:clearCurrentToken	()V
    //   33: aload_1
    //   34: invokevirtual 229	com/flurry/org/codehaus/jackson/JsonParser:close	()V
    //   37: aload 6
    //   39: areturn
    //   40: aload 5
    //   42: getstatic 323	com/flurry/org/codehaus/jackson/JsonToken:END_ARRAY	Lcom/flurry/org/codehaus/jackson/JsonToken;
    //   45: if_acmpeq +98 -> 143
    //   48: aload 5
    //   50: getstatic 326	com/flurry/org/codehaus/jackson/JsonToken:END_OBJECT	Lcom/flurry/org/codehaus/jackson/JsonToken;
    //   53: if_acmpne +6 -> 59
    //   56: goto +87 -> 143
    //   59: aload_0
    //   60: invokevirtual 330	com/flurry/org/codehaus/jackson/map/ObjectMapper:copyDeserializationConfig	()Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;
    //   63: astore 8
    //   65: aload_0
    //   66: aload_1
    //   67: aload 8
    //   69: invokevirtual 332	com/flurry/org/codehaus/jackson/map/ObjectMapper:_createDeserializationContext	(Lcom/flurry/org/codehaus/jackson/JsonParser;Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;)Lcom/flurry/org/codehaus/jackson/map/DeserializationContext;
    //   72: astore 9
    //   74: aload_0
    //   75: aload 8
    //   77: aload_2
    //   78: invokevirtual 313	com/flurry/org/codehaus/jackson/map/ObjectMapper:_findRootDeserializer	(Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig;Lcom/flurry/org/codehaus/jackson/type/JavaType;)Lcom/flurry/org/codehaus/jackson/map/JsonDeserializer;
    //   81: astore 10
    //   83: aload 8
    //   85: getstatic 338	com/flurry/org/codehaus/jackson/map/DeserializationConfig$Feature:UNWRAP_ROOT_VALUE	Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig$Feature;
    //   88: invokevirtual 341	com/flurry/org/codehaus/jackson/map/DeserializationConfig:isEnabled	(Lcom/flurry/org/codehaus/jackson/map/DeserializationConfig$Feature;)Z
    //   91: ifeq +18 -> 109
    //   94: aload_0
    //   95: aload_1
    //   96: aload_2
    //   97: aload 9
    //   99: aload 10
    //   101: invokevirtual 345	com/flurry/org/codehaus/jackson/map/ObjectMapper:_unwrapAndDeserialize	(Lcom/flurry/org/codehaus/jackson/JsonParser;Lcom/flurry/org/codehaus/jackson/type/JavaType;Lcom/flurry/org/codehaus/jackson/map/DeserializationContext;Lcom/flurry/org/codehaus/jackson/map/JsonDeserializer;)Ljava/lang/Object;
    //   104: astore 6
    //   106: goto -77 -> 29
    //   109: aload 10
    //   111: aload_1
    //   112: aload 9
    //   114: invokevirtual 349	com/flurry/org/codehaus/jackson/map/JsonDeserializer:deserialize	(Lcom/flurry/org/codehaus/jackson/JsonParser;Lcom/flurry/org/codehaus/jackson/map/DeserializationContext;)Ljava/lang/Object;
    //   117: astore 11
    //   119: aload 11
    //   121: astore 6
    //   123: goto -94 -> 29
    //   126: astore_3
    //   127: aload_1
    //   128: invokevirtual 229	com/flurry/org/codehaus/jackson/JsonParser:close	()V
    //   131: aload_3
    //   132: athrow
    //   133: astore 7
    //   135: aload 6
    //   137: areturn
    //   138: astore 4
    //   140: goto -9 -> 131
    //   143: aconst_null
    //   144: astore 6
    //   146: goto -117 -> 29
    //
    // Exception table:
    //   from	to	target	type
    //   0	29	126	finally
    //   29	33	126	finally
    //   40	56	126	finally
    //   59	106	126	finally
    //   109	119	126	finally
    //   33	37	133	java/io/IOException
    //   127	131	138	java/io/IOException
  }

  protected Object _readValue(DeserializationConfig paramDeserializationConfig, JsonParser paramJsonParser, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    JsonToken localJsonToken = _initForReading(paramJsonParser);
    Object localObject;
    if (localJsonToken == JsonToken.VALUE_NULL)
      localObject = _findRootDeserializer(paramDeserializationConfig, paramJavaType).getNullValue();
    while (true)
    {
      paramJsonParser.clearCurrentToken();
      return localObject;
      if ((localJsonToken == JsonToken.END_ARRAY) || (localJsonToken == JsonToken.END_OBJECT))
      {
        localObject = null;
      }
      else
      {
        DeserializationContext localDeserializationContext = _createDeserializationContext(paramJsonParser, paramDeserializationConfig);
        JsonDeserializer localJsonDeserializer = _findRootDeserializer(paramDeserializationConfig, paramJavaType);
        if (paramDeserializationConfig.isEnabled(DeserializationConfig.Feature.UNWRAP_ROOT_VALUE))
          localObject = _unwrapAndDeserialize(paramJsonParser, paramJavaType, localDeserializationContext, localJsonDeserializer);
        else
          localObject = localJsonDeserializer.deserialize(paramJsonParser, localDeserializationContext);
      }
    }
  }

  protected Object _unwrapAndDeserialize(JsonParser paramJsonParser, JavaType paramJavaType, DeserializationContext paramDeserializationContext, JsonDeserializer<Object> paramJsonDeserializer)
    throws IOException, JsonParseException, JsonMappingException
  {
    SerializedString localSerializedString = this._deserializerProvider.findExpectedRootName(paramDeserializationContext.getConfig(), paramJavaType);
    if (paramJsonParser.getCurrentToken() != JsonToken.START_OBJECT)
      throw JsonMappingException.from(paramJsonParser, "Current token not START_OBJECT (needed to unwrap root name '" + localSerializedString + "'), but " + paramJsonParser.getCurrentToken());
    if (paramJsonParser.nextToken() != JsonToken.FIELD_NAME)
      throw JsonMappingException.from(paramJsonParser, "Current token not FIELD_NAME (to contain expected root name '" + localSerializedString + "'), but " + paramJsonParser.getCurrentToken());
    String str = paramJsonParser.getCurrentName();
    if (!localSerializedString.getValue().equals(str))
      throw JsonMappingException.from(paramJsonParser, "Root name '" + str + "' does not match expected ('" + localSerializedString + "') for type " + paramJavaType);
    paramJsonParser.nextToken();
    Object localObject = paramJsonDeserializer.deserialize(paramJsonParser, paramDeserializationContext);
    if (paramJsonParser.nextToken() != JsonToken.END_OBJECT)
      throw JsonMappingException.from(paramJsonParser, "Current token not END_OBJECT (to match wrapper object with root name '" + localSerializedString + "'), but " + paramJsonParser.getCurrentToken());
    return localObject;
  }

  public boolean canDeserialize(JavaType paramJavaType)
  {
    return this._deserializerProvider.hasValueDeserializerFor(copyDeserializationConfig(), paramJavaType);
  }

  public boolean canSerialize(Class<?> paramClass)
  {
    return this._serializerProvider.hasSerializerFor(copySerializationConfig(), paramClass, this._serializerFactory);
  }

  public ObjectMapper configure(JsonGenerator.Feature paramFeature, boolean paramBoolean)
  {
    this._jsonFactory.configure(paramFeature, paramBoolean);
    return this;
  }

  public ObjectMapper configure(JsonParser.Feature paramFeature, boolean paramBoolean)
  {
    this._jsonFactory.configure(paramFeature, paramBoolean);
    return this;
  }

  public ObjectMapper configure(DeserializationConfig.Feature paramFeature, boolean paramBoolean)
  {
    this._deserializationConfig.set(paramFeature, paramBoolean);
    return this;
  }

  public ObjectMapper configure(SerializationConfig.Feature paramFeature, boolean paramBoolean)
  {
    this._serializationConfig.set(paramFeature, paramBoolean);
    return this;
  }

  public JavaType constructType(Type paramType)
  {
    return this._typeFactory.constructType(paramType);
  }

  public <T> T convertValue(Object paramObject, JavaType paramJavaType)
    throws IllegalArgumentException
  {
    return _convert(paramObject, paramJavaType);
  }

  public <T> T convertValue(Object paramObject, TypeReference paramTypeReference)
    throws IllegalArgumentException
  {
    return _convert(paramObject, this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T convertValue(Object paramObject, Class<T> paramClass)
    throws IllegalArgumentException
  {
    return _convert(paramObject, this._typeFactory.constructType(paramClass));
  }

  public DeserializationConfig copyDeserializationConfig()
  {
    return this._deserializationConfig.createUnshared(this._subtypeResolver).passSerializationFeatures(this._serializationConfig._featureFlags);
  }

  public SerializationConfig copySerializationConfig()
  {
    return this._serializationConfig.createUnshared(this._subtypeResolver);
  }

  public ArrayNode createArrayNode()
  {
    return this._deserializationConfig.getNodeFactory().arrayNode();
  }

  public ObjectNode createObjectNode()
  {
    return this._deserializationConfig.getNodeFactory().objectNode();
  }

  @Deprecated
  public ObjectWriter defaultPrettyPrintingWriter()
  {
    return writerWithDefaultPrettyPrinter();
  }

  public ObjectMapper disable(DeserializationConfig.Feature[] paramArrayOfFeature)
  {
    this._deserializationConfig = this._deserializationConfig.without(paramArrayOfFeature);
    return this;
  }

  public ObjectMapper disable(SerializationConfig.Feature[] paramArrayOfFeature)
  {
    this._serializationConfig = this._serializationConfig.without(paramArrayOfFeature);
    return this;
  }

  public ObjectMapper disableDefaultTyping()
  {
    return setDefaultTyping(null);
  }

  public ObjectMapper enable(DeserializationConfig.Feature[] paramArrayOfFeature)
  {
    this._deserializationConfig = this._deserializationConfig.with(paramArrayOfFeature);
    return this;
  }

  public ObjectMapper enable(SerializationConfig.Feature[] paramArrayOfFeature)
  {
    this._serializationConfig = this._serializationConfig.with(paramArrayOfFeature);
    return this;
  }

  public ObjectMapper enableDefaultTyping()
  {
    return enableDefaultTyping(DefaultTyping.OBJECT_AND_NON_CONCRETE);
  }

  public ObjectMapper enableDefaultTyping(DefaultTyping paramDefaultTyping)
  {
    return enableDefaultTyping(paramDefaultTyping, JsonTypeInfo.As.WRAPPER_ARRAY);
  }

  public ObjectMapper enableDefaultTyping(DefaultTyping paramDefaultTyping, JsonTypeInfo.As paramAs)
  {
    return setDefaultTyping(new DefaultTypeResolverBuilder(paramDefaultTyping).init(JsonTypeInfo.Id.CLASS, null).inclusion(paramAs));
  }

  public ObjectMapper enableDefaultTypingAsProperty(DefaultTyping paramDefaultTyping, String paramString)
  {
    return setDefaultTyping(new DefaultTypeResolverBuilder(paramDefaultTyping).init(JsonTypeInfo.Id.CLASS, null).inclusion(JsonTypeInfo.As.PROPERTY).typeProperty(paramString));
  }

  @Deprecated
  public ObjectWriter filteredWriter(FilterProvider paramFilterProvider)
  {
    return writer(paramFilterProvider);
  }

  public JsonSchema generateJsonSchema(Class<?> paramClass)
    throws JsonMappingException
  {
    return generateJsonSchema(paramClass, copySerializationConfig());
  }

  public JsonSchema generateJsonSchema(Class<?> paramClass, SerializationConfig paramSerializationConfig)
    throws JsonMappingException
  {
    return this._serializerProvider.generateJsonSchema(paramClass, paramSerializationConfig, this._serializerFactory);
  }

  public DeserializationConfig getDeserializationConfig()
  {
    return this._deserializationConfig;
  }

  public DeserializerProvider getDeserializerProvider()
  {
    return this._deserializerProvider;
  }

  public JsonFactory getJsonFactory()
  {
    return this._jsonFactory;
  }

  public JsonNodeFactory getNodeFactory()
  {
    return this._deserializationConfig.getNodeFactory();
  }

  public SerializationConfig getSerializationConfig()
  {
    return this._serializationConfig;
  }

  public SerializerProvider getSerializerProvider()
  {
    return this._serializerProvider;
  }

  public SubtypeResolver getSubtypeResolver()
  {
    if (this._subtypeResolver == null)
      this._subtypeResolver = new StdSubtypeResolver();
    return this._subtypeResolver;
  }

  public TypeFactory getTypeFactory()
  {
    return this._typeFactory;
  }

  public VisibilityChecker<?> getVisibilityChecker()
  {
    return this._serializationConfig.getDefaultVisibilityChecker();
  }

  public boolean isEnabled(JsonGenerator.Feature paramFeature)
  {
    return this._jsonFactory.isEnabled(paramFeature);
  }

  public boolean isEnabled(JsonParser.Feature paramFeature)
  {
    return this._jsonFactory.isEnabled(paramFeature);
  }

  public boolean isEnabled(DeserializationConfig.Feature paramFeature)
  {
    return this._deserializationConfig.isEnabled(paramFeature);
  }

  public boolean isEnabled(SerializationConfig.Feature paramFeature)
  {
    return this._serializationConfig.isEnabled(paramFeature);
  }

  @Deprecated
  public ObjectWriter prettyPrintingWriter(PrettyPrinter paramPrettyPrinter)
  {
    return writer(paramPrettyPrinter);
  }

  public JsonNode readTree(JsonParser paramJsonParser)
    throws IOException, JsonProcessingException
  {
    DeserializationConfig localDeserializationConfig = copyDeserializationConfig();
    JsonNode localJsonNode;
    if ((paramJsonParser.getCurrentToken() == null) && (paramJsonParser.nextToken() == null))
      localJsonNode = null;
    do
    {
      return localJsonNode;
      localJsonNode = (JsonNode)_readValue(localDeserializationConfig, paramJsonParser, JSON_NODE_TYPE);
    }
    while (localJsonNode != null);
    return getNodeFactory().nullNode();
  }

  public JsonNode readTree(JsonParser paramJsonParser, DeserializationConfig paramDeserializationConfig)
    throws IOException, JsonProcessingException
  {
    Object localObject = (JsonNode)_readValue(paramDeserializationConfig, paramJsonParser, JSON_NODE_TYPE);
    if (localObject == null)
      localObject = NullNode.instance;
    return localObject;
  }

  public JsonNode readTree(File paramFile)
    throws IOException, JsonProcessingException
  {
    Object localObject = (JsonNode)_readMapAndClose(this._jsonFactory.createJsonParser(paramFile), JSON_NODE_TYPE);
    if (localObject == null)
      localObject = NullNode.instance;
    return localObject;
  }

  public JsonNode readTree(InputStream paramInputStream)
    throws IOException, JsonProcessingException
  {
    Object localObject = (JsonNode)_readMapAndClose(this._jsonFactory.createJsonParser(paramInputStream), JSON_NODE_TYPE);
    if (localObject == null)
      localObject = NullNode.instance;
    return localObject;
  }

  public JsonNode readTree(Reader paramReader)
    throws IOException, JsonProcessingException
  {
    Object localObject = (JsonNode)_readMapAndClose(this._jsonFactory.createJsonParser(paramReader), JSON_NODE_TYPE);
    if (localObject == null)
      localObject = NullNode.instance;
    return localObject;
  }

  public JsonNode readTree(String paramString)
    throws IOException, JsonProcessingException
  {
    Object localObject = (JsonNode)_readMapAndClose(this._jsonFactory.createJsonParser(paramString), JSON_NODE_TYPE);
    if (localObject == null)
      localObject = NullNode.instance;
    return localObject;
  }

  public JsonNode readTree(URL paramURL)
    throws IOException, JsonProcessingException
  {
    Object localObject = (JsonNode)_readMapAndClose(this._jsonFactory.createJsonParser(paramURL), JSON_NODE_TYPE);
    if (localObject == null)
      localObject = NullNode.instance;
    return localObject;
  }

  public JsonNode readTree(byte[] paramArrayOfByte)
    throws IOException, JsonProcessingException
  {
    Object localObject = (JsonNode)_readMapAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte), JSON_NODE_TYPE);
    if (localObject == null)
      localObject = NullNode.instance;
    return localObject;
  }

  public <T> T readValue(JsonNode paramJsonNode, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(copyDeserializationConfig(), treeAsTokens(paramJsonNode), paramJavaType);
  }

  public <T> T readValue(JsonNode paramJsonNode, TypeReference paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(copyDeserializationConfig(), treeAsTokens(paramJsonNode), this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(JsonNode paramJsonNode, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(copyDeserializationConfig(), treeAsTokens(paramJsonNode), this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(JsonParser paramJsonParser, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(copyDeserializationConfig(), paramJsonParser, paramJavaType);
  }

  public <T> T readValue(JsonParser paramJsonParser, JavaType paramJavaType, DeserializationConfig paramDeserializationConfig)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(paramDeserializationConfig, paramJsonParser, paramJavaType);
  }

  public <T> T readValue(JsonParser paramJsonParser, TypeReference<?> paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(copyDeserializationConfig(), paramJsonParser, this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(JsonParser paramJsonParser, TypeReference<?> paramTypeReference, DeserializationConfig paramDeserializationConfig)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(paramDeserializationConfig, paramJsonParser, this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(JsonParser paramJsonParser, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(copyDeserializationConfig(), paramJsonParser, this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(JsonParser paramJsonParser, Class<T> paramClass, DeserializationConfig paramDeserializationConfig)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readValue(paramDeserializationConfig, paramJsonParser, this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(File paramFile, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramFile), paramJavaType);
  }

  public <T> T readValue(File paramFile, TypeReference paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramFile), this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(File paramFile, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramFile), this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(InputStream paramInputStream, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramInputStream), paramJavaType);
  }

  public <T> T readValue(InputStream paramInputStream, TypeReference paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramInputStream), this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(InputStream paramInputStream, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramInputStream), this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(Reader paramReader, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramReader), paramJavaType);
  }

  public <T> T readValue(Reader paramReader, TypeReference paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramReader), this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(Reader paramReader, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramReader), this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(String paramString, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramString), paramJavaType);
  }

  public <T> T readValue(String paramString, TypeReference paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramString), this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(String paramString, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramString), this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(URL paramURL, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramURL), paramJavaType);
  }

  public <T> T readValue(URL paramURL, TypeReference paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramURL), this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(URL paramURL, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramURL), this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(byte[] paramArrayOfByte, int paramInt1, int paramInt2, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte, paramInt1, paramInt2), paramJavaType);
  }

  public <T> T readValue(byte[] paramArrayOfByte, int paramInt1, int paramInt2, TypeReference paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte, paramInt1, paramInt2), this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(byte[] paramArrayOfByte, int paramInt1, int paramInt2, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte, paramInt1, paramInt2), this._typeFactory.constructType(paramClass));
  }

  public <T> T readValue(byte[] paramArrayOfByte, JavaType paramJavaType)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte), paramJavaType);
  }

  public <T> T readValue(byte[] paramArrayOfByte, TypeReference paramTypeReference)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte), this._typeFactory.constructType(paramTypeReference));
  }

  public <T> T readValue(byte[] paramArrayOfByte, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return _readMapAndClose(this._jsonFactory.createJsonParser(paramArrayOfByte), this._typeFactory.constructType(paramClass));
  }

  public <T> MappingIterator<T> readValues(JsonParser paramJsonParser, JavaType paramJavaType)
    throws IOException, JsonProcessingException
  {
    DeserializationConfig localDeserializationConfig = copyDeserializationConfig();
    return new MappingIterator(paramJavaType, paramJsonParser, _createDeserializationContext(paramJsonParser, localDeserializationConfig), _findRootDeserializer(localDeserializationConfig, paramJavaType), false, null);
  }

  public <T> MappingIterator<T> readValues(JsonParser paramJsonParser, TypeReference<?> paramTypeReference)
    throws IOException, JsonProcessingException
  {
    return readValues(paramJsonParser, this._typeFactory.constructType(paramTypeReference));
  }

  public <T> MappingIterator<T> readValues(JsonParser paramJsonParser, Class<T> paramClass)
    throws IOException, JsonProcessingException
  {
    return readValues(paramJsonParser, this._typeFactory.constructType(paramClass));
  }

  public ObjectReader reader()
  {
    return new ObjectReader(this, copyDeserializationConfig()).withInjectableValues(this._injectableValues);
  }

  public ObjectReader reader(FormatSchema paramFormatSchema)
  {
    return new ObjectReader(this, copyDeserializationConfig(), null, null, paramFormatSchema, this._injectableValues);
  }

  public ObjectReader reader(InjectableValues paramInjectableValues)
  {
    return new ObjectReader(this, copyDeserializationConfig(), null, null, null, paramInjectableValues);
  }

  public ObjectReader reader(JsonNodeFactory paramJsonNodeFactory)
  {
    return new ObjectReader(this, copyDeserializationConfig()).withNodeFactory(paramJsonNodeFactory);
  }

  public ObjectReader reader(JavaType paramJavaType)
  {
    return new ObjectReader(this, copyDeserializationConfig(), paramJavaType, null, null, this._injectableValues);
  }

  public ObjectReader reader(TypeReference<?> paramTypeReference)
  {
    return reader(this._typeFactory.constructType(paramTypeReference));
  }

  public ObjectReader reader(Class<?> paramClass)
  {
    return reader(this._typeFactory.constructType(paramClass));
  }

  public ObjectReader readerForUpdating(Object paramObject)
  {
    JavaType localJavaType = this._typeFactory.constructType(paramObject.getClass());
    return new ObjectReader(this, copyDeserializationConfig(), localJavaType, paramObject, null, this._injectableValues);
  }

  public void registerModule(Module paramModule)
  {
    if (paramModule.getModuleName() == null)
      throw new IllegalArgumentException("Module without defined name");
    if (paramModule.version() == null)
      throw new IllegalArgumentException("Module without defined version");
    paramModule.setupModule(new Module.SetupContext()
    {
      public void addAbstractTypeResolver(AbstractTypeResolver paramAnonymousAbstractTypeResolver)
      {
        jdField_this._deserializerProvider = jdField_this._deserializerProvider.withAbstractTypeResolver(paramAnonymousAbstractTypeResolver);
      }

      public void addBeanDeserializerModifier(BeanDeserializerModifier paramAnonymousBeanDeserializerModifier)
      {
        jdField_this._deserializerProvider = jdField_this._deserializerProvider.withDeserializerModifier(paramAnonymousBeanDeserializerModifier);
      }

      public void addBeanSerializerModifier(BeanSerializerModifier paramAnonymousBeanSerializerModifier)
      {
        jdField_this._serializerFactory = jdField_this._serializerFactory.withSerializerModifier(paramAnonymousBeanSerializerModifier);
      }

      public void addDeserializers(Deserializers paramAnonymousDeserializers)
      {
        jdField_this._deserializerProvider = jdField_this._deserializerProvider.withAdditionalDeserializers(paramAnonymousDeserializers);
      }

      public void addKeyDeserializers(KeyDeserializers paramAnonymousKeyDeserializers)
      {
        jdField_this._deserializerProvider = jdField_this._deserializerProvider.withAdditionalKeyDeserializers(paramAnonymousKeyDeserializers);
      }

      public void addKeySerializers(Serializers paramAnonymousSerializers)
      {
        jdField_this._serializerFactory = jdField_this._serializerFactory.withAdditionalKeySerializers(paramAnonymousSerializers);
      }

      public void addSerializers(Serializers paramAnonymousSerializers)
      {
        jdField_this._serializerFactory = jdField_this._serializerFactory.withAdditionalSerializers(paramAnonymousSerializers);
      }

      public void addTypeModifier(TypeModifier paramAnonymousTypeModifier)
      {
        TypeFactory localTypeFactory = jdField_this._typeFactory.withModifier(paramAnonymousTypeModifier);
        jdField_this.setTypeFactory(localTypeFactory);
      }

      public void addValueInstantiators(ValueInstantiators paramAnonymousValueInstantiators)
      {
        jdField_this._deserializerProvider = jdField_this._deserializerProvider.withValueInstantiators(paramAnonymousValueInstantiators);
      }

      public void appendAnnotationIntrospector(AnnotationIntrospector paramAnonymousAnnotationIntrospector)
      {
        jdField_this._deserializationConfig = jdField_this._deserializationConfig.withAppendedAnnotationIntrospector(paramAnonymousAnnotationIntrospector);
        jdField_this._serializationConfig = jdField_this._serializationConfig.withAppendedAnnotationIntrospector(paramAnonymousAnnotationIntrospector);
      }

      public DeserializationConfig getDeserializationConfig()
      {
        return jdField_this.getDeserializationConfig();
      }

      public Version getMapperVersion()
      {
        return ObjectMapper.this.version();
      }

      public SerializationConfig getSerializationConfig()
      {
        return jdField_this.getSerializationConfig();
      }

      public void insertAnnotationIntrospector(AnnotationIntrospector paramAnonymousAnnotationIntrospector)
      {
        jdField_this._deserializationConfig = jdField_this._deserializationConfig.withInsertedAnnotationIntrospector(paramAnonymousAnnotationIntrospector);
        jdField_this._serializationConfig = jdField_this._serializationConfig.withInsertedAnnotationIntrospector(paramAnonymousAnnotationIntrospector);
      }

      public boolean isEnabled(JsonGenerator.Feature paramAnonymousFeature)
      {
        return jdField_this.isEnabled(paramAnonymousFeature);
      }

      public boolean isEnabled(JsonParser.Feature paramAnonymousFeature)
      {
        return jdField_this.isEnabled(paramAnonymousFeature);
      }

      public boolean isEnabled(DeserializationConfig.Feature paramAnonymousFeature)
      {
        return jdField_this.isEnabled(paramAnonymousFeature);
      }

      public boolean isEnabled(SerializationConfig.Feature paramAnonymousFeature)
      {
        return jdField_this.isEnabled(paramAnonymousFeature);
      }

      public void setMixInAnnotations(Class<?> paramAnonymousClass1, Class<?> paramAnonymousClass2)
      {
        jdField_this._deserializationConfig.addMixInAnnotations(paramAnonymousClass1, paramAnonymousClass2);
        jdField_this._serializationConfig.addMixInAnnotations(paramAnonymousClass1, paramAnonymousClass2);
      }
    });
  }

  public void registerSubtypes(NamedType[] paramArrayOfNamedType)
  {
    getSubtypeResolver().registerSubtypes(paramArrayOfNamedType);
  }

  public void registerSubtypes(Class<?>[] paramArrayOfClass)
  {
    getSubtypeResolver().registerSubtypes(paramArrayOfClass);
  }

  @Deprecated
  public ObjectReader schemaBasedReader(FormatSchema paramFormatSchema)
  {
    return reader(paramFormatSchema);
  }

  @Deprecated
  public ObjectWriter schemaBasedWriter(FormatSchema paramFormatSchema)
  {
    return writer(paramFormatSchema);
  }

  public ObjectMapper setAnnotationIntrospector(AnnotationIntrospector paramAnnotationIntrospector)
  {
    this._serializationConfig = this._serializationConfig.withAnnotationIntrospector(paramAnnotationIntrospector);
    this._deserializationConfig = this._deserializationConfig.withAnnotationIntrospector(paramAnnotationIntrospector);
    return this;
  }

  public void setDateFormat(DateFormat paramDateFormat)
  {
    this._deserializationConfig = this._deserializationConfig.withDateFormat(paramDateFormat);
    this._serializationConfig = this._serializationConfig.withDateFormat(paramDateFormat);
  }

  public ObjectMapper setDefaultTyping(TypeResolverBuilder<?> paramTypeResolverBuilder)
  {
    this._deserializationConfig = this._deserializationConfig.withTypeResolverBuilder(paramTypeResolverBuilder);
    this._serializationConfig = this._serializationConfig.withTypeResolverBuilder(paramTypeResolverBuilder);
    return this;
  }

  public ObjectMapper setDeserializationConfig(DeserializationConfig paramDeserializationConfig)
  {
    this._deserializationConfig = paramDeserializationConfig;
    return this;
  }

  public ObjectMapper setDeserializerProvider(DeserializerProvider paramDeserializerProvider)
  {
    this._deserializerProvider = paramDeserializerProvider;
    return this;
  }

  public void setFilters(FilterProvider paramFilterProvider)
  {
    this._serializationConfig = this._serializationConfig.withFilters(paramFilterProvider);
  }

  public void setHandlerInstantiator(HandlerInstantiator paramHandlerInstantiator)
  {
    this._deserializationConfig = this._deserializationConfig.withHandlerInstantiator(paramHandlerInstantiator);
    this._serializationConfig = this._serializationConfig.withHandlerInstantiator(paramHandlerInstantiator);
  }

  public ObjectMapper setInjectableValues(InjectableValues paramInjectableValues)
  {
    this._injectableValues = paramInjectableValues;
    return this;
  }

  public ObjectMapper setNodeFactory(JsonNodeFactory paramJsonNodeFactory)
  {
    this._deserializationConfig = this._deserializationConfig.withNodeFactory(paramJsonNodeFactory);
    return this;
  }

  public ObjectMapper setPropertyNamingStrategy(PropertyNamingStrategy paramPropertyNamingStrategy)
  {
    this._serializationConfig = this._serializationConfig.withPropertyNamingStrategy(paramPropertyNamingStrategy);
    this._deserializationConfig = this._deserializationConfig.withPropertyNamingStrategy(paramPropertyNamingStrategy);
    return this;
  }

  public ObjectMapper setSerializationConfig(SerializationConfig paramSerializationConfig)
  {
    this._serializationConfig = paramSerializationConfig;
    return this;
  }

  public ObjectMapper setSerializationInclusion(JsonSerialize.Inclusion paramInclusion)
  {
    this._serializationConfig = this._serializationConfig.withSerializationInclusion(paramInclusion);
    return this;
  }

  public ObjectMapper setSerializerFactory(SerializerFactory paramSerializerFactory)
  {
    this._serializerFactory = paramSerializerFactory;
    return this;
  }

  public ObjectMapper setSerializerProvider(SerializerProvider paramSerializerProvider)
  {
    this._serializerProvider = paramSerializerProvider;
    return this;
  }

  public void setSubtypeResolver(SubtypeResolver paramSubtypeResolver)
  {
    this._subtypeResolver = paramSubtypeResolver;
  }

  public ObjectMapper setTypeFactory(TypeFactory paramTypeFactory)
  {
    this._typeFactory = paramTypeFactory;
    this._deserializationConfig = this._deserializationConfig.withTypeFactory(paramTypeFactory);
    this._serializationConfig = this._serializationConfig.withTypeFactory(paramTypeFactory);
    return this;
  }

  public ObjectMapper setVisibility(JsonMethod paramJsonMethod, JsonAutoDetect.Visibility paramVisibility)
  {
    this._deserializationConfig = this._deserializationConfig.withVisibility(paramJsonMethod, paramVisibility);
    this._serializationConfig = this._serializationConfig.withVisibility(paramJsonMethod, paramVisibility);
    return this;
  }

  public void setVisibilityChecker(VisibilityChecker<?> paramVisibilityChecker)
  {
    this._deserializationConfig = this._deserializationConfig.withVisibilityChecker(paramVisibilityChecker);
    this._serializationConfig = this._serializationConfig.withVisibilityChecker(paramVisibilityChecker);
  }

  public JsonParser treeAsTokens(JsonNode paramJsonNode)
  {
    return new TreeTraversingParser(paramJsonNode, this);
  }

  public <T> T treeToValue(JsonNode paramJsonNode, Class<T> paramClass)
    throws IOException, JsonParseException, JsonMappingException
  {
    return readValue(treeAsTokens(paramJsonNode), paramClass);
  }

  @Deprecated
  public ObjectWriter typedWriter(JavaType paramJavaType)
  {
    return writerWithType(paramJavaType);
  }

  @Deprecated
  public ObjectWriter typedWriter(TypeReference<?> paramTypeReference)
  {
    return writerWithType(paramTypeReference);
  }

  @Deprecated
  public ObjectWriter typedWriter(Class<?> paramClass)
  {
    return writerWithType(paramClass);
  }

  @Deprecated
  public ObjectReader updatingReader(Object paramObject)
  {
    return readerForUpdating(paramObject);
  }

  public <T extends JsonNode> T valueToTree(Object paramObject)
    throws IllegalArgumentException
  {
    if (paramObject == null)
      return null;
    TokenBuffer localTokenBuffer = new TokenBuffer(this);
    try
    {
      writeValue(localTokenBuffer, paramObject);
      JsonParser localJsonParser = localTokenBuffer.asParser();
      JsonNode localJsonNode = readTree(localJsonParser);
      localJsonParser.close();
      return localJsonNode;
    }
    catch (IOException localIOException)
    {
      throw new IllegalArgumentException(localIOException.getMessage(), localIOException);
    }
  }

  public Version version()
  {
    return VersionUtil.versionFor(getClass());
  }

  @Deprecated
  public ObjectWriter viewWriter(Class<?> paramClass)
  {
    return writerWithView(paramClass);
  }

  public ObjectMapper withModule(Module paramModule)
  {
    registerModule(paramModule);
    return this;
  }

  public void writeTree(JsonGenerator paramJsonGenerator, JsonNode paramJsonNode)
    throws IOException, JsonProcessingException
  {
    SerializationConfig localSerializationConfig = copySerializationConfig();
    this._serializerProvider.serializeValue(localSerializationConfig, paramJsonGenerator, paramJsonNode, this._serializerFactory);
    if (localSerializationConfig.isEnabled(SerializationConfig.Feature.FLUSH_AFTER_WRITE_VALUE))
      paramJsonGenerator.flush();
  }

  public void writeTree(JsonGenerator paramJsonGenerator, JsonNode paramJsonNode, SerializationConfig paramSerializationConfig)
    throws IOException, JsonProcessingException
  {
    this._serializerProvider.serializeValue(paramSerializationConfig, paramJsonGenerator, paramJsonNode, this._serializerFactory);
    if (paramSerializationConfig.isEnabled(SerializationConfig.Feature.FLUSH_AFTER_WRITE_VALUE))
      paramJsonGenerator.flush();
  }

  public void writeValue(JsonGenerator paramJsonGenerator, Object paramObject)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    SerializationConfig localSerializationConfig = copySerializationConfig();
    if ((localSerializationConfig.isEnabled(SerializationConfig.Feature.CLOSE_CLOSEABLE)) && ((paramObject instanceof Closeable)))
      _writeCloseableValue(paramJsonGenerator, paramObject, localSerializationConfig);
    do
    {
      return;
      this._serializerProvider.serializeValue(localSerializationConfig, paramJsonGenerator, paramObject, this._serializerFactory);
    }
    while (!localSerializationConfig.isEnabled(SerializationConfig.Feature.FLUSH_AFTER_WRITE_VALUE));
    paramJsonGenerator.flush();
  }

  public void writeValue(JsonGenerator paramJsonGenerator, Object paramObject, SerializationConfig paramSerializationConfig)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    if ((paramSerializationConfig.isEnabled(SerializationConfig.Feature.CLOSE_CLOSEABLE)) && ((paramObject instanceof Closeable)))
      _writeCloseableValue(paramJsonGenerator, paramObject, paramSerializationConfig);
    do
    {
      return;
      this._serializerProvider.serializeValue(paramSerializationConfig, paramJsonGenerator, paramObject, this._serializerFactory);
    }
    while (!paramSerializationConfig.isEnabled(SerializationConfig.Feature.FLUSH_AFTER_WRITE_VALUE));
    paramJsonGenerator.flush();
  }

  public void writeValue(File paramFile, Object paramObject)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    _configAndWriteValue(this._jsonFactory.createJsonGenerator(paramFile, JsonEncoding.UTF8), paramObject);
  }

  public void writeValue(OutputStream paramOutputStream, Object paramObject)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    _configAndWriteValue(this._jsonFactory.createJsonGenerator(paramOutputStream, JsonEncoding.UTF8), paramObject);
  }

  public void writeValue(Writer paramWriter, Object paramObject)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    _configAndWriteValue(this._jsonFactory.createJsonGenerator(paramWriter), paramObject);
  }

  public byte[] writeValueAsBytes(Object paramObject)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    ByteArrayBuilder localByteArrayBuilder = new ByteArrayBuilder(this._jsonFactory._getBufferRecycler());
    _configAndWriteValue(this._jsonFactory.createJsonGenerator(localByteArrayBuilder, JsonEncoding.UTF8), paramObject);
    byte[] arrayOfByte = localByteArrayBuilder.toByteArray();
    localByteArrayBuilder.release();
    return arrayOfByte;
  }

  public String writeValueAsString(Object paramObject)
    throws IOException, JsonGenerationException, JsonMappingException
  {
    SegmentedStringWriter localSegmentedStringWriter = new SegmentedStringWriter(this._jsonFactory._getBufferRecycler());
    _configAndWriteValue(this._jsonFactory.createJsonGenerator(localSegmentedStringWriter), paramObject);
    return localSegmentedStringWriter.getAndClear();
  }

  public ObjectWriter writer()
  {
    return new ObjectWriter(this, copySerializationConfig());
  }

  public ObjectWriter writer(FormatSchema paramFormatSchema)
  {
    return new ObjectWriter(this, copySerializationConfig(), paramFormatSchema);
  }

  public ObjectWriter writer(PrettyPrinter paramPrettyPrinter)
  {
    if (paramPrettyPrinter == null)
      paramPrettyPrinter = ObjectWriter.NULL_PRETTY_PRINTER;
    return new ObjectWriter(this, copySerializationConfig(), null, paramPrettyPrinter);
  }

  public ObjectWriter writer(FilterProvider paramFilterProvider)
  {
    return new ObjectWriter(this, copySerializationConfig().withFilters(paramFilterProvider));
  }

  public ObjectWriter writer(DateFormat paramDateFormat)
  {
    return new ObjectWriter(this, copySerializationConfig().withDateFormat(paramDateFormat));
  }

  public ObjectWriter writerWithDefaultPrettyPrinter()
  {
    return new ObjectWriter(this, copySerializationConfig(), null, _defaultPrettyPrinter());
  }

  public ObjectWriter writerWithType(JavaType paramJavaType)
  {
    return new ObjectWriter(this, copySerializationConfig(), paramJavaType, null);
  }

  public ObjectWriter writerWithType(TypeReference<?> paramTypeReference)
  {
    if (paramTypeReference == null);
    for (JavaType localJavaType = null; ; localJavaType = this._typeFactory.constructType(paramTypeReference))
      return new ObjectWriter(this, copySerializationConfig(), localJavaType, null);
  }

  public ObjectWriter writerWithType(Class<?> paramClass)
  {
    if (paramClass == null);
    for (JavaType localJavaType = null; ; localJavaType = this._typeFactory.constructType(paramClass))
      return new ObjectWriter(this, copySerializationConfig(), localJavaType, null);
  }

  public ObjectWriter writerWithView(Class<?> paramClass)
  {
    return new ObjectWriter(this, copySerializationConfig().withView(paramClass));
  }

  public static class DefaultTypeResolverBuilder extends StdTypeResolverBuilder
  {
    protected final ObjectMapper.DefaultTyping _appliesFor;

    public DefaultTypeResolverBuilder(ObjectMapper.DefaultTyping paramDefaultTyping)
    {
      this._appliesFor = paramDefaultTyping;
    }

    public TypeDeserializer buildTypeDeserializer(DeserializationConfig paramDeserializationConfig, JavaType paramJavaType, Collection<NamedType> paramCollection, BeanProperty paramBeanProperty)
    {
      if (useForType(paramJavaType))
        return super.buildTypeDeserializer(paramDeserializationConfig, paramJavaType, paramCollection, paramBeanProperty);
      return null;
    }

    public TypeSerializer buildTypeSerializer(SerializationConfig paramSerializationConfig, JavaType paramJavaType, Collection<NamedType> paramCollection, BeanProperty paramBeanProperty)
    {
      if (useForType(paramJavaType))
        return super.buildTypeSerializer(paramSerializationConfig, paramJavaType, paramCollection, paramBeanProperty);
      return null;
    }

    public boolean useForType(JavaType paramJavaType)
    {
      switch (ObjectMapper.2.$SwitchMap$org$codehaus$jackson$map$ObjectMapper$DefaultTyping[this._appliesFor.ordinal()])
      {
      default:
        if (paramJavaType.getRawClass() != Object.class)
          break;
      case 1:
      case 2:
      case 3:
        do
        {
          return true;
          if (paramJavaType.isArrayType())
            paramJavaType = paramJavaType.getContentType();
          boolean bool1;
          if (paramJavaType.getRawClass() != Object.class)
          {
            boolean bool2 = paramJavaType.isConcrete();
            bool1 = false;
            if (bool2);
          }
          else
          {
            bool1 = true;
          }
          return bool1;
          if (paramJavaType.isArrayType())
            paramJavaType = paramJavaType.getContentType();
        }
        while (!paramJavaType.isFinal());
        return false;
      }
      return false;
    }
  }

  public static enum DefaultTyping
  {
    static
    {
      NON_CONCRETE_AND_ARRAYS = new DefaultTyping("NON_CONCRETE_AND_ARRAYS", 2);
      NON_FINAL = new DefaultTyping("NON_FINAL", 3);
      DefaultTyping[] arrayOfDefaultTyping = new DefaultTyping[4];
      arrayOfDefaultTyping[0] = JAVA_LANG_OBJECT;
      arrayOfDefaultTyping[1] = OBJECT_AND_NON_CONCRETE;
      arrayOfDefaultTyping[2] = NON_CONCRETE_AND_ARRAYS;
      arrayOfDefaultTyping[3] = NON_FINAL;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ObjectMapper
 * JD-Core Version:    0.6.2
 */