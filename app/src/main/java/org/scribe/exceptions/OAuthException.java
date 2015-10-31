package org.scribe.exceptions;

public class OAuthException extends RuntimeException
{
  private static final long serialVersionUID = 1L;

  public OAuthException(String paramString)
  {
    super(paramString, null);
  }

  public OAuthException(String paramString, Exception paramException)
  {
    super(paramString, paramException);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.exceptions.OAuthException
 * JD-Core Version:    0.6.2
 */