package com.flurry.org.apache.avro.reflect;

import com.flurry.org.apache.avro.AvroRuntimeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.io.Decoder;
import com.flurry.org.apache.avro.specific.SpecificDatumReader;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collection;

public class ReflectDatumReader<T> extends SpecificDatumReader<T>
{
  public ReflectDatumReader()
  {
    this(null, null, ReflectData.get());
  }

  public ReflectDatumReader(Schema paramSchema)
  {
    this(paramSchema, paramSchema, ReflectData.get());
  }

  public ReflectDatumReader(Schema paramSchema1, Schema paramSchema2)
  {
    this(paramSchema1, paramSchema2, ReflectData.get());
  }

  protected ReflectDatumReader(Schema paramSchema1, Schema paramSchema2, ReflectData paramReflectData)
  {
    super(paramSchema1, paramSchema2, paramReflectData);
  }

  public ReflectDatumReader(Class<T> paramClass)
  {
    this(ReflectData.get().getSchema(paramClass));
  }

  protected void addToArray(Object paramObject1, long paramLong, Object paramObject2)
  {
    if ((paramObject1 instanceof Collection))
    {
      ((Collection)paramObject1).add(paramObject2);
      return;
    }
    Array.set(paramObject1, (int)paramLong, paramObject2);
  }

  protected Object createString(String paramString)
  {
    return paramString;
  }

  protected Object newArray(Object paramObject, int paramInt, Schema paramSchema)
  {
    ReflectData localReflectData = ReflectData.get();
    Class localClass1 = ReflectData.getClassProp(paramSchema, "java-class");
    if (localClass1 != null)
    {
      if ((paramObject instanceof Collection))
      {
        ((Collection)paramObject).clear();
        return paramObject;
      }
      if (localClass1.isAssignableFrom(ArrayList.class))
        return new ArrayList();
      return ReflectData.newInstance(localClass1, paramSchema);
    }
    Class localClass2 = ReflectData.getClassProp(paramSchema, "java-element-class");
    if (localClass2 == null)
      localClass2 = localReflectData.getClass(paramSchema.getElementType());
    return Array.newInstance(localClass2, paramInt);
  }

  protected Object peekArray(Object paramObject)
  {
    return null;
  }

  protected Object readBytes(Object paramObject, Decoder paramDecoder)
    throws IOException
  {
    ByteBuffer localByteBuffer = paramDecoder.readBytes(null);
    byte[] arrayOfByte = new byte[localByteBuffer.remaining()];
    localByteBuffer.get(arrayOfByte);
    return arrayOfByte;
  }

  protected Object readInt(Object paramObject, Schema paramSchema, Decoder paramDecoder)
    throws IOException
  {
    Object localObject = Integer.valueOf(paramDecoder.readInt());
    String str = paramSchema.getProp("java-class");
    if (Byte.class.getName().equals(str))
      localObject = Byte.valueOf(((Integer)localObject).byteValue());
    while (!Short.class.getName().equals(str))
      return localObject;
    return Short.valueOf(((Integer)localObject).shortValue());
  }

  protected Object readString(Object paramObject, Schema paramSchema, Decoder paramDecoder)
    throws IOException
  {
    Object localObject1 = (String)readString(null, paramDecoder);
    Class localClass = ReflectData.getClassProp(paramSchema, "java-class");
    if (localClass != null);
    try
    {
      Object localObject2 = localClass.getConstructor(new Class[] { String.class }).newInstance(new Object[] { localObject1 });
      localObject1 = localObject2;
      return localObject1;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      throw new AvroRuntimeException(localNoSuchMethodException);
    }
    catch (InstantiationException localInstantiationException)
    {
      throw new AvroRuntimeException(localInstantiationException);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new AvroRuntimeException(localIllegalAccessException);
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      throw new AvroRuntimeException(localInvocationTargetException);
    }
  }

  protected Object readString(Object paramObject, Decoder paramDecoder)
    throws IOException
  {
    return super.readString(null, paramDecoder).toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.reflect.ReflectDatumReader
 * JD-Core Version:    0.6.2
 */