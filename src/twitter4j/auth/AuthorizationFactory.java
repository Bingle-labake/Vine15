package twitter4j.auth;

import twitter4j.conf.Configuration;

public final class AuthorizationFactory
{
  public static Authorization getInstance(Configuration paramConfiguration)
  {
    String str1 = paramConfiguration.getOAuthConsumerKey();
    String str2 = paramConfiguration.getOAuthConsumerSecret();
    if ((str1 != null) && (str2 != null))
      if (!paramConfiguration.isApplicationOnlyAuthEnabled());
    String str3;
    String str4;
    do
    {
      return null;
      OAuthAuthorization localOAuthAuthorization = new OAuthAuthorization(paramConfiguration);
      String str5 = paramConfiguration.getOAuthAccessToken();
      String str6 = paramConfiguration.getOAuthAccessTokenSecret();
      if ((str5 != null) && (str6 != null))
        localOAuthAuthorization.setOAuthAccessToken(new AccessToken(str5, str6));
      return localOAuthAuthorization;
      str3 = paramConfiguration.getUser();
      str4 = paramConfiguration.getPassword();
    }
    while ((str3 == null) || (str4 == null));
    return new BasicAuthorization(str3, str4);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.auth.AuthorizationFactory
 * JD-Core Version:    0.6.2
 */