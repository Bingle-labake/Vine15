package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.MenuItem;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import co.vine.android.network.HttpOperation;

public class CaptchaActivity extends BaseControllerActionBarActivity
{
  public static final int CAPTCHA_CANCELED = 2;
  private static final String CAPTCHA_COMPLETE = "_captcha_complete";
  private String mReqId;

  private void cancelCaptcha()
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("rid", this.mReqId);
    setResult(2, localIntent);
    finish();
  }

  public static Intent getIntent(Context paramContext, String paramString1, String paramString2)
  {
    Intent localIntent = new Intent(paramContext, CaptchaActivity.class);
    localIntent.putExtra("captcha_url", paramString1);
    localIntent.putExtra("rid", paramString2);
    return localIntent;
  }

  public void onBackPressed()
  {
    cancelCaptcha();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903154, false);
    Bundle localBundle = getIntent().getExtras();
    WebView localWebView = (WebView)findViewById(2131361933);
    this.mReqId = localBundle.getString("rid");
    String str = localBundle.getString("captcha_url");
    localWebView.getSettings().setUserAgentString(HttpOperation.USER_AGENT_STRING);
    localWebView.loadUrl(str);
    localWebView.setWebViewClient(new WebViewClient()
    {
      public void onReceivedError(WebView paramAnonymousWebView, int paramAnonymousInt, String paramAnonymousString1, String paramAnonymousString2)
      {
        paramAnonymousWebView.setVisibility(8);
      }

      public boolean shouldOverrideUrlLoading(WebView paramAnonymousWebView, String paramAnonymousString)
      {
        Uri localUri = Uri.parse(paramAnonymousString);
        boolean bool1;
        if (!localUri.getScheme().equals("vine"))
        {
          boolean bool2 = localUri.getScheme().equals("vine-dev");
          bool1 = false;
          if (!bool2);
        }
        else
        {
          if ("_captcha_complete".equals(localUri.getHost()))
          {
            Intent localIntent = new Intent();
            localIntent.putExtra("rid", CaptchaActivity.this.mReqId);
            CaptchaActivity.this.setResult(-1, localIntent);
            new AsyncTask()
            {
              protected Void doInBackground(Void[] paramAnonymous2ArrayOfVoid)
              {
                AppImpl.getInstance().clearUploadCaptchas(CaptchaActivity.this.getApplicationContext());
                return null;
              }
            }
            .execute(new Void[0]);
            CaptchaActivity.this.finish();
          }
          bool1 = true;
        }
        return bool1;
      }
    });
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (paramMenuItem.getItemId() == 16908332)
    {
      cancelCaptcha();
      return true;
    }
    return false;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.CaptchaActivity
 * JD-Core Version:    0.6.2
 */