package com.flurry.org.apache.avro.specific;

import com.flurry.org.apache.avro.Schema;
import com.flurry.org.apache.avro.data.RecordBuilderBase;

public abstract class SpecificRecordBuilderBase<T extends SpecificRecord> extends RecordBuilderBase<T>
{
  protected SpecificRecordBuilderBase(Schema paramSchema)
  {
    super(paramSchema, SpecificData.get());
  }

  protected SpecificRecordBuilderBase(T paramT)
  {
    super(paramT.getSchema(), SpecificData.get());
  }

  protected SpecificRecordBuilderBase(SpecificRecordBuilderBase<T> paramSpecificRecordBuilderBase)
  {
    super(paramSpecificRecordBuilderBase, SpecificData.get());
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.specific.SpecificRecordBuilderBase
 * JD-Core Version:    0.6.2
 */