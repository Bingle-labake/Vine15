package co.vine.android;

import android.os.Bundle;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.view.MenuItem;

public class ContentControlsActivity extends BaseControllerActionBarActivity
{
  private static final String CONTENT_CONTROLS_TAG = "content_controls";

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903095, true);
    setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), Integer.valueOf(2131624059), Boolean.valueOf(true));
    if (paramBundle == null)
    {
      ContentControlsFragment localContentControlsFragment = new ContentControlsFragment();
      getSupportFragmentManager().beginTransaction().add(2131361953, localContentControlsFragment, "content_controls").commit();
    }
  }

  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    switch (paramMenuItem.getItemId())
    {
    default:
      return super.onOptionsItemSelected(paramMenuItem);
    case 16908332:
    }
    onBackPressed();
    return true;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.ContentControlsActivity
 * JD-Core Version:    0.6.2
 */