package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.map.JsonSerializable;
import com.flurry.org.codehaus.jackson.map.JsonSerializableWithType;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.map.ser.SerializerBase;
import java.io.IOException;

@JacksonStdImpl
public class SerializableSerializer extends SerializerBase<JsonSerializable>
{
  public static final SerializableSerializer instance = new SerializableSerializer();

  protected SerializableSerializer()
  {
    super(JsonSerializable.class);
  }

  // ERROR //
  public com.flurry.org.codehaus.jackson.JsonNode getSchema(SerializerProvider paramSerializerProvider, java.lang.reflect.Type paramType)
    throws com.flurry.org.codehaus.jackson.map.JsonMappingException
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 30	com/flurry/org/codehaus/jackson/map/ser/std/SerializableSerializer:createObjectNode	()Lcom/flurry/org/codehaus/jackson/node/ObjectNode;
    //   4: astore_3
    //   5: ldc 32
    //   7: astore 4
    //   9: aconst_null
    //   10: astore 5
    //   12: aconst_null
    //   13: astore 6
    //   15: aload_2
    //   16: ifnull +115 -> 131
    //   19: aload_2
    //   20: invokestatic 38	com/flurry/org/codehaus/jackson/map/type/TypeFactory:type	(Ljava/lang/reflect/Type;)Lcom/flurry/org/codehaus/jackson/type/JavaType;
    //   23: invokevirtual 44	com/flurry/org/codehaus/jackson/type/JavaType:getRawClass	()Ljava/lang/Class;
    //   26: astore 11
    //   28: aload 11
    //   30: ldc 46
    //   32: invokevirtual 52	java/lang/Class:isAnnotationPresent	(Ljava/lang/Class;)Z
    //   35: istore 12
    //   37: aconst_null
    //   38: astore 5
    //   40: aconst_null
    //   41: astore 6
    //   43: iload 12
    //   45: ifeq +86 -> 131
    //   48: aload 11
    //   50: ldc 46
    //   52: invokevirtual 56	java/lang/Class:getAnnotation	(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;
    //   55: checkcast 46	com/flurry/org/codehaus/jackson/schema/JsonSerializableSchema
    //   58: astore 13
    //   60: aload 13
    //   62: invokeinterface 60 1 0
    //   67: astore 4
    //   69: ldc 62
    //   71: aload 13
    //   73: invokeinterface 65 1 0
    //   78: invokevirtual 71	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   81: istore 14
    //   83: aconst_null
    //   84: astore 6
    //   86: iload 14
    //   88: ifne +12 -> 100
    //   91: aload 13
    //   93: invokeinterface 65 1 0
    //   98: astore 6
    //   100: ldc 62
    //   102: aload 13
    //   104: invokeinterface 74 1 0
    //   109: invokevirtual 71	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   112: istore 15
    //   114: aconst_null
    //   115: astore 5
    //   117: iload 15
    //   119: ifne +12 -> 131
    //   122: aload 13
    //   124: invokeinterface 74 1 0
    //   129: astore 5
    //   131: aload_3
    //   132: ldc 75
    //   134: aload 4
    //   136: invokevirtual 81	com/flurry/org/codehaus/jackson/node/ObjectNode:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   139: aload 6
    //   141: ifnull +27 -> 168
    //   144: aload_3
    //   145: ldc 83
    //   147: new 85	com/flurry/org/codehaus/jackson/map/ObjectMapper
    //   150: dup
    //   151: invokespecial 86	com/flurry/org/codehaus/jackson/map/ObjectMapper:<init>	()V
    //   154: aload 6
    //   156: ldc 88
    //   158: invokevirtual 92	com/flurry/org/codehaus/jackson/map/ObjectMapper:readValue	(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    //   161: checkcast 88	com/flurry/org/codehaus/jackson/JsonNode
    //   164: invokevirtual 95	com/flurry/org/codehaus/jackson/node/ObjectNode:put	(Ljava/lang/String;Lcom/flurry/org/codehaus/jackson/JsonNode;)Lcom/flurry/org/codehaus/jackson/JsonNode;
    //   167: pop
    //   168: aload 5
    //   170: ifnull +27 -> 197
    //   173: aload_3
    //   174: ldc 97
    //   176: new 85	com/flurry/org/codehaus/jackson/map/ObjectMapper
    //   179: dup
    //   180: invokespecial 86	com/flurry/org/codehaus/jackson/map/ObjectMapper:<init>	()V
    //   183: aload 5
    //   185: ldc 88
    //   187: invokevirtual 92	com/flurry/org/codehaus/jackson/map/ObjectMapper:readValue	(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;
    //   190: checkcast 88	com/flurry/org/codehaus/jackson/JsonNode
    //   193: invokevirtual 95	com/flurry/org/codehaus/jackson/node/ObjectNode:put	(Ljava/lang/String;Lcom/flurry/org/codehaus/jackson/JsonNode;)Lcom/flurry/org/codehaus/jackson/JsonNode;
    //   196: pop
    //   197: aload_3
    //   198: areturn
    //   199: astore 9
    //   201: new 99	java/lang/IllegalStateException
    //   204: dup
    //   205: aload 9
    //   207: invokespecial 102	java/lang/IllegalStateException:<init>	(Ljava/lang/Throwable;)V
    //   210: athrow
    //   211: astore 7
    //   213: new 99	java/lang/IllegalStateException
    //   216: dup
    //   217: aload 7
    //   219: invokespecial 102	java/lang/IllegalStateException:<init>	(Ljava/lang/Throwable;)V
    //   222: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   144	168	199	java/io/IOException
    //   173	197	211	java/io/IOException
  }

  public void serialize(JsonSerializable paramJsonSerializable, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    paramJsonSerializable.serialize(paramJsonGenerator, paramSerializerProvider);
  }

  public final void serializeWithType(JsonSerializable paramJsonSerializable, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
    throws IOException, JsonGenerationException
  {
    if ((paramJsonSerializable instanceof JsonSerializableWithType))
    {
      ((JsonSerializableWithType)paramJsonSerializable).serializeWithType(paramJsonGenerator, paramSerializerProvider, paramTypeSerializer);
      return;
    }
    serialize(paramJsonSerializable, paramJsonGenerator, paramSerializerProvider);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.SerializableSerializer
 * JD-Core Version:    0.6.2
 */