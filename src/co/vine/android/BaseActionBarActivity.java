package co.vine.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v7.app.ActionBarActivity;
import android.util.AndroidRuntimeException;
import android.view.Menu;
import android.view.MenuItem;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.MuteUtil;
import co.vine.android.util.SystemUtil;
import com.android.debug.hv.ViewServer;
import com.crashlytics.android.Crashlytics;
import com.edisonwang.android.slog.SLog;

public class BaseActionBarActivity extends ActionBarActivity
{
  public static final String FINISH_BROADCAST_ACTION = "co.vine.android.FINISH";
  private static IntentFilter FINISH_INTENT_FILTER = new IntentFilter();
  private final BroadcastReceiver mFinishReceiver = new BroadcastReceiver()
  {
    public void onReceive(Context paramAnonymousContext, Intent paramAnonymousIntent)
    {
      if (paramAnonymousIntent.getAction().equals("co.vine.android.FINISH"))
        BaseActionBarActivity.this.finish();
    }
  };
  protected Menu mMenu;
  protected ProgressDialog mProgressDialog;

  static
  {
    FINISH_INTENT_FILTER.addAction("co.vine.android.FINISH");
  }

  protected void dismissDialog()
  {
    if (this.mProgressDialog != null)
    {
      this.mProgressDialog.dismiss();
      this.mProgressDialog = null;
    }
  }

  public void onBackPressed()
  {
    try
    {
      super.onBackPressed();
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      CrashUtil.logException(localIllegalStateException);
    }
  }

  protected void onCreate(Bundle paramBundle)
  {
    throw new IllegalArgumentException("If extending BaseActivity, please use multiple parameter version of this method.");
  }

  public void onCreate(Bundle paramBundle, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    try
    {
      super.onCreate(paramBundle);
      preSetContentView();
      setContentView(paramInt);
      Activity localActivity = getParent();
      if ((paramBoolean1) && (!VineAccountHelper.isLoggedIn(this, paramBoolean2)))
      {
        i = 1;
        if ((i != 0) && (localActivity == null))
          StartActivity.toStart(this);
        if (SystemUtil.isViewServerEnabled(this))
          ViewServer.get(this).addWindow(this);
        registerReceiver(this.mFinishReceiver, FINISH_INTENT_FILTER);
        return;
      }
    }
    catch (AndroidRuntimeException localAndroidRuntimeException)
    {
      while (true)
      {
        CrashUtil.logException(localAndroidRuntimeException);
        continue;
        int i = 0;
      }
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    updateMuteActionState(paramMenu.findItem(2131362190));
    this.mMenu = paramMenu;
    return true;
  }

  protected void onDestroy()
  {
    super.onDestroy();
    if (SystemUtil.isViewServerEnabled(this))
      ViewServer.get(this).removeWindow(this);
    unregisterReceiver(this.mFinishReceiver);
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 16908332:
      try
      {
        super.onBackPressed();
        return true;
      }
      catch (IllegalStateException localIllegalStateException)
      {
        return true;
      }
    case 2131362193:
      AppImpl.getInstance().startCapture(this);
      return true;
    case 2131362190:
    }
    if (!MuteUtil.isMuted(this));
    for (boolean bool = true; ; bool = false)
    {
      MuteUtil.setMuted(this, bool);
      updateMuteActionState(paramMenuItem);
      return true;
    }
  }

  protected void onPause()
  {
    super.onPause();
    dismissDialog();
  }

  protected void onResume()
  {
    super.onResume();
    if (!BuildUtil.isLogsOn())
      Crashlytics.setString("Activity", getClass().getName());
    while (true)
    {
      if (this.mMenu != null)
        updateMuteActionState(this.mMenu.findItem(2131362190));
      registerReceiver(this.mFinishReceiver, FINISH_INTENT_FILTER);
      return;
      if (SystemUtil.isViewServerEnabled(this))
        ViewServer.get(this).setFocusedWindow(this);
    }
  }

  protected void onStart()
  {
    super.onStart();
    FlurryUtils.start(this);
  }

  protected void onStop()
  {
    super.onStop();
    FlurryUtils.stop(this);
  }

  public void preSetContentView()
  {
  }

  protected void setupActionBar(Boolean paramBoolean1, Boolean paramBoolean2, Integer paramInteger, Boolean paramBoolean3)
  {
    android.support.v7.app.ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null)
    {
      if (paramBoolean1 != null)
        localActionBar.setHomeButtonEnabled(paramBoolean1.booleanValue());
      if (paramBoolean2 != null)
        localActionBar.setDisplayShowTitleEnabled(paramBoolean2.booleanValue());
      if (paramBoolean3 != null)
        localActionBar.setDisplayHomeAsUpEnabled(paramBoolean3.booleanValue());
      if (paramInteger != null)
        localActionBar.setTitle(paramInteger.intValue());
    }
    if (Build.VERSION.SDK_INT >= 14)
      setupActionBarJBOnly(paramBoolean1, paramBoolean2, paramBoolean3);
  }

  @TargetApi(14)
  protected void setupActionBarJBOnly(Boolean paramBoolean1, Boolean paramBoolean2, Boolean paramBoolean3)
  {
    android.app.ActionBar localActionBar = getActionBar();
    if (localActionBar != null)
    {
      if (paramBoolean1 != null)
        localActionBar.setHomeButtonEnabled(paramBoolean1.booleanValue());
      if (paramBoolean2 != null)
        localActionBar.setDisplayShowTitleEnabled(paramBoolean2.booleanValue());
      if (paramBoolean3 != null)
        localActionBar.setDisplayHomeAsUpEnabled(paramBoolean3.booleanValue());
    }
  }

  public void updateMuteActionState(MenuItem paramMenuItem)
  {
    if (paramMenuItem != null)
    {
      boolean bool = MuteUtil.isMuted(this);
      SLog.d("Is muted? {}", Boolean.valueOf(bool));
      if (!bool)
        break label36;
    }
    label36: for (int i = 2131624394; ; i = 2131624180)
    {
      paramMenuItem.setTitle(i);
      return;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.BaseActionBarActivity
 * JD-Core Version:    0.6.2
 */