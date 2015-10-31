package com.flurry.org.apache.avro.specific;

import com.flurry.org.apache.avro.generic.GenericData.Fixed;

public abstract class SpecificFixed extends GenericData.Fixed
{
  public SpecificFixed()
  {
    setSchema(SpecificData.get().getSchema(getClass()));
  }

  public SpecificFixed(byte[] paramArrayOfByte)
  {
    this();
    bytes(paramArrayOfByte);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.specific.SpecificFixed
 * JD-Core Version:    0.6.2
 */