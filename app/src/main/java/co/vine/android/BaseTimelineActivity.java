package co.vine.android;

import co.vine.android.util.BuildUtil;

public abstract class BaseTimelineActivity extends BaseControllerActionBarActivity
{
  protected abstract BaseTimelineFragment getCurrentTimeLineFragment();

  public void onBackPressed()
  {
    if (BuildUtil.isExplore())
    {
      BaseTimelineFragment localBaseTimelineFragment = getCurrentTimeLineFragment();
      if ((localBaseTimelineFragment != null) && (localBaseTimelineFragment.onBackPressed()))
        return;
    }
    super.onBackPressed();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.BaseTimelineActivity
 * JD-Core Version:    0.6.2
 */