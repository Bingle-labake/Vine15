package co.vine.android;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.view.View;
import android.view.View.OnClickListener;
import co.vine.android.util.Util;

public class ViewOnlyNotifActivity extends BaseControllerActionBarActivity
  implements View.OnClickListener
{
  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    default:
      return;
    case 2131361972:
    }
    Util.getDefaultSharedPrefs(this).edit().putBoolean("pref_gb_notif_dismissed", true).apply();
    setResult(-1);
    finish();
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903106, true);
    if (Build.VERSION.SDK_INT <= 14)
    {
      ActionBar localActionBar = getSupportActionBar();
      if (localActionBar != null)
        localActionBar.hide();
    }
    findViewById(2131361972).setOnClickListener(this);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ViewOnlyNotifActivity
 * JD-Core Version:    0.6.2
 */