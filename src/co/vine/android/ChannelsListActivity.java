package co.vine.android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;

public class ChannelsListActivity extends BaseControllerActionBarActivity
{
  public static final String EXTRA_CHANNEL = "channel";
  public static final String EXTRA_CHANNEL_ID = "channel_id";
  public static final String EXTRA_SELECTED_CHANNEL = "selected_channel";

  public void onChannelSelected(long paramLong, String paramString)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("channel", paramString);
    localIntent.putExtra("channel_id", paramLong);
    setResult(-1, localIntent);
    finish();
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setRequestedOrientation(1);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624271), Boolean.valueOf(true));
    Intent localIntent = getIntent();
    if (paramBundle == null)
    {
      ChannelsListFragment localChannelsListFragment = new ChannelsListFragment();
      long l = localIntent.getLongExtra("selected_channel", -1L);
      localIntent.putExtra("refresh", false);
      localIntent.putExtra("take_focus", true);
      localIntent.putExtra("selected_channel", l);
      localChannelsListFragment.setArguments(BaseListFragment.prepareArguments(localIntent, false));
      getSupportFragmentManager().beginTransaction().add(2131361953, localChannelsListFragment).commit();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ChannelsListActivity
 * JD-Core Version:    0.6.2
 */