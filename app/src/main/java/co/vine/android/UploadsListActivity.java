package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;

public class UploadsListActivity extends BaseControllerActionBarActivity
{
  private Fragment mFragment;

  public static void start(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, UploadsListActivity.class);
    localIntent.setFlags(67108864);
    paramContext.startActivity(localIntent);
  }

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (this.mFragment != null)
      this.mFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setRequestedOrientation(1);
    Intent localIntent = getIntent();
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624400), Boolean.valueOf(false));
    if (paramBundle == null)
    {
      this.mFragment = new UploadsListFragment();
      localIntent.putExtra("take_focus", true);
      localIntent.putExtra("refresh", false);
      localIntent.putExtra("empty_desc", 2131624187);
      this.mFragment.setArguments(BaseListFragment.prepareArguments(localIntent, false));
      getSupportFragmentManager().beginTransaction().add(2131361953, this.mFragment).commit();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.UploadsListActivity
 * JD-Core Version:    0.6.2
 */