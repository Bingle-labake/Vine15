package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.view.Menu;
import android.view.MenuInflater;

public class HashtagActivity extends BaseTimelineActivity
{
  private static final String FRAGMENT_TAG = "hashtag";

  public static void start(Context paramContext, String paramString)
  {
    paramContext.startActivity(new Intent(paramContext, HashtagActivity.class).putExtra("category", "tag").putExtra("tag", paramString.substring(1, paramString.length())));
  }

  protected BaseTimelineFragment getCurrentTimeLineFragment()
  {
    return (BaseTimelineFragment)getSupportFragmentManager().findFragmentByTag("hashtag");
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag("hashtag");
    if ((localFragment instanceof BaseTimelineFragment))
      localFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, false);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), null, Boolean.valueOf(true));
    Intent localIntent = getIntent();
    ActionBar localActionBar = getSupportActionBar();
    if (localActionBar != null)
      localActionBar.setTitle("#" + localIntent.getStringExtra("tag"));
    if (paramBundle == null)
    {
      ExploreTimelineFragment localExploreTimelineFragment = new ExploreTimelineFragment();
      Bundle localBundle = ExploreTimelineFragment.prepareArguments(localIntent, false);
      localBundle.putBoolean("refresh", true);
      localExploreTimelineFragment.setArguments(localBundle);
      getSupportFragmentManager().beginTransaction().add(2131361953, localExploreTimelineFragment, "hashtag").commit();
    }
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755015, paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.HashtagActivity
 * JD-Core Version:    0.6.2
 */