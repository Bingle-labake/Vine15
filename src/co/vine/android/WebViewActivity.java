package co.vine.android;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import co.vine.android.client.VineAPI;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class WebViewActivity extends BaseControllerActionBarActivity
{
  public static final String EXTRA_TYPE = "type";
  public static final int TYPE_ATTRIBUTION = 5;
  public static final int TYPE_PRIVACY_POLICY_TWITTER = 3;
  public static final int TYPE_PRIVACY_POLICY_VINE = 1;
  public static final int TYPE_TOS_TWITTER = 4;
  public static final int TYPE_TOS_VINE = 2;

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903154, false);
    WebView localWebView = (WebView)findViewById(2131361933);
    localWebView.setWebViewClient(new WebViewClient());
    Bundle localBundle = getIntent().getExtras();
    HashMap localHashMap;
    if (localBundle != null)
    {
      localHashMap = new HashMap(1);
      String str = Locale.getDefault().getLanguage();
      if (!TextUtils.isEmpty(str))
      {
        localHashMap.put("Accept-Language", str);
        localHashMap.put("X-Vine-Client", VineAPI.getInstance(this).getVineClientHeader());
      }
      switch (localBundle.getInt("type"))
      {
      default:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      }
    }
    while (true)
    {
      setupActionBar(Boolean.valueOf(true), null, null, null);
      return;
      localWebView.loadUrl(getString(2131624232), localHashMap);
      continue;
      localWebView.loadUrl(getString(2131624389), localHashMap);
      continue;
      localWebView.loadUrl(getString(2131624231), localHashMap);
      continue;
      localWebView.loadUrl(getString(2131624388), localHashMap);
      continue;
      localWebView.loadUrl(getString(2131624009), localHashMap);
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755010, paramMenu);
    paramMenu.findItem(2131362189).setEnabled(true);
    return true;
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 2131362189:
    }
    finish();
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.WebViewActivity
 * JD-Core Version:    0.6.2
 */