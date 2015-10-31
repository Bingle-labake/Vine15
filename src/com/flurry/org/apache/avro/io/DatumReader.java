package com.flurry.org.apache.avro.io;

import com.flurry.org.apache.avro.Schema;
import java.io.IOException;

public abstract interface DatumReader<D>
{
  public abstract D read(D paramD, Decoder paramDecoder)
    throws IOException;

  public abstract void setSchema(Schema paramSchema);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.DatumReader
 * JD-Core Version:    0.6.2
 */