package co.vine.android.service;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import co.vine.android.util.Util;
import com.edisonwang.android.slog.SLog;

public class GCMBroadcastReceiver extends BroadcastReceiver
{
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    SLog.d("GCM: message received, intent.extras={}", paramIntent.getExtras().toString());
    if (!Util.getDefaultSharedPrefs(paramContext).getBoolean("pref_notifications_enabled", true))
      return;
    Intent localIntent = new Intent(paramContext, GCMNotificationService.class);
    localIntent.putExtras(paramIntent.getExtras());
    paramContext.startService(localIntent);
    setResultCode(-1);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.GCMBroadcastReceiver
 * JD-Core Version:    0.6.2
 */