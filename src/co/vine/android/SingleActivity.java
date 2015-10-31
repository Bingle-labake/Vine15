package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.Menu;
import android.view.MenuInflater;

public class SingleActivity extends BaseTimelineActivity
{
  private static final String EXTRA_LOCKED = "locked";
  private static final String EXTRA_POST_ID = "post_id";
  private static final String EXTRA_SHARE_ID = "post_share_id";
  private static final String EXTRA_USERNAME = "username";
  private static final String EXTRA_USER_ID = "userId";
  private static final String FRAGMENT_TAG = "single_post";

  public static void start(Context paramContext, long paramLong)
  {
    Intent localIntent = new Intent(paramContext, SingleActivity.class);
    localIntent.putExtra("post_id", paramLong);
    paramContext.startActivity(localIntent);
  }

  public static void start(Context paramContext, String paramString)
  {
    Intent localIntent = new Intent(paramContext, SingleActivity.class);
    localIntent.putExtra("post_share_id", paramString);
    paramContext.startActivity(localIntent);
  }

  public static void startLocked(Context paramContext, long paramLong1, String paramString, long paramLong2)
  {
    Intent localIntent = new Intent(paramContext, SingleActivity.class);
    localIntent.putExtra("post_id", paramLong1);
    localIntent.putExtra("locked", true);
    localIntent.putExtra("username", paramString);
    localIntent.putExtra("userId", paramLong2);
    paramContext.startActivity(localIntent);
  }

  protected BaseTimelineFragment getCurrentTimeLineFragment()
  {
    return (BaseTimelineFragment)getSupportFragmentManager().findFragmentByTag("single_post");
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag("single_post");
    if ((localFragment instanceof BaseTimelineFragment))
      localFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setRequestedOrientation(1);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624385), Boolean.valueOf(true));
    Intent localIntent = getIntent();
    if (paramBundle == null)
    {
      SingleFragment localSingleFragment = new SingleFragment();
      localIntent.putExtra("take_focus", true);
      localSingleFragment.setArguments(BaseListFragment.prepareArguments(localIntent, false));
      getSupportFragmentManager().beginTransaction().add(2131361953, localSingleFragment, "single_post").commit();
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755015, paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SingleActivity
 * JD-Core Version:    0.6.2
 */