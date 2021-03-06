package com.flurry.org.apache.avro.io;

import com.flurry.org.apache.avro.AvroTypeException;
import java.io.IOException;
import java.util.Arrays;

public abstract class ParsingEncoder extends Encoder
{
  private long[] counts = new long[10];
  protected int pos = -1;

  protected final int depth()
  {
    return this.pos;
  }

  protected final void pop()
  {
    if (this.counts[this.pos] != 0L)
      throw new AvroTypeException("Incorrect number of items written. " + this.counts[this.pos] + " more required.");
    this.pos = (-1 + this.pos);
  }

  protected final void push()
  {
    if (this.pos == this.counts.length)
      this.counts = Arrays.copyOf(this.counts, 10 + this.pos);
    long[] arrayOfLong = this.counts;
    int i = 1 + this.pos;
    this.pos = i;
    arrayOfLong[i] = 0L;
  }

  public void setItemCount(long paramLong)
    throws IOException
  {
    if (this.counts[this.pos] != 0L)
      throw new AvroTypeException("Incorrect number of items written. " + this.counts[this.pos] + " more required.");
    this.counts[this.pos] = paramLong;
  }

  public void startItem()
    throws IOException
  {
    long[] arrayOfLong = this.counts;
    int i = this.pos;
    arrayOfLong[i] -= 1L;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.io.ParsingEncoder
 * JD-Core Version:    0.6.2
 */