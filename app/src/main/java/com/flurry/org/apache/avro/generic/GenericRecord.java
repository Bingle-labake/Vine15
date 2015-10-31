package com.flurry.org.apache.avro.generic;

public abstract interface GenericRecord extends IndexedRecord
{
  public abstract Object get(String paramString);

  public abstract void put(String paramString, Object paramObject);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.generic.GenericRecord
 * JD-Core Version:    0.6.2
 */