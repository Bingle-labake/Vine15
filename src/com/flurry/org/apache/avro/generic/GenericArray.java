package com.flurry.org.apache.avro.generic;

import java.util.List;

public abstract interface GenericArray<T> extends List<T>, GenericContainer
{
  public abstract T peek();

  public abstract void reverse();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.generic.GenericArray
 * JD-Core Version:    0.6.2
 */