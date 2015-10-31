package co.vine.android;

import android.os.Build.VERSION;
import android.os.Bundle;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.player.SdkVideoView;
import co.vine.android.util.BuildUtil;
import java.util.ArrayList;

public abstract class BaseControllerActionBarActivity extends BaseActionBarActivity
{
  public static final String EXTRA_TITLE_ID = "title";
  private static final String STATE_PENDING_REQUESTS = "pending_reqs";
  protected AppController mAppController;
  protected AppSessionListener mAppSessionListener;
  private ArrayList<String> mPendingRequests;

  public AppController getAppController()
  {
    return this.mAppController;
  }

  protected void onCreate(Bundle paramBundle, int paramInt, boolean paramBoolean)
  {
    super.onCreate(paramBundle, paramInt, paramBoolean, false);
    this.mAppController = AppController.getInstance(this);
    if (paramBundle != null)
    {
      this.mPendingRequests = paramBundle.getStringArrayList("pending_reqs");
      return;
    }
    this.mPendingRequests = new ArrayList(5);
  }

  protected void onDestroy()
  {
    super.onDestroy();
    if ((Build.VERSION.SDK_INT >= 14) && (!BuildUtil.isExplore()))
      SdkVideoView.releaseStaticIfNeeded();
  }

  protected void onPause()
  {
    super.onPause();
    if (this.mAppSessionListener != null)
      this.mAppController.removeListener(this.mAppSessionListener);
  }

  protected void onResume()
  {
    super.onResume();
    if (this.mAppSessionListener != null)
      this.mAppController.addListener(this.mAppSessionListener);
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    paramBundle.putStringArrayList("pending_reqs", this.mPendingRequests);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.BaseControllerActionBarActivity
 * JD-Core Version:    0.6.2
 */