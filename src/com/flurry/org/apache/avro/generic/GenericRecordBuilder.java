package com.flurry.org.apache.avro.generic;

import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Field;
import com.flurry.org.apache.avro.data.RecordBuilderBase;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

public class GenericRecordBuilder extends RecordBuilderBase<GenericData.Record>
{
  private final GenericData.Record record;

  public GenericRecordBuilder(Schema paramSchema)
  {
    super(paramSchema, GenericData.get());
    this.record = new GenericData.Record(paramSchema);
  }

  public GenericRecordBuilder(GenericData.Record paramRecord)
  {
    super(paramRecord.getSchema(), GenericData.get());
    this.record = new GenericData.Record(paramRecord, true);
    Iterator localIterator = schema().getFields().iterator();
    while (localIterator.hasNext())
    {
      Schema.Field localField = (Schema.Field)localIterator.next();
      Object localObject = paramRecord.get(localField.pos());
      if (isValidValue(localField, localObject))
        set(localField, data().deepCopy(localField.schema(), localObject));
    }
  }

  public GenericRecordBuilder(GenericRecordBuilder paramGenericRecordBuilder)
  {
    super(paramGenericRecordBuilder, GenericData.get());
    this.record = new GenericData.Record(paramGenericRecordBuilder.record, true);
  }

  private Object getWithDefault(Schema.Field paramField)
    throws IOException
  {
    if (fieldSetFlags()[paramField.pos()] != 0)
      return this.record.get(paramField.pos());
    return defaultValue(paramField);
  }

  private GenericRecordBuilder set(Schema.Field paramField, int paramInt, Object paramObject)
  {
    validate(paramField, paramObject);
    this.record.put(paramInt, paramObject);
    fieldSetFlags()[paramInt] = 1;
    return this;
  }

  // ERROR //
  public GenericData.Record build()
  {
    // Byte code:
    //   0: new 20	com/flurry/org/apache/avro/generic/GenericData$Record
    //   3: dup
    //   4: aload_0
    //   5: invokevirtual 35	com/flurry/org/apache/avro/generic/GenericRecordBuilder:schema	()Lcom/flurry/org/apache/avro/Schema;
    //   8: invokespecial 22	com/flurry/org/apache/avro/generic/GenericData$Record:<init>	(Lcom/flurry/org/apache/avro/Schema;)V
    //   11: astore_1
    //   12: aload_0
    //   13: invokevirtual 114	com/flurry/org/apache/avro/generic/GenericRecordBuilder:fields	()[Lcom/flurry/org/apache/avro/Schema$Field;
    //   16: astore_2
    //   17: aload_2
    //   18: arraylength
    //   19: istore_3
    //   20: iconst_0
    //   21: istore 4
    //   23: iload 4
    //   25: iload_3
    //   26: if_icmpge +63 -> 89
    //   29: aload_2
    //   30: iload 4
    //   32: aaload
    //   33: astore 5
    //   35: aload_0
    //   36: aload 5
    //   38: invokespecial 116	com/flurry/org/apache/avro/generic/GenericRecordBuilder:getWithDefault	(Lcom/flurry/org/apache/avro/Schema$Field;)Ljava/lang/Object;
    //   41: astore 7
    //   43: aload 7
    //   45: ifnull +14 -> 59
    //   48: aload_1
    //   49: aload 5
    //   51: invokevirtual 63	com/flurry/org/apache/avro/Schema$Field:pos	()I
    //   54: aload 7
    //   56: invokevirtual 106	com/flurry/org/apache/avro/generic/GenericData$Record:put	(ILjava/lang/Object;)V
    //   59: iinc 4 1
    //   62: goto -39 -> 23
    //   65: astore 8
    //   67: new 118	com/flurry/org/apache/avro/AvroRuntimeException
    //   70: dup
    //   71: aload 8
    //   73: invokespecial 121	com/flurry/org/apache/avro/AvroRuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   76: athrow
    //   77: astore 6
    //   79: new 118	com/flurry/org/apache/avro/AvroRuntimeException
    //   82: dup
    //   83: aload 6
    //   85: invokespecial 121	com/flurry/org/apache/avro/AvroRuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   88: athrow
    //   89: aload_1
    //   90: areturn
    //
    // Exception table:
    //   from	to	target	type
    //   0	12	65	java/lang/Exception
    //   35	43	77	java/io/IOException
  }

  protected GenericRecordBuilder clear(int paramInt)
  {
    this.record.put(paramInt, null);
    fieldSetFlags()[paramInt] = 0;
    return this;
  }

  public GenericRecordBuilder clear(Schema.Field paramField)
  {
    return clear(paramField.pos());
  }

  public GenericRecordBuilder clear(String paramString)
  {
    return clear(schema().getField(paramString));
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    GenericRecordBuilder localGenericRecordBuilder;
    do
    {
      do
      {
        return true;
        if (!super.equals(paramObject))
          return false;
        if (getClass() != paramObject.getClass())
          return false;
        localGenericRecordBuilder = (GenericRecordBuilder)paramObject;
        if (this.record != null)
          break;
      }
      while (localGenericRecordBuilder.record == null);
      return false;
    }
    while (this.record.equals(localGenericRecordBuilder.record));
    return false;
  }

  protected Object get(int paramInt)
  {
    return this.record.get(paramInt);
  }

  public Object get(Schema.Field paramField)
  {
    return get(paramField.pos());
  }

  public Object get(String paramString)
  {
    return get(schema().getField(paramString));
  }

  protected boolean has(int paramInt)
  {
    return fieldSetFlags()[paramInt];
  }

  public boolean has(Schema.Field paramField)
  {
    return has(paramField.pos());
  }

  public boolean has(String paramString)
  {
    return has(schema().getField(paramString));
  }

  public int hashCode()
  {
    int i = 31 * super.hashCode();
    if (this.record == null);
    for (int j = 0; ; j = this.record.hashCode())
      return i + j;
  }

  protected GenericRecordBuilder set(int paramInt, Object paramObject)
  {
    return set(fields()[paramInt], paramInt, paramObject);
  }

  public GenericRecordBuilder set(Schema.Field paramField, Object paramObject)
  {
    return set(paramField, paramField.pos(), paramObject);
  }

  public GenericRecordBuilder set(String paramString, Object paramObject)
  {
    return set(schema().getField(paramString), paramObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.generic.GenericRecordBuilder
 * JD-Core Version:    0.6.2
 */