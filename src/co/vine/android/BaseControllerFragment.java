package co.vine.android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;

public class BaseControllerFragment extends BaseFragment
{
  public static final int REQUEST_CODE_CAPTCHA = 11;
  protected static final String STATE_PENDING_CAPTCHA_REQUEST = "state_pending_captcha_request";
  protected AppController mAppController;
  protected AppSessionListener mAppSessionListener;

  public AppController getAppController()
  {
    return this.mAppController;
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    this.mAppController = AppController.getInstance(getActivity());
  }

  public void onPause()
  {
    super.onPause();
    AppController localAppController = this.mAppController;
    if ((localAppController != null) && (this.mAppSessionListener != null))
      localAppController.removeListener(this.mAppSessionListener);
  }

  public void onResume()
  {
    super.onResume();
    if (this.mAppSessionListener != null)
      this.mAppController.addListener(this.mAppSessionListener);
  }

  public void showCaptcha(String paramString1, String paramString2)
  {
    Intent localIntent = CaptchaActivity.getIntent(getActivity(), paramString2, paramString1);
    getActivity().startActivityForResult(localIntent, 11);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.BaseControllerFragment
 * JD-Core Version:    0.6.2
 */