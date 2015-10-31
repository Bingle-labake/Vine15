package org.scribe.exceptions;

public class OAuthSignatureException extends OAuthException
{
  private static final long serialVersionUID = 1L;

  public OAuthSignatureException(String paramString, Exception paramException)
  {
    super("Error while signing string: " + paramString, paramException);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.exceptions.OAuthSignatureException
 * JD-Core Version:    0.6.2
 */