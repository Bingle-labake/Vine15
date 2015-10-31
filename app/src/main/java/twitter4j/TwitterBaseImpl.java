package twitter4j;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import twitter4j.auth.AccessToken;
import twitter4j.auth.Authorization;
import twitter4j.auth.AuthorizationFactory;
import twitter4j.auth.BasicAuthorization;
import twitter4j.auth.OAuthAuthorization;
import twitter4j.auth.OAuthSupport;
import twitter4j.auth.RequestToken;
import twitter4j.conf.Configuration;
import twitter4j.internal.http.HttpClientWrapper;
import twitter4j.internal.http.HttpResponseEvent;
import twitter4j.internal.http.HttpResponseListener;
import twitter4j.internal.http.XAuthAuthorization;
import twitter4j.internal.json.z_T4JInternalFactory;
import twitter4j.internal.json.z_T4JInternalJSONImplFactory;

abstract class TwitterBaseImpl
  implements TwitterBase, Serializable, OAuthSupport, HttpResponseListener
{
  private static final long serialVersionUID = -3812176145960812140L;
  protected Authorization auth;
  protected Configuration conf;
  protected z_T4JInternalFactory factory;
  protected transient HttpClientWrapper http;
  protected transient long id = 0L;
  protected transient String screenName = null;

  TwitterBaseImpl(Configuration paramConfiguration, Authorization paramAuthorization)
  {
    this.conf = paramConfiguration;
    this.auth = paramAuthorization;
    init();
  }

  private OAuthSupport getOAuth()
  {
    if (!(this.auth instanceof OAuthSupport))
      throw new IllegalStateException("OAuth consumer key/secret combination not supplied");
    return (OAuthSupport)this.auth;
  }

  private void init()
  {
    if (this.auth == null)
    {
      String str1 = this.conf.getOAuthConsumerKey();
      String str2 = this.conf.getOAuthConsumerSecret();
      if ((str1 != null) && (str2 != null) && (!this.conf.isApplicationOnlyAuthEnabled()))
        break label75;
    }
    while (true)
    {
      this.http = new HttpClientWrapper(this.conf);
      this.http.setHttpResponseListener(this);
      setFactory();
      return;
      label75: OAuthAuthorization localOAuthAuthorization = new OAuthAuthorization(this.conf);
      String str3 = this.conf.getOAuthAccessToken();
      String str4 = this.conf.getOAuthAccessTokenSecret();
      if ((str3 != null) && (str4 != null))
        localOAuthAuthorization.setOAuthAccessToken(new AccessToken(str3, str4));
      this.auth = localOAuthAuthorization;
    }
  }

  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.readFields();
    this.conf = ((Configuration)paramObjectInputStream.readObject());
    this.auth = ((Authorization)paramObjectInputStream.readObject());
    this.http = new HttpClientWrapper(this.conf);
    this.http.setHttpResponseListener(this);
    setFactory();
  }

  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.putFields();
    paramObjectOutputStream.writeFields();
    paramObjectOutputStream.writeObject(this.conf);
    paramObjectOutputStream.writeObject(this.auth);
  }

  protected final void ensureAuthorizationEnabled()
  {
    if (!this.auth.isEnabled())
      throw new IllegalStateException("Authentication credentials are missing. See http://twitter4j.org/en/configuration.html for the detail.");
  }

  protected final void ensureOAuthEnabled()
  {
    if (!(this.auth instanceof OAuthAuthorization))
      throw new IllegalStateException("OAuth required. Authentication credentials are missing. See http://twitter4j.org/en/configuration.html for the detail.");
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    TwitterBaseImpl localTwitterBaseImpl;
    do
    {
      return true;
      if (!(paramObject instanceof TwitterBaseImpl))
        return false;
      localTwitterBaseImpl = (TwitterBaseImpl)paramObject;
      if (this.auth != null)
      {
        if (this.auth.equals(localTwitterBaseImpl.auth));
      }
      else
        while (localTwitterBaseImpl.auth != null)
          return false;
      if (!this.conf.equals(localTwitterBaseImpl.conf))
        return false;
      if (this.http == null)
        break;
    }
    while (this.http.equals(localTwitterBaseImpl.http));
    while (true)
    {
      return false;
      if (localTwitterBaseImpl.http == null)
        break;
    }
  }

  public final Authorization getAuthorization()
  {
    return this.auth;
  }

  public Configuration getConfiguration()
  {
    return this.conf;
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
          Authorization localAuthorization2 = AuthorizationFactory.getInstance(this.conf);
          if ((localAuthorization2 instanceof OAuthAuthorization))
          {
            this.auth = localAuthorization2;
            localObject2 = ((OAuthAuthorization)localAuthorization2).getOAuthAccessToken(localBasicAuthorization.getUserId(), localBasicAuthorization.getPassword());
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
      AccessToken localAccessToken = getOAuth().getOAuthAccessToken(paramString);
      this.screenName = localAccessToken.getScreenName();
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
      AccessToken localAccessToken = getOAuth().getOAuthAccessToken(paramString1, paramString2);
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
      AccessToken localAccessToken = getOAuth().getOAuthAccessToken(paramRequestToken);
      this.screenName = localAccessToken.getScreenName();
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
      AccessToken localAccessToken = getOAuth().getOAuthAccessToken(paramRequestToken, paramString);
      return localAccessToken;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public RequestToken getOAuthRequestToken()
    throws TwitterException
  {
    return getOAuthRequestToken(null);
  }

  public RequestToken getOAuthRequestToken(String paramString)
    throws TwitterException
  {
    return getOAuth().getOAuthRequestToken(paramString);
  }

  public RequestToken getOAuthRequestToken(String paramString1, String paramString2)
    throws TwitterException
  {
    return getOAuth().getOAuthRequestToken(paramString1, paramString2);
  }

  public int hashCode()
  {
    int i = 31 * this.conf.hashCode();
    if (this.http != null);
    for (int j = this.http.hashCode(); ; j = 0)
    {
      int k = 31 * (i + j);
      Authorization localAuthorization = this.auth;
      int m = 0;
      if (localAuthorization != null)
        m = this.auth.hashCode();
      return k + m;
    }
  }

  public void httpResponseReceived(HttpResponseEvent paramHttpResponseEvent)
  {
  }

  protected void setFactory()
  {
    this.factory = new z_T4JInternalJSONImplFactory(this.conf);
  }

  public void setOAuthAccessToken(AccessToken paramAccessToken)
  {
    try
    {
      getOAuth().setOAuthAccessToken(paramAccessToken);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void setOAuthConsumer(String paramString1, String paramString2)
  {
    if (paramString1 == null)
      try
      {
        throw new NullPointerException("consumer key is null");
      }
      finally
      {
      }
    if (paramString2 == null)
      throw new NullPointerException("consumer secret is null");
    if (this.auth == null)
    {
      boolean bool = this.conf.isApplicationOnlyAuthEnabled();
      if (!bool);
    }
    do
      while (true)
      {
        return;
        OAuthAuthorization localOAuthAuthorization = new OAuthAuthorization(this.conf);
        localOAuthAuthorization.setOAuthConsumer(paramString1, paramString2);
        this.auth = localOAuthAuthorization;
        continue;
        if (!(this.auth instanceof BasicAuthorization))
          break;
        XAuthAuthorization localXAuthAuthorization = new XAuthAuthorization((BasicAuthorization)this.auth);
        localXAuthAuthorization.setOAuthConsumer(paramString1, paramString2);
        this.auth = localXAuthAuthorization;
      }
    while (!(this.auth instanceof OAuthAuthorization));
    throw new IllegalStateException("consumer key/secret pair already set.");
  }

  public void shutdown()
  {
    if (this.http != null)
      this.http.shutdown();
  }

  public String toString()
  {
    return "TwitterBase{conf=" + this.conf + ", http=" + this.http + ", auth=" + this.auth + '}';
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.TwitterBaseImpl
 * JD-Core Version:    0.6.2
 */