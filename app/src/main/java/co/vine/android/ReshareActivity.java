package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;

public class ReshareActivity extends BaseControllerActionBarActivity
{
  public static final String EXTRA_NETWORK = "network";
  public static final String NETWORK_FACEBOOK = "facebook";
  public static final String NETWORK_TWITTER = "twitter";

  public static Intent getReshareIntent(Context paramContext, String paramString, Bundle paramBundle)
  {
    Intent localIntent = new Intent(paramContext, ReshareActivity.class);
    localIntent.putExtras(paramBundle);
    localIntent.putExtra("network", paramString);
    if ("twitter".equals(paramString))
      localIntent.putExtra("title", 2131624348);
    while (!"facebook".equals(paramString))
      return localIntent;
    localIntent.putExtra("title", 2131624347);
    return localIntent;
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    Fragment localFragment = getSupportFragmentManager().findFragmentByTag("reshare");
    if ((localFragment instanceof ReshareFragment))
    {
      localFragment.onActivityResult(paramInt1, paramInt2, paramIntent);
      return;
    }
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
  }

  public void onCreate(Bundle paramBundle)
  {
    int i = 1;
    super.onCreate(paramBundle, 2130903095, i);
    setRequestedOrientation(i);
    Intent localIntent = getIntent();
    int k = localIntent.getIntExtra("title", 0);
    Boolean localBoolean1 = Boolean.valueOf(i);
    Boolean localBoolean2;
    if (k > 0)
    {
      localBoolean2 = Boolean.valueOf(i);
      if (k <= 0)
        break label117;
    }
    label117: for (Integer localInteger = Integer.valueOf(k); ; localInteger = null)
    {
      setupActionBar(localBoolean1, localBoolean2, localInteger, null);
      if (paramBundle == null)
      {
        ReshareFragment localReshareFragment = new ReshareFragment();
        localReshareFragment.setArguments(ReshareFragment.prepareArguments(localIntent));
        getSupportFragmentManager().beginTransaction().add(2131361953, localReshareFragment, "reshare").commit();
      }
      return;
      int j = 0;
      break;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ReshareActivity
 * JD-Core Version:    0.6.2
 */