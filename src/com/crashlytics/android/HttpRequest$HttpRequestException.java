package com.crashlytics.android;

import java.io.IOException;

public class HttpRequest$HttpRequestException extends RuntimeException
{
  private static final long serialVersionUID = -1170466989781746231L;

  protected HttpRequest$HttpRequestException(IOException paramIOException)
  {
    super(paramIOException);
  }

  public IOException getCause()
  {
    return (IOException)super.getCause();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.HttpRequest.HttpRequestException
 * JD-Core Version:    0.6.2
 */