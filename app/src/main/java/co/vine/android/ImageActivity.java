package co.vine.android;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;

public class ImageActivity extends BaseControllerActionBarActivity
{
  public static final String EXTRA_IMAGE_URL = "image_url";
  public static final String FRAGMENT_TAG = "image_fragment";

  public static void start(Context paramContext, String paramString, int paramInt)
  {
    Intent localIntent = new Intent(paramContext, ImageActivity.class);
    localIntent.putExtra("image_url", paramString);
    localIntent.putExtra("title", paramInt);
    paramContext.startActivity(localIntent);
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setRequestedOrientation(1);
    Intent localIntent = getIntent();
    int i = localIntent.getIntExtra("title", 0);
    if (i == 0)
      throw new IllegalArgumentException("An ActionBar title resourceId must be provided when starting this Activity.");
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(i), Boolean.valueOf(true));
    if (paramBundle == null)
    {
      ImageFragment localImageFragment = new ImageFragment();
      localIntent.putExtra("take_focus", true);
      localImageFragment.setArguments(BaseListFragment.prepareArguments(localIntent, false));
      getSupportFragmentManager().beginTransaction().add(2131361953, localImageFragment, "image_fragment").commit();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ImageActivity
 * JD-Core Version:    0.6.2
 */