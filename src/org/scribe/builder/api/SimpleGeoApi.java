package org.scribe.builder.api;

import org.scribe.model.Token;

public class SimpleGeoApi extends DefaultApi10a
{
  private static final String ENDPOINT = "these are not used since SimpleGeo uses 2 legged OAuth";

  public String getAccessTokenEndpoint()
  {
    return "these are not used since SimpleGeo uses 2 legged OAuth";
  }

  public String getAuthorizationUrl(Token paramToken)
  {
    return "these are not used since SimpleGeo uses 2 legged OAuth";
  }

  public String getRequestTokenEndpoint()
  {
    return "these are not used since SimpleGeo uses 2 legged OAuth";
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.builder.api.SimpleGeoApi
 * JD-Core Version:    0.6.2
 */