package co.vine.android.views;

import android.content.Context;
import android.os.Build.VERSION;
import android.util.AttributeSet;
import android.webkit.WebView;

public class SdkWebView extends WebView
{
  public SdkWebView(Context paramContext)
  {
    super(paramContext);
    init();
  }

  public SdkWebView(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
    init();
  }

  public SdkWebView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    init();
  }

  private void init()
  {
    if (Build.VERSION.SDK_INT <= 14)
      setScrollBarStyle(0);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.views.SdkWebView
 * JD-Core Version:    0.6.2
 */