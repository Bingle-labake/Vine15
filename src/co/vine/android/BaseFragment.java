package co.vine.android;

import android.content.Intent;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import com.crashlytics.android.Crashlytics;
import com.flurry.android.FlurryAgent;

public class BaseFragment extends Fragment
{
  public static Bundle prepareArguments(Intent paramIntent)
  {
    Bundle localBundle = paramIntent.getExtras();
    if (localBundle == null)
      localBundle = new Bundle();
    return localBundle;
  }

  public void onResume()
  {
    super.onResume();
    Crashlytics.setString("Fragment", getClass().getName());
    FlurryAgent.onPageView();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.BaseFragment
 * JD-Core Version:    0.6.2
 */