package twitter4j.internal.http;

import twitter4j.TwitterException;

public abstract interface HttpClient
{
  public abstract HttpResponse request(HttpRequest paramHttpRequest)
    throws TwitterException;

  public abstract void shutdown();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.internal.http.HttpClient
 * JD-Core Version:    0.6.2
 */