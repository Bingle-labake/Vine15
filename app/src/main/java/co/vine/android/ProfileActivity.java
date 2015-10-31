package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.Menu;
import android.view.MenuInflater;
import java.util.ArrayList;

public class ProfileActivity extends BaseTimelineActivity
{
  private static final String EXTRA_FOLLOW_EVENT_SOURCE = "event_source";
  private static final String EXTRA_USER_ID = "user_id";
  private static final String EXTRA_VANITY_URL = "vanity_url";

  public static void start(Context paramContext, long paramLong, String paramString)
  {
    Intent localIntent = new Intent(paramContext, ProfileActivity.class);
    localIntent.putExtra("user_id", paramLong);
    localIntent.putExtra("event_source", paramString);
    paramContext.startActivity(localIntent);
  }

  public static void start(Context paramContext, ArrayList<String> paramArrayList, String paramString)
  {
    Intent localIntent = new Intent(paramContext, ProfileActivity.class);
    localIntent.putStringArrayListExtra("vanity_url", paramArrayList);
    localIntent.putExtra("event_source", paramString);
    paramContext.startActivity(localIntent);
  }

  protected BaseTimelineFragment getCurrentTimeLineFragment()
  {
    return (BaseTimelineFragment)getSupportFragmentManager().findFragmentByTag("profile");
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag("profile");
    if ((localFragment instanceof BaseTimelineFragment))
      localFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setRequestedOrientation(1);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624246), Boolean.valueOf(true));
    Intent localIntent = getIntent();
    if (paramBundle == null)
    {
      ProfileFragment localProfileFragment = new ProfileFragment();
      localIntent.putExtra("refresh", true);
      localIntent.putExtra("take_focus", true);
      localProfileFragment.setArguments(BaseListFragment.prepareArguments(localIntent, true));
      getSupportFragmentManager().beginTransaction().add(2131361953, localProfileFragment, "profile").commit();
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755015, paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ProfileActivity
 * JD-Core Version:    0.6.2
 */