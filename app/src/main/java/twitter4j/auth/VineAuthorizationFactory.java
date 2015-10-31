package twitter4j.auth;

import twitter4j.conf.Configuration;

public class VineAuthorizationFactory
{
  public static Authorization getInstance(Configuration paramConfiguration)
  {
    String str1 = paramConfiguration.getOAuthConsumerKey();
    String str2 = paramConfiguration.getOAuthConsumerSecret();
    VineOauthAuthorization localVineOauthAuthorization1;
    if ((str1 != null) && (str2 != null))
    {
      VineOauthAuthorization localVineOauthAuthorization2 = new VineOauthAuthorization(paramConfiguration);
      String str5 = paramConfiguration.getOAuthAccessToken();
      String str6 = paramConfiguration.getOAuthAccessTokenSecret();
      if ((str5 != null) && (str6 != null))
        localVineOauthAuthorization2.setOAuthAccessToken(new AccessToken(str5, str6));
      localVineOauthAuthorization1 = localVineOauthAuthorization2;
    }
    String str3;
    String str4;
    do
    {
      do
      {
        return localVineOauthAuthorization1;
        str3 = paramConfiguration.getUser();
        str4 = paramConfiguration.getPassword();
        localVineOauthAuthorization1 = null;
      }
      while (str3 == null);
      localVineOauthAuthorization1 = null;
    }
    while (str4 == null);
    return new BasicAuthorization(str3, str4);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.auth.VineAuthorizationFactory
 * JD-Core Version:    0.6.2
 */