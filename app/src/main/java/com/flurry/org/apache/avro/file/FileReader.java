package com.flurry.org.apache.avro.file;

import com.flurry.org.apache.avro.Schema;
import java.io.Closeable;
import java.io.IOException;
import java.util.Iterator;

public abstract interface FileReader<D> extends Iterator<D>, Iterable<D>, Closeable
{
  public abstract Schema getSchema();

  public abstract D next(D paramD)
    throws IOException;

  public abstract boolean pastSync(long paramLong)
    throws IOException;

  public abstract void sync(long paramLong)
    throws IOException;

  public abstract long tell()
    throws IOException;
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.file.FileReader
 * JD-Core Version:    0.6.2
 */