package co.vine.android;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;
import android.widget.RemoteViews;
import co.vine.android.service.CameraService;

public class CameraWidgetProvider extends AppWidgetProvider
{
  public void onUpdate(Context paramContext, AppWidgetManager paramAppWidgetManager, int[] paramArrayOfInt)
  {
    RemoteViews localRemoteViews = new RemoteViews(paramContext.getPackageName(), 2130903069);
    int i = paramArrayOfInt.length;
    for (int j = 0; j < i; j++)
    {
      int k = paramArrayOfInt[j];
      Intent localIntent = AbstractRecordingActivity.getIntent(paramContext, -1, "CameraWidget");
      localIntent.setAction("co.vine.android.RECORD");
      localRemoteViews.setOnClickPendingIntent(2131361879, PendingIntent.getActivity(paramContext, 0, localIntent, 0));
      paramAppWidgetManager.updateAppWidget(k, localRemoteViews);
    }
    paramContext.startService(new Intent(paramContext, CameraService.class));
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.CameraWidgetProvider
 * JD-Core Version:    0.6.2
 */