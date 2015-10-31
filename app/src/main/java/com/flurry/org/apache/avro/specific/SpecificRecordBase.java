package com.flurry.org.apache.avro.specific;

import com.flurry.org.apache.avro.Schema;

public abstract class SpecificRecordBase
  implements SpecificRecord, Comparable<SpecificRecord>
{
  public int compareTo(SpecificRecord paramSpecificRecord)
  {
    return SpecificData.get().compare(this, paramSpecificRecord, getSchema());
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == this);
    do
    {
      return true;
      if (!(paramObject instanceof SpecificRecord))
        return false;
      if (getClass() != paramObject.getClass())
        return false;
    }
    while (compareTo((SpecificRecord)paramObject) == 0);
    return false;
  }

  public abstract Object get(int paramInt);

  public abstract Schema getSchema();

  public int hashCode()
  {
    return SpecificData.get().hashCode(this, getSchema());
  }

  public abstract void put(int paramInt, Object paramObject);

  public String toString()
  {
    return SpecificData.get().toString(this);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.specific.SpecificRecordBase
 * JD-Core Version:    0.6.2
 */