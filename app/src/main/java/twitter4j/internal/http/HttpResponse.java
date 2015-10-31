package twitter4j.internal.http;

import co.vine.android.util.BuildUtil;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import twitter4j.conf.ConfigurationContext;
import twitter4j.internal.org.json.JSONArray;
import twitter4j.internal.org.json.JSONObject;

public abstract class HttpResponse
{
  private static boolean LOGGABLE = false;
  private static final String TAG = "T4JHttpResposne";
  protected final HttpClientConfiguration CONF;
  protected InputStream is;
  private JSONObject json = null;
  private JSONArray jsonArray = null;
  protected String responseAsString = null;
  protected int statusCode;
  private boolean streamConsumed = false;

  HttpResponse()
  {
    this.CONF = ConfigurationContext.getInstance();
  }

  public HttpResponse(HttpClientConfiguration paramHttpClientConfiguration)
  {
    this.CONF = paramHttpClientConfiguration;
  }

  private void disconnectForcibly()
  {
    try
    {
      disconnect();
      return;
    }
    catch (Exception localException)
    {
    }
  }

  // ERROR //
  public JSONArray asJSONArray()
    throws twitter4j.TwitterException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 44	twitter4j/internal/http/HttpResponse:jsonArray	Ltwitter4j/internal/org/json/JSONArray;
    //   4: ifnonnull +86 -> 90
    //   7: aconst_null
    //   8: astore_1
    //   9: aload_0
    //   10: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   13: astore 5
    //   15: aconst_null
    //   16: astore_1
    //   17: aload 5
    //   19: ifnonnull +76 -> 95
    //   22: aload_0
    //   23: invokevirtual 71	twitter4j/internal/http/HttpResponse:asReader	()Ljava/io/Reader;
    //   26: astore_1
    //   27: aload_0
    //   28: new 73	twitter4j/internal/org/json/JSONArray
    //   31: dup
    //   32: new 75	twitter4j/internal/org/json/JSONTokener
    //   35: dup
    //   36: aload_1
    //   37: invokespecial 78	twitter4j/internal/org/json/JSONTokener:<init>	(Ljava/io/Reader;)V
    //   40: invokespecial 81	twitter4j/internal/org/json/JSONArray:<init>	(Ltwitter4j/internal/org/json/JSONTokener;)V
    //   43: putfield 44	twitter4j/internal/http/HttpResponse:jsonArray	Ltwitter4j/internal/org/json/JSONArray;
    //   46: aload_0
    //   47: getfield 52	twitter4j/internal/http/HttpResponse:CONF	Ltwitter4j/internal/http/HttpClientConfiguration;
    //   50: invokeinterface 86 1 0
    //   55: ifeq +123 -> 178
    //   58: getstatic 33	twitter4j/internal/http/HttpResponse:LOGGABLE	Z
    //   61: ifeq +17 -> 78
    //   64: ldc 11
    //   66: aload_0
    //   67: getfield 44	twitter4j/internal/http/HttpResponse:jsonArray	Ltwitter4j/internal/org/json/JSONArray;
    //   70: iconst_1
    //   71: invokevirtual 90	twitter4j/internal/org/json/JSONArray:toString	(I)Ljava/lang/String;
    //   74: invokestatic 96	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   77: pop
    //   78: aload_1
    //   79: ifnull +7 -> 86
    //   82: aload_1
    //   83: invokevirtual 101	java/io/Reader:close	()V
    //   86: aload_0
    //   87: invokespecial 103	twitter4j/internal/http/HttpResponse:disconnectForcibly	()V
    //   90: aload_0
    //   91: getfield 44	twitter4j/internal/http/HttpResponse:jsonArray	Ltwitter4j/internal/org/json/JSONArray;
    //   94: areturn
    //   95: aload_0
    //   96: new 73	twitter4j/internal/org/json/JSONArray
    //   99: dup
    //   100: aload_0
    //   101: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   104: invokespecial 106	twitter4j/internal/org/json/JSONArray:<init>	(Ljava/lang/String;)V
    //   107: putfield 44	twitter4j/internal/http/HttpResponse:jsonArray	Ltwitter4j/internal/org/json/JSONArray;
    //   110: aconst_null
    //   111: astore_1
    //   112: goto -66 -> 46
    //   115: astore 4
    //   117: getstatic 33	twitter4j/internal/http/HttpResponse:LOGGABLE	Z
    //   120: ifeq +104 -> 224
    //   123: new 63	twitter4j/TwitterException
    //   126: dup
    //   127: new 108	java/lang/StringBuilder
    //   130: dup
    //   131: invokespecial 109	java/lang/StringBuilder:<init>	()V
    //   134: aload 4
    //   136: invokevirtual 113	twitter4j/internal/org/json/JSONException:getMessage	()Ljava/lang/String;
    //   139: invokevirtual 117	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   142: ldc 119
    //   144: invokevirtual 117	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: aload_0
    //   148: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   151: invokevirtual 117	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   154: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   157: aload 4
    //   159: invokespecial 124	twitter4j/TwitterException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   162: athrow
    //   163: astore_2
    //   164: aload_1
    //   165: ifnull +7 -> 172
    //   168: aload_1
    //   169: invokevirtual 101	java/io/Reader:close	()V
    //   172: aload_0
    //   173: invokespecial 103	twitter4j/internal/http/HttpResponse:disconnectForcibly	()V
    //   176: aload_2
    //   177: athrow
    //   178: getstatic 33	twitter4j/internal/http/HttpResponse:LOGGABLE	Z
    //   181: ifeq -103 -> 78
    //   184: aload_0
    //   185: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   188: ifnull +20 -> 208
    //   191: aload_0
    //   192: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   195: astore 7
    //   197: ldc 11
    //   199: aload 7
    //   201: invokestatic 96	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   204: pop
    //   205: goto -127 -> 78
    //   208: aload_0
    //   209: getfield 44	twitter4j/internal/http/HttpResponse:jsonArray	Ltwitter4j/internal/org/json/JSONArray;
    //   212: invokevirtual 125	twitter4j/internal/org/json/JSONArray:toString	()Ljava/lang/String;
    //   215: astore 6
    //   217: aload 6
    //   219: astore 7
    //   221: goto -24 -> 197
    //   224: new 63	twitter4j/TwitterException
    //   227: dup
    //   228: aload 4
    //   230: invokevirtual 113	twitter4j/internal/org/json/JSONException:getMessage	()Ljava/lang/String;
    //   233: aload 4
    //   235: invokespecial 124	twitter4j/TwitterException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   238: athrow
    //   239: astore 9
    //   241: goto -155 -> 86
    //   244: astore_3
    //   245: goto -73 -> 172
    //
    // Exception table:
    //   from	to	target	type
    //   9	15	115	twitter4j/internal/org/json/JSONException
    //   22	46	115	twitter4j/internal/org/json/JSONException
    //   46	78	115	twitter4j/internal/org/json/JSONException
    //   95	110	115	twitter4j/internal/org/json/JSONException
    //   178	197	115	twitter4j/internal/org/json/JSONException
    //   197	205	115	twitter4j/internal/org/json/JSONException
    //   208	217	115	twitter4j/internal/org/json/JSONException
    //   9	15	163	finally
    //   22	46	163	finally
    //   46	78	163	finally
    //   95	110	163	finally
    //   117	163	163	finally
    //   178	197	163	finally
    //   197	205	163	finally
    //   208	217	163	finally
    //   224	239	163	finally
    //   82	86	239	java/io/IOException
    //   168	172	244	java/io/IOException
  }

  // ERROR //
  public JSONObject asJSONObject()
    throws twitter4j.TwitterException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 42	twitter4j/internal/http/HttpResponse:json	Ltwitter4j/internal/org/json/JSONObject;
    //   4: ifnonnull +86 -> 90
    //   7: aconst_null
    //   8: astore_1
    //   9: aload_0
    //   10: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   13: astore 5
    //   15: aconst_null
    //   16: astore_1
    //   17: aload 5
    //   19: ifnonnull +76 -> 95
    //   22: aload_0
    //   23: invokevirtual 71	twitter4j/internal/http/HttpResponse:asReader	()Ljava/io/Reader;
    //   26: astore_1
    //   27: aload_0
    //   28: new 129	twitter4j/internal/org/json/JSONObject
    //   31: dup
    //   32: new 75	twitter4j/internal/org/json/JSONTokener
    //   35: dup
    //   36: aload_1
    //   37: invokespecial 78	twitter4j/internal/org/json/JSONTokener:<init>	(Ljava/io/Reader;)V
    //   40: invokespecial 130	twitter4j/internal/org/json/JSONObject:<init>	(Ltwitter4j/internal/org/json/JSONTokener;)V
    //   43: putfield 42	twitter4j/internal/http/HttpResponse:json	Ltwitter4j/internal/org/json/JSONObject;
    //   46: aload_0
    //   47: getfield 52	twitter4j/internal/http/HttpResponse:CONF	Ltwitter4j/internal/http/HttpClientConfiguration;
    //   50: invokeinterface 86 1 0
    //   55: ifeq +99 -> 154
    //   58: getstatic 33	twitter4j/internal/http/HttpResponse:LOGGABLE	Z
    //   61: ifeq +17 -> 78
    //   64: ldc 11
    //   66: aload_0
    //   67: getfield 42	twitter4j/internal/http/HttpResponse:json	Ltwitter4j/internal/org/json/JSONObject;
    //   70: iconst_1
    //   71: invokevirtual 131	twitter4j/internal/org/json/JSONObject:toString	(I)Ljava/lang/String;
    //   74: invokestatic 96	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   77: pop
    //   78: aload_1
    //   79: ifnull +7 -> 86
    //   82: aload_1
    //   83: invokevirtual 101	java/io/Reader:close	()V
    //   86: aload_0
    //   87: invokespecial 103	twitter4j/internal/http/HttpResponse:disconnectForcibly	()V
    //   90: aload_0
    //   91: getfield 42	twitter4j/internal/http/HttpResponse:json	Ltwitter4j/internal/org/json/JSONObject;
    //   94: areturn
    //   95: aload_0
    //   96: new 129	twitter4j/internal/org/json/JSONObject
    //   99: dup
    //   100: aload_0
    //   101: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   104: invokespecial 132	twitter4j/internal/org/json/JSONObject:<init>	(Ljava/lang/String;)V
    //   107: putfield 42	twitter4j/internal/http/HttpResponse:json	Ltwitter4j/internal/org/json/JSONObject;
    //   110: aconst_null
    //   111: astore_1
    //   112: goto -66 -> 46
    //   115: astore 4
    //   117: aload_0
    //   118: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   121: ifnonnull +79 -> 200
    //   124: new 63	twitter4j/TwitterException
    //   127: dup
    //   128: aload 4
    //   130: invokevirtual 113	twitter4j/internal/org/json/JSONException:getMessage	()Ljava/lang/String;
    //   133: aload 4
    //   135: invokespecial 124	twitter4j/TwitterException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   138: athrow
    //   139: astore_2
    //   140: aload_1
    //   141: ifnull +7 -> 148
    //   144: aload_1
    //   145: invokevirtual 101	java/io/Reader:close	()V
    //   148: aload_0
    //   149: invokespecial 103	twitter4j/internal/http/HttpResponse:disconnectForcibly	()V
    //   152: aload_2
    //   153: athrow
    //   154: getstatic 33	twitter4j/internal/http/HttpResponse:LOGGABLE	Z
    //   157: ifeq -79 -> 78
    //   160: aload_0
    //   161: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   164: ifnull +20 -> 184
    //   167: aload_0
    //   168: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   171: astore 7
    //   173: ldc 11
    //   175: aload 7
    //   177: invokestatic 96	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   180: pop
    //   181: goto -103 -> 78
    //   184: aload_0
    //   185: getfield 42	twitter4j/internal/http/HttpResponse:json	Ltwitter4j/internal/org/json/JSONObject;
    //   188: invokevirtual 133	twitter4j/internal/org/json/JSONObject:toString	()Ljava/lang/String;
    //   191: astore 6
    //   193: aload 6
    //   195: astore 7
    //   197: goto -24 -> 173
    //   200: new 63	twitter4j/TwitterException
    //   203: dup
    //   204: new 108	java/lang/StringBuilder
    //   207: dup
    //   208: invokespecial 109	java/lang/StringBuilder:<init>	()V
    //   211: aload 4
    //   213: invokevirtual 113	twitter4j/internal/org/json/JSONException:getMessage	()Ljava/lang/String;
    //   216: invokevirtual 117	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   219: ldc 119
    //   221: invokevirtual 117	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   224: aload_0
    //   225: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   228: invokevirtual 117	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   231: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   234: aload 4
    //   236: invokespecial 124	twitter4j/TwitterException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   239: athrow
    //   240: astore 9
    //   242: goto -156 -> 86
    //   245: astore_3
    //   246: goto -98 -> 148
    //
    // Exception table:
    //   from	to	target	type
    //   9	15	115	twitter4j/internal/org/json/JSONException
    //   22	46	115	twitter4j/internal/org/json/JSONException
    //   46	78	115	twitter4j/internal/org/json/JSONException
    //   95	110	115	twitter4j/internal/org/json/JSONException
    //   154	173	115	twitter4j/internal/org/json/JSONException
    //   173	181	115	twitter4j/internal/org/json/JSONException
    //   184	193	115	twitter4j/internal/org/json/JSONException
    //   9	15	139	finally
    //   22	46	139	finally
    //   46	78	139	finally
    //   95	110	139	finally
    //   117	139	139	finally
    //   154	173	139	finally
    //   173	181	139	finally
    //   184	193	139	finally
    //   200	240	139	finally
    //   82	86	240	java/io/IOException
    //   144	148	245	java/io/IOException
  }

  public Reader asReader()
  {
    try
    {
      BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(this.is, "UTF-8"));
      return localBufferedReader;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
    }
    return new InputStreamReader(this.is);
  }

  public InputStream asStream()
  {
    if (this.streamConsumed)
      throw new IllegalStateException("Stream has already been consumed.");
    return this.is;
  }

  // ERROR //
  public String asString()
    throws twitter4j.TwitterException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   4: ifnonnull +196 -> 200
    //   7: aconst_null
    //   8: astore_1
    //   9: aconst_null
    //   10: astore_2
    //   11: aload_0
    //   12: invokevirtual 160	twitter4j/internal/http/HttpResponse:asStream	()Ljava/io/InputStream;
    //   15: astore 7
    //   17: aload 7
    //   19: astore_2
    //   20: aload_2
    //   21: ifnonnull +25 -> 46
    //   24: aload_2
    //   25: ifnull +7 -> 32
    //   28: aload_2
    //   29: invokevirtual 163	java/io/InputStream:close	()V
    //   32: iconst_0
    //   33: ifeq +7 -> 40
    //   36: aconst_null
    //   37: invokevirtual 164	java/io/BufferedReader:close	()V
    //   40: aload_0
    //   41: invokespecial 103	twitter4j/internal/http/HttpResponse:disconnectForcibly	()V
    //   44: aconst_null
    //   45: areturn
    //   46: new 137	java/io/BufferedReader
    //   49: dup
    //   50: new 139	java/io/InputStreamReader
    //   53: dup
    //   54: aload_2
    //   55: ldc 143
    //   57: invokespecial 146	java/io/InputStreamReader:<init>	(Ljava/io/InputStream;Ljava/lang/String;)V
    //   60: invokespecial 147	java/io/BufferedReader:<init>	(Ljava/io/Reader;)V
    //   63: astore 8
    //   65: new 108	java/lang/StringBuilder
    //   68: dup
    //   69: invokespecial 109	java/lang/StringBuilder:<init>	()V
    //   72: astore 9
    //   74: aload 8
    //   76: invokevirtual 167	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   79: astore 10
    //   81: aload 10
    //   83: ifnull +61 -> 144
    //   86: aload 9
    //   88: aload 10
    //   90: invokevirtual 117	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: ldc 169
    //   95: invokevirtual 117	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   98: pop
    //   99: goto -25 -> 74
    //   102: astore_3
    //   103: aload 8
    //   105: astore_1
    //   106: new 63	twitter4j/TwitterException
    //   109: dup
    //   110: aload_3
    //   111: invokevirtual 170	java/io/IOException:getMessage	()Ljava/lang/String;
    //   114: aload_3
    //   115: invokespecial 124	twitter4j/TwitterException:<init>	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   118: athrow
    //   119: astore 4
    //   121: aload_2
    //   122: ifnull +7 -> 129
    //   125: aload_2
    //   126: invokevirtual 163	java/io/InputStream:close	()V
    //   129: aload_1
    //   130: ifnull +7 -> 137
    //   133: aload_1
    //   134: invokevirtual 164	java/io/BufferedReader:close	()V
    //   137: aload_0
    //   138: invokespecial 103	twitter4j/internal/http/HttpResponse:disconnectForcibly	()V
    //   141: aload 4
    //   143: athrow
    //   144: aload_0
    //   145: aload 9
    //   147: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   150: putfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   153: getstatic 33	twitter4j/internal/http/HttpResponse:LOGGABLE	Z
    //   156: ifeq +13 -> 169
    //   159: ldc 11
    //   161: aload_0
    //   162: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   165: invokestatic 96	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   168: pop
    //   169: aload_2
    //   170: invokevirtual 163	java/io/InputStream:close	()V
    //   173: aload_0
    //   174: iconst_1
    //   175: putfield 40	twitter4j/internal/http/HttpResponse:streamConsumed	Z
    //   178: aload_2
    //   179: ifnull +7 -> 186
    //   182: aload_2
    //   183: invokevirtual 163	java/io/InputStream:close	()V
    //   186: aload 8
    //   188: ifnull +8 -> 196
    //   191: aload 8
    //   193: invokevirtual 164	java/io/BufferedReader:close	()V
    //   196: aload_0
    //   197: invokespecial 103	twitter4j/internal/http/HttpResponse:disconnectForcibly	()V
    //   200: aload_0
    //   201: getfield 38	twitter4j/internal/http/HttpResponse:responseAsString	Ljava/lang/String;
    //   204: areturn
    //   205: astore 16
    //   207: goto -175 -> 32
    //   210: astore 15
    //   212: goto -172 -> 40
    //   215: astore 13
    //   217: goto -31 -> 186
    //   220: astore 12
    //   222: goto -26 -> 196
    //   225: astore 6
    //   227: goto -98 -> 129
    //   230: astore 5
    //   232: goto -95 -> 137
    //   235: astore 4
    //   237: aload 8
    //   239: astore_1
    //   240: goto -119 -> 121
    //   243: astore_3
    //   244: aconst_null
    //   245: astore_1
    //   246: goto -140 -> 106
    //
    // Exception table:
    //   from	to	target	type
    //   65	74	102	java/io/IOException
    //   74	81	102	java/io/IOException
    //   86	99	102	java/io/IOException
    //   144	169	102	java/io/IOException
    //   169	178	102	java/io/IOException
    //   11	17	119	finally
    //   46	65	119	finally
    //   106	119	119	finally
    //   28	32	205	java/io/IOException
    //   36	40	210	java/io/IOException
    //   182	186	215	java/io/IOException
    //   191	196	220	java/io/IOException
    //   125	129	225	java/io/IOException
    //   133	137	230	java/io/IOException
    //   65	74	235	finally
    //   74	81	235	finally
    //   86	99	235	finally
    //   144	169	235	finally
    //   169	178	235	finally
    //   11	17	243	java/io/IOException
    //   46	65	243	java/io/IOException
  }

  public abstract void disconnect()
    throws IOException;

  public abstract String getResponseHeader(String paramString);

  public abstract Map<String, List<String>> getResponseHeaderFields();

  public int getStatusCode()
  {
    return this.statusCode;
  }

  public String toString()
  {
    return "HttpResponse{statusCode=" + this.statusCode + ", responseAsString='" + this.responseAsString + '\'' + ", is=" + this.is + ", streamConsumed=" + this.streamConsumed + '}';
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     twitter4j.internal.http.HttpResponse
 * JD-Core Version:    0.6.2
 */