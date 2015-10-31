package org.scribe.model;

import java.util.HashMap;
import java.util.Map;

public class OAuthRequest extends Request
{
  private static final String OAUTH_PREFIX = "oauth_";
  private Map<String, String> oauthParameters = new HashMap();

  public OAuthRequest(Verb paramVerb, String paramString)
  {
    super(paramVerb, paramString);
  }

  private String checkKey(String paramString)
  {
    if ((paramString.startsWith("oauth_")) || (paramString.equals("scope")))
      return paramString;
    throw new IllegalArgumentException(String.format("OAuth parameters must either be '%s' or start with '%s'", new Object[] { "scope", "oauth_" }));
  }

  public void addOAuthParameter(String paramString1, String paramString2)
  {
    this.oauthParameters.put(checkKey(paramString1), paramString2);
  }

  public Map<String, String> getOauthParameters()
  {
    return this.oauthParameters;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = getVerb();
    arrayOfObject[1] = getUrl();
    return String.format("@OAuthRequest(%s, %s)", arrayOfObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.OAuthRequest
 * JD-Core Version:    0.6.2
 */