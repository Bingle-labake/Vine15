package com.flurry.org.apache.avro.specific;

import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.Schema.Type;
import com.flurry.org.apache.avro.generic.GenericDatumReader;

public class SpecificDatumReader<T> extends GenericDatumReader<T>
{
  public SpecificDatumReader()
  {
    this(null, null, SpecificData.get());
  }

  public SpecificDatumReader(Schema paramSchema)
  {
    this(paramSchema, paramSchema, SpecificData.get());
  }

  public SpecificDatumReader(Schema paramSchema1, Schema paramSchema2)
  {
    this(paramSchema1, paramSchema2, SpecificData.get());
  }

  public SpecificDatumReader(Schema paramSchema1, Schema paramSchema2, SpecificData paramSpecificData)
  {
    super(paramSchema1, paramSchema2, paramSpecificData);
  }

  public SpecificDatumReader(Class<T> paramClass)
  {
    this(SpecificData.get().getSchema(paramClass));
  }

  protected Object createEnum(String paramString, Schema paramSchema)
  {
    Class localClass = getSpecificData().getClass(paramSchema);
    if (localClass == null)
      return super.createEnum(paramString, paramSchema);
    return Enum.valueOf(localClass, paramString);
  }

  public SpecificData getSpecificData()
  {
    return (SpecificData)getData();
  }

  public void setSchema(Schema paramSchema)
  {
    if ((getExpected() == null) && (paramSchema != null) && (paramSchema.getType() == Schema.Type.RECORD))
    {
      SpecificData localSpecificData = getSpecificData();
      Class localClass = localSpecificData.getClass(paramSchema);
      if ((localClass != null) && (SpecificRecord.class.isAssignableFrom(localClass)))
        setExpected(localSpecificData.getSchema(localClass));
    }
    super.setSchema(paramSchema);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.specific.SpecificDatumReader
 * JD-Core Version:    0.6.2
 */