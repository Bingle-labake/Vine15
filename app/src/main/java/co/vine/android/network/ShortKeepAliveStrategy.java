package co.vine.android.network;

import org.apache.http.HeaderElement;
import org.apache.http.HeaderElementIterator;
import org.apache.http.HttpResponse;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.message.BasicHeaderElementIterator;
import org.apache.http.protocol.HttpContext;

class ShortKeepAliveStrategy
  implements ConnectionKeepAliveStrategy
{
  private static final long DEFAULT_KEEP_ALIVE_DURATION = 60000L;

  public long getKeepAliveDuration(HttpResponse paramHttpResponse, HttpContext paramHttpContext)
  {
    BasicHeaderElementIterator localBasicHeaderElementIterator = new BasicHeaderElementIterator(paramHttpResponse.headerIterator("Keep-Alive"));
    while (true)
    {
      String str2;
      if (localBasicHeaderElementIterator.hasNext())
      {
        HeaderElement localHeaderElement = localBasicHeaderElementIterator.nextElement();
        String str1 = localHeaderElement.getName();
        str2 = localHeaderElement.getValue();
        if ((str2 == null) || (!"timeout".equalsIgnoreCase(str1)));
      }
      else
      {
        try
        {
          long l1 = Long.parseLong(str2);
          long l2 = l1 * 1000L;
          if (l2 > 0L)
          {
            return l2;
            return 60000L;
          }
        }
        catch (NumberFormatException localNumberFormatException)
        {
        }
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.network.ShortKeepAliveStrategy
 * JD-Core Version:    0.6.2
 */