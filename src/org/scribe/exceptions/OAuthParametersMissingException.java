package org.scribe.exceptions;

import org.scribe.model.OAuthRequest;

public class OAuthParametersMissingException extends OAuthException
{
  private static final String MSG = "Could not find oauth parameters in request: %s. OAuth parameters must be specified with the addOAuthParameter() method";
  private static final long serialVersionUID = 1745308760111976671L;

  public OAuthParametersMissingException(OAuthRequest paramOAuthRequest)
  {
    super(String.format("Could not find oauth parameters in request: %s. OAuth parameters must be specified with the addOAuthParameter() method", new Object[] { paramOAuthRequest }));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.exceptions.OAuthParametersMissingException
 * JD-Core Version:    0.6.2
 */