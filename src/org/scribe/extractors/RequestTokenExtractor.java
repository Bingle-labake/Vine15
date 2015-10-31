package org.scribe.extractors;

import org.scribe.model.Token;

public abstract interface RequestTokenExtractor
{
  public abstract Token extract(String paramString);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.extractors.RequestTokenExtractor
 * JD-Core Version:    0.6.2
 */