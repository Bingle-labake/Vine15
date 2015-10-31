package twitter4j;

import twitter4j.auth.AccessToken;
import twitter4j.auth.Authorization;
import twitter4j.auth.BasicAuthorization;
import twitter4j.auth.OAuthAuthorization;
import twitter4j.auth.OAuthSupport;
import twitter4j.auth.RequestToken;
import twitter4j.auth.VineAuthorizationFactory;
import twitter4j.auth.VineOauthAuthorization;
import twitter4j.conf.Configuration;
import twitter4j.internal.http.HttpResponseEvent;
import twitter4j.internal.http.XAuthAuthorization;

public class VineTwitter4j extends TwitterImpl
{
  VineTwitter4j(Configuration paramConfiguration, Authorization paramAuthorization)
  {
    super(paramConfiguration, paramAuthorization);
  }

  private OAuthSupport getOAuth()
  {
    if (!(this.auth instanceof OAuthSupport))
      throw new IllegalStateException("OAuth consumer key/secret combination not supplied");
    return (OAuthSupport)this.auth;
  }

  public AccessToken getOAuthAccessToken()
    throws TwitterException
  {
    while (true)
    {
      Authorization localAuthorization1;
      Object localObject2;
      try
      {
        localAuthorization1 = getAuthorization();
        if ((localAuthorization1 instanceof BasicAuthorization))
        {
          BasicAuthorization localBasicAuthorization = (BasicAuthorization)localAuthorization1;
          Authorization localAuthorization2 = VineAuthorizationFactory.getInstance(this.conf);
          if ((localAuthorization2 instanceof VineOauthAuthorization))
          {
            this.auth = localAuthorization2;
            localObject2 = ((VineOauthAuthorization)localAuthorization2).getOAuthAccessToken(localBasicAuthorization.getUserId(), localBasicAuthorization.getPassword());
            this.screenName = ((AccessToken)localObject2).getScreenName();
            this.id = ((AccessToken)localObject2).getUserId();
            return localObject2;
          }
          throw new IllegalStateException("consumer key / secret combination not supplied.");
        }
      }
      finally
      {
      }
      if ((localAuthorization1 instanceof XAuthAuthorization))
      {
        XAuthAuthorization localXAuthAuthorization = (XAuthAuthorization)localAuthorization1;
        this.auth = localXAuthAuthorization;
        OAuthAuthorization localOAuthAuthorization = new OAuthAuthorization(this.conf);
        localOAuthAuthorization.setOAuthConsumer(localXAuthAuthorization.getConsumerKey(), localXAuthAuthorization.getConsumerSecret());
        localObject2 = localOAuthAuthorization.getOAuthAccessToken(localXAuthAuthorization.getUserId(), localXAuthAuthorization.getPassword());
      }
      else
      {
        AccessToken localAccessToken = getOAuth().getOAuthAccessToken();
        localObject2 = localAccessToken;
      }
    }
  }

  public AccessToken getOAuthAccessToken(String paramString)
    throws TwitterException
  {
    try
    {
      AccessToken localAccessToken = super.getOAuthAccessToken(paramString);
      return localAccessToken;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public AccessToken getOAuthAccessToken(String paramString1, String paramString2)
    throws TwitterException
  {
    try
    {
      AccessToken localAccessToken = super.getOAuthAccessToken(paramString1, paramString2);
      return localAccessToken;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public AccessToken getOAuthAccessToken(RequestToken paramRequestToken)
    throws TwitterException
  {
    try
    {
      AccessToken localAccessToken = super.getOAuthAccessToken(paramRequestToken);
      return localAccessToken;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public AccessToken getOAuthAccessToken(RequestToken paramRequestToken, String paramString)
    throws TwitterException
  {
    try
    {
      AccessToken localAccessToken = super.getOAuthAccessToken(paramRequestToken, paramString);
      return localAccessToken;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void httpResponseReceived(HttpResponseEvent paramHttpResponseEvent)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.VineTwitter4j
 * JD-Core Version:    0.6.2
 */