package com.flurry.org.apache.avro.data;

public abstract interface ErrorBuilder<T> extends RecordBuilder<T>
{
  public abstract ErrorBuilder<T> clearCause();

  public abstract ErrorBuilder<T> clearValue();

  public abstract Throwable getCause();

  public abstract Object getValue();

  public abstract boolean hasCause();

  public abstract boolean hasValue();

  public abstract ErrorBuilder<T> setCause(Throwable paramThrowable);

  public abstract ErrorBuilder<T> setValue(Object paramObject);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.data.ErrorBuilder
 * JD-Core Version:    0.6.2
 */