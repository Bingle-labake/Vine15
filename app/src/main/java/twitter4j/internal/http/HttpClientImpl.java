package twitter4j.internal.http;

import java.io.IOException;
import java.io.Serializable;
import java.net.Authenticator;
import java.net.Authenticator.RequestorType;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.net.Proxy.Type;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import twitter4j.TwitterException;
import twitter4j.auth.Authorization;
import twitter4j.conf.Configuration;
import twitter4j.conf.ConfigurationContext;

public class HttpClientImpl extends HttpClientBase
  implements HttpResponseCode, Serializable
{
  private static final Map<HttpClientConfiguration, HttpClient> instanceMap = new HashMap(1);
  private static final long serialVersionUID = -8819171414069621503L;

  static
  {
    if (ConfigurationContext.getInstance().isDalvik())
      System.setProperty("http.keepAlive", "false");
  }

  public HttpClientImpl()
  {
    super(ConfigurationContext.getInstance());
  }

  public HttpClientImpl(HttpClientConfiguration paramHttpClientConfiguration)
  {
    super(paramHttpClientConfiguration);
  }

  public static HttpClient getInstance(HttpClientConfiguration paramHttpClientConfiguration)
  {
    Object localObject = (HttpClient)instanceMap.get(paramHttpClientConfiguration);
    if (localObject == null)
    {
      localObject = new HttpClientImpl(paramHttpClientConfiguration);
      instanceMap.put(paramHttpClientConfiguration, localObject);
    }
    return localObject;
  }

  private void setHeaders(HttpRequest paramHttpRequest, HttpURLConnection paramHttpURLConnection)
  {
    if (paramHttpRequest.getAuthorization() != null)
    {
      String str2 = paramHttpRequest.getAuthorization().getAuthorizationHeader(paramHttpRequest);
      if (str2 != null)
        paramHttpURLConnection.addRequestProperty("Authorization", str2);
    }
    if (paramHttpRequest.getRequestHeaders() != null)
    {
      Iterator localIterator = paramHttpRequest.getRequestHeaders().keySet().iterator();
      while (localIterator.hasNext())
      {
        String str1 = (String)localIterator.next();
        paramHttpURLConnection.addRequestProperty(str1, (String)paramHttpRequest.getRequestHeaders().get(str1));
      }
    }
  }

  public HttpResponse get(String paramString)
    throws TwitterException
  {
    return request(new HttpRequest(RequestMethod.GET, paramString, null, null, null));
  }

  protected HttpURLConnection getConnection(String paramString)
    throws IOException
  {
    Proxy localProxy;
    if (isProxyConfigured())
    {
      if ((this.CONF.getHttpProxyUser() != null) && (!this.CONF.getHttpProxyUser().equals("")))
        Authenticator.setDefault(new Authenticator()
        {
          protected PasswordAuthentication getPasswordAuthentication()
          {
            if (getRequestorType().equals(Authenticator.RequestorType.PROXY))
              return new PasswordAuthentication(HttpClientImpl.this.CONF.getHttpProxyUser(), HttpClientImpl.this.CONF.getHttpProxyPassword().toCharArray());
            return null;
          }
        });
      localProxy = new Proxy(Proxy.Type.HTTP, InetSocketAddress.createUnresolved(this.CONF.getHttpProxyHost(), this.CONF.getHttpProxyPort()));
    }
    for (HttpURLConnection localHttpURLConnection = (HttpURLConnection)new URL(paramString).openConnection(localProxy); ; localHttpURLConnection = (HttpURLConnection)new URL(paramString).openConnection())
    {
      if (this.CONF.getHttpConnectionTimeout() > 0)
        localHttpURLConnection.setConnectTimeout(this.CONF.getHttpConnectionTimeout());
      if (this.CONF.getHttpReadTimeout() > 0)
        localHttpURLConnection.setReadTimeout(this.CONF.getHttpReadTimeout());
      localHttpURLConnection.setInstanceFollowRedirects(false);
      return localHttpURLConnection;
    }
  }

  public HttpResponse post(String paramString, HttpParameter[] paramArrayOfHttpParameter)
    throws TwitterException
  {
    return request(new HttpRequest(RequestMethod.POST, paramString, paramArrayOfHttpParameter, null, null));
  }

  // ERROR //
  public HttpResponse request(HttpRequest paramHttpRequest)
    throws TwitterException
  {
    // Byte code:
    //   0: iconst_1
    //   1: aload_0
    //   2: getfield 138	twitter4j/internal/http/HttpClientImpl:CONF	Ltwitter4j/internal/http/HttpClientConfiguration;
    //   5: invokeinterface 225 1 0
    //   10: iadd
    //   11: istore_2
    //   12: iconst_0
    //   13: istore_3
    //   14: aconst_null
    //   15: astore 4
    //   17: iload_3
    //   18: iload_2
    //   19: if_icmpge +867 -> 886
    //   22: iconst_m1
    //   23: istore 5
    //   25: aconst_null
    //   26: astore 6
    //   28: aload_0
    //   29: aload_1
    //   30: invokevirtual 228	twitter4j/internal/http/HttpRequest:getURL	()Ljava/lang/String;
    //   33: invokevirtual 230	twitter4j/internal/http/HttpClientImpl:getConnection	(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    //   36: astore 14
    //   38: aload 14
    //   40: iconst_1
    //   41: invokevirtual 233	java/net/HttpURLConnection:setDoInput	(Z)V
    //   44: aload_0
    //   45: aload_1
    //   46: aload 14
    //   48: invokespecial 235	twitter4j/internal/http/HttpClientImpl:setHeaders	(Ltwitter4j/internal/http/HttpRequest;Ljava/net/HttpURLConnection;)V
    //   51: aload 14
    //   53: aload_1
    //   54: invokevirtual 239	twitter4j/internal/http/HttpRequest:getMethod	()Ltwitter4j/internal/http/RequestMethod;
    //   57: invokevirtual 242	twitter4j/internal/http/RequestMethod:name	()Ljava/lang/String;
    //   60: invokevirtual 245	java/net/HttpURLConnection:setRequestMethod	(Ljava/lang/String;)V
    //   63: aload_1
    //   64: invokevirtual 239	twitter4j/internal/http/HttpRequest:getMethod	()Ltwitter4j/internal/http/RequestMethod;
    //   67: astore 15
    //   69: getstatic 218	twitter4j/internal/http/RequestMethod:POST	Ltwitter4j/internal/http/RequestMethod;
    //   72: astore 16
    //   74: aconst_null
    //   75: astore 6
    //   77: aload 15
    //   79: aload 16
    //   81: if_acmpne +567 -> 648
    //   84: aload_1
    //   85: invokevirtual 249	twitter4j/internal/http/HttpRequest:getParameters	()[Ltwitter4j/internal/http/HttpParameter;
    //   88: invokestatic 255	twitter4j/internal/http/HttpParameter:containsFile	([Ltwitter4j/internal/http/HttpParameter;)Z
    //   91: istore 17
    //   93: aconst_null
    //   94: astore 6
    //   96: iload 17
    //   98: ifeq +665 -> 763
    //   101: new 257	java/lang/StringBuilder
    //   104: dup
    //   105: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   108: ldc_w 261
    //   111: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   114: invokestatic 269	java/lang/System:currentTimeMillis	()J
    //   117: invokevirtual 272	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   120: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   123: astore 18
    //   125: aload 14
    //   127: ldc_w 277
    //   130: new 257	java/lang/StringBuilder
    //   133: dup
    //   134: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   137: ldc_w 279
    //   140: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   143: aload 18
    //   145: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   148: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   151: invokevirtual 282	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   154: new 257	java/lang/StringBuilder
    //   157: dup
    //   158: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   161: ldc_w 284
    //   164: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   167: aload 18
    //   169: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   172: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   175: astore 19
    //   177: aload 14
    //   179: iconst_1
    //   180: invokevirtual 287	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   183: aload 14
    //   185: invokevirtual 291	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   188: astore 6
    //   190: new 293	java/io/DataOutputStream
    //   193: dup
    //   194: aload 6
    //   196: invokespecial 296	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   199: astore 20
    //   201: aload_1
    //   202: invokevirtual 249	twitter4j/internal/http/HttpRequest:getParameters	()[Ltwitter4j/internal/http/HttpParameter;
    //   205: astore 21
    //   207: aload 21
    //   209: arraylength
    //   210: istore 22
    //   212: iconst_0
    //   213: istore 23
    //   215: iload 23
    //   217: iload 22
    //   219: if_icmpge +383 -> 602
    //   222: aload 21
    //   224: iload 23
    //   226: aaload
    //   227: astore 24
    //   229: aload 24
    //   231: invokevirtual 299	twitter4j/internal/http/HttpParameter:isFile	()Z
    //   234: ifeq +268 -> 502
    //   237: aload_0
    //   238: aload 20
    //   240: new 257	java/lang/StringBuilder
    //   243: dup
    //   244: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   247: aload 19
    //   249: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   252: ldc_w 301
    //   255: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   258: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   261: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   264: aload_0
    //   265: aload 20
    //   267: new 257	java/lang/StringBuilder
    //   270: dup
    //   271: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   274: ldc_w 307
    //   277: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   280: aload 24
    //   282: invokevirtual 310	twitter4j/internal/http/HttpParameter:getName	()Ljava/lang/String;
    //   285: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   288: ldc_w 312
    //   291: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   294: aload 24
    //   296: invokevirtual 316	twitter4j/internal/http/HttpParameter:getFile	()Ljava/io/File;
    //   299: invokevirtual 319	java/io/File:getName	()Ljava/lang/String;
    //   302: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   305: ldc_w 321
    //   308: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   311: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   314: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   317: aload_0
    //   318: aload 20
    //   320: new 257	java/lang/StringBuilder
    //   323: dup
    //   324: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   327: ldc_w 323
    //   330: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   333: aload 24
    //   335: invokevirtual 326	twitter4j/internal/http/HttpParameter:getContentType	()Ljava/lang/String;
    //   338: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   341: ldc_w 328
    //   344: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   347: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   350: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   353: aload 24
    //   355: invokevirtual 331	twitter4j/internal/http/HttpParameter:hasFileBody	()Z
    //   358: ifeq +110 -> 468
    //   361: aload 24
    //   363: invokevirtual 335	twitter4j/internal/http/HttpParameter:getFileBody	()Ljava/io/InputStream;
    //   366: astore 25
    //   368: new 337	java/io/BufferedInputStream
    //   371: dup
    //   372: aload 25
    //   374: invokespecial 340	java/io/BufferedInputStream:<init>	(Ljava/io/InputStream;)V
    //   377: astore 26
    //   379: sipush 1024
    //   382: newarray byte
    //   384: astore 27
    //   386: aload 26
    //   388: aload 27
    //   390: invokevirtual 344	java/io/BufferedInputStream:read	([B)I
    //   393: istore 28
    //   395: iload 28
    //   397: iconst_m1
    //   398: if_icmpeq +87 -> 485
    //   401: aload 20
    //   403: aload 27
    //   405: iconst_0
    //   406: iload 28
    //   408: invokevirtual 347	java/io/DataOutputStream:write	([BII)V
    //   411: goto -25 -> 386
    //   414: astore 7
    //   416: aload 4
    //   418: astore 8
    //   420: aload 6
    //   422: invokevirtual 352	java/io/OutputStream:close	()V
    //   425: aload 7
    //   427: athrow
    //   428: astore 10
    //   430: aload_0
    //   431: getfield 138	twitter4j/internal/http/HttpClientImpl:CONF	Ltwitter4j/internal/http/HttpClientConfiguration;
    //   434: invokeinterface 225 1 0
    //   439: istore 11
    //   441: iload_3
    //   442: iload 11
    //   444: if_icmpne +395 -> 839
    //   447: new 114	twitter4j/TwitterException
    //   450: dup
    //   451: aload 10
    //   453: invokevirtual 355	java/io/IOException:getMessage	()Ljava/lang/String;
    //   456: aload 10
    //   458: iload 5
    //   460: invokespecial 358	twitter4j/TwitterException:<init>	(Ljava/lang/String;Ljava/lang/Exception;I)V
    //   463: astore 12
    //   465: aload 12
    //   467: athrow
    //   468: new 360	java/io/FileInputStream
    //   471: dup
    //   472: aload 24
    //   474: invokevirtual 316	twitter4j/internal/http/HttpParameter:getFile	()Ljava/io/File;
    //   477: invokespecial 363	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   480: astore 25
    //   482: goto -114 -> 368
    //   485: aload_0
    //   486: aload 20
    //   488: ldc_w 301
    //   491: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   494: aload 26
    //   496: invokevirtual 364	java/io/BufferedInputStream:close	()V
    //   499: goto +390 -> 889
    //   502: aload_0
    //   503: aload 20
    //   505: new 257	java/lang/StringBuilder
    //   508: dup
    //   509: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   512: aload 19
    //   514: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   517: ldc_w 301
    //   520: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   523: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   526: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   529: aload_0
    //   530: aload 20
    //   532: new 257	java/lang/StringBuilder
    //   535: dup
    //   536: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   539: ldc_w 307
    //   542: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   545: aload 24
    //   547: invokevirtual 310	twitter4j/internal/http/HttpParameter:getName	()Ljava/lang/String;
    //   550: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   553: ldc_w 321
    //   556: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   559: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   562: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   565: aload_0
    //   566: aload 20
    //   568: ldc_w 366
    //   571: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   574: aload 20
    //   576: aload 24
    //   578: invokevirtual 369	twitter4j/internal/http/HttpParameter:getValue	()Ljava/lang/String;
    //   581: ldc_w 371
    //   584: invokevirtual 375	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   587: invokevirtual 378	java/io/DataOutputStream:write	([B)V
    //   590: aload_0
    //   591: aload 20
    //   593: ldc_w 301
    //   596: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   599: goto +290 -> 889
    //   602: aload_0
    //   603: aload 20
    //   605: new 257	java/lang/StringBuilder
    //   608: dup
    //   609: invokespecial 259	java/lang/StringBuilder:<init>	()V
    //   612: aload 19
    //   614: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   617: ldc_w 380
    //   620: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   623: invokevirtual 275	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   626: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   629: aload_0
    //   630: aload 20
    //   632: ldc_w 301
    //   635: invokevirtual 305	twitter4j/internal/http/HttpClientImpl:write	(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    //   638: aload 6
    //   640: invokevirtual 383	java/io/OutputStream:flush	()V
    //   643: aload 6
    //   645: invokevirtual 352	java/io/OutputStream:close	()V
    //   648: aload_0
    //   649: getfield 138	twitter4j/internal/http/HttpClientImpl:CONF	Ltwitter4j/internal/http/HttpClientConfiguration;
    //   652: astore 29
    //   654: new 385	twitter4j/internal/http/HttpResponseImpl
    //   657: dup
    //   658: aload 14
    //   660: aload 29
    //   662: invokespecial 388	twitter4j/internal/http/HttpResponseImpl:<init>	(Ljava/net/HttpURLConnection;Ltwitter4j/internal/http/HttpClientConfiguration;)V
    //   665: astore 8
    //   667: aload 14
    //   669: invokevirtual 391	java/net/HttpURLConnection:getResponseCode	()I
    //   672: istore 5
    //   674: iload 5
    //   676: sipush 200
    //   679: if_icmplt +19 -> 698
    //   682: iload 5
    //   684: sipush 302
    //   687: if_icmpeq +139 -> 826
    //   690: sipush 300
    //   693: iload 5
    //   695: if_icmpgt +131 -> 826
    //   698: iload 5
    //   700: sipush 420
    //   703: if_icmpeq +36 -> 739
    //   706: iload 5
    //   708: sipush 400
    //   711: if_icmpeq +28 -> 739
    //   714: iload 5
    //   716: sipush 500
    //   719: if_icmplt +20 -> 739
    //   722: aload_0
    //   723: getfield 138	twitter4j/internal/http/HttpClientImpl:CONF	Ltwitter4j/internal/http/HttpClientConfiguration;
    //   726: invokeinterface 225 1 0
    //   731: istore 31
    //   733: iload_3
    //   734: iload 31
    //   736: if_icmpne +98 -> 834
    //   739: new 114	twitter4j/TwitterException
    //   742: dup
    //   743: aload 8
    //   745: invokevirtual 396	twitter4j/internal/http/HttpResponse:asString	()Ljava/lang/String;
    //   748: aload 8
    //   750: invokespecial 399	twitter4j/TwitterException:<init>	(Ljava/lang/String;Ltwitter4j/internal/http/HttpResponse;)V
    //   753: astore 30
    //   755: aload 30
    //   757: athrow
    //   758: astore 7
    //   760: goto -340 -> 420
    //   763: aload 14
    //   765: ldc_w 277
    //   768: ldc_w 401
    //   771: invokevirtual 282	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   774: aload_1
    //   775: invokevirtual 249	twitter4j/internal/http/HttpRequest:getParameters	()[Ltwitter4j/internal/http/HttpParameter;
    //   778: invokestatic 405	twitter4j/internal/http/HttpParameter:encodeParameters	([Ltwitter4j/internal/http/HttpParameter;)Ljava/lang/String;
    //   781: ldc_w 371
    //   784: invokevirtual 375	java/lang/String:getBytes	(Ljava/lang/String;)[B
    //   787: astore 34
    //   789: aload 14
    //   791: ldc_w 407
    //   794: aload 34
    //   796: arraylength
    //   797: invokestatic 412	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   800: invokevirtual 282	java/net/HttpURLConnection:setRequestProperty	(Ljava/lang/String;Ljava/lang/String;)V
    //   803: aload 14
    //   805: iconst_1
    //   806: invokevirtual 287	java/net/HttpURLConnection:setDoOutput	(Z)V
    //   809: aload 14
    //   811: invokevirtual 291	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   814: astore 6
    //   816: aload 6
    //   818: aload 34
    //   820: invokevirtual 413	java/io/OutputStream:write	([B)V
    //   823: goto -185 -> 638
    //   826: aload 6
    //   828: invokevirtual 352	java/io/OutputStream:close	()V
    //   831: aload 8
    //   833: areturn
    //   834: aload 6
    //   836: invokevirtual 352	java/io/OutputStream:close	()V
    //   839: sipush 1000
    //   842: aload_0
    //   843: getfield 138	twitter4j/internal/http/HttpClientImpl:CONF	Ltwitter4j/internal/http/HttpClientConfiguration;
    //   846: invokeinterface 416 1 0
    //   851: imul
    //   852: i2l
    //   853: invokestatic 422	java/lang/Thread:sleep	(J)V
    //   856: iinc 3 1
    //   859: aload 8
    //   861: astore 4
    //   863: goto -846 -> 17
    //   866: astore 33
    //   868: aload 8
    //   870: areturn
    //   871: astore 32
    //   873: goto -34 -> 839
    //   876: astore 9
    //   878: goto -453 -> 425
    //   881: astore 13
    //   883: goto -27 -> 856
    //   886: aload 4
    //   888: areturn
    //   889: iinc 23 1
    //   892: goto -677 -> 215
    //
    // Exception table:
    //   from	to	target	type
    //   28	74	414	finally
    //   84	93	414	finally
    //   101	212	414	finally
    //   222	368	414	finally
    //   368	386	414	finally
    //   386	395	414	finally
    //   401	411	414	finally
    //   468	482	414	finally
    //   485	499	414	finally
    //   502	599	414	finally
    //   602	638	414	finally
    //   638	648	414	finally
    //   648	667	414	finally
    //   763	823	414	finally
    //   420	425	428	java/io/IOException
    //   425	428	428	java/io/IOException
    //   826	831	428	java/io/IOException
    //   834	839	428	java/io/IOException
    //   667	674	758	finally
    //   722	733	758	finally
    //   739	758	758	finally
    //   826	831	866	java/lang/Exception
    //   834	839	871	java/lang/Exception
    //   420	425	876	java/lang/Exception
    //   839	856	881	java/lang/InterruptedException
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.internal.http.HttpClientImpl
 * JD-Core Version:    0.6.2
 */