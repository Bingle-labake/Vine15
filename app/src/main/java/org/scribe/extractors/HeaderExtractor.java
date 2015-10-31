package org.scribe.extractors;

import org.scribe.model.OAuthRequest;

public abstract interface HeaderExtractor
{
  public abstract String extract(OAuthRequest paramOAuthRequest);
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.extractors.HeaderExtractor
 * JD-Core Version:    0.6.2
 */