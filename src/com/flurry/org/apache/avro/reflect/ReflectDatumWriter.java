package com.flurry.org.apache.avro.reflect;

import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.io.Encoder;
import com.flurry.org.apache.avro.specific.SpecificDatumWriter;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Iterator;

public class ReflectDatumWriter<T> extends SpecificDatumWriter<T>
{
  public ReflectDatumWriter()
  {
    this(ReflectData.get());
  }

  public ReflectDatumWriter(Schema paramSchema)
  {
    this(paramSchema, ReflectData.get());
  }

  protected ReflectDatumWriter(Schema paramSchema, ReflectData paramReflectData)
  {
    super(paramSchema, paramReflectData);
  }

  protected ReflectDatumWriter(ReflectData paramReflectData)
  {
    super(paramReflectData);
  }

  public ReflectDatumWriter(Class<T> paramClass)
  {
    this(paramClass, ReflectData.get());
  }

  public ReflectDatumWriter(Class<T> paramClass, ReflectData paramReflectData)
  {
    this(paramReflectData.getSchema(paramClass), paramReflectData);
  }

  protected Iterator<Object> getArrayElements(final Object paramObject)
  {
    if ((paramObject instanceof Collection))
      return ((Collection)paramObject).iterator();
    return new Iterator()
    {
      private int i = 0;
      private final int length = Array.getLength(paramObject);

      public boolean hasNext()
      {
        return this.i < this.length;
      }

      public Object next()
      {
        Object localObject = paramObject;
        int j = this.i;
        this.i = (j + 1);
        return Array.get(localObject, j);
      }

      public void remove()
      {
        throw new UnsupportedOperationException();
      }
    };
  }

  protected long getArraySize(Object paramObject)
  {
    if ((paramObject instanceof Collection))
      return ((Collection)paramObject).size();
    return Array.getLength(paramObject);
  }

  protected void write(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    if ((paramObject instanceof Byte))
      paramObject = Integer.valueOf(((Byte)paramObject).intValue());
    NullPointerException localNullPointerException2;
    try
    {
      while (true)
      {
        super.write(paramSchema, paramObject, paramEncoder);
        return;
        if ((paramObject instanceof Short))
          paramObject = Integer.valueOf(((Short)paramObject).intValue());
      }
    }
    catch (NullPointerException localNullPointerException1)
    {
      localNullPointerException2 = new NullPointerException("in " + paramSchema.getFullName() + " " + localNullPointerException1.getMessage());
      if (localNullPointerException1.getCause() != null);
    }
    while (true)
    {
      localNullPointerException2.initCause(localNullPointerException1);
      throw localNullPointerException2;
      Throwable localThrowable = localNullPointerException1.getCause();
    }
  }

  protected void writeBytes(Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    if ((paramObject instanceof byte[]))
    {
      paramEncoder.writeBytes((byte[])paramObject);
      return;
    }
    super.writeBytes(paramObject, paramEncoder);
  }

  protected void writeString(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    if (paramSchema.getProp("java-class") != null)
      paramObject = paramObject.toString();
    writeString(paramObject, paramEncoder);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.reflect.ReflectDatumWriter
 * JD-Core Version:    0.6.2
 */