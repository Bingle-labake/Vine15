package com.flurry.org.apache.avro.generic;

public abstract interface IndexedRecord extends GenericContainer
{
  public abstract Object get(int paramInt);

  public abstract void put(int paramInt, Object paramObject);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.generic.IndexedRecord
 * JD-Core Version:    0.6.2
 */