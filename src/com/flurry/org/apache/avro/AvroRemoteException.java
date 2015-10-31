package com.flurry.org.apache.avro;

import java.io.IOException;

public class AvroRemoteException extends IOException
{
  private Object value;

  protected AvroRemoteException()
  {
  }

  public AvroRemoteException(Object paramObject)
  {
  }

  public AvroRemoteException(Object paramObject, Throwable paramThrowable)
  {
  }

  public AvroRemoteException(Throwable paramThrowable)
  {
    this(paramThrowable.toString());
    initCause(paramThrowable);
  }

  public Object getValue()
  {
    return this.value;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.apache.avro.AvroRemoteException
 * JD-Core Version:    0.6.2
 */