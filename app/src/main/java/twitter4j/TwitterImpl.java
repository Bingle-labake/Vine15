package twitter4j;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import twitter4j.auth.Authorization;
import twitter4j.conf.Configuration;
import twitter4j.internal.http.HttpClientWrapper;
import twitter4j.internal.http.HttpParameter;
import twitter4j.internal.http.HttpResponse;

class TwitterImpl extends TwitterBaseImpl
  implements Twitter
{
  private static final Map<Configuration, HttpParameter[]> implicitParamsMap = new HashMap();
  private static final Map<Configuration, String> implicitParamsStrMap = new HashMap();
  private static final long serialVersionUID = -1486360080128882436L;
  private final HttpParameter[] IMPLICIT_PARAMS;
  private final String IMPLICIT_PARAMS_STR;
  private final HttpParameter INCLUDE_MY_RETWEET;

  TwitterImpl(Configuration paramConfiguration, Authorization paramAuthorization)
  {
    super(paramConfiguration, paramAuthorization);
    this.INCLUDE_MY_RETWEET = new HttpParameter("include_my_retweet", paramConfiguration.isIncludeMyRetweetEnabled());
    HttpParameter[] arrayOfHttpParameter = (HttpParameter[])implicitParamsMap.get(paramConfiguration);
    String str1 = (String)implicitParamsStrMap.get(paramConfiguration);
    String str2;
    String str3;
    label82: int i;
    label98: StringBuilder localStringBuilder;
    if (arrayOfHttpParameter == null)
    {
      if (!paramConfiguration.isIncludeEntitiesEnabled())
        break label330;
      str2 = "1";
      if (!paramConfiguration.isIncludeRTsEnabled())
        break label337;
      str3 = "1";
      if (paramConfiguration.getContributingTo() == -1L)
        break label344;
      i = 1;
      localStringBuilder = new StringBuilder().append("include_entities=").append(str2).append("&include_rts=").append(str3);
      if (i == 0)
        break label350;
    }
    label330: label337: label344: label350: for (String str4 = "&contributingto=" + paramConfiguration.getContributingTo(); ; str4 = "")
    {
      str1 = str4;
      implicitParamsStrMap.put(paramConfiguration, str1);
      ArrayList localArrayList = new ArrayList(4);
      localArrayList.add(new HttpParameter("include_entities", str2));
      localArrayList.add(new HttpParameter("include_rts", str3));
      if (i != 0)
        localArrayList.add(new HttpParameter("contributingto", paramConfiguration.getContributingTo()));
      if (paramConfiguration.isTrimUserEnabled())
        localArrayList.add(new HttpParameter("trim_user", "1"));
      arrayOfHttpParameter = (HttpParameter[])localArrayList.toArray(new HttpParameter[localArrayList.size()]);
      implicitParamsMap.put(paramConfiguration, arrayOfHttpParameter);
      this.IMPLICIT_PARAMS = arrayOfHttpParameter;
      this.IMPLICIT_PARAMS_STR = str1;
      return;
      str2 = "0";
      break;
      str3 = "0";
      break label82;
      i = 0;
      break label98;
    }
  }

  private HttpResponse get(String paramString)
    throws TwitterException
  {
    ensureAuthorizationEnabled();
    if (paramString.contains("?"));
    for (String str = paramString + "&" + this.IMPLICIT_PARAMS_STR; !this.conf.isMBeanEnabled(); str = paramString + "?" + this.IMPLICIT_PARAMS_STR)
      return this.http.get(str, this.auth);
    long l = System.currentTimeMillis();
    try
    {
      HttpResponse localHttpResponse = this.http.get(str, this.auth);
      return localHttpResponse;
    }
    finally
    {
      (System.currentTimeMillis() - l);
    }
  }

  private HttpResponse get(String paramString, HttpParameter[] paramArrayOfHttpParameter)
    throws TwitterException
  {
    ensureAuthorizationEnabled();
    if (!this.conf.isMBeanEnabled())
      return this.http.get(paramString, mergeImplicitParams(paramArrayOfHttpParameter), this.auth);
    long l = System.currentTimeMillis();
    try
    {
      HttpResponse localHttpResponse = this.http.get(paramString, mergeImplicitParams(paramArrayOfHttpParameter), this.auth);
      return localHttpResponse;
    }
    finally
    {
      (System.currentTimeMillis() - l);
    }
  }

  private boolean isOk(HttpResponse paramHttpResponse)
  {
    return (paramHttpResponse != null) && (paramHttpResponse.getStatusCode() < 300);
  }

  private HttpParameter[] mergeImplicitParams(HttpParameter[] paramArrayOfHttpParameter)
  {
    return mergeParameters(paramArrayOfHttpParameter, this.IMPLICIT_PARAMS);
  }

  private HttpParameter[] mergeParameters(HttpParameter[] paramArrayOfHttpParameter, HttpParameter paramHttpParameter)
  {
    if ((paramArrayOfHttpParameter != null) && (paramHttpParameter != null))
    {
      HttpParameter[] arrayOfHttpParameter = new HttpParameter[1 + paramArrayOfHttpParameter.length];
      System.arraycopy(paramArrayOfHttpParameter, 0, arrayOfHttpParameter, 0, paramArrayOfHttpParameter.length);
      arrayOfHttpParameter[(-1 + arrayOfHttpParameter.length)] = paramHttpParameter;
      return arrayOfHttpParameter;
    }
    if ((paramArrayOfHttpParameter == null) && (paramHttpParameter == null))
      return new HttpParameter[0];
    if (paramArrayOfHttpParameter != null)
      return paramArrayOfHttpParameter;
    return new HttpParameter[] { paramHttpParameter };
  }

  private HttpParameter[] mergeParameters(HttpParameter[] paramArrayOfHttpParameter1, HttpParameter[] paramArrayOfHttpParameter2)
  {
    if ((paramArrayOfHttpParameter1 != null) && (paramArrayOfHttpParameter2 != null))
    {
      HttpParameter[] arrayOfHttpParameter = new HttpParameter[paramArrayOfHttpParameter1.length + paramArrayOfHttpParameter2.length];
      System.arraycopy(paramArrayOfHttpParameter1, 0, arrayOfHttpParameter, 0, paramArrayOfHttpParameter1.length);
      System.arraycopy(paramArrayOfHttpParameter2, 0, arrayOfHttpParameter, paramArrayOfHttpParameter1.length, paramArrayOfHttpParameter2.length);
      return arrayOfHttpParameter;
    }
    if ((paramArrayOfHttpParameter1 == null) && (paramArrayOfHttpParameter2 == null))
      return new HttpParameter[0];
    if (paramArrayOfHttpParameter1 != null)
      return paramArrayOfHttpParameter1;
    return paramArrayOfHttpParameter2;
  }

  private HttpResponse post(String paramString)
    throws TwitterException
  {
    ensureAuthorizationEnabled();
    if (!this.conf.isMBeanEnabled())
      return this.http.post(paramString, this.IMPLICIT_PARAMS, this.auth);
    long l = System.currentTimeMillis();
    try
    {
      HttpResponse localHttpResponse = this.http.post(paramString, this.IMPLICIT_PARAMS, this.auth);
      return localHttpResponse;
    }
    finally
    {
      (System.currentTimeMillis() - l);
    }
  }

  private HttpResponse post(String paramString, HttpParameter[] paramArrayOfHttpParameter)
    throws TwitterException
  {
    ensureAuthorizationEnabled();
    if (!this.conf.isMBeanEnabled())
      return this.http.post(paramString, mergeImplicitParams(paramArrayOfHttpParameter), this.auth);
    long l = System.currentTimeMillis();
    try
    {
      HttpResponse localHttpResponse = this.http.post(paramString, mergeImplicitParams(paramArrayOfHttpParameter), this.auth);
      return localHttpResponse;
    }
    finally
    {
      (System.currentTimeMillis() - l);
    }
  }

  public String toString()
  {
    return "TwitterImpl{INCLUDE_MY_RETWEET=" + this.INCLUDE_MY_RETWEET + '}';
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.TwitterImpl
 * JD-Core Version:    0.6.2
 */