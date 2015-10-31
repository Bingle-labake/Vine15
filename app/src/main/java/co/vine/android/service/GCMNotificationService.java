package co.vine.android.service;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.IBinder;
import android.support.v4.app.NotificationCompat.Builder;
import android.support.v4.app.NotificationCompat.InboxStyle;
import android.text.SpannableStringBuilder;
import android.text.TextUtils;
import android.util.Log;
import co.vine.android.StartActivity;
import co.vine.android.api.VineNotification;
import co.vine.android.api.VineParsers;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.provider.VineDatabaseHelper;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.UrlImage;
import com.edisonwang.android.slog.SLog;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class GCMNotificationService extends Service
{
  public static final String ACTION_CLEAR_NOTIFICATIONS = "clearNotifications";
  public static final String ACTION_SHOW_NOTIFICATION = "showNotification";
  public static final String EXTRA_NOTIFICATIONS_JSON = "notifications";
  private static final int NOTIFICATION_ID = 0;
  private static final String NOTIFICATION_TAG = "gcmGenericNotification";
  private static final String TAG = "GCMNotifService";
  private AppController mAppController;
  private AppSessionListener mAppSessionListener;
  private NotificationCompat.Builder mBuilder;
  private boolean mIconRequested;
  private ImageKey mImageKey;
  private ArrayList<Integer> mStartIds;

  private void clearNotification()
  {
    ((NotificationManager)getSystemService("notification")).cancel("gcmGenericNotification", 0);
    stopService();
  }

  public static Intent getClearNotificationIntent(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, GCMNotificationService.class);
    localIntent.setAction("clearNotifications");
    return localIntent;
  }

  private PendingIntent getPendingIntent(int paramInt)
  {
    Intent localIntent = new Intent("co.vine.android.NOTIFICATION_PRESSED");
    localIntent.setClass(this, StartActivity.class);
    return PendingIntent.getActivity(this, 0, localIntent, 0);
  }

  private void prepareNotification(String paramString)
  {
    if (!TextUtils.isEmpty(paramString));
    VineNotification localVineNotification;
    String str1;
    PendingIntent localPendingIntent;
    SpannableStringBuilder localSpannableStringBuilder;
    VineDatabaseHelper localVineDatabaseHelper;
    do
    {
      try
      {
        localVineNotification = VineParsers.parsePushNotification(VineParsers.createParser(paramString));
        if (localVineNotification == null)
        {
          SLog.d("GCM: Invalid GCM notification payload, notifications={}", paramString);
          CrashUtil.log("Invalid GCM notification payload.");
          return;
        }
      }
      catch (IOException localIOException)
      {
        CrashUtil.logException(localIOException, "Exception while parsing GCM push notification payload.", new Object[0]);
        return;
      }
      str1 = localVineNotification.avatarUrl;
      String str2 = localVineNotification.comment;
      int i = localVineNotification.notificationType;
      ArrayList localArrayList1 = localVineNotification.entities;
      localPendingIntent = getPendingIntent(i);
      localSpannableStringBuilder = new SpannableStringBuilder(str2);
      Util.adjustEntities(localArrayList1, localSpannableStringBuilder, 0, true);
      localVineDatabaseHelper = VineDatabaseHelper.getDatabaseHelper(this);
    }
    while (localVineDatabaseHelper.mergeNotification(localVineNotification, localSpannableStringBuilder.toString()) == null);
    NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(this);
    this.mBuilder = localBuilder;
    this.mBuilder.setAutoCancel(true);
    this.mBuilder.setContentTitle(localSpannableStringBuilder);
    this.mBuilder.setSubText(getString(2131624192));
    this.mBuilder.setSmallIcon(2130837922);
    this.mBuilder.setContentIntent(localPendingIntent);
    ArrayList localArrayList2 = localVineDatabaseHelper.getUnclearedNotifications();
    if (localArrayList2.size() > 1)
    {
      NotificationCompat.InboxStyle localInboxStyle = new NotificationCompat.InboxStyle();
      localInboxStyle.setBigContentTitle(getString(2131624190));
      Iterator localIterator = localArrayList2.iterator();
      while (localIterator.hasNext())
        localInboxStyle.addLine(((Notification)localIterator.next()).message);
      this.mBuilder.setStyle(localInboxStyle);
      this.mBuilder.setNumber(localVineDatabaseHelper.getUnclearedNotificationCount());
    }
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(this);
    boolean bool = localSharedPreferences.getBoolean("pref_notifications_sound", true);
    int j = 0;
    if (bool)
    {
      String str3 = localSharedPreferences.getString("pref_notifications_ringtone", "");
      if (TextUtils.isEmpty(str3))
        break label438;
      this.mBuilder.setSound(Uri.parse(str3));
    }
    while (true)
    {
      if (localSharedPreferences.getBoolean("pref_notifications_vibrate", false))
        j |= 2;
      if (localSharedPreferences.getBoolean("pref_notifications_light", true))
        j |= 4;
      this.mBuilder.setDefaults(j);
      ImageKey localImageKey = new ImageKey(str1);
      this.mImageKey = localImageKey;
      Bitmap localBitmap = this.mAppController.getPhotoBitmap(this.mImageKey);
      if (localBitmap == null)
        break;
      showNotification(localBitmap);
      return;
      label438: j = 0x0 | 0x1;
    }
    this.mIconRequested = true;
  }

  private void showNotification(Bitmap paramBitmap)
  {
    if (paramBitmap == null)
      paramBitmap = BitmapFactory.decodeResource(getResources(), 2130837841);
    int i = getResources().getDimensionPixelSize(2131427390);
    this.mBuilder.setLargeIcon(Bitmap.createScaledBitmap(paramBitmap, i, i, true));
    NotificationManager localNotificationManager = (NotificationManager)getSystemService("notification");
    Notification localNotification = this.mBuilder.build();
    localNotification.ledARGB = -16711936;
    localNotificationManager.notify("gcmGenericNotification", 0, localNotification);
    stopService();
  }

  private void stopService()
  {
    Iterator localIterator = this.mStartIds.iterator();
    while (localIterator.hasNext())
    {
      int i = ((Integer)localIterator.next()).intValue();
      Log.d("GCMNotifService", "Stopping service for startId=" + i);
      stopSelf(i);
    }
  }

  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }

  public void onCreate()
  {
    super.onCreate();
    this.mAppController = AppController.getInstance(this);
    this.mAppSessionListener = new GCMBroadcastReceiverListener(null);
    this.mAppController.addListener(this.mAppSessionListener);
    this.mStartIds = new ArrayList();
  }

  public void onDestroy()
  {
    super.onDestroy();
    if (this.mAppSessionListener != null)
      this.mAppController.removeListener(this.mAppSessionListener);
  }

  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    Log.d("GCMNotifService", "onStartCommand, startId=" + paramInt2 + ", startIds=" + this.mStartIds.toString());
    this.mStartIds.add(Integer.valueOf(paramInt2));
    if (paramIntent != null)
    {
      if (!"clearNotifications".equals(paramIntent.getAction()))
        break label76;
      clearNotification();
    }
    while (true)
    {
      return 2;
      label76: prepareNotification(paramIntent.getStringExtra("notifications"));
    }
  }

  private class GCMBroadcastReceiverListener extends AppSessionListener
  {
    private GCMBroadcastReceiverListener()
    {
    }

    public void onPhotoImageLoaded(HashMap<ImageKey, UrlImage> paramHashMap)
    {
      if ((!paramHashMap.isEmpty()) && (GCMNotificationService.this.mImageKey != null) && (GCMNotificationService.this.mIconRequested))
      {
        GCMNotificationService.access$202(GCMNotificationService.this, false);
        UrlImage localUrlImage = (UrlImage)paramHashMap.get(GCMNotificationService.this.mImageKey);
        if ((localUrlImage != null) && (localUrlImage.isValid()))
          GCMNotificationService.this.showNotification(localUrlImage.bitmap);
      }
      else
      {
        return;
      }
      GCMNotificationService.this.showNotification(null);
    }
  }

  public static class Notification
  {
    public boolean cleared;
    public String message;
    public long notificationId;
    public int notificationType;

    public Notification(Cursor paramCursor)
    {
      this.notificationId = paramCursor.getLong(i);
      this.notificationType = paramCursor.getInt(2);
      this.message = paramCursor.getString(3);
      if (paramCursor.getInt(4) == i);
      while (true)
      {
        this.cleared = i;
        return;
        i = 0;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.GCMNotificationService
 * JD-Core Version:    0.6.2
 */