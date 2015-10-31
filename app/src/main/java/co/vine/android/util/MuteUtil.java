package co.vine.android.util;

import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import com.edisonwang.android.slog.SLog;

public class MuteUtil
{
  public static final String ACTION_CHANGED_TO_MUTE = SLog.getAuthority() + ".muted";
  public static final String ACTION_CHANGED_TO_UNMUTE = SLog.getAuthority() + ".un_muted";
  public static final IntentFilter MUTE_INTENT_FILTER = new IntentFilter();
  private static final String PREF_MUTE = "mute";
  private static SharedPreferences sp;

  static
  {
    MUTE_INTENT_FILTER.addAction(ACTION_CHANGED_TO_MUTE);
    MUTE_INTENT_FILTER.addAction(ACTION_CHANGED_TO_UNMUTE);
  }

  public static boolean isMuted(Context paramContext)
  {
    try
    {
      if (sp == null)
        sp = paramContext.getSharedPreferences("mute", 0);
      boolean bool = sp.getBoolean("mute", false);
      return bool;
    }
    finally
    {
    }
  }

  public static void setMuted(Context paramContext, boolean paramBoolean)
  {
    try
    {
      if (sp == null)
        sp = paramContext.getSharedPreferences("mute", 0);
      sp.edit().putBoolean("mute", paramBoolean).commit();
      SLog.d("Mute state change send.");
      if (paramBoolean);
      for (String str = ACTION_CHANGED_TO_MUTE; ; str = ACTION_CHANGED_TO_UNMUTE)
      {
        paramContext.sendBroadcast(new Intent(str));
        return;
      }
    }
    finally
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.MuteUtil
 * JD-Core Version:    0.6.2
 */