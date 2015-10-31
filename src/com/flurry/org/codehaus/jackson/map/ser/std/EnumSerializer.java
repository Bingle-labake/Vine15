package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.io.SerializedString;
import com.flurry.org.codehaus.jackson.map.AnnotationIntrospector;
import com.flurry.org.codehaus.jackson.map.SerializationConfig;
import com.flurry.org.codehaus.jackson.map.SerializationConfig.Feature;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.map.introspect.BasicBeanDescription;
import com.flurry.org.codehaus.jackson.map.util.EnumValues;
import com.flurry.org.codehaus.jackson.node.ArrayNode;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.Iterator;

@JacksonStdImpl
public class EnumSerializer extends ScalarSerializerBase<Enum<?>>
{
  protected final EnumValues _values;

  public EnumSerializer(EnumValues paramEnumValues)
  {
    super(Enum.class, false);
    this._values = paramEnumValues;
  }

  public static EnumSerializer construct(Class<Enum<?>> paramClass, SerializationConfig paramSerializationConfig, BasicBeanDescription paramBasicBeanDescription)
  {
    AnnotationIntrospector localAnnotationIntrospector = paramSerializationConfig.getAnnotationIntrospector();
    if (paramSerializationConfig.isEnabled(SerializationConfig.Feature.WRITE_ENUMS_USING_TO_STRING));
    for (EnumValues localEnumValues = EnumValues.constructFromToString(paramClass, localAnnotationIntrospector); ; localEnumValues = EnumValues.constructFromName(paramClass, localAnnotationIntrospector))
      return new EnumSerializer(localEnumValues);
  }

  public EnumValues getEnumValues()
  {
    return this._values;
  }

  public JsonNode getSchema(SerializerProvider paramSerializerProvider, Type paramType)
  {
    ObjectNode localObjectNode;
    if (paramSerializerProvider.isEnabled(SerializationConfig.Feature.WRITE_ENUMS_USING_INDEX))
      localObjectNode = createSchemaNode("integer", true);
    while (true)
    {
      return localObjectNode;
      localObjectNode = createSchemaNode("string", true);
      if ((paramType != null) && (paramSerializerProvider.constructType(paramType).isEnumType()))
      {
        ArrayNode localArrayNode = localObjectNode.putArray("enum");
        Iterator localIterator = this._values.values().iterator();
        while (localIterator.hasNext())
          localArrayNode.add(((SerializedString)localIterator.next()).getValue());
      }
    }
  }

  public final void serialize(Enum<?> paramEnum, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    if (paramSerializerProvider.isEnabled(SerializationConfig.Feature.WRITE_ENUMS_USING_INDEX))
    {
      paramJsonGenerator.writeNumber(paramEnum.ordinal());
      return;
    }
    paramJsonGenerator.writeString(this._values.serializedValueFor(paramEnum));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.EnumSerializer
 * JD-Core Version:    0.6.2
 */