package co.vine.android;

import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageManager.NameNotFoundException;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.VineAPI;
import co.vine.android.provider.SettingsManager;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.Util;
import co.vine.android.widget.OnTabChangedListener;
import com.edisonwang.android.slog.SLog;
import com.twitter.android.widget.TopScrollable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;

public class ExploreFragment extends BaseControllerFragment
  implements OnTabChangedListener, TopScrollable
{
  private static final boolean LOGGABLE = false;
  private static final String PARAM_EDITION = "ed";
  private static final String PARAM_MODEL = "model";
  private static final String PARAM_OS = "os";
  private static final String PARAM_VERSION = "v";
  private static final String PREF_LAST_REFRESH_TIME = "last_explore";
  private static final long REFRESH_INTERVAL = 900000L;
  private static final String TAG = "ExploreFragment";
  private static final String VALUE_OS = "android";
  private static final String VALUE_UNDEFINED = "undefined";
  private View mEmpty;
  private TextView mEmptyText;
  private SharedPreferences mPrefs;
  private RelativeLayout mProgressContainer;
  private ImageView mSadface;
  private WebView mWebView;

  private String getExploreUrl()
  {
    String str1 = BuildUtil.get(getActivity()).getExploreUrl();
    try
    {
      String str4 = Util.getVersionName(getActivity());
      str2 = str4;
      Locale localLocale = Locale.US;
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Build.MANUFACTURER;
      arrayOfObject[1] = Build.MODEL;
      String str3 = String.format(localLocale, "%s_%s", arrayOfObject);
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(new BasicNameValuePair("model", str3.replaceAll("\\s+", "-")));
      localArrayList.add(new BasicNameValuePair("v", str2));
      localArrayList.add(new BasicNameValuePair("os", "android"));
      localArrayList.add(new BasicNameValuePair("ed", SettingsManager.getEdition(getActivity())));
      return str1 + "?" + URLEncodedUtils.format(localArrayList, "UTF-8");
    }
    catch (PackageManager.NameNotFoundException localNameNotFoundException)
    {
      while (true)
        String str2 = "undefined";
    }
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppSessionListener = new ExploreListener();
  }

  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    View localView = paramLayoutInflater.inflate(2130903085, paramViewGroup, false);
    this.mEmpty = localView.findViewById(2131361934);
    this.mEmptyText = ((TextView)localView.findViewById(2131361889));
    this.mProgressContainer = ((RelativeLayout)localView.findViewById(2131362116));
    this.mSadface = ((ImageView)localView.findViewById(2131361935));
    this.mWebView = ((WebView)localView.findViewById(2131361933));
    this.mPrefs = Util.getDefaultSharedPrefs(getActivity());
    return localView;
  }

  public void onDestroy()
  {
    ViewGroup localViewGroup = (ViewGroup)this.mWebView.getParent();
    localViewGroup.removeViewAt(localViewGroup.indexOfChild(this.mWebView));
    this.mWebView.destroy();
    super.onDestroy();
  }

  public void onMoveAway(int paramInt)
  {
  }

  public void onMoveTo(int paramInt)
  {
    long l1 = this.mPrefs.getLong("last_explore", 0L);
    SharedPreferences.Editor localEditor = this.mPrefs.edit();
    long l2 = System.currentTimeMillis();
    if (localEditor != null)
    {
      if ((l1 <= 0L) || (900000L + l1 >= l2))
        break label73;
      reloadWebView();
      localEditor.putLong("last_explore", l2).commit();
    }
    label73: 
    while (l1 > 0L)
      return;
    localEditor.putLong("last_explore", l2).commit();
  }

  public void onPause()
  {
    super.onPause();
    this.mAppController.addListener(this.mAppSessionListener);
  }

  public void onViewCreated(View paramView, Bundle paramBundle)
  {
    super.onViewCreated(paramView, paramBundle);
    reloadWebView();
  }

  public void reloadWebView()
  {
    View localView = getView();
    WebView localWebView;
    WebSettings localWebSettings;
    if (localView != null)
    {
      localWebView = (WebView)localView.findViewById(2131361933);
      if (localWebView != null)
      {
        localWebView.setWebViewClient(new VineVideoListWebViewClient());
        localWebView.setHorizontalScrollBarEnabled(false);
        localWebSettings = localWebView.getSettings();
      }
    }
    try
    {
      localWebSettings.setJavaScriptEnabled(true);
      label50: localWebSettings.setCacheMode(2);
      HashMap localHashMap = new HashMap(1);
      String str1 = Util.getLocale();
      if (!TextUtils.isEmpty(str1))
        localHashMap.put("Accept-Language", str1);
      VineAPI localVineAPI = VineAPI.getInstance(getActivity());
      localHashMap.put("X-Vine-Client", localVineAPI.getVineClientHeader());
      if (!BuildUtil.isProduction())
        localHashMap.put("X-Vine-Auth", localVineAPI.getAuthHeaderSecret());
      String str2 = getExploreUrl();
      if (BuildUtil.isLogsOn())
        Log.v("ExploreFragment", "Accessing explore url: " + str2);
      localWebView.loadUrl(str2, localHashMap);
      return;
    }
    catch (Exception localException)
    {
      break label50;
    }
  }

  public boolean scrollTop()
  {
    WebView localWebView = this.mWebView;
    boolean bool = false;
    if (localWebView != null)
    {
      this.mWebView.scrollTo(0, 0);
      bool = true;
    }
    return bool;
  }

  class ExploreListener extends AppSessionListener
  {
    ExploreListener()
    {
    }

    public void onUpdateEditionComplete(String paramString1, int paramInt, String paramString2)
    {
      super.onUpdateEditionComplete(paramString1, paramInt, paramString2);
      SLog.d("Reloading webview after edition update");
      ExploreFragment.this.reloadWebView();
    }
  }

  class VineVideoListWebViewClient extends WebViewClient
  {
    VineVideoListWebViewClient()
    {
    }

    public void onReceivedError(WebView paramWebView, int paramInt, String paramString1, String paramString2)
    {
      if (ExploreFragment.LOGGABLE)
        Log.d("ExploreFragment", "WebViewClient errorCode=" + paramInt);
      paramWebView.setVisibility(8);
      if (ExploreFragment.this.mProgressContainer != null)
        ExploreFragment.this.mProgressContainer.setVisibility(8);
      if (ExploreFragment.this.mEmpty != null)
        ExploreFragment.this.mEmpty.setVisibility(0);
      if (ExploreFragment.this.mSadface != null)
        ExploreFragment.this.mSadface.setVisibility(0);
      if (ExploreFragment.this.mEmptyText != null)
        ExploreFragment.this.mEmptyText.setVisibility(0);
      if (paramInt == -2);
      for (String str = ExploreFragment.this.getString(2131624106); ; str = ExploreFragment.this.getString(2131624105))
      {
        ExploreFragment.this.mEmptyText.setText(str);
        return;
      }
    }

    public boolean shouldOverrideUrlLoading(WebView paramWebView, String paramString)
    {
      Uri localUri = Uri.parse(paramString);
      if (localUri.getScheme().equals("vine"))
      {
        Intent localIntent = new Intent();
        localIntent.setData(localUri);
        if ("channels".equals(localUri.getHost()))
          localIntent.setClass(ExploreFragment.this.getActivity(), ExploreChannelsActivity.class);
        while (true)
        {
          ExploreFragment.this.startActivity(localIntent);
          return true;
          localIntent.setClass(ExploreFragment.this.getActivity(), ExploreVideoListActivity.class);
        }
      }
      return false;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ExploreFragment
 * JD-Core Version:    0.6.2
 */