package com.flurry.org.apache.avro.generic;

import com.flurry.org.apache.avro.AvroTypeException;
import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import com.flurry.org.apache.avro.io.DatumWriter;
import com.flurry.org.apache.avro.io.Encoder;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class GenericDatumWriter<D>
  implements DatumWriter<D>
{
  private final GenericData data;
  private Schema root;

  public GenericDatumWriter()
  {
    this(GenericData.get());
  }

  public GenericDatumWriter(Schema paramSchema)
  {
    this();
    setSchema(paramSchema);
  }

  protected GenericDatumWriter(Schema paramSchema, GenericData paramGenericData)
  {
    this(paramGenericData);
    setSchema(paramSchema);
  }

  protected GenericDatumWriter(GenericData paramGenericData)
  {
    this.data = paramGenericData;
  }

  private void error(Schema paramSchema, Object paramObject)
  {
    throw new AvroTypeException("Not a " + paramSchema + ": " + paramObject);
  }

  protected Iterator<? extends Object> getArrayElements(Object paramObject)
  {
    return ((Collection)paramObject).iterator();
  }

  protected long getArraySize(Object paramObject)
  {
    return ((Collection)paramObject).size();
  }

  public GenericData getData()
  {
    return this.data;
  }

  protected Iterable<Map.Entry<Object, Object>> getMapEntries(Object paramObject)
  {
    return ((Map)paramObject).entrySet();
  }

  protected int getMapSize(Object paramObject)
  {
    return ((Map)paramObject).size();
  }

  protected NullPointerException npe(NullPointerException paramNullPointerException, String paramString)
  {
    NullPointerException localNullPointerException = new NullPointerException(paramNullPointerException.getMessage() + paramString);
    if (paramNullPointerException.getCause() == null);
    while (true)
    {
      localNullPointerException.initCause(paramNullPointerException);
      return localNullPointerException;
      paramNullPointerException = paramNullPointerException.getCause();
    }
  }

  protected int resolveUnion(Schema paramSchema, Object paramObject)
  {
    return this.data.resolveUnion(paramSchema, paramObject);
  }

  public void setSchema(Schema paramSchema)
  {
    this.root = paramSchema;
  }

  protected void write(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    try
    {
      switch (1.$SwitchMap$org$apache$avro$Schema$Type[paramSchema.getType().ordinal()])
      {
      default:
        error(paramSchema, paramObject);
        return;
      case 1:
        writeRecord(paramSchema, paramObject, paramEncoder);
        return;
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      }
    }
    catch (NullPointerException localNullPointerException)
    {
      throw npe(localNullPointerException, " of " + paramSchema.getFullName());
    }
    writeEnum(paramSchema, paramObject, paramEncoder);
    return;
    writeArray(paramSchema, paramObject, paramEncoder);
    return;
    writeMap(paramSchema, paramObject, paramEncoder);
    return;
    int i = resolveUnion(paramSchema, paramObject);
    paramEncoder.writeIndex(i);
    write((Schema)paramSchema.getTypes().get(i), paramObject, paramEncoder);
    return;
    writeFixed(paramSchema, paramObject, paramEncoder);
    return;
    writeString(paramSchema, paramObject, paramEncoder);
    return;
    writeBytes(paramObject, paramEncoder);
    return;
    paramEncoder.writeInt(((Number)paramObject).intValue());
    return;
    paramEncoder.writeLong(((Long)paramObject).longValue());
    return;
    paramEncoder.writeFloat(((Float)paramObject).floatValue());
    return;
    paramEncoder.writeDouble(((Double)paramObject).doubleValue());
    return;
    paramEncoder.writeBoolean(((Boolean)paramObject).booleanValue());
    return;
    paramEncoder.writeNull();
  }

  public void write(D paramD, Encoder paramEncoder)
    throws IOException
  {
    write(this.root, paramD, paramEncoder);
  }

  protected void writeArray(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    Schema localSchema = paramSchema.getElementType();
    long l = getArraySize(paramObject);
    paramEncoder.writeArrayStart();
    paramEncoder.setItemCount(l);
    Iterator localIterator = getArrayElements(paramObject);
    while (localIterator.hasNext())
    {
      paramEncoder.startItem();
      write(localSchema, localIterator.next(), paramEncoder);
    }
    paramEncoder.writeArrayEnd();
  }

  protected void writeBytes(Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    paramEncoder.writeBytes((ByteBuffer)paramObject);
  }

  protected void writeEnum(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    paramEncoder.writeEnum(paramSchema.getEnumOrdinal(paramObject.toString()));
  }

  protected void writeFixed(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    paramEncoder.writeFixed(((GenericFixed)paramObject).bytes(), 0, paramSchema.getFixedSize());
  }

  protected void writeMap(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    Schema localSchema = paramSchema.getValueType();
    int i = getMapSize(paramObject);
    paramEncoder.writeMapStart();
    paramEncoder.setItemCount(i);
    Iterator localIterator = getMapEntries(paramObject).iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      paramEncoder.startItem();
      writeString(localEntry.getKey(), paramEncoder);
      write(localSchema, localEntry.getValue(), paramEncoder);
    }
    paramEncoder.writeMapEnd();
  }

  protected void writeRecord(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    Object localObject1 = this.data.getRecordState(paramObject, paramSchema);
    Iterator localIterator = paramSchema.getFields().iterator();
    while (localIterator.hasNext())
    {
      Schema.Field localField = (Schema.Field)localIterator.next();
      Object localObject2 = this.data.getField(paramObject, localField.name(), localField.pos(), localObject1);
      try
      {
        write(localField.schema(), localObject2, paramEncoder);
      }
      catch (NullPointerException localNullPointerException)
      {
        throw npe(localNullPointerException, " in field " + localField.name());
      }
    }
  }

  protected void writeString(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    writeString(paramObject, paramEncoder);
  }

  protected void writeString(Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    paramEncoder.writeString((CharSequence)paramObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.generic.GenericDatumWriter
 * JD-Core Version:    0.6.2
 */