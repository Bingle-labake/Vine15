package co.vine.android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import co.vine.android.client.AppController;
import co.vine.android.util.CrashUtil;

public class CommentsActivity extends BaseControllerActionBarActivity
{
  public static final String EXTRA_HIDE_KEYBOARD = "hide_keyboard";
  public static final String EXTRA_POST_AUTHOR_ID = "post_author_id";
  public static final String EXTRA_POST_ID = "post_id";
  private static final String TAG = "commentsthread";
  private CommentsFragment mFragment;

  public void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    this.mFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    if (this.mAppController == null)
    {
      this.mAppController = AppController.getInstance(this);
      CrashUtil.logException(new VineException(), "App controller is null here, and now? " + this.mAppController, new Object[0]);
    }
    if ((this.mAppController == null) || (!this.mAppController.isLoggedIn()));
    Intent localIntent;
    do
    {
      return;
      setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624033), Boolean.valueOf(true));
      localIntent = getIntent();
    }
    while (paramBundle != null);
    this.mFragment = new CommentsFragment();
    Bundle localBundle = CommentsFragment.prepareArguments(localIntent, false);
    boolean bool = localIntent.getBooleanExtra("hide_keyboard", false);
    localBundle.putLong("post_id", localIntent.getLongExtra("post_id", -1L));
    localBundle.putLong("post_author_id", localIntent.getLongExtra("post_author_id", -1L));
    localBundle.putInt("empty_desc", 2131624030);
    localBundle.putBoolean("hide_keyboard", bool);
    this.mFragment.setArguments(localBundle);
    getSupportFragmentManager().beginTransaction().add(2131361953, this.mFragment, "commentsthread").commit();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.CommentsActivity
 * JD-Core Version:    0.6.2
 */