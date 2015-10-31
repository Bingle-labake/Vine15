package com.twitter.android.sdk;

import android.net.Uri;
import android.text.TextUtils;
import android.util.Base64;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.util.EntityUtils;

public class TwitterAuthHelper
{
  private static final String FORM_URLENCODED_HEADER = "application/x-www-form-urlencoded";
  private static final String OAUTH_SIGNATURE_METHOD = "HMAC-SHA1";
  private static final String OAUTH_VERSION = "1.0";
  private static final SecureRandom RAND = new SecureRandom();
  private static final String REALM = "https://api.twitter.com/";
  private static final String UTF8 = "UTF8";

  public static void attachHeader(HttpURLConnection paramHttpURLConnection, String paramString1, String paramString2, String paramString3, String paramString4, long paramLong, HttpEntity paramHttpEntity)
    throws URISyntaxException
  {
    paramHttpURLConnection.addRequestProperty("Authorization", makeAuthorizationHeaderValue(paramHttpURLConnection.getURL().toURI(), paramHttpURLConnection.getRequestMethod(), paramString1, paramString2, paramString3, paramString4, paramLong, paramHttpEntity));
  }

  public static void attachHeader(HttpRequestBase paramHttpRequestBase, String paramString1, String paramString2, String paramString3, String paramString4, long paramLong, HttpEntity paramHttpEntity)
  {
    paramHttpRequestBase.setHeader("Authorization", makeAuthorizationHeaderValue(paramHttpRequestBase.getURI(), paramHttpRequestBase.getMethod(), paramString1, paramString2, paramString3, paramString4, paramLong, paramHttpEntity));
  }

  public static String encode(String paramString)
  {
    if (paramString == null)
      return "";
    return Uri.encode(paramString);
  }

  public static String makeAuthorizationHeaderValue(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5)
  {
    if (paramString5 == null)
      return String.format("OAuth realm=\"%s\", oauth_version=\"%s\", oauth_nonce=\"%s\", oauth_timestamp=\"%s\", oauth_signature=\"%s\", oauth_consumer_key=\"%s\", oauth_signature_method=\"%s\"", new Object[] { "https://api.twitter.com/", "1.0", paramString3, paramString4, paramString1, paramString2, "HMAC-SHA1" });
    return String.format("OAuth realm=\"%s\", oauth_version=\"%s\", oauth_token=\"%s\", oauth_nonce=\"%s\", oauth_timestamp=\"%s\", oauth_signature=\"%s\", oauth_consumer_key=\"%s\", oauth_signature_method=\"%s\"", new Object[] { "https://api.twitter.com/", "1.0", paramString5, paramString3, paramString4, paramString1, paramString2, "HMAC-SHA1" });
  }

  public static String makeAuthorizationHeaderValue(URI paramURI, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, long paramLong, HttpEntity paramHttpEntity)
  {
    String str1 = String.valueOf(System.nanoTime()) + String.valueOf(Math.abs(RAND.nextLong()));
    String str2 = String.valueOf(paramLong / 1000L);
    return makeAuthorizationHeaderValue(sign(makeSignatureBase(paramURI, paramString1, paramString2, str1, str2, paramString4, paramHttpEntity), paramString5, paramString3), paramString4, str1, str2, paramString2);
  }

  public static String makeSignatureBase(URI paramURI, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, HttpEntity paramHttpEntity)
  {
    String str1 = paramURI.getRawQuery();
    StringBuilder localStringBuilder1 = new StringBuilder();
    if (str1 != null)
      localStringBuilder1.append(str1);
    if (paramHttpEntity != null)
    {
      Header localHeader = paramHttpEntity.getContentType();
      if ((localHeader == null) || (!"application/x-www-form-urlencoded".equals(localHeader.getValue())));
    }
    try
    {
      String str3 = EntityUtils.toString(paramHttpEntity);
      if (!TextUtils.isEmpty(localStringBuilder1))
        localStringBuilder1.append("&");
      localStringBuilder1.append(str3);
      label93: TreeMap localTreeMap = parseForm(localStringBuilder1.toString(), true);
      localTreeMap.put("oauth_consumer_key", paramString5);
      localTreeMap.put("oauth_nonce", paramString3);
      localTreeMap.put("oauth_signature_method", "HMAC-SHA1");
      localTreeMap.put("oauth_timestamp", paramString4);
      localTreeMap.put("oauth_version", "1.0");
      if (paramString2 != null)
        localTreeMap.put("oauth_token", paramString2);
      StringBuilder localStringBuilder2 = new StringBuilder(paramString1);
      String str2 = urlFromRequest(paramURI);
      localStringBuilder2.append("&").append(encode(str2)).append("&");
      int i = localTreeMap.size();
      int j = 0;
      Iterator localIterator = localTreeMap.entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localStringBuilder2.append(encode(encode((String)localEntry.getKey()))).append("%3D").append(encode(encode((String)localEntry.getValue())));
        j++;
        if (j < i)
          localStringBuilder2.append("%26");
      }
      return localStringBuilder2.toString();
    }
    catch (IOException localIOException)
    {
      break label93;
    }
  }

  public static TreeMap<String, String> parseForm(String paramString, boolean paramBoolean)
  {
    TreeMap localTreeMap = new TreeMap();
    if (paramString != null)
    {
      String[] arrayOfString1 = paramString.split("&");
      int i = arrayOfString1.length;
      int j = 0;
      if (j < i)
      {
        String[] arrayOfString2 = arrayOfString1[j].split("=");
        if (arrayOfString2.length == 2)
          if (paramBoolean)
            localTreeMap.put(urldecode(arrayOfString2[0], "UTF8"), urldecode(arrayOfString2[1], "UTF8"));
        while (true)
        {
          j++;
          break;
          localTreeMap.put(arrayOfString2[0], arrayOfString2[1]);
          continue;
          if (!TextUtils.isEmpty(arrayOfString2[0]))
            if (paramBoolean)
              localTreeMap.put(urldecode(arrayOfString2[0], "UTF8"), "");
            else
              localTreeMap.put(arrayOfString2[0], "");
        }
      }
    }
    return localTreeMap;
  }

  public static String sign(String paramString1, String paramString2, String paramString3)
  {
    if (paramString3 == null)
      paramString3 = "";
    try
    {
      SecretKeySpec localSecretKeySpec = new SecretKeySpec((urlencode(paramString2, "UTF8") + '&' + urlencode(paramString3, "UTF8")).getBytes("UTF8"), "HmacSHA1");
      Mac localMac = Mac.getInstance("HmacSHA1");
      localMac.init(localSecretKeySpec);
      String str = urlencode(new String(Base64.encode(localMac.doFinal(paramString1.getBytes("UTF8")), 0), "UTF8"), "UTF8");
      return str;
    }
    catch (InvalidKeyException localInvalidKeyException)
    {
      return "";
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      return "";
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
    }
    return "";
  }

  public static String urlFromRequest(URI paramURI)
  {
    return paramURI.getScheme() + "://" + paramURI.getHost() + paramURI.getPath();
  }

  public static String urldecode(String paramString1, String paramString2)
  {
    if (paramString1 == null)
      return "";
    try
    {
      String str = URLDecoder.decode(paramString1, paramString2);
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException.getMessage(), localUnsupportedEncodingException);
    }
  }

  public static String urlencode(String paramString1, String paramString2)
  {
    if (paramString1 == null)
      return "";
    try
    {
      String str = URLEncoder.encode(paramString1, paramString2);
      return str;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException.getMessage(), localUnsupportedEncodingException);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.twitter.android.sdk.TwitterAuthHelper
 * JD-Core Version:    0.6.2
 */