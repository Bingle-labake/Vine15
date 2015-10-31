package co.vine.android;

import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.os.Bundle;

public class NotificationSettingsActivity extends BaseControllerActionBarActivity
{
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624191), Boolean.valueOf(true));
    if (paramBundle == null)
    {
      NotificationSettingsFragment localNotificationSettingsFragment = new NotificationSettingsFragment();
      getFragmentManager().beginTransaction().add(2131361953, localNotificationSettingsFragment).commit();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.NotificationSettingsActivity
 * JD-Core Version:    0.6.2
 */