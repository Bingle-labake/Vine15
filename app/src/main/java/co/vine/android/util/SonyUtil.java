package co.vine.android.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import co.vine.android.client.AppController;

public class SonyUtil
{
  public static final String SONY_SESSION_START_TIME = "session_start_time";
  public static final String SONY_SESSION_START_TIME_LOGGED_OUT = "session_start_time_logged_out";

  public static void endSession(Context paramContext)
  {
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(paramContext);
    long l1 = System.currentTimeMillis();
    long l2 = localSharedPreferences.getLong("session_start_time", 0L);
    if (l2 > 0L)
    {
      FlurryUtils.trackSonyCameraModeSessionTime(l1 - l2, false);
      localSharedPreferences.edit().putLong("session_start_time", -1L).commit();
    }
    long l3;
    do
    {
      return;
      l3 = localSharedPreferences.getLong("session_start_time_logged_out", 0L);
    }
    while (l3 <= 0L);
    FlurryUtils.trackSonyCameraModeSessionTime(l1 - l3, true);
    localSharedPreferences.edit().putLong("session_start_time_logged_out", -1L).commit();
  }

  public static void startSession(Context paramContext)
  {
    AppController localAppController = AppController.getInstance(paramContext);
    long l = System.currentTimeMillis();
    SharedPreferences.Editor localEditor = Util.getDefaultSharedPrefs(paramContext).edit();
    if (localAppController.isLoggedIn())
    {
      localEditor.putLong("session_start_time", l);
      localEditor.putLong("session_start_time_logged_out", -1L).commit();
      return;
    }
    localEditor.putLong("session_start_time", -1L);
    localEditor.putLong("session_start_time_logged_out", l).commit();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.SonyUtil
 * JD-Core Version:    0.6.2
 */