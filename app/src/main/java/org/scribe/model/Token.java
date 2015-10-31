package org.scribe.model;

import java.io.Serializable;

public class Token
  implements Serializable
{
  private static final long serialVersionUID = 715000866082812683L;
  private final String rawResponse;
  private final String secret;
  private final String token;

  public Token(String paramString1, String paramString2)
  {
    this(paramString1, paramString2, null);
  }

  public Token(String paramString1, String paramString2, String paramString3)
  {
    this.token = paramString1;
    this.secret = paramString2;
    this.rawResponse = paramString3;
  }

  public String getRawResponse()
  {
    if (this.rawResponse == null)
      throw new IllegalStateException("This token object was not constructed by scribe and does not have a rawResponse");
    return this.rawResponse;
  }

  public String getSecret()
  {
    return this.secret;
  }

  public String getToken()
  {
    return this.token;
  }

  public String toString()
  {
    Object[] arrayOfObject = new Object[2];
    arrayOfObject[0] = this.token;
    arrayOfObject[1] = this.secret;
    return String.format("Token[%s , %s]", arrayOfObject);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.Token
 * JD-Core Version:    0.6.2
 */