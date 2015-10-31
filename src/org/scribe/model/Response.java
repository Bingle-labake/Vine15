package org.scribe.model;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.scribe.utils.StreamUtils;

public class Response
{
  private static final String EMPTY = "";
  private String body;
  private int code;
  private Map<String, String> headers;
  private InputStream stream;

  Response(HttpURLConnection paramHttpURLConnection)
    throws IOException
  {
    try
    {
      paramHttpURLConnection.connect();
      this.code = paramHttpURLConnection.getResponseCode();
      this.headers = parseHeaders(paramHttpURLConnection);
      if (isSuccessful());
      InputStream localInputStream;
      for (Object localObject = paramHttpURLConnection.getInputStream(); ; localObject = localInputStream)
      {
        this.stream = ((InputStream)localObject);
        return;
        localInputStream = paramHttpURLConnection.getErrorStream();
      }
    }
    catch (UnknownHostException localUnknownHostException)
    {
      this.code = 404;
      this.body = "";
    }
  }

  private String parseBodyContents()
  {
    this.body = StreamUtils.getStreamContents(getStream());
    return this.body;
  }

  private Map<String, String> parseHeaders(HttpURLConnection paramHttpURLConnection)
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = paramHttpURLConnection.getHeaderFields().keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, ((List)paramHttpURLConnection.getHeaderFields().get(str)).get(0));
    }
    return localHashMap;
  }

  public String getBody()
  {
    if (this.body != null)
      return this.body;
    return parseBodyContents();
  }

  public int getCode()
  {
    return this.code;
  }

  public String getHeader(String paramString)
  {
    return (String)this.headers.get(paramString);
  }

  public Map<String, String> getHeaders()
  {
    return this.headers;
  }

  public InputStream getStream()
  {
    return this.stream;
  }

  public boolean isSuccessful()
  {
    return (getCode() >= 200) && (getCode() < 400);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     org.scribe.model.Response
 * JD-Core Version:    0.6.2
 */