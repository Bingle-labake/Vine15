package co.vine.android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.MenuItem;

public class SettingsActivity extends BaseControllerActionBarActivity
{
  private String SETTINGS_TAG = "settings";
  private SettingsFragment mFrag;

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (this.mFrag == null)
      this.mFrag = ((SettingsFragment)getSupportFragmentManager().findFragmentByTag(this.SETTINGS_TAG));
    if (this.mFrag != null)
    {
      this.mFrag.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
    }
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onBackPressed()
  {
    if (this.mFrag == null)
      this.mFrag = ((SettingsFragment)getSupportFragmentManager().findFragmentByTag(this.SETTINGS_TAG));
    if (this.mFrag != null)
    {
      this.mFrag.onBackPressed();
      return;
    }
    super.onBackPressed();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624277), Boolean.valueOf(true));
    if (paramBundle == null)
    {
      this.mFrag = new SettingsFragment();
      getSupportFragmentManager().beginTransaction().add(2131361953, this.mFrag, this.SETTINGS_TAG).commit();
    }
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 16908332:
    }
    if (this.mFrag == null)
      this.mFrag = ((SettingsFragment)getSupportFragmentManager().findFragmentByTag(this.SETTINGS_TAG));
    if (this.mFrag != null)
      this.mFrag.onBackPressed();
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SettingsActivity
 * JD-Core Version:    0.6.2
 */