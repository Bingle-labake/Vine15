package com.facebook;

public class FacebookException extends RuntimeException
{
  static final long serialVersionUID = 1L;

  public FacebookException()
  {
  }

  public FacebookException(String paramString)
  {
    super(paramString);
  }

  public FacebookException(String paramString, Throwable paramThrowable)
  {
    super(paramString, paramThrowable);
  }

  public FacebookException(Throwable paramThrowable)
  {
    super(paramThrowable);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.facebook.FacebookException
 * JD-Core Version:    0.6.2
 */