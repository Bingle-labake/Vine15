package co.vine.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import co.vine.android.util.FlurryUtils;

public class SonyLaunchActivity extends Activity
{
  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
    FlurryUtils.trackSonyCameraModeLaunch();
    Intent localIntent = new Intent(this, SonyRecordingActivity.class);
    localIntent.setFlags(268468224);
    startActivity(localIntent);
    finish();
  }

  protected void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.SonyLaunchActivity
 * JD-Core Version:    0.6.2
 */