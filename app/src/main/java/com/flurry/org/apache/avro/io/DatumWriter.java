package com.flurry.org.apache.avro.io;

import com.flurry.org.apache.avro.Schema;
import java.io.IOException;

public abstract interface DatumWriter<D>
{
  public abstract void setSchema(Schema paramSchema);

  public abstract void write(D paramD, Encoder paramEncoder)
    throws IOException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.DatumWriter
 * JD-Core Version:    0.6.2
 */