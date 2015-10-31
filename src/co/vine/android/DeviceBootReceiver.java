package co.vine.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import co.vine.android.service.CameraService;
import com.edisonwang.android.slog.SLog;

public class DeviceBootReceiver extends BroadcastReceiver
{
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    String str = paramIntent.getAction();
    SLog.d("Received device boot message {}.", str);
    if ("android.intent.action.PACKAGE_REPLACED".equals(str))
    {
      Uri localUri = paramIntent.getData();
      if ((localUri != null) && (!paramContext.getPackageName().equals(localUri.getSchemeSpecificPart())))
        return;
    }
    paramContext.startService(new Intent(paramContext, CameraService.class));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.DeviceBootReceiver
 * JD-Core Version:    0.6.2
 */