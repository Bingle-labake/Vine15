package com.flurry.org.apache.avro.specific;

import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.generic.GenericDatumWriter;
import com.flurry.org.apache.avro.io.Encoder;
import java.io.IOException;

public class SpecificDatumWriter<T> extends GenericDatumWriter<T>
{
  public SpecificDatumWriter()
  {
    super(SpecificData.get());
  }

  public SpecificDatumWriter(Schema paramSchema)
  {
    super(paramSchema, SpecificData.get());
  }

  protected SpecificDatumWriter(Schema paramSchema, SpecificData paramSpecificData)
  {
    super(paramSchema, paramSpecificData);
  }

  protected SpecificDatumWriter(SpecificData paramSpecificData)
  {
    super(paramSpecificData);
  }

  public SpecificDatumWriter(Class<T> paramClass)
  {
    super(SpecificData.get().getSchema(paramClass), SpecificData.get());
  }

  protected void writeEnum(Schema paramSchema, Object paramObject, Encoder paramEncoder)
    throws IOException
  {
    if (!(paramObject instanceof Enum))
    {
      super.writeEnum(paramSchema, paramObject, paramEncoder);
      return;
    }
    paramEncoder.writeEnum(((Enum)paramObject).ordinal());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.specific.SpecificDatumWriter
 * JD-Core Version:    0.6.2
 */