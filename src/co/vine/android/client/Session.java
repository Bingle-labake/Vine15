package co.vine.android.client;

import co.vine.android.api.VineUser;

public class Session
{
  private String mAvatarUrl;
  private long mLastLogin;
  private String mLoginEmail;
  private LoginStatus mLoginStatus;
  private String mName;
  private String mSessionKey;
  private VineUser mUser;
  private long mUserId;

  public Session(String paramString1, long paramLong, String paramString2, String paramString3, String paramString4)
  {
    this.mSessionKey = paramString1;
    this.mUserId = paramLong;
    this.mName = paramString2;
    this.mLoginStatus = LoginStatus.LOGGED_OUT;
    this.mAvatarUrl = paramString3;
  }

  public String getAvatarUrl()
  {
    return this.mAvatarUrl;
  }

  public String getLoginEmail()
  {
    return this.mLoginEmail;
  }

  public LoginStatus getLoginStatus()
  {
    return this.mLoginStatus;
  }

  public String getName()
  {
    return this.mName;
  }

  public String getSessionKey()
  {
    return this.mSessionKey;
  }

  public long getUserId()
  {
    return this.mUserId;
  }

  public boolean isLoggedIn()
  {
    return this.mLoginStatus.equals(LoginStatus.LOGGED_IN);
  }

  public void logout()
  {
    this.mLoginEmail = null;
    this.mSessionKey = null;
    this.mName = null;
    this.mUserId = 0L;
    this.mAvatarUrl = null;
    this.mLoginStatus = LoginStatus.LOGGED_OUT;
  }

  public void setAvatarUrl(String paramString)
  {
    this.mAvatarUrl = paramString;
  }

  public void setLoginEmail(String paramString)
  {
    this.mLoginEmail = paramString;
  }

  public void setLoginStatus(LoginStatus paramLoginStatus)
  {
    this.mLoginStatus = paramLoginStatus;
  }

  public void setName(String paramString)
  {
    this.mName = paramString;
  }

  public void setSessionKey(String paramString)
  {
    this.mSessionKey = paramString;
  }

  public void setUserId(long paramLong)
  {
    this.mUserId = paramLong;
  }

  public static enum LoginStatus
  {
    static
    {
      LOGGED_IN = new LoginStatus("LOGGED_IN", 2);
      LOGGING_OUT = new LoginStatus("LOGGING_OUT", 3);
      LoginStatus[] arrayOfLoginStatus = new LoginStatus[4];
      arrayOfLoginStatus[0] = LOGGED_OUT;
      arrayOfLoginStatus[1] = LOGGING_IN;
      arrayOfLoginStatus[2] = LOGGED_IN;
      arrayOfLoginStatus[3] = LOGGING_OUT;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.client.Session
 * JD-Core Version:    0.6.2
 */