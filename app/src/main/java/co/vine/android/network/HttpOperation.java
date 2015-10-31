package co.vine.android.network;

import android.util.Log;
import co.vine.android.client.VineAPI;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.MeasureInputStream;
import co.vine.android.util.Util;
import com.edisonwang.android.slog.SLog;
import com.flurry.org.codehaus.jackson.map.ObjectMapper;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.concurrent.atomic.AtomicLong;
import java.util.zip.GZIPInputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.entity.StringEntity;
import org.apache.http.message.BasicNameValuePair;

public class HttpOperation
{
  private static final int DEFAULT_AUTH_RETRIES = 1;
  private static final HttpOperationReader DEFAULT_READER;
  public static final int DEFAULT_RETRIES = 0;
  private static final HttpResult[] EMPTY_RESULTS;
  public static final String FORM_URLENCODED_HEADER = "application/x-www-form-urlencoded";
  private static final String HEADER_DATE = "Date";
  public static final int HIGH_PRIORITY_RETRIES = 1;
  public static final int HTTP_MULTIPLE_REDIRECT = 300;
  public static final int HTTP_OK = 200;
  private static final boolean LOGGABLE = false;
  private static final String TAG = "HttpOperation";
  public static final String USER_AGENT_STRING = System.getProperty("http.agent");
  private static final String X_RATELIMIT_LIMIT = "X-RateLimit-Limit";
  private static final String X_RATELIMIT_REMAINING = "X-RateLimit-Remaining";
  private static final String X_RATELIMIT_RESET = "X-RateLimit-Reset";
  public static final AtomicLong sTimeOffset;
  public Exception exception;
  private final HttpClient mHttpClient;
  private final HttpRequestBase mHttpRequest;
  private final HttpOperationReader mReader;
  private HttpResult[] mResults;
  public int statusCode;
  public String statusPhrase;
  public String uploadKey;

  static
  {
    if ((BuildUtil.isLogsOn()) || (Log.isLoggable("HttpOperation", 3)));
    for (boolean bool = true; ; bool = false)
    {
      LOGGABLE = bool;
      sTimeOffset = new AtomicLong(0L);
      EMPTY_RESULTS = new HttpResult[0];
      DEFAULT_READER = new DefaultHttpOperationReader();
      return;
    }
  }

  public HttpOperation(HttpOperationClient paramHttpOperationClient, HttpRequestBase paramHttpRequestBase, HttpOperationReader paramHttpOperationReader, VineAPI paramVineAPI)
  {
    paramHttpRequestBase.addHeader("Accept-Encoding", "gzip");
    paramHttpRequestBase.addHeader("User-Agent", USER_AGENT_STRING);
    if (paramVineAPI != null)
      paramVineAPI.addClientHeaders(paramHttpRequestBase);
    this.mHttpClient = paramHttpOperationClient.getHttpClient();
    this.mHttpRequest = paramHttpRequestBase;
    if (paramHttpOperationReader == null)
    {
      this.mReader = DEFAULT_READER;
      return;
    }
    this.mReader = paramHttpOperationReader;
  }

