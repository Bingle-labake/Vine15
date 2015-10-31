package com.flurry.org.codehaus.jackson;

public abstract interface SerializableString
{
  public abstract char[] asQuotedChars();

  public abstract byte[] asQuotedUTF8();

  public abstract byte[] asUnquotedUTF8();

  public abstract int charLength();

  public abstract String getValue();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.org.codehaus.jackson.SerializableString
 * JD-Core Version:    0.6.2
 */