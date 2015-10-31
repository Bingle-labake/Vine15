package com.flurry.android;

import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import org.apache.http.Header;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;

final class ab extends AsyncTask<Void, Void, String>
{
  private Context J;
  private String ae;
  private final String d = getClass().getSimpleName();

  public ab(FlurryAds paramFlurryAds, Context paramContext, String paramString)
  {
    this.J = paramContext;
    this.ae = paramString;
  }

  private String g()
  {
    for (int i = 0; ; i++)
    {
      String str = null;
      if (i < 5)
      {
        try
        {
          if (!Uri.parse(this.ae).getScheme().equals("http"))
            break label240;
          if ((FlurryAds.j(this.J) == true) && (!FlurryAds.k(this.J)))
          {
            HttpResponse localHttpResponse = bd.a(this.ae, 10000, 15000, false);
            if (localHttpResponse == null)
              continue;
            int j = localHttpResponse.getStatusLine().getStatusCode();
            if (j == 200)
            {
              new StringBuilder().append("Redirect URL found for: ").append(this.ae).toString();
              return this.ae;
            }
            if ((j >= 300) && (j < 400))
            {
              new StringBuilder().append("NumRedirects: ").append(i + 1).toString();
              if (!localHttpResponse.containsHeader("Location"))
                continue;
              this.ae = localHttpResponse.getFirstHeader("Location").getValue();
              continue;
            }
            new StringBuilder().append("Bad Response status code: ").append(j).toString();
            return null;
          }
        }
        catch (Throwable localThrowable)
        {
          localThrowable.printStackTrace();
          return null;
        }
        try
        {
          Thread.sleep(100L);
        }
        catch (InterruptedException localInterruptedException)
        {
          localInterruptedException.getMessage();
        }
        label240: boolean bool = FlurryAds.a(this.J, this.ae, "android.intent.action.VIEW");
        str = null;
        if (bool)
          str = this.ae;
      }
      return str;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.ab
 * JD-Core Version:    0.6.2
 */