package org.scribe.services;

public abstract interface TimestampService
{
  public abstract String getNonce();

  public abstract String getTimestampInSeconds();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.services.TimestampService
 * JD-Core Version:    0.6.2
 */