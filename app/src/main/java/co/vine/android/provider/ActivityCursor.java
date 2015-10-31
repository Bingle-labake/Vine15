package co.vine.android.provider;

import android.database.Cursor;
import android.database.MergeCursor;
import android.os.Bundle;

public class ActivityCursor extends MergeCursor
{
  public static final String EXTRA_NUM_REQUESTS = "num_reqs";
  private int mNumFollowRequests;

  public ActivityCursor(Cursor[] paramArrayOfCursor)
  {
    super(paramArrayOfCursor);
  }

  public ActivityCursor(Cursor[] paramArrayOfCursor, int paramInt)
  {
    super(paramArrayOfCursor);
    this.mNumFollowRequests = paramInt;
  }

  public Bundle getExtras()
  {
    Bundle localBundle = new Bundle(super.getExtras());
    localBundle.putInt("num_reqs", this.mNumFollowRequests);
    return localBundle;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.ActivityCursor
 * JD-Core Version:    0.6.2
 */