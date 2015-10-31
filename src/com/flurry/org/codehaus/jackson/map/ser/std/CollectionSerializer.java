package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.ser.impl.PropertySerializerMap;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

public class CollectionSerializer extends AsArraySerializerBase<Collection<?>>
{
  public CollectionSerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty, JsonSerializer<Object> paramJsonSerializer)
  {
    super(Collection.class, paramJavaType, paramBoolean, paramTypeSerializer, paramBeanProperty, paramJsonSerializer);
  }

  public ContainerSerializerBase<?> _withValueTypeSerializer(TypeSerializer paramTypeSerializer)
  {
    return new CollectionSerializer(this._elementType, this._staticTyping, paramTypeSerializer, this._property, this._elementSerializer);
  }

  public void serializeContents(Collection<?> paramCollection, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
    throws IOException, JsonGenerationException
  {
    if (this._elementSerializer != null)
      serializeContentsUsing(paramCollection, paramJsonGenerator, paramSerializerProvider, this._elementSerializer);
    Iterator localIterator;
    do
    {
      return;
      localIterator = paramCollection.iterator();
    }
    while (!localIterator.hasNext());
    PropertySerializerMap localPropertySerializerMap = this._dynamicSerializers;
    TypeSerializer localTypeSerializer = this._valueTypeSerializer;
    int i = 0;
    while (true)
    {
      Object localObject;
      Class localClass;
      try
      {
        localObject = localIterator.next();
        if (localObject == null)
        {
          paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
          i++;
          if (localIterator.hasNext())
            continue;
          return;
        }
        localClass = localObject.getClass();
        localJsonSerializer = localPropertySerializerMap.serializerFor(localClass);
        if (localJsonSerializer == null)
        {
          if (this._elementType.hasGenericTypes())
          {
            localJsonSerializer = _findAndAddDynamic(localPropertySerializerMap, paramSerializerProvider.constructSpecializedType(this._elementType, localClass), paramSerializerProvider);
            localPropertySerializerMap = this._dynamicSerializers;
          }
        }
        else
        {
          if (localTypeSerializer != null)
            break label185;
          localJsonSerializer.serialize(localObject, paramJsonGenerator, paramSerializerProvider);
          continue;
        }
      }
      catch (Exception localException)
      {
        wrapAndThrow(paramSerializerProvider, localException, paramCollection, i);
        return;
      }
      JsonSerializer localJsonSerializer = _findAndAddDynamic(localPropertySerializerMap, localClass, paramSerializerProvider);
      continue;
      label185: localJsonSerializer.serializeWithType(localObject, paramJsonGenerator, paramSerializerProvider, localTypeSerializer);
    }
  }

  public void serializeContentsUsing(Collection<?> paramCollection, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, JsonSerializer<Object> paramJsonSerializer)
    throws IOException, JsonGenerationException
  {
    Iterator localIterator = paramCollection.iterator();
    TypeSerializer localTypeSerializer;
    int i;
    if (localIterator.hasNext())
    {
      localTypeSerializer = this._valueTypeSerializer;
      i = 0;
    }
    while (true)
    {
      Object localObject = localIterator.next();
      if (localObject == null);
      try
      {
        paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
        while (true)
        {
          i++;
          if (localIterator.hasNext())
            break;
          return;
          if (localTypeSerializer != null)
            break label92;
          paramJsonSerializer.serialize(localObject, paramJsonGenerator, paramSerializerProvider);
        }
      }
      catch (Exception localException)
      {
        while (true)
        {
          wrapAndThrow(paramSerializerProvider, localException, paramCollection, i);
          continue;
          label92: paramJsonSerializer.serializeWithType(localObject, paramJsonGenerator, paramSerializerProvider, localTypeSerializer);
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.CollectionSerializer
 * JD-Core Version:    0.6.2
 */