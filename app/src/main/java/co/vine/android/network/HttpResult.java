package co.vine.android.network;

public class HttpResult
{
  public long durationMs;
  public int errorCode;
  public Exception exception;
  public final String reasonPhrase;
  public final int statusCode;
  public String uploadKey;

  public HttpResult(int paramInt, String paramString)
  {
    this.statusCode = paramInt;
    this.reasonPhrase = paramString;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.HttpResult
 * JD-Core Version:    0.6.2
 */