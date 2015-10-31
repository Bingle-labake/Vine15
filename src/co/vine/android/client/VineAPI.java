package co.vine.android.client;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.text.TextUtils;
import co.vine.android.network.HttpOperation;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.Util;
import com.google.gdata.util.common.base.PercentEscaper;
import java.util.Locale;
import org.apache.http.HttpRequest;

public class VineAPI
{
  public static final String ACCEPT_LANGUAGE_HEADER = "Accept-Language";
  private static final PercentEscaper ENCODER = new PercentEscaper("-._~", false);
  public static final int GLOBAL_SIZE = 20;
  public static final char PATH_SEPARATOR = '/';
  public static final String RESOURCE_AUTHENTICATE = "authenticate";
  public static final String RESOURCE_BLOCKED = "blocked";
  public static final String RESOURCE_CHANNELS = "channels";
  public static final String RESOURCE_CLIENT_PROFILE = "clientprofiles";
  public static final String RESOURCE_COMMENTS = "comments";
  public static final String RESOURCE_COMPLAINTS = "complaints";
  public static final String RESOURCE_CONTACTS = "contacts";
  public static final String RESOURCE_DEVICE_TOKEN = "deviceToken";
  public static final String RESOURCE_EDITION = "edition";
  public static final String RESOURCE_EDITIONS = "editions";
  public static final String RESOURCE_EXPLICIT = "explicit";
  public static final String RESOURCE_FEATURED = "featured";
  public static final String RESOURCE_FOLLOWERS = "followers";
  public static final String RESOURCE_FOLLOWING = "following";
  public static final String RESOURCE_FOLLOW_REQUESTS = "followRequests";
  public static final String RESOURCE_FRIENDS = "friends";
  public static final String RESOURCE_GRAPH = "graph";
  public static final String RESOURCE_LIKES = "likes";
  public static final String RESOURCE_ME = "me";
  public static final String RESOURCE_NOTIFICATIONS = "notifications";
  public static final String RESOURCE_POPULAR_NOW = "popular";
  public static final String RESOURCE_POSTS = "posts";
  public static final String RESOURCE_PREFERENCES = "preferences";
  public static final String RESOURCE_PROFILES = "profiles";
  public static final String RESOURCE_REACTIVATE = "reactivate";
  public static final String RESOURCE_REPOST = "repost";
  public static final String RESOURCE_REPOSTS = "reposts";
  public static final String RESOURCE_REQUESTS = "requests";
  public static final String RESOURCE_SEARCH = "search";
  public static final String RESOURCE_SHARE = "share";
  public static final String RESOURCE_SHARED = "s";
  public static final String RESOURCE_SUGGESTED = "suggested";
  public static final String RESOURCE_TAGS = "tags";
  public static final String RESOURCE_TIMELINES = "timelines";
  public static final String RESOURCE_TRENDING = "trending";
  public static final String RESOURCE_TWITTER = "twitter";
  public static final String RESOURCE_USERS = "users";
  public static final String RESOURCE_VANITY = "vanity";
  public static final String SECRET_AUTH_HEADER = "X-Vine-Auth";
  public static final String X_VINE_CLIENT = "X-Vine-Client";
  private static VineAPI mApi;
  private String mAccountName;
  private final String mAmazonUrl;
  private final String mBaseCdnUrl;
  private final String mBaseUrl;
  private final Context mContext;
  private String mLocale;
  private Session mSession;
  private final String mTwitterUrl;
  private String mXVineClientHeader;

