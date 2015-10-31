package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.JsonNode;
import com.flurry.org.codehaus.jackson.map.JsonMappingException;
import com.flurry.org.codehaus.jackson.map.JsonMappingException.Reference;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.ResolvableSerializer;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.ser.AnyGetterWriter;
import com.flurry.org.codehaus.jackson.map.ser.BeanPropertyFilter;
import com.flurry.org.codehaus.jackson.map.ser.BeanPropertyWriter;
import com.flurry.org.codehaus.jackson.map.ser.FilterProvider;
import com.flurry.org.codehaus.jackson.node.ObjectNode;
import com.flurry.org.codehaus.jackson.schema.JsonSchema;
import com.flurry.org.codehaus.jackson.schema.SchemaAware;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.lang.reflect.Type;

public abstract class BeanSerializerBase extends SerializerBase<Object>
  implements ResolvableSerializer, SchemaAware
{
  protected static final BeanPropertyWriter[] NO_PROPS = new BeanPropertyWriter[0];
  protected final AnyGetterWriter _anyGetterWriter;
  protected final BeanPropertyWriter[] _filteredProps;
  protected final Object _propertyFilterId;
  protected final BeanPropertyWriter[] _props;

  protected BeanSerializerBase(BeanSerializerBase paramBeanSerializerBase)
  {
    this(paramBeanSerializerBase._handledType, paramBeanSerializerBase._props, paramBeanSerializerBase._filteredProps, paramBeanSerializerBase._anyGetterWriter, paramBeanSerializerBase._propertyFilterId);
  }

  protected BeanSerializerBase(JavaType paramJavaType, BeanPropertyWriter[] paramArrayOfBeanPropertyWriter1, BeanPropertyWriter[] paramArrayOfBeanPropertyWriter2, AnyGetterWriter paramAnyGetterWriter, Object paramObject)
  {
    super(paramJavaType);
    this._props = paramArrayOfBeanPropertyWriter1;
    this._filteredProps = paramArrayOfBeanPropertyWriter2;
    this._anyGetterWriter = paramAnyGetterWriter;
    this._propertyFilterId = paramObject;
  }

  public BeanSerializerBase(Class<?> paramClass, BeanPropertyWriter[] paramArrayOfBeanPropertyWriter1, BeanPropertyWriter[] paramArrayOfBeanPropertyWriter2, AnyGetterWriter paramAnyGetterWriter, Object paramObject)
  {
    super(paramClass);
    this._props = paramArrayOfBeanPropertyWriter1;
    this._filteredProps = paramArrayOfBeanPropertyWriter2;
    this._anyGetterWriter = paramAnyGetterWriter;
    this._propertyFilterId = paramObject;
  }

  protected BeanPropertyFilter findFilter(SerializerProvider paramSerializerProvider)
    throws JsonMappingException
  {
    Object localObject = this._propertyFilterId;
    FilterProvider localFilterProvider = paramSerializerProvider.getFilterProvider();
    if (localFilterProvider == null)
      throw new JsonMappingException("Can not resolve BeanPropertyFilter with id '" + localObject + "'; no FilterProvider configured");
    return localFilterProvider.findFilter(localObject);
  }

  public JsonNode getSchema(SerializerProvider paramSerializerProvider, Type paramType)
    throws JsonMappingException
  {
    ObjectNode localObjectNode1 = createSchemaNode("object", true);
    ObjectNode localObjectNode2 = localObjectNode1.objectNode();
    int i = 0;
    if (i < this._props.length)
    {
      BeanPropertyWriter localBeanPropertyWriter = this._props[i];
      JavaType localJavaType = localBeanPropertyWriter.getSerializationType();
      Object localObject;
      label55: JsonSerializer localJsonSerializer;
      if (localJavaType == null)
      {
        localObject = localBeanPropertyWriter.getGenericPropertyType();
        localJsonSerializer = localBeanPropertyWriter.getSerializer();
        if (localJsonSerializer == null)
        {
          Class localClass = localBeanPropertyWriter.getRawSerializationType();
          if (localClass == null)
            localClass = localBeanPropertyWriter.getPropertyType();
          localJsonSerializer = paramSerializerProvider.findValueSerializer(localClass, localBeanPropertyWriter);
        }
        if (!(localJsonSerializer instanceof SchemaAware))
          break label148;
      }
      label148: for (JsonNode localJsonNode = ((SchemaAware)localJsonSerializer).getSchema(paramSerializerProvider, (Type)localObject); ; localJsonNode = JsonSchema.getDefaultSchemaNode())
      {
        localObjectNode2.put(localBeanPropertyWriter.getName(), localJsonNode);
        i++;
        break;
        localObject = localJavaType.getRawClass();
        break label55;
      }
    }
    localObjectNode1.put("properties", localObjectNode2);
    return localObjectNode1;
  }

  public void resolve(SerializerProvider paramSerializerProvider)
    throws JsonMappingException
  {
    int i;
    int j;
    label18: BeanPropertyWriter localBeanPropertyWriter1;
    if (this._filteredProps == null)
    {
      i = 0;
      j = 0;
      int k = this._props.length;
      if (j >= k)
        break label219;
      localBeanPropertyWriter1 = this._props[j];
      if (!localBeanPropertyWriter1.hasSerializer())
        break label55;
    }
    while (true)
    {
      j++;
      break label18;
      i = this._filteredProps.length;
      break;
      label55: JavaType localJavaType = localBeanPropertyWriter1.getSerializationType();
      if (localJavaType == null)
      {
        localJavaType = paramSerializerProvider.constructType(localBeanPropertyWriter1.getGenericPropertyType());
        if (!localJavaType.isFinal())
        {
          if ((!localJavaType.isContainerType()) && (localJavaType.containedTypeCount() <= 0))
            continue;
          localBeanPropertyWriter1.setNonTrivialBaseType(localJavaType);
        }
      }
      else
      {
        Object localObject = paramSerializerProvider.findValueSerializer(localJavaType, localBeanPropertyWriter1);
        if (localJavaType.isContainerType())
        {
          TypeSerializer localTypeSerializer = (TypeSerializer)localJavaType.getContentType().getTypeHandler();
          if ((localTypeSerializer != null) && ((localObject instanceof ContainerSerializerBase)))
            localObject = ((ContainerSerializerBase)localObject).withValueTypeSerializer(localTypeSerializer);
        }
        BeanPropertyWriter localBeanPropertyWriter2 = localBeanPropertyWriter1.withSerializer((JsonSerializer)localObject);
        this._props[j] = localBeanPropertyWriter2;
        if (j < i)
        {
          BeanPropertyWriter localBeanPropertyWriter3 = this._filteredProps[j];
          if (localBeanPropertyWriter3 != null)
            this._filteredProps[j] = localBeanPropertyWriter3.withSerializer((JsonSerializer)localObject);
        }
      }
    }
    label219: if (this._anyGetterWriter != null)
      this._anyGetterWriter.resolve(paramSerializerProvider);
  }

  public abstract void serialize(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException;

  protected void serializeFields(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    BeanPropertyWriter[] arrayOfBeanPropertyWriter;
    if ((this._filteredProps != null) && (paramSerializerProvider.getSerializationView() != null))
      arrayOfBeanPropertyWriter = this._filteredProps;
    int i;
    JsonMappingException localJsonMappingException;
    while (true)
    {
      i = 0;
      try
      {
        int j = arrayOfBeanPropertyWriter.length;
        while (true)
          if (i < j)
          {
            BeanPropertyWriter localBeanPropertyWriter = arrayOfBeanPropertyWriter[i];
            if (localBeanPropertyWriter != null)
              localBeanPropertyWriter.serializeAsField(paramObject, paramJsonGenerator, paramSerializerProvider);
            i++;
            continue;
            arrayOfBeanPropertyWriter = this._props;
            break;
          }
        if (this._anyGetterWriter != null)
          this._anyGetterWriter.getAndSerialize(paramObject, paramJsonGenerator, paramSerializerProvider);
        return;
      }
      catch (Exception localException)
      {
        if (i == arrayOfBeanPropertyWriter.length);
        for (String str2 = "[anySetter]"; ; str2 = arrayOfBeanPropertyWriter[i].getName())
        {
          wrapAndThrow(paramSerializerProvider, localException, paramObject, str2);
          return;
        }
      }
      catch (StackOverflowError localStackOverflowError)
      {
        localJsonMappingException = new JsonMappingException("Infinite recursion (StackOverflowError)");
        if (i != arrayOfBeanPropertyWriter.length);
      }
    }
    for (String str1 = "[anySetter]"; ; str1 = arrayOfBeanPropertyWriter[i].getName())
    {
      localJsonMappingException.prependPath(new JsonMappingException.Reference(paramObject, str1));
      throw localJsonMappingException;
    }
  }

  protected void serializeFieldsFiltered(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    BeanPropertyWriter[] arrayOfBeanPropertyWriter;
    BeanPropertyFilter localBeanPropertyFilter;
    if ((this._filteredProps != null) && (paramSerializerProvider.getSerializationView() != null))
    {
      arrayOfBeanPropertyWriter = this._filteredProps;
      localBeanPropertyFilter = findFilter(paramSerializerProvider);
      if (localBeanPropertyFilter != null)
        break label49;
      serializeFields(paramObject, paramJsonGenerator, paramSerializerProvider);
    }
    while (true)
    {
      return;
      arrayOfBeanPropertyWriter = this._props;
      break;
      label49: int i = 0;
      try
      {
        int j = arrayOfBeanPropertyWriter.length;
        if (i < j)
        {
          BeanPropertyWriter localBeanPropertyWriter = arrayOfBeanPropertyWriter[i];
          if (localBeanPropertyWriter != null)
            localBeanPropertyFilter.serializeAsField(paramObject, paramJsonGenerator, paramSerializerProvider, localBeanPropertyWriter);
        }
        else
        {
          if (this._anyGetterWriter == null)
            continue;
          this._anyGetterWriter.getAndSerialize(paramObject, paramJsonGenerator, paramSerializerProvider);
          return;
        }
      }
      catch (Exception localException)
      {
        if (i == arrayOfBeanPropertyWriter.length);
        for (String str2 = "[anySetter]"; ; str2 = arrayOfBeanPropertyWriter[i].getName())
        {
          wrapAndThrow(paramSerializerProvider, localException, paramObject, str2);
          return;
        }
      }
      catch (StackOverflowError localStackOverflowError)
      {
        while (true)
        {
          JsonMappingException localJsonMappingException = new JsonMappingException("Infinite recursion (StackOverflowError)");
          if (i == arrayOfBeanPropertyWriter.length);
          for (String str1 = "[anySetter]"; ; str1 = arrayOfBeanPropertyWriter[i].getName())
          {
            localJsonMappingException.prependPath(new JsonMappingException.Reference(paramObject, str1));
            throw localJsonMappingException;
          }
          i++;
        }
      }
    }
  }

  public void serializeWithType(Object paramObject, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, TypeSerializer paramTypeSerializer)
    throws IOException, JsonGenerationException
  {
    paramTypeSerializer.writeTypePrefixForObject(paramObject, paramJsonGenerator);
    if (this._propertyFilterId != null)
      serializeFieldsFiltered(paramObject, paramJsonGenerator, paramSerializerProvider);
    while (true)
    {
      paramTypeSerializer.writeTypeSuffixForObject(paramObject, paramJsonGenerator);
      return;
      serializeFields(paramObject, paramJsonGenerator, paramSerializerProvider);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.BeanSerializerBase
 * JD-Core Version:    0.6.2
 */