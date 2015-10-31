package twitter4j.internal.http;

import java.util.Map;

public abstract interface HttpClientWrapperConfiguration extends HttpClientConfiguration
{
  public abstract Map<String, String> getRequestHeaders();
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.internal.http.HttpClientWrapperConfiguration
 * JD-Core Version:    0.6.2
 */