package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.ActionBar;
import android.text.TextUtils;
import android.view.Menu;
import android.view.MenuInflater;
import android.widget.Toast;

public class ExploreVideoListActivity extends BaseTimelineActivity
{
  private static final String FRAGMENT_TAG = "explore_video_list";
  private static final String QUERY_TITLE = "title";

  public static Intent getIntent(Context paramContext, String paramString1, String paramString2)
  {
    Intent localIntent = new Intent(paramContext, ExploreVideoListActivity.class);
    StringBuilder localStringBuilder = new StringBuilder().append("vine://").append(paramString1);
    if (paramString2 != null);
    for (String str = "/" + paramString2; ; str = "")
      return localIntent.setData(Uri.parse(str));
  }

  public static void start(Context paramContext, Uri paramUri)
  {
    Intent localIntent = new Intent(paramContext, ExploreVideoListActivity.class);
    localIntent.setData(paramUri);
    paramContext.startActivity(localIntent);
  }

  protected BaseTimelineFragment getCurrentTimeLineFragment()
  {
    return (BaseTimelineFragment)getSupportFragmentManager().findFragmentByTag("explore_video_list");
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag("explore_video_list");
    if ((localFragment instanceof BaseTimelineFragment))
      localFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    Intent localIntent = getIntent();
    Uri localUri = getIntent().getData();
    if (localUri == null)
      throw new IllegalAccessError("You can't access video list without specifying a url.");
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), null, Boolean.valueOf(true));
    ActionBar localActionBar = getSupportActionBar();
    if ("tag".equals(localUri.getHost()))
      localActionBar.setTitle("#" + localUri.getLastPathSegment());
    while (true)
    {
      if (paramBundle == null)
      {
        ExploreTimelineFragment localExploreTimelineFragment = new ExploreTimelineFragment();
        localIntent.putExtra("refresh", true);
        localExploreTimelineFragment.setArguments(ExploreTimelineFragment.prepareArguments(localIntent, true, localUri.getHost(), localUri.getLastPathSegment(), localUri));
        getSupportFragmentManager().beginTransaction().add(2131361953, localExploreTimelineFragment, "explore_video_list").commit();
      }
      return;
      if ("trending-people".equals(localUri.getHost()))
      {
        localActionBar.setTitle(2131624207);
      }
      else if ("popular-now".equals(localUri.getHost()))
      {
        localActionBar.setTitle(2131624217);
      }
      else
      {
        if (!"timelines".equals(localUri.getHost()))
          break;
        String str = localUri.getQueryParameter("title");
        if (!TextUtils.isEmpty(str))
          localActionBar.setTitle(str.replace('+', ' '));
        else
          localActionBar.setTitle(getString(2131624376));
      }
    }
    Toast.makeText(this, "All post is not supported at this moment, it's just here to tease you. ", 0).show();
    finish();
  }

  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    getMenuInflater().inflate(2131755015, paramMenu);
    return super.onCreateOptionsMenu(paramMenu);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ExploreVideoListActivity
 * JD-Core Version:    0.6.2
 */