  public static HttpOperation createBasicAuthDeleteRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, VineAPI paramVineAPI, HttpOperationReader paramHttpOperationReader)
  {
    HttpOperation localHttpOperation = new HttpOperation(paramHttpOperationClient, new HttpDelete(paramStringBuilder.toString()), paramHttpOperationReader, paramVineAPI);
    paramVineAPI.addSessionKeyAuthHeader(localHttpOperation);
    return localHttpOperation;
  }

  public static HttpOperation createBasicAuthDeleteRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, VineAPI paramVineAPI, HttpOperationReader paramHttpOperationReader, String paramString)
  {
    HttpOperation localHttpOperation = new HttpOperation(paramHttpOperationClient, new HttpDelete(paramStringBuilder.toString()), paramHttpOperationReader, paramVineAPI);
    paramVineAPI.addSessionKeyAuthHeader(localHttpOperation, paramString);
    return localHttpOperation;
  }

  public static HttpOperation createBasicAuthGetRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, VineAPI paramVineAPI, HttpOperationReader paramHttpOperationReader)
  {
    HttpOperation localHttpOperation = new HttpOperation(paramHttpOperationClient, new HttpGet(paramStringBuilder.toString()), paramHttpOperationReader, paramVineAPI);
    paramVineAPI.addSessionKeyAuthHeader(localHttpOperation);
    return localHttpOperation;
  }

  public static HttpOperation createBasicAuthGetRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, VineAPI paramVineAPI, HttpOperationReader paramHttpOperationReader, String paramString)
  {
    HttpOperation localHttpOperation = new HttpOperation(paramHttpOperationClient, new HttpGet(paramStringBuilder.toString()), paramHttpOperationReader, paramVineAPI);
    paramVineAPI.addSessionKeyAuthHeader(localHttpOperation, paramString);
    return localHttpOperation;
  }

  public static HttpOperation createBasicAuthJsonPostRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, VineAPI paramVineAPI, HashMap<String, Object> paramHashMap, HttpOperationReader paramHttpOperationReader)
  {
    HttpOperation localHttpOperation = createPostRequest(paramHttpOperationClient, paramStringBuilder, paramHashMap, paramHttpOperationReader, paramVineAPI);
    paramVineAPI.addSessionKeyAuthHeader(localHttpOperation);
    paramVineAPI.addContentTypeHeader(localHttpOperation, "application/json");
    return localHttpOperation;
  }

  public static HttpOperation createBasicAuthPostRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, VineAPI paramVineAPI, ArrayList<BasicNameValuePair> paramArrayList, HttpOperationReader paramHttpOperationReader, String[] paramArrayOfString)
  {
    HttpOperation localHttpOperation = createPostRequest(paramHttpOperationClient, paramStringBuilder, paramArrayList, paramHttpOperationReader, paramVineAPI);
    paramVineAPI.addSessionKeyAuthHeader(localHttpOperation);
    int i = paramArrayOfString.length;
    for (int j = 0; j < i; j++)
      paramVineAPI.addContentTypeHeader(localHttpOperation, paramArrayOfString[j]);
    return localHttpOperation;
  }

  public static HttpOperation createBasicAuthPutRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, VineAPI paramVineAPI, ArrayList<BasicNameValuePair> paramArrayList, HttpOperationReader paramHttpOperationReader)
  {
    HttpPut localHttpPut = new HttpPut(paramStringBuilder.toString());
    if (paramArrayList != null);
    try
    {
      localHttpPut.setEntity(new UrlEncodedFormEntity(paramArrayList, "UTF-8"));
      HttpOperation localHttpOperation = new HttpOperation(paramHttpOperationClient, localHttpPut, paramHttpOperationReader, paramVineAPI);
      paramVineAPI.addSessionKeyAuthHeader(localHttpOperation);
      return localHttpOperation;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      while (true)
        localUnsupportedEncodingException.printStackTrace();
    }
  }

  public static HttpOperation createGetRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, HttpOperationReader paramHttpOperationReader, VineAPI paramVineAPI)
  {
    return new HttpOperation(paramHttpOperationClient, new HttpGet(paramStringBuilder.toString()), paramHttpOperationReader, paramVineAPI);
  }

  public static HttpOperation createMediaPutRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, HttpOperationReader paramHttpOperationReader, HttpEntity paramHttpEntity, VineAPI paramVineAPI)
  {
    HttpPut localHttpPut = new HttpPut(paramStringBuilder.toString());
    if (paramHttpEntity != null)
      localHttpPut.setEntity(paramHttpEntity);
    HttpOperation localHttpOperation = new HttpOperation(paramHttpOperationClient, localHttpPut, paramHttpOperationReader, paramVineAPI);
    paramVineAPI.addSessionKeyAuthHeader(localHttpOperation);
    return localHttpOperation;
  }

  private static HttpOperation createPostRequest(HttpOperationClient paramHttpOperationClient, CharSequence paramCharSequence, HashMap<String, Object> paramHashMap, HttpOperationReader paramHttpOperationReader, VineAPI paramVineAPI)
  {
    HttpPost localHttpPost = new HttpPost(paramCharSequence.toString());
    if (paramHashMap != null);
    try
    {
      ObjectMapper localObjectMapper = new ObjectMapper();
      StringEntity localStringEntity = new StringEntity(localObjectMapper.writeValueAsString(localObjectMapper.valueToTree(paramHashMap)), "UTF-8");
      localStringEntity.setContentType("application/json");
      localStringEntity.setContentEncoding("UTF-8");
      localHttpPost.setEntity(localStringEntity);
      return new HttpOperation(paramHttpOperationClient, localHttpPost, paramHttpOperationReader, paramVineAPI);
    }
    catch (IOException localIOException)
    {
      while (true)
        SLog.e("Failed to create Post Request.", localIOException);
    }
  }

  public static HttpOperation createPostRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, ArrayList<BasicNameValuePair> paramArrayList, HttpOperationReader paramHttpOperationReader, VineAPI paramVineAPI)
  {
    HttpPost localHttpPost = new HttpPost(paramStringBuilder.toString());
    if (paramArrayList != null);
    try
    {
      localHttpPost.setEntity(new UrlEncodedFormEntity(paramArrayList, "UTF-8"));
      return new HttpOperation(paramHttpOperationClient, localHttpPost, paramHttpOperationReader, paramVineAPI);
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      while (true)
        localUnsupportedEncodingException.printStackTrace();
    }
  }

  public static HttpOperation createResourceGetRequest(HttpOperationClient paramHttpOperationClient, StringBuilder paramStringBuilder, VineAPI paramVineAPI, HttpOperationReader paramHttpOperationReader)
  {
    HttpOperation localHttpOperation = new HttpOperation(paramHttpOperationClient, new HttpGet(paramStringBuilder.toString()), paramHttpOperationReader, paramVineAPI);
    if (paramStringBuilder.toString().startsWith("https"))
      paramVineAPI.addSessionKeyAuthHeader(localHttpOperation);
    return localHttpOperation;
  }

  public void cancel()
  {
    this.mHttpRequest.abort();
  }

  public HttpOperation execute()
  {
    return execute(0);
  }

  public final HttpOperation execute(int paramInt)
  {
    int i = 1;
    String str1 = null;
    HttpRequestBase localHttpRequestBase = this.mHttpRequest;
    ArrayList localArrayList = new ArrayList(1 + Math.max(paramInt, 0));
    long l1 = -1L;
    long l2 = 0L;
    long l3 = 0L;
    long l4 = 0L;
    prepareRequest(sTimeOffset.get());
    if (LOGGABLE)
      Log.d("HttpOperation", localHttpRequestBase.getMethod() + " " + localHttpRequestBase.getURI());
    long l5 = System.currentTimeMillis();
    while (true)
    {
      int j;
      try
      {
        while (true)
        {
          HttpResponse localHttpResponse = this.mHttpClient.execute(localHttpRequestBase);
          StatusLine localStatusLine = localHttpResponse.getStatusLine();
          j = localStatusLine.getStatusCode();
          l1 = System.currentTimeMillis() - l5;
          str2 = localStatusLine.getReasonPhrase();
          if (LOGGABLE)
          {
            Log.d("HttpOperation", j + "/" + str2 + " [" + localHttpRequestBase.getURI() + "]");
            break label1329;
            label208: HttpEntity localHttpEntity = localHttpResponse.getEntity();
            l3 = System.currentTimeMillis() - l5;
            String str3;
            label264: String str4;
            label287: int k;
            Object localObject3;
            if ((localHttpEntity != null) && (localHttpEntity.isStreaming()))
            {
              if (localHttpEntity.getContentEncoding() == null)
                break label763;
              str3 = localHttpEntity.getContentEncoding().getValue();
              Header localHeader2 = localHttpEntity.getContentType();
              if (localHeader2 == null)
                break label769;
              str4 = localHeader2.getValue();
              k = (int)localHttpEntity.getContentLength();
              if (LOGGABLE)
                Log.d("HttpOperation", "read: Encoding: " + str3 + ", type: " + str4 + ", length: " + k);
              localObject3 = null;
            }
            try
            {
              MeasureInputStream localMeasureInputStream = new MeasureInputStream(localHttpEntity.getContent());
              localObject3 = localMeasureInputStream;
              if (str4 == null);
              while (true)
              {
                this.mReader.readInput(j, k, localObject3);
                long l12 = localMeasureInputStream.getReadTime();
                l2 = l12;
                long l13 = System.currentTimeMillis();
                Util.closeSilently(localObject3);
                long l14 = System.currentTimeMillis();
                l4 = l14 - l13;
                long l10 = l4 + (l3 + l2);
                if ((l1 != -1L) && ((SLog.sLogsOn) || (Math.random() > 0.1D)))
                {
                  URI localURI3 = localHttpRequestBase.getURI();
                  Object[] arrayOfObject3 = new Object[4];
                  arrayOfObject3[0] = localURI3.getHost();
                  arrayOfObject3[1] = localURI3.getPath();
                  arrayOfObject3[2] = Long.valueOf(l1);
                  arrayOfObject3[3] = Long.valueOf(l10);
                  SLog.d("{}, {} took {} ms to open and {} total.", arrayOfObject3);
                  FlurryUtils.trackRespondTime(localURI3.getHost(), localURI3.getPath(), l1, l10, localURI3.toString().contains("/r/videos/"));
                }
                HttpResult localHttpResult = new HttpResult(j, str2);
                localHttpResult.exception = null;
                localHttpResult.durationMs = l10;
                localHttpResult.uploadKey = str1;
                if (j != 200)
                  this.mReader.onHandleError(localHttpResult);
                localArrayList.add(localHttpResult);
                paramInt--;
                localObject2 = null;
                if (paramInt >= 0)
                  break;
                this.statusCode = j;
                this.statusPhrase = str2;
                this.exception = localObject2;
                this.uploadKey = str1;
                this.mResults = new HttpResult[localArrayList.size()];
                localArrayList.toArray(this.mResults);
                return this;
                Header[] arrayOfHeader = localHttpResponse.getHeaders("X-Upload-Key");
                if ((arrayOfHeader == null) || (arrayOfHeader.length <= 0))
                  break label208;
                str1 = arrayOfHeader[0].getValue();
                break label208;
                Header localHeader1 = localHttpResponse.getLastHeader("Date");
                if (localHeader1 != null)
                {
                  long l8 = Util.DATE_TIME_RFC1123.parse(localHeader1.getValue()).getTime();
                  long l9 = System.currentTimeMillis();
                  sTimeOffset.set(l8 - l9);
                }
                if (i <= 0)
                  break label208;
                i--;
                paramInt++;
                break label208;
                label763: str3 = null;
                break label264;
                label769: str4 = null;
                break label287;
                if ((!str4.startsWith("application/octet-stream")) && (!str4.startsWith("video/mp4")) && (!str4.startsWith("binary/octet-stream")))
                  if (str4.startsWith("application/json"))
                  {
                    if ((str3 != null) && (str3.equals("gzip")))
                    {
                      GZIPInputStream localGZIPInputStream1 = new GZIPInputStream(localObject3);
                      k = -1;
                      localObject3 = localGZIPInputStream1;
                    }
                  }
                  else
                  {
                    if ((!str4.startsWith("text/html")) && (!str4.startsWith("text/plain")) && (!str4.startsWith("text/xml")) && (!str4.startsWith("application/xml")) && (!str4.startsWith("image/")))
                      break label945;
                    if ((str3 != null) && (str3.equals("gzip")))
                    {
                      GZIPInputStream localGZIPInputStream2 = new GZIPInputStream(localObject3);
                      k = -1;
                      localObject3 = localGZIPInputStream2;
                    }
                  }
              }
              label945: throw new IOException("Unsupported content type: " + str4);
            }
            finally
            {
              long l11 = System.currentTimeMillis();
              Util.closeSilently(localObject3);
              l4 = System.currentTimeMillis() - l11;
            }
          }
        }
      }
      catch (Exception localException)
      {
        if (LOGGABLE)
          Log.d("HttpOperation", "[" + localHttpRequestBase.getURI() + "]", localException);
        localHttpRequestBase.abort();
        Object localObject2 = localException;
        long l7 = l4 + (l3 + l2);
        boolean bool1 = -1L < -1L;
        String str2 = null;
        j = 0;
        if (!bool1)
          continue;
        if (!SLog.sLogsOn)
        {
          boolean bool2 = Math.random() < 0.1D;
          str2 = null;
          j = 0;
          if (!bool2)
            continue;
        }
        URI localURI2 = localHttpRequestBase.getURI();
        Object[] arrayOfObject2 = new Object[4];
        arrayOfObject2[0] = localURI2.getHost();
        arrayOfObject2[1] = localURI2.getPath();
        arrayOfObject2[2] = Long.valueOf(-1L);
        arrayOfObject2[3] = Long.valueOf(l7);
        SLog.d("{}, {} took {} ms to open and {} total.", arrayOfObject2);
        FlurryUtils.trackRespondTime(localURI2.getHost(), localURI2.getPath(), -1L, l7, localURI2.toString().contains("/r/videos/"));
        str2 = null;
        j = 0;
        continue;
      }
      finally
      {
        long l6 = l4 + (l3 + l2);
        if ((l1 != -1L) && ((SLog.sLogsOn) || (Math.random() > 0.1D)))
        {
          URI localURI1 = localHttpRequestBase.getURI();
          Object[] arrayOfObject1 = new Object[4];
          arrayOfObject1[0] = localURI1.getHost();
          arrayOfObject1[1] = localURI1.getPath();
          arrayOfObject1[2] = Long.valueOf(l1);
          arrayOfObject1[3] = Long.valueOf(l6);
          SLog.d("{}, {} took {} ms to open and {} total.", arrayOfObject1);
          FlurryUtils.trackRespondTime(localURI1.getHost(), localURI1.getPath(), l1, l6, localURI1.toString().contains("/r/videos/"));
        }
      }
      label1329: switch (j)
      {
      case 500:
      case 502:
      case 503:
      case 200:
      case 401:
      }
      paramInt = 0;
    }
  }

  public HttpRequestBase getHttpRequest()
  {
    return this.mHttpRequest;
  }

  public HttpOperationReader getReader()
  {
    return this.mReader;
  }

  public HttpResult[] getResults()
  {
    if (this.mResults == null)
      return EMPTY_RESULTS;
    return this.mResults;
  }

  public boolean isOK()
  {
    return this.statusCode == 200;
  }

  public boolean isSuccessful()
  {
    return (this.statusCode >= 200) && (this.statusCode < 300);
  }

  protected void prepareRequest(long paramLong)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.HttpOperation
 * JD-Core Version:    0.6.2
 */