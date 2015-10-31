package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.map.JsonSerializableWithType;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import java.io.IOException;

@JacksonStdImpl
public class SerializableWithTypeSerializer extends SerializerBase<JsonSerializableWithType>
{
  public static final SerializableWithTypeSerializer instance = new SerializableWithTypeSerializer();

  protected SerializableWithTypeSerializer()
  {
    super(JsonSerializableWithType.class);
  }

  // ERROR //
  public com.flurry.org.codehaus.jackson.JsonNode getSchema(SerializerProvider paramSerializerProvider, java.lang.reflect.Type paramType)
    throws com.flurry.org.codehaus.jackson.map.JsonMappingException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 30	com/flurry/org/codehaus/jackson/map/ser/std/SerializableWithTypeSerializer:createObjectNode	()Lcom/flurry/org/codehaus/jackson/node/ObjectNode;
    //   4: astore_3
    //   5: ldc 32
    //   7: astore 4
    //   9: aconst_null
    //   10: astore 5
    //   12: aconst_null
    //   13: astore 6
    //   15: aload_2
    //   16: ifnull +112 -> 128
    //   19: aload_2
    //   20: invokestatic 38	com/flurry/org/codehaus/jackson/map/type/TypeFactory:rawClass	(Ljava/lang/reflect/Type;)Ljava/lang/Class;
    //   23: astore 11
    //   25: aload 11
    //   27: ldc 40
    //   29: invokevirtual 46	java/lang/Class:isAnnotationPresent	(Ljava/lang/Class;)Z
    //   32: istore 12
    //   34: aconst_null
    //   35: astore 5
    //   37: aconst_null
    //   38: astore 6
    //   40: iload 12
    //   42: ifeq +86 -> 128
    //   45: aload 11
    //   47: ldc 40
    //   49: invokevirtual 50	java/lang/Class:getAnnotation	(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    //   52: checkcast 40	com/flurry/org/codehaus/jackson/schema/JsonSerializableSchema
    //   55: astore 13
    //   57: aload 13
    //   59: invokeinterface 54 1 0
    //   64: astore 4
    //   66: ldc 56
    //   68: aload 13
    //   70: invokeinterface 59 1 0
    //   75: invokevirtual 65	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   78: istore 14
    //   80: aconst_null
    //   81: astore 6
    //   83: iload 14
    //   85: ifne +12 -> 97
    //   88: aload 13
    //   90: invokeinterface 59 1 0
    //   95: astore 6
    //   97: ldc 56
    //   99: aload 13
    //   101: invokeinterface 68 1 0
    //   106: invokevirtual 65	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   109: istore 15
    //   111: aconst_null
    //   112: astore 5
    //   114: iload 15
    //   116: ifne +12 -> 128
    //   119: aload 13
    //   121: invokeinterface 68 1 0
    //   126: astore 5
    //   128: aload_3
    //   129: ldc 70
    //   131: aload 4
    //   133: invokevirtual 76	com/flurry/org/codehaus/jackson/node/ObjectNode:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   136: aload 6
    //   138: ifnull +27 -> 165
    //   141: aload_3
    //   142: ldc 78
    //   144: new 80	com/flurry/org/codehaus/jackson/map/ObjectMapper
    //   147: dup
    //   148: invokespecial 81	com/flurry/org/codehaus/jackson/map/ObjectMapper:<init>	()V
    //   151: aload 6
    //   153: ldc 83
    //   155: invokevirtual 87	com/flurry/org/codehaus/jackson/map/ObjectMapper:readValue	(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    //   158: checkcast 83	com/flurry/org/codehaus/jackson/JsonNode
    //   161: invokevirtual 90	com/flurry/org/codehaus/jackson/node/ObjectNode:put	(Ljava/lang/String;Lcom/flurry/org/codehaus/jackson/JsonNode;)Lcom/flurry/org/codehaus/jackson/JsonNode;
    //   164: pop
    //   165: aload 5
    //   167: ifnull +27 -> 194
    //   170: aload_3
    //   171: ldc 92
    //   173: new 80	com/flurry/org/codehaus/jackson/map/ObjectMapper
    //   176: dup
    //   177: invokespecial 81	com/flurry/org/codehaus/jackson/map/ObjectMapper:<init>	()V
    //   180: aload 5
    //   182: ldc 83
    //   184: invokevirtual 87	com/flurry/org/codehaus/jackson/map/ObjectMapper:readValue	(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    //   187: checkcast 83	com/flurry/org/codehaus/jackson/JsonNode
    //   190: invokevirtual 90	com/flurry/org/codehaus/jackson/node/ObjectNode:put	(Ljava/lang/String;Lcom/flurry/org/codehaus/jackson/JsonNode;)Lcom/flurry/org/codehaus/jackson/JsonNode;
    //   193: pop
    //   194: aload_3
    //   195: areturn
    //   196: astore 9
    //   198: new 94	java/lang/IllegalStateException
    //   201: dup
    //   202: aload 9
    //   204: invokespecial 97	java/lang/IllegalStateException:<init>	(Ljava/lang/Throwable;)V
    //   207: athrow
    //   208: astore 7
    //   210: new 94	java/lang/IllegalStateException
    //   213: dup
    //   214: aload 7
    //   216: invokespecial 97	java/lang/IllegalStateException:<init>	(Ljava/lang/Throwable;)V
    //   219: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   141	165	196	java/io/IOException
    //   170	194	208	java/io/IOException
  }

  public void serialize(JsonSerializableWithType paramJsonSerializableWithType, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    paramJsonSerializableWithType.serialize(paramJsonGenerator, paramSerializerProvider);
  }

  public final void serializeWithType(JsonSerializableWithType paramJsonSerializableWithType, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
    throws IOException, JsonGenerationException
  {
    paramJsonSerializableWithType.serializeWithType(paramJsonGenerator, paramSerializerProvider, paramTypeSerializer);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.SerializableWithTypeSerializer
 * JD-Core Version:    0.6.2
 */