package co.vine.android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;

public class UsersActivity extends BaseControllerActionBarActivity
{
  public static final String EXTRA_POST_ID = "post_id";
  public static final String EXTRA_USERS_TYPE = "u_type";
  public static final String EXTRA_USER_ID = "p_id";
  private UsersFragment mFragment;

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    this.mFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903151, true);
    Intent localIntent = getIntent();
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), null, Boolean.valueOf(true));
    ActionBar localActionBar = getSupportActionBar();
    switch (localIntent.getIntExtra("u_type", 0))
    {
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    default:
    case 1:
    case 2:
    case 5:
    case 9:
    }
    while (true)
    {
      if (paramBundle == null)
      {
        this.mFragment = new UsersFragment();
        Bundle localBundle = UsersFragment.prepareArguments(localIntent, false);
        localBundle.putBoolean("refresh", true);
        this.mFragment.setArguments(localBundle);
        getSupportFragmentManager().beginTransaction().add(2131361953, this.mFragment).commit();
      }
      return;
      localActionBar.setTitle(2131624409);
      continue;
      localActionBar.setTitle(2131624408);
      continue;
      localActionBar.setTitle(2131624410);
      continue;
      localActionBar.setTitle(2131624263);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.UsersActivity
 * JD-Core Version:    0.6.2
 */