  private VineAPI(Context paramContext)
  {
    this.mContext = paramContext;
    this.mBaseUrl = BuildUtil.get(paramContext).getBaseUrl();
    this.mBaseCdnUrl = BuildUtil.get(paramContext).getBaseCdnUrl();
    this.mAmazonUrl = paramContext.getString(2131624006);
    this.mTwitterUrl = paramContext.getString(2131624391);
    refreshLocale();
    try
    {
      String str1 = paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 0).versionName;
      if (!TextUtils.isEmpty(str1))
      {
        StringBuilder localStringBuilder = new StringBuilder().append("android");
        if (BuildUtil.isExplore());
        for (String str2 = "-gb"; ; str2 = "")
        {
          this.mXVineClientHeader = (str2 + "/" + str1);
          return;
        }
      }
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      this.mXVineClientHeader = null;
    }
  }

  public static int addParam(StringBuilder paramStringBuilder, String paramString, long[] paramArrayOfLong, int paramInt1, int paramInt2)
  {
    if ((paramArrayOfLong != null) && (paramInt1 < paramArrayOfLong.length) && (paramInt2 > 0))
    {
      prefixParam(paramStringBuilder, paramString);
      int i = Math.min(paramInt1 + paramInt2, paramArrayOfLong.length);
      for (int j = paramInt1; j < i; j++)
      {
        paramStringBuilder.append(paramArrayOfLong[j]);
        if (j < i - 1)
          paramStringBuilder.append(',');
      }
      return i - paramInt1;
    }
    return 0;
  }

  public static void addParam(StringBuilder paramStringBuilder, String paramString, double paramDouble)
  {
    prefixParam(paramStringBuilder, paramString).append(paramDouble);
  }

  public static void addParam(StringBuilder paramStringBuilder, String paramString, int paramInt)
  {
    prefixParam(paramStringBuilder, paramString).append(paramInt);
  }

  public static void addParam(StringBuilder paramStringBuilder, String paramString, long paramLong)
  {
    prefixParam(paramStringBuilder, paramString).append(paramLong);
  }

  public static void addParam(StringBuilder paramStringBuilder, String paramString1, String paramString2)
  {
    prefixParam(paramStringBuilder, paramString1).append(encode(paramString2));
  }

  public static void addParam(StringBuilder paramStringBuilder, String paramString, boolean paramBoolean)
  {
    prefixParam(paramStringBuilder, paramString).append(paramBoolean);
  }

  public static StringBuilder buildUponUrl(String paramString, Object[] paramArrayOfObject)
  {
    StringBuilder localStringBuilder = new StringBuilder(paramString);
    if (paramArrayOfObject != null)
    {
      int i = paramArrayOfObject.length;
      for (int j = 0; j < i; j++)
      {
        Object localObject = paramArrayOfObject[j];
        localStringBuilder.append('/');
        localStringBuilder.append(localObject);
      }
    }
    return localStringBuilder;
  }

  public static String encode(String paramString)
  {
    if (paramString == null)
      return "";
    return ENCODER.escape(paramString);
  }

  public static VineAPI getInstance(Context paramContext)
  {
    if (mApi == null)
      mApi = new VineAPI(paramContext);
    return mApi;
  }

  private String getSessionKey()
  {
    return AppController.getInstance(this.mContext).getActiveSession().getSessionKey();
  }

  private static StringBuilder prefixParam(StringBuilder paramStringBuilder, String paramString)
  {
    if (paramStringBuilder.indexOf("?") == -1)
      paramStringBuilder.append('?');
    while (true)
    {
      return paramStringBuilder.append(paramString).append('=');
      paramStringBuilder.append('&');
    }
  }

  public void addClientHeaders(HttpRequest paramHttpRequest)
  {
    if (TextUtils.isEmpty(this.mXVineClientHeader));
    do
    {
      return;
      paramHttpRequest.addHeader("X-Vine-Client", this.mXVineClientHeader);
      String str = Util.getLocale();
      if (!TextUtils.isEmpty(str))
        paramHttpRequest.addHeader("Accept-Language", str);
    }
    while (BuildUtil.isProduction());
    paramHttpRequest.addHeader("X-Vine-Auth", getAuthHeaderSecret());
  }

  public void addContentTypeHeader(HttpOperation paramHttpOperation, String paramString)
  {
    paramHttpOperation.getHttpRequest().addHeader("content-type", paramString);
  }

  public void addSessionKeyAuthHeader(HttpOperation paramHttpOperation)
  {
    paramHttpOperation.getHttpRequest().addHeader("vine-session-id", getSessionKey());
  }

  public void addSessionKeyAuthHeader(HttpOperation paramHttpOperation, String paramString)
  {
    paramHttpOperation.getHttpRequest().addHeader("vine-session-id", paramString);
  }

  public StringBuilder buildUrl(Object[] paramArrayOfObject)
  {
    return buildUponUrl(this.mBaseUrl, paramArrayOfObject);
  }

  public String getAmazonUrl()
  {
    return this.mAmazonUrl;
  }

  public String getAuthHeaderSecret()
  {
    return this.mContext.getResources().getString(2131624008);
  }

  public String getBaseCdnUrl()
  {
    return this.mBaseCdnUrl;
  }

  public String getBaseUrl()
  {
    return this.mBaseUrl;
  }

  public String getTwitterUrl()
  {
    return this.mTwitterUrl;
  }

  public String getVineClientHeader()
  {
    return this.mXVineClientHeader;
  }

  public void refreshLocale()
  {
    String str = Locale.getDefault().getCountry();
    if (!TextUtils.isEmpty(str))
    {
      this.mLocale = str;
      return;
    }
    this.mLocale = null;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.client.VineAPI
 * JD-Core Version:    0.6.2
 */