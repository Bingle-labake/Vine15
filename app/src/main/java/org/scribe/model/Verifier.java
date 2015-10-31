package org.scribe.model;

import org.scribe.utils.Preconditions;

public class Verifier
{
  private final String value;

  public Verifier(String paramString)
  {
    Preconditions.checkNotNull(paramString, "Must provide a valid string as verifier");
    this.value = paramString;
  }

  public String getValue()
  {
    return this.value;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.Verifier
 * JD-Core Version:    0.6.2
 */