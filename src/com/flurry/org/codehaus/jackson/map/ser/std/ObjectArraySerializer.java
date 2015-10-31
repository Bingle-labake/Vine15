package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.ResolvableSerializer;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.map.ser.impl.PropertySerializerMap;
import com.flurry.org.codehaus.jackson.map.ser.impl.PropertySerializerMap.SerializerAndMapResult;
import com.flurry.org.codehaus.jackson.map.type.ArrayType;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import com.flurry.org.codehaus.jackson.schema.JsonSchema;
import com.flurry.org.codehaus.jackson.schema.SchemaAware;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;

@JacksonStdImpl
public class ObjectArraySerializer extends StdArraySerializers.ArraySerializerBase<Object[]>
  implements ResolvableSerializer
{
  protected PropertySerializerMap _dynamicSerializers;
  protected JsonSerializer<Object> _elementSerializer;
  protected final JavaType _elementType;
  protected final boolean _staticTyping;

  @Deprecated
  public ObjectArraySerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty)
  {
    this(paramJavaType, paramBoolean, paramTypeSerializer, paramBeanProperty, null);
  }

  public ObjectArraySerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty, JsonSerializer<Object> paramJsonSerializer)
  {
    super([Ljava.lang.Object.class, paramTypeSerializer, paramBeanProperty);
    this._elementType = paramJavaType;
    this._staticTyping = paramBoolean;
    this._dynamicSerializers = PropertySerializerMap.emptyMap();
    this._elementSerializer = paramJsonSerializer;
  }

  protected final JsonSerializer<Object> _findAndAddDynamic(PropertySerializerMap paramPropertySerializerMap, JavaType paramJavaType, SerializerProvider paramSerializerProvider)
    throws JsonMappingException
  {
    PropertySerializerMap.SerializerAndMapResult localSerializerAndMapResult = paramPropertySerializerMap.findAndAddSerializer(paramJavaType, paramSerializerProvider, this._property);
    if (paramPropertySerializerMap != localSerializerAndMapResult.map)
      this._dynamicSerializers = localSerializerAndMapResult.map;
    return localSerializerAndMapResult.serializer;
  }

  protected final JsonSerializer<Object> _findAndAddDynamic(PropertySerializerMap paramPropertySerializerMap, Class<?> paramClass, SerializerProvider paramSerializerProvider)
    throws JsonMappingException
  {
    PropertySerializerMap.SerializerAndMapResult localSerializerAndMapResult = paramPropertySerializerMap.findAndAddSerializer(paramClass, paramSerializerProvider, this._property);
    if (paramPropertySerializerMap != localSerializerAndMapResult.map)
      this._dynamicSerializers = localSerializerAndMapResult.map;
    return localSerializerAndMapResult.serializer;
  }

  public ContainerSerializerBase<?> _withValueTypeSerializer(TypeSerializer paramTypeSerializer)
  {
    return new ObjectArraySerializer(this._elementType, this._staticTyping, paramTypeSerializer, this._property, this._elementSerializer);
  }

  public JsonNode getSchema(SerializerProvider paramSerializerProvider, Type paramType)
    throws JsonMappingException
  {
    ObjectNode localObjectNode = createSchemaNode("array", true);
    Class localClass;
    if (paramType != null)
    {
      JavaType localJavaType = paramSerializerProvider.constructType(paramType);
      if (localJavaType.isArrayType())
      {
        localClass = ((ArrayType)localJavaType).getContentType().getRawClass();
        if (localClass != Object.class)
          break label59;
        localObjectNode.put("items", JsonSchema.getDefaultSchemaNode());
      }
    }
    return localObjectNode;
    label59: JsonSerializer localJsonSerializer = paramSerializerProvider.findValueSerializer(localClass, this._property);
    if ((localJsonSerializer instanceof SchemaAware));
    for (JsonNode localJsonNode = ((SchemaAware)localJsonSerializer).getSchema(paramSerializerProvider, null); ; localJsonNode = JsonSchema.getDefaultSchemaNode())
    {
      localObjectNode.put("items", localJsonNode);
      return localObjectNode;
    }
  }

  public void resolve(SerializerProvider paramSerializerProvider)
    throws JsonMappingException
  {
    if ((this._staticTyping) && (this._elementSerializer == null))
      this._elementSerializer = paramSerializerProvider.findValueSerializer(this._elementType, this._property);
  }

  public void serializeContents(Object[] paramArrayOfObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    int i = paramArrayOfObject.length;
    if (i == 0)
      return;
    if (this._elementSerializer != null)
    {
      serializeContentsUsing(paramArrayOfObject, paramJsonGenerator, paramSerializerProvider, this._elementSerializer);
      return;
    }
    if (this._valueTypeSerializer != null)
    {
      serializeTypedContents(paramArrayOfObject, paramJsonGenerator, paramSerializerProvider);
      return;
    }
    int j = 0;
    Object localObject1 = null;
    while (true)
    {
      try
      {
        localPropertySerializerMap = this._dynamicSerializers;
        if (j >= i)
          break;
        localObject1 = paramArrayOfObject[j];
        if (localObject1 == null)
        {
          paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
        }
        else
        {
          localClass = localObject1.getClass();
          localObject3 = localPropertySerializerMap.serializerFor(localClass);
          if (localObject3 == null)
          {
            if (this._elementType.hasGenericTypes())
              localObject3 = _findAndAddDynamic(localPropertySerializerMap, paramSerializerProvider.constructSpecializedType(this._elementType, localClass), paramSerializerProvider);
          }
          else
            ((JsonSerializer)localObject3).serialize(localObject1, paramJsonGenerator, paramSerializerProvider);
        }
      }
      catch (IOException localIOException)
      {
        PropertySerializerMap localPropertySerializerMap;
        Class localClass;
        throw localIOException;
        JsonSerializer localJsonSerializer = _findAndAddDynamic(localPropertySerializerMap, localClass, paramSerializerProvider);
        Object localObject3 = localJsonSerializer;
        continue;
      }
      catch (Exception localException)
      {
        Object localObject2 = localException;
        if (((localObject2 instanceof InvocationTargetException)) && (((Throwable)localObject2).getCause() != null))
        {
          localObject2 = ((Throwable)localObject2).getCause();
          continue;
        }
        if ((localObject2 instanceof Error))
          throw ((Error)localObject2);
        throw JsonMappingException.wrapWithPath((Throwable)localObject2, localObject1, j);
      }
      j++;
    }
  }

  public void serializeContentsUsing(Object[] paramArrayOfObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, JsonSerializer<Object> paramJsonSerializer)
    throws IOException, JsonGenerationException
  {
    int i = paramArrayOfObject.length;
    TypeSerializer localTypeSerializer = this._valueTypeSerializer;
    int j = 0;
    Object localObject1 = null;
    while (true)
    {
      if (j < i)
        try
        {
          localObject1 = paramArrayOfObject[j];
          if (localObject1 == null)
            paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
          else if (localTypeSerializer == null)
            paramJsonSerializer.serialize(localObject1, paramJsonGenerator, paramSerializerProvider);
        }
        catch (IOException localIOException)
        {
          throw localIOException;
          paramJsonSerializer.serializeWithType(localObject1, paramJsonGenerator, paramSerializerProvider, localTypeSerializer);
        }
        catch (Exception localException)
        {
          for (Object localObject2 = localException; ((localObject2 instanceof InvocationTargetException)) && (((Throwable)localObject2).getCause() != null); localObject2 = ((Throwable)localObject2).getCause());
          if ((localObject2 instanceof Error))
            throw ((Error)localObject2);
          throw JsonMappingException.wrapWithPath((Throwable)localObject2, localObject1, j);
        }
      else
        return;
      j++;
    }
  }

  public void serializeTypedContents(Object[] paramArrayOfObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    int i = paramArrayOfObject.length;
    TypeSerializer localTypeSerializer = this._valueTypeSerializer;
    int j = 0;
    Object localObject1 = null;
    while (true)
    {
      try
      {
        PropertySerializerMap localPropertySerializerMap = this._dynamicSerializers;
        if (j < i)
        {
          localObject1 = paramArrayOfObject[j];
          if (localObject1 == null)
          {
            paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
          }
          else
          {
            Class localClass = localObject1.getClass();
            JsonSerializer localJsonSerializer = localPropertySerializerMap.serializerFor(localClass);
            if (localJsonSerializer == null)
              localJsonSerializer = _findAndAddDynamic(localPropertySerializerMap, localClass, paramSerializerProvider);
            localJsonSerializer.serializeWithType(localObject1, paramJsonGenerator, paramSerializerProvider, localTypeSerializer);
          }
        }
      }
      catch (IOException localIOException)
      {
        throw localIOException;
      }
      catch (Exception localException)
      {
        Object localObject2 = localException;
        if (((localObject2 instanceof InvocationTargetException)) && (((Throwable)localObject2).getCause() != null))
        {
          localObject2 = ((Throwable)localObject2).getCause();
          continue;
        }
        if ((localObject2 instanceof Error))
          throw ((Error)localObject2);
        throw JsonMappingException.wrapWithPath((Throwable)localObject2, localObject1, j);
      }
      return;
      j++;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.ObjectArraySerializer
 * JD-Core Version:    0.6.2
 */