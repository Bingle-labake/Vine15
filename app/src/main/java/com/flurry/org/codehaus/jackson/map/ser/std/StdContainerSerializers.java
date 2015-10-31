package com.flurry.org.codehaus.jackson.map.ser.std;

import com.flurry.org.codehaus.jackson.JsonGenerationException;
import com.flurry.org.codehaus.jackson.JsonGenerator;
import com.flurry.org.codehaus.jackson.map.BeanProperty;
import com.flurry.org.codehaus.jackson.map.JsonSerializer;
import com.flurry.org.codehaus.jackson.map.SerializerProvider;
import com.flurry.org.codehaus.jackson.map.TypeSerializer;
import com.flurry.org.codehaus.jackson.map.annotate.JacksonStdImpl;
import com.flurry.org.codehaus.jackson.map.ser.impl.PropertySerializerMap;
import com.flurry.org.codehaus.jackson.type.JavaType;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class StdContainerSerializers
{
  public static ContainerSerializerBase<?> collectionSerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty, JsonSerializer<Object> paramJsonSerializer)
  {
    return new CollectionSerializer(paramJavaType, paramBoolean, paramTypeSerializer, paramBeanProperty, paramJsonSerializer);
  }

  public static JsonSerializer<?> enumSetSerializer(JavaType paramJavaType, BeanProperty paramBeanProperty)
  {
    return new EnumSetSerializer(paramJavaType, paramBeanProperty);
  }

  public static ContainerSerializerBase<?> indexedListSerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty, JsonSerializer<Object> paramJsonSerializer)
  {
    return new IndexedListSerializer(paramJavaType, paramBoolean, paramTypeSerializer, paramBeanProperty, paramJsonSerializer);
  }

  public static ContainerSerializerBase<?> iterableSerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty)
  {
    return new IterableSerializer(paramJavaType, paramBoolean, paramTypeSerializer, paramBeanProperty);
  }

  public static ContainerSerializerBase<?> iteratorSerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty)
  {
    return new IteratorSerializer(paramJavaType, paramBoolean, paramTypeSerializer, paramBeanProperty);
  }

  @JacksonStdImpl
  public static class IndexedListSerializer extends AsArraySerializerBase<List<?>>
  {
    public IndexedListSerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty, JsonSerializer<Object> paramJsonSerializer)
    {
      super(paramJavaType, paramBoolean, paramTypeSerializer, paramBeanProperty, paramJsonSerializer);
    }

    public ContainerSerializerBase<?> _withValueTypeSerializer(TypeSerializer paramTypeSerializer)
    {
      return new IndexedListSerializer(this._elementType, this._staticTyping, paramTypeSerializer, this._property, this._elementSerializer);
    }

    public void serializeContents(List<?> paramList, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
      throws IOException, JsonGenerationException
    {
      if (this._elementSerializer != null)
        serializeContentsUsing(paramList, paramJsonGenerator, paramSerializerProvider, this._elementSerializer);
      int i;
      do
      {
        return;
        if (this._valueTypeSerializer != null)
        {
          serializeTypedContents(paramList, paramJsonGenerator, paramSerializerProvider);
          return;
        }
        i = paramList.size();
      }
      while (i == 0);
      for (int j = 0; ; j++)
        while (true)
        {
          PropertySerializerMap localPropertySerializerMap;
          Class localClass;
          try
          {
            localPropertySerializerMap = this._dynamicSerializers;
            if (j >= i)
              break;
            Object localObject1 = paramList.get(j);
            if (localObject1 == null)
            {
              paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
            }
            else
            {
              localClass = localObject1.getClass();
              localObject2 = localPropertySerializerMap.serializerFor(localClass);
              if (localObject2 == null)
              {
                if (this._elementType.hasGenericTypes())
                {
                  localObject2 = _findAndAddDynamic(localPropertySerializerMap, paramSerializerProvider.constructSpecializedType(this._elementType, localClass), paramSerializerProvider);
                  localPropertySerializerMap = this._dynamicSerializers;
                }
              }
              else
                ((JsonSerializer)localObject2).serialize(localObject1, paramJsonGenerator, paramSerializerProvider);
            }
          }
          catch (Exception localException)
          {
            wrapAndThrow(paramSerializerProvider, localException, paramList, j);
            return;
          }
          JsonSerializer localJsonSerializer = _findAndAddDynamic(localPropertySerializerMap, localClass, paramSerializerProvider);
          Object localObject2 = localJsonSerializer;
        }
    }

    public void serializeContentsUsing(List<?> paramList, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider, JsonSerializer<Object> paramJsonSerializer)
      throws IOException, JsonGenerationException
    {
      int i = paramList.size();
      if (i == 0);
      while (true)
      {
        return;
        TypeSerializer localTypeSerializer = this._valueTypeSerializer;
        for (int j = 0; j < i; j++)
        {
          Object localObject = paramList.get(j);
          if (localObject == null);
          try
          {
            paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
            continue;
            if (localTypeSerializer == null)
              paramJsonSerializer.serialize(localObject, paramJsonGenerator, paramSerializerProvider);
          }
          catch (Exception localException)
          {
            wrapAndThrow(paramSerializerProvider, localException, paramList, j);
          }
          paramJsonSerializer.serializeWithType(localObject, paramJsonGenerator, paramSerializerProvider, localTypeSerializer);
        }
      }
    }

    public void serializeTypedContents(List<?> paramList, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
      throws IOException, JsonGenerationException
    {
      int i = paramList.size();
      if (i == 0)
        return;
      for (int j = 0; ; j++)
        while (true)
        {
          PropertySerializerMap localPropertySerializerMap;
          Class localClass;
          try
          {
            TypeSerializer localTypeSerializer = this._valueTypeSerializer;
            localPropertySerializerMap = this._dynamicSerializers;
            if (j >= i)
              break;
            Object localObject1 = paramList.get(j);
            if (localObject1 == null)
            {
              paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
            }
            else
            {
              localClass = localObject1.getClass();
              localObject2 = localPropertySerializerMap.serializerFor(localClass);
              if (localObject2 == null)
              {
                if (this._elementType.hasGenericTypes())
                {
                  localObject2 = _findAndAddDynamic(localPropertySerializerMap, paramSerializerProvider.constructSpecializedType(this._elementType, localClass), paramSerializerProvider);
                  localPropertySerializerMap = this._dynamicSerializers;
                }
              }
              else
                ((JsonSerializer)localObject2).serializeWithType(localObject1, paramJsonGenerator, paramSerializerProvider, localTypeSerializer);
            }
          }
          catch (Exception localException)
          {
            wrapAndThrow(paramSerializerProvider, localException, paramList, j);
            return;
          }
          JsonSerializer localJsonSerializer = _findAndAddDynamic(localPropertySerializerMap, localClass, paramSerializerProvider);
          Object localObject2 = localJsonSerializer;
        }
    }
  }

  @JacksonStdImpl
  public static class IteratorSerializer extends AsArraySerializerBase<Iterator<?>>
  {
    public IteratorSerializer(JavaType paramJavaType, boolean paramBoolean, TypeSerializer paramTypeSerializer, BeanProperty paramBeanProperty)
    {
      super(paramJavaType, paramBoolean, paramTypeSerializer, paramBeanProperty, null);
    }

    public ContainerSerializerBase<?> _withValueTypeSerializer(TypeSerializer paramTypeSerializer)
    {
      return new IteratorSerializer(this._elementType, this._staticTyping, paramTypeSerializer, this._property);
    }

    public void serializeContents(Iterator<?> paramIterator, JsonGenerator paramJsonGenerator, SerializerProvider paramSerializerProvider)
      throws IOException, JsonGenerationException
    {
      TypeSerializer localTypeSerializer;
      Object localObject1;
      Object localObject2;
      if (paramIterator.hasNext())
      {
        localTypeSerializer = this._valueTypeSerializer;
        localObject1 = null;
        localObject2 = null;
      }
      while (true)
      {
        Object localObject3 = paramIterator.next();
        if (localObject3 == null)
          paramSerializerProvider.defaultSerializeNull(paramJsonGenerator);
        while (!paramIterator.hasNext())
        {
          return;
          Class localClass = localObject3.getClass();
          Object localObject4;
          if (localClass == localObject2)
            localObject4 = localObject1;
          while (true)
          {
            if (localTypeSerializer != null)
              break label107;
            ((JsonSerializer)localObject4).serialize(localObject3, paramJsonGenerator, paramSerializerProvider);
            break;
            localObject4 = paramSerializerProvider.findValueSerializer(localClass, this._property);
            localObject1 = localObject4;
            localObject2 = localClass;
          }
          label107: ((JsonSerializer)localObject4).serializeWithType(localObject3, paramJsonGenerator, paramSerializerProvider, localTypeSerializer);
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.map.ser.std.StdContainerSerializers
 * JD-Core Version:    0.6.2
 */