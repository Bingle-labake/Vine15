package co.vine.android.service;

public class PostResult
{
  public String captchaUrl;
  public boolean shouldRefreshSessionKey;
  public boolean success;

  public PostResult(boolean paramBoolean)
  {
    this.success = paramBoolean;
  }

  public PostResult(boolean paramBoolean1, boolean paramBoolean2, String paramString)
  {
    this.success = paramBoolean1;
    this.captchaUrl = paramString;
    this.shouldRefreshSessionKey = paramBoolean2;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.PostResult
 * JD-Core Version:    0.6.2
 */