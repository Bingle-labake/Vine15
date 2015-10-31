package co.vine.android.service;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.AsyncTask.Status;
import android.os.Handler;
import android.os.IBinder;
import android.support.v4.app.NotificationCompat.Builder;
import android.text.TextUtils;
import co.vine.android.StartActivity;
import co.vine.android.api.VineEntity;
import co.vine.android.api.VineLogin;
import co.vine.android.api.VineParserReader;
import co.vine.android.api.VineUpload;
import co.vine.android.api.VineUpload.PostInfo;
import co.vine.android.client.AppController;
import co.vine.android.client.Session;
import co.vine.android.client.VineAPI;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.network.HttpOperation;
import co.vine.android.network.ThreadedHttpOperationClient;
import co.vine.android.provider.VineUploads.Uploads;
import co.vine.android.provider.VineUploadsDatabaseSQL.UploadsQuery;
import co.vine.android.recorder.EncoderManager.EncoderBoss;
import co.vine.android.recorder.RecordConfigUtils;
import co.vine.android.recorder.RecordSessionManager;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.UploadManager;
import co.vine.android.util.VineProgressEvent;
import co.vine.android.util.VineProgressListener;
import com.crashlytics.android.Crashlytics;
import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.apache.http.message.BasicNameValuePair;

public class VineUploadService extends Service
{
  public static final String ACTION_CLEAR_NOTIFICATIONS = "clear_notifications";
  public static final String ACTION_DISCARD = "discard";
  public static final String ACTION_DISCARD_ALL = "discard_all";
  public static final String ACTION_NOTIFY_FAILED = "cNotify";
  public static final String ACTION_POST = "bPost";
  public static final String ACTION_SHOW_NOTIFICATIONS = "show_notifications";
  public static final String ACTION_UPLOAD = "aUpload";
  public static final String ACTION_UPLOAD_RESULT = "co.vine.android.UPLOAD_RESULT";
  public static final String AG_CHANNEL_ID = "channelId";
  public static final String AG_DESCRIPTION = "description";
  public static final String AG_ENTITIES = "entities";
  public static final String AG_HASH = "hash";
  public static final String AG_MESSAGE = "message";
  public static final String AG_PATH = "path";
  public static final String AG_POST_TO_FACEBOOK = "postToFacebook";
  public static final String AG_POST_TO_TWITTER = "postToTwitter";
  public static final String AG_REFERENCE = "reference";
  public static final String AG_THUMBNAIL = "thumbnail";
  public static final String AG_TIMESTAMP = "created";
  public static final String AG_UPLOAD_RESULT = "upload_status";
  public static final String EXTRA_REACTIVATE = "reactivate";
  public static final String EXTRA_SESSION_KEY = "s_key";
  private static final int MAX_BITMAP_SIZE = 10;
  private static final int NOTIFICATION_FAILED_ID = 0;
  private static final int NOTIFICATION_PROGRESS_ID = 1;
  private static final String NOTIFICATION_TAG = "upload_notification";
  private static final String PARAM_PASSWORD = "password";
  private static final String PARAM_TWITTER_SECRET = "twitterOauthSecret";
  private static final String PARAM_TWITTER_TOKEN = "twitterOauthToken";
  private static final String PARAM_USERNAME = "username";
  public static final int RESULT_NEED_POST_INFO = 3;
  public static final int RESULT_STATUS_FAILED = 1;
  public static final int RESULT_STATUS_SUCCEEDED = 2;
  public static final int RESULT_STATUS_UPLOADING = 0;
  private static final int SMALL_ICON = 2130837922;
  private static boolean sShowProgress;
  private HashMap<String, Bitmap> mBitmaps;
  private ServiceAsyncTask mCurrentTask;
  private Bitmap mDefaultNotificationIcon;
  private final int[] mLock = new int[0];
  private NotificationManager mNotificationManager;
  private int mNotificationPanelSize = -1;
  private LinkedHashSet<ServiceAsyncTask> mPendingTasks;
  private ConcurrentHashMap<String, Integer> mProgressMap;
  private RecordSessionManager mRsm;
  private SessionChangedReceiver mSessionChangedReceiver;
  private LinkedList<Integer> mStartIds;
  private UploadManager mUploadManager;

  private void cancelFailedNofitication()
  {
    try
    {
      if (UploadManager.uploadListIsEmpty(this))
        clearNotification(0);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void clearNotification(int paramInt)
  {
    try
    {
      this.mNotificationManager.cancel("upload_notification", paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void discardTask(String paramString)
  {
    SLog.d("Discard task for path={}", paramString);
    ServiceAsyncTask localServiceAsyncTask1 = this.mCurrentTask;
    if ((localServiceAsyncTask1 != null) && (localServiceAsyncTask1.path.equals(paramString)))
    {
      localServiceAsyncTask1.setIsDiscarded(true);
      localServiceAsyncTask1.cancel(true);
      SLog.d("In-progress task has been cancelled, path={}", paramString);
    }
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.mPendingTasks.iterator();
    while (localIterator.hasNext())
    {
      ServiceAsyncTask localServiceAsyncTask2 = (ServiceAsyncTask)localIterator.next();
      if ((localServiceAsyncTask2 != null) && (localServiceAsyncTask2.path.equals(paramString)))
        localArrayList.add(localServiceAsyncTask2);
    }
    if (!localArrayList.isEmpty())
    {
      SLog.d("Queued task(s) will be cancelled.");
      this.mPendingTasks.removeAll(localArrayList);
    }
    discardUpload(paramString);
  }

  private void discardUpload(String paramString)
  {
    new File(paramString).delete();
    new File(paramString + ".mp4").delete();
    new File(RecordConfigUtils.getThumbnailPath(paramString)).delete();
    UploadManager.deleteUploadRecord(this, paramString);
    cancelFailedNofitication();
  }

  private void executeNext()
  {
    SLog.d("pending tasks: {}", this.mPendingTasks);
    if (this.mCurrentTask != null)
    {
      SLog.d("mCurrentTask is not null, will not execute next");
      return;
    }
    while (true)
    {
      synchronized (this.mLock)
      {
        if (!this.mPendingTasks.isEmpty())
        {
          Iterator localIterator = this.mPendingTasks.iterator();
          ServiceAsyncTask localServiceAsyncTask = (ServiceAsyncTask)localIterator.next();
          if (!isRunning(localServiceAsyncTask))
          {
            localServiceAsyncTask.execute(new Void[0]);
            SLog.d("started executing task: action={}, path={}", localServiceAsyncTask.action, localServiceAsyncTask.path);
          }
          this.mCurrentTask = localServiceAsyncTask;
          localIterator.remove();
          return;
        }
      }
      new Handler().post(new Runnable()
      {
        public void run()
        {
          VineUploadService.this.stopIfNoTaskLeft();
        }
      });
    }
  }

  public static Intent getClearNotificationsIntent(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, VineUploadService.class);
    localIntent.setAction("clear_notifications");
    return localIntent;
  }

  public static Intent getDiscardAllIntent(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, VineUploadService.class);
    localIntent.setAction("discard_all");
    return localIntent;
  }

  public static Intent getDiscardIntent(Context paramContext, String paramString)
  {
    Intent localIntent = new Intent(paramContext, VineUploadService.class);
    localIntent.setAction("discard");
    localIntent.putExtra("path", paramString);
    return localIntent;
  }

  public static Intent getNotifyFailedIntent(Context paramContext)
  {
    String[] arrayOfString = new String[1];
    arrayOfString[0] = String.valueOf(2);
    long l = AppController.getInstance(paramContext).getActiveSessionReadOnly().getUserId();
    Uri localUri = ContentUris.withAppendedId(VineUploads.Uploads.CONTENT_URI, l);
    Cursor localCursor = paramContext.getContentResolver().query(localUri, VineUploadsDatabaseSQL.UploadsQuery.PROJECTION, "status=?", arrayOfString, "_id ASC");
    String str = null;
    if (localCursor != null)
    {
      boolean bool = localCursor.moveToLast();
      str = null;
      if (bool)
        str = localCursor.getString(1);
      localCursor.close();
    }
    Intent localIntent = new Intent(paramContext, VineUploadService.class);
    localIntent.setAction("cNotify");
    localIntent.putExtra("path", str);
    return localIntent;
  }

  public static Intent getPostIntent(Context paramContext, VineUpload paramVineUpload, boolean paramBoolean)
  {
    if (!TextUtils.isEmpty(paramVineUpload.postInfo))
    {
      VineUpload.PostInfo localPostInfo = VineUpload.PostInfo.fromJsonString(paramVineUpload.postInfo);
      return getPostIntent(paramContext, paramVineUpload.path, localPostInfo.caption, localPostInfo.postToTwitter, localPostInfo.postToFacebook, localPostInfo.channelId, paramBoolean, localPostInfo.entities, localPostInfo.message);
    }
    return null;
  }

  public static Intent getPostIntent(Context paramContext, String paramString1, String paramString2, boolean paramBoolean1, boolean paramBoolean2, long paramLong, boolean paramBoolean3, ArrayList<VineEntity> paramArrayList, String paramString3)
  {
    Intent localIntent = new Intent(paramContext, VineUploadService.class);
    localIntent.setAction("bPost");
    localIntent.putExtra("is_retry", paramBoolean3);
    localIntent.putExtra("path", paramString1);
    localIntent.putExtra("description", paramString2);
    localIntent.putExtra("postToTwitter", paramBoolean1);
    localIntent.putExtra("postToFacebook", paramBoolean2);
    localIntent.putExtra("channelId", paramLong);
    localIntent.putExtra("entities", paramArrayList);
    localIntent.putExtra("message", paramString3);
    localIntent.putExtra("created", System.currentTimeMillis());
    return localIntent;
  }

  public static Intent getShowProgressIntent(Context paramContext)
  {
    Intent localIntent = new Intent(paramContext, VineUploadService.class);
    localIntent.setAction("show_notifications");
    return localIntent;
  }

  public static Intent getUploadIntent(Context paramContext, VineUpload paramVineUpload)
  {
    return getUploadIntent(paramContext, paramVineUpload.path, paramVineUpload.hash, paramVineUpload.thumbnailPath, paramVineUpload.reference);
  }

  public static Intent getUploadIntent(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4)
  {
    sShowProgress = false;
    Intent localIntent = new Intent(paramContext, VineUploadService.class);
    localIntent.setAction("aUpload");
    localIntent.putExtra("path", paramString1);
    localIntent.putExtra("hash", paramString2);
    localIntent.putExtra("thumbnail", paramString3);
    localIntent.putExtra("reference", paramString4);
    return localIntent;
  }

  private boolean isRunning(ServiceAsyncTask paramServiceAsyncTask)
  {
    return (paramServiceAsyncTask != null) && (paramServiceAsyncTask.getStatus().equals(AsyncTask.Status.RUNNING));
  }

  private void processCommand(String paramString1, String paramString2, Intent paramIntent)
  {
    SLog.d("Process command for action={}, path={}", paramString2, paramString1);
    ServiceAsyncTask localServiceAsyncTask1 = new ServiceAsyncTask(paramString1, paramString2, paramIntent);
    if ("aUpload".equals(paramString2))
      if (!this.mPendingTasks.contains(localServiceAsyncTask1))
      {
        UploadManager.addOrUpdateUpload(this, paramString1, paramIntent.getStringExtra("hash"), paramIntent.getStringExtra("reference"), this.mRsm);
        if (this.mPendingTasks.add(localServiceAsyncTask1))
          SLog.d("Upload task added for path={}", paramString1);
      }
    label378: 
    do
      while (true)
      {
        executeNext();
        VineUpload.PostInfo localPostInfo;
        VineUpload localVineUpload;
        do
        {
          return;
          SLog.d("Upload task is already in queue for path={}", paramString1);
          break;
          if (!"bPost".equals(paramString2))
            break label378;
          localPostInfo = new VineUpload.PostInfo(paramIntent.getStringExtra("description"), paramIntent.getBooleanExtra("postToTwitter", false), paramIntent.getBooleanExtra("postToFacebook", false), paramIntent.getLongExtra("channelId", -1L), paramIntent.getParcelableArrayListExtra("entities"), paramIntent.getStringExtra("message"), paramIntent.getLongExtra("created", 0L));
          localVineUpload = UploadManager.getUpload(this, paramString1);
        }
        while (localVineUpload == null);
        UploadManager.setPostInfo(this, localVineUpload, localPostInfo);
        switch (localVineUpload.status)
        {
        default:
          SLog.d("Invalid state={} for path={}", Integer.valueOf(localVineUpload.status), paramString1);
          break;
        case 0:
          ServiceAsyncTask localServiceAsyncTask2 = new ServiceAsyncTask(paramString1, "aUpload", paramIntent);
          if ((!localServiceAsyncTask2.equals(this.mCurrentTask)) && (this.mPendingTasks.add(localServiceAsyncTask2)))
            SLog.d("Upload task added for path={}", paramString1, localServiceAsyncTask2.action);
          if (this.mPendingTasks.add(localServiceAsyncTask1))
            SLog.d("Post task added for path={}", paramString1, localServiceAsyncTask1.action);
          break;
        case 1:
        case 2:
          if (localVineUpload.isExpired())
          {
            UploadManager.setStatus(this, localVineUpload, 0);
            startService(getPostIntent(this, localVineUpload, true));
            return;
          }
          if ((!localServiceAsyncTask1.equals(this.mCurrentTask)) && (this.mPendingTasks.add(localServiceAsyncTask1)))
          {
            SLog.d("Post task added for path={}", paramString1, localServiceAsyncTask1.action);
            continue;
            if (!"cNotify".equals(paramString2))
              break label413;
            if (!TextUtils.isEmpty(paramString1))
            {
              sShowProgress = true;
              SLog.d("Notify failed upload for path={}.", paramString1);
              showFailedNotification(paramString1);
            }
          }
          break;
        }
      }
    while (!"discard".equals(paramString2));
    label413: discardTask(paramString1);
  }

  public static boolean refreshSessionKey(Context paramContext)
  {
    Account localAccount = VineAccountHelper.getActiveAccount(paramContext);
    AccountManager localAccountManager = AccountManager.get(paramContext);
    int i = VineAccountHelper.getLoginType(localAccountManager, localAccount);
    VineAPI localVineAPI = VineAPI.getInstance(paramContext);
    switch (i)
    {
    default:
    case 1:
    case 2:
    }
    VineParserReader localVineParserReader1;
    ArrayList localArrayList1;
    StringBuilder localStringBuilder1;
    do
    {
      VineParserReader localVineParserReader2;
      ArrayList localArrayList2;
      StringBuilder localStringBuilder2;
      do
      {
        return false;
        String str3 = localAccount.name;
        String str4 = VineAccountHelper.getPassword(localAccountManager, localAccount);
        localVineParserReader2 = VineParserReader.createLoginReader();
        localArrayList2 = new ArrayList();
        localArrayList2.add(new BasicNameValuePair("username", str3));
        localArrayList2.add(new BasicNameValuePair("password", str4));
        localStringBuilder2 = new StringBuilder(localVineAPI.getBaseUrl()).append("/users/authenticate");
      }
      while (!HttpOperation.createPostRequest(ThreadedHttpOperationClient.getInstance(paramContext), localStringBuilder2, localArrayList2, localVineParserReader2, localVineAPI).execute().isOK());
      VineLogin localVineLogin2 = (VineLogin)localVineParserReader2.getParsedObject();
      VineAccountHelper.setSessionKey(localAccountManager, localAccount, localVineLogin2.key);
      AppController.getInstance(paramContext).setSessionKey(localVineLogin2.key);
      return true;
      String str1 = VineAccountHelper.getTwitterToken(localAccountManager, localAccount);
      String str2 = VineAccountHelper.getTwitterSecret(localAccountManager, localAccount);
      localVineParserReader1 = VineParserReader.createLoginReader();
      localArrayList1 = new ArrayList();
      localArrayList1.add(new BasicNameValuePair("twitterOauthToken", str1));
      localArrayList1.add(new BasicNameValuePair("twitterOauthSecret", str2));
      localStringBuilder1 = VineAPI.buildUponUrl(localVineAPI.getBaseUrl(), new Object[] { "users", "authenticate", "twitter" });
    }
    while (!HttpOperation.createPostRequest(ThreadedHttpOperationClient.getInstance(paramContext), localStringBuilder1, localArrayList1, localVineParserReader1, localVineAPI).execute().isOK());
    VineLogin localVineLogin1 = (VineLogin)localVineParserReader1.getParsedObject();
    VineAccountHelper.setSessionKey(localAccountManager, localAccount, localVineLogin1.key);
    AppController.getInstance(paramContext).setSessionKey(localVineLogin1.key);
    return true;
  }

  private Bitmap setScaledNotificationIcon(String paramString)
  {
    if (!TextUtils.isEmpty(paramString))
    {
      Bitmap localBitmap1 = (Bitmap)this.mBitmaps.get(paramString);
      if (localBitmap1 == null)
      {
        if (this.mNotificationPanelSize == -1)
          this.mNotificationPanelSize = getResources().getDimensionPixelSize(2131427390);
        Bitmap localBitmap2 = BitmapFactory.decodeFile(paramString);
        if (localBitmap2 != null)
        {
          localBitmap1 = Bitmap.createScaledBitmap(localBitmap2, this.mNotificationPanelSize, this.mNotificationPanelSize, true);
          if (localBitmap1 != null)
          {
            if (this.mBitmaps.size() >= 10)
              this.mBitmaps.clear();
            this.mBitmaps.put(paramString, localBitmap1);
          }
        }
      }
      else
      {
        return localBitmap1;
      }
    }
    if (this.mDefaultNotificationIcon == null)
      this.mDefaultNotificationIcon = BitmapFactory.decodeResource(getResources(), 2130837841);
    this.mBitmaps.put(paramString, this.mDefaultNotificationIcon);
    return this.mDefaultNotificationIcon;
  }

  private void showFailedNotification(String paramString)
  {
    VineUpload localVineUpload = UploadManager.getUpload(this, paramString);
    if (localVineUpload == null)
      return;
    SLog.d("Show failed notification for {}, upload expired? {}.", paramString, Boolean.valueOf(localVineUpload.isExpired()));
    NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(this);
    localBuilder.setSmallIcon(2130837922);
    localBuilder.setLargeIcon(setScaledNotificationIcon(localVineUpload.thumbnailPath));
    localBuilder.setContentIntent(PendingIntent.getActivity(this, 0, StartActivity.getStartIntent(this, "co.vine.android.UPLOAD_LIST"), 0));
    localBuilder.setContentTitle(getText(2131624220));
    localBuilder.setContentText(getText(2131624381));
    localBuilder.setAutoCancel(false);
    showNotification(localBuilder, 0);
  }

  private void showNotification(NotificationCompat.Builder paramBuilder, int paramInt)
  {
    try
    {
      boolean bool = sShowProgress;
      if (bool);
      try
      {
        this.mNotificationManager.notify("upload_notification", paramInt, paramBuilder.build());
        return;
      }
      catch (RuntimeException localRuntimeException)
      {
        while (true)
        {
          paramBuilder.setLargeIcon(null);
          this.mNotificationManager.notify("upload_notification", paramInt, paramBuilder.build());
        }
      }
    }
    finally
    {
    }
  }

  private void stopIfNoTaskLeft()
  {
    if ((this.mPendingTasks.isEmpty()) && (!isRunning(this.mCurrentTask)))
      stopService();
  }

  private void stopService()
  {
    synchronized (this.mLock)
    {
      Iterator localIterator = this.mStartIds.iterator();
      if (localIterator.hasNext())
        stopSelf(((Integer)localIterator.next()).intValue());
    }
    this.mStartIds.clear();
  }

  private void updateProgressNotification(String paramString, int paramInt1, int paramInt2, boolean paramBoolean, int paramInt3)
  {
    SLog.d("Update notification: {}, {}.", Boolean.valueOf(paramBoolean), Integer.valueOf(paramInt3));
    NotificationCompat.Builder localBuilder = new NotificationCompat.Builder(this);
    localBuilder.setLargeIcon(setScaledNotificationIcon(paramString));
    localBuilder.setSmallIcon(2130837922);
    localBuilder.setContentTitle(getText(paramInt1));
    localBuilder.setContentText(getText(paramInt2));
    localBuilder.setWhen(0L);
    localBuilder.setOngoing(true);
    if (paramBoolean)
      if (paramInt3 > 0)
        localBuilder.setProgress(100, paramInt3, false);
    while (true)
    {
      showNotification(localBuilder, 1);
      return;
      localBuilder.setProgress(0, 0, true);
      continue;
      localBuilder.setProgress(0, 0, true);
    }
  }

  private void updateTranscodeProgress(String paramString1, String paramString2)
  {
    Integer localInteger = (Integer)this.mProgressMap.get(paramString1);
    if (localInteger == null)
      localInteger = Integer.valueOf(0);
    updateProgressNotification(paramString2, 2131624229, 2131624230, true, localInteger.intValue());
  }

  private void updateUploadProgress(String paramString1, String paramString2)
  {
    Integer localInteger = (Integer)this.mProgressMap.get(paramString1);
    if (localInteger == null)
      localInteger = Integer.valueOf(0);
    updateProgressNotification(paramString2, 2131624404, 2131624405, true, localInteger.intValue());
  }

  public IBinder onBind(Intent paramIntent)
  {
    return null;
  }

  public void onCreate()
  {
    super.onCreate();
    if (!BuildUtil.isLogsOn())
      Crashlytics.start(this);
    try
    {
      this.mRsm = RecordSessionManager.getInstance(this);
      label22: this.mPendingTasks = new LinkedHashSet();
      this.mProgressMap = new ConcurrentHashMap();
      this.mUploadManager = new UploadManager(this);
      this.mStartIds = new LinkedList();
      this.mNotificationManager = ((NotificationManager)getSystemService("notification"));
      VineAccountHelper.resetActiveSession();
      IntentFilter localIntentFilter = new IntentFilter();
      localIntentFilter.addAction("co.vine.android.session.logout");
      localIntentFilter.addAction("co.vine.android.session.login");
      this.mSessionChangedReceiver = new SessionChangedReceiver();
      this.mBitmaps = new HashMap();
      registerReceiver(this.mSessionChangedReceiver, localIntentFilter);
      return;
    }
    catch (IOException localIOException)
    {
      break label22;
    }
  }

  public void onDestroy()
  {
    super.onDestroy();
    if (this.mSessionChangedReceiver != null)
      unregisterReceiver(this.mSessionChangedReceiver);
  }

  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    SLog.d("onStartCommand, intent={}", paramIntent);
    String str1;
    synchronized (this.mLock)
    {
      this.mStartIds.add(Integer.valueOf(paramInt2));
      if (paramIntent == null)
        return 1;
      str1 = paramIntent.getAction();
      if (str1 == null)
        throw new IllegalArgumentException("VineUploadService must be started with an explicit action.");
    }
    if ("discard_all".equals(str1))
    {
      Iterator localIterator = UploadManager.getAllPaths(this).keySet().iterator();
      while (localIterator.hasNext())
        discardTask((String)localIterator.next());
      cancelFailedNofitication();
    }
    while (true)
    {
      return 1;
      if ("show_notifications".equals(str1))
      {
        sShowProgress = true;
      }
      else if ("clear_notifications".equals(str1))
      {
        sShowProgress = false;
        clearNotification(0);
        clearNotification(1);
      }
      else
      {
        String str2 = paramIntent.getStringExtra("path");
        if (!TextUtils.isEmpty(str2))
          processCommand(str2, str1, paramIntent);
        else
          CrashUtil.log("path or hash is null, action={}, intent={}", new Object[] { str1, paramIntent });
      }
    }
  }

  void updatePostProgress(String paramString)
  {
    updateProgressNotification(paramString, 2131624228, 2131624003, true, -1);
  }

  public class ServiceAsyncTask extends AsyncTask<Void, Void, PostResult>
    implements VineProgressListener, EncoderManager.EncoderBoss
  {
    public final String action;
    private long mCurrentSize;
    private int mExecutionStatus;
    private boolean mIsDiscarded;
    private boolean mIsRetry;
    private int mLastProgress = -1;
    private final File mReference;
    private long mSize;
    private final String mThumbnail;
    private VineUpload mUpload;
    public final String path;

    public ServiceAsyncTask(String paramString1, String paramIntent, Intent arg4)
    {
      this.path = paramString1;
      this.action = paramIntent;
      this.mThumbnail = RecordConfigUtils.getThumbnailPath(paramString1);
      this.mReference = new File(RecordConfigUtils.getFrameInfoPath(paramString1));
      Object localObject;
      this.mIsRetry = localObject.getBooleanExtra("is_retry", false);
    }

    private void onComplete()
    {
      try
      {
        VineUploadService.this.clearNotification(1);
        VineUploadService.access$702(VineUploadService.this, null);
        Intent localIntent = new Intent("co.vine.android.UPLOAD_RESULT");
        localIntent.putExtra("upload_status", this.mExecutionStatus);
        localIntent.putExtra("path", this.path);
        localIntent.putExtra("thumbnail", this.mThumbnail);
        VineUploadService.this.sendBroadcast(localIntent);
        VineUploadService.this.executeNext();
        return;
      }
      finally
      {
      }
    }

    // ERROR //
    protected PostResult doInBackground(Void[] paramArrayOfVoid)
    {
      // Byte code:
      //   0: ldc 2
      //   2: monitorenter
      //   3: aload_0
      //   4: aload_0
      //   5: invokevirtual 113	co/vine/android/service/VineUploadService$ServiceAsyncTask:getContext	()Landroid/content/Context;
      //   8: aload_0
      //   9: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   12: invokestatic 119	co/vine/android/util/UploadManager:getUpload	(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;
      //   15: putfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   18: aload_0
      //   19: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   22: ifnull +14 -> 36
      //   25: aload_0
      //   26: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   29: getfield 126	co/vine/android/api/VineUpload:status	I
      //   32: iconst_m1
      //   33: if_icmpne +19 -> 52
      //   36: new 128	co/vine/android/service/PostResult
      //   39: dup
      //   40: iconst_0
      //   41: invokespecial 131	co/vine/android/service/PostResult:<init>	(Z)V
      //   44: astore 5
      //   46: ldc 2
      //   48: monitorexit
      //   49: aload 5
      //   51: areturn
      //   52: ldc 133
      //   54: aload_0
      //   55: getfield 41	co/vine/android/service/VineUploadService$ServiceAsyncTask:action	Ljava/lang/String;
      //   58: invokevirtual 139	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   61: ifeq +185 -> 246
      //   64: aload_0
      //   65: getfield 69	co/vine/android/service/VineUploadService$ServiceAsyncTask:mIsRetry	Z
      //   68: ifne +14 -> 82
      //   71: aload_0
      //   72: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   75: aload_0
      //   76: getfield 49	co/vine/android/service/VineUploadService$ServiceAsyncTask:mThumbnail	Ljava/lang/String;
      //   79: invokevirtual 142	co/vine/android/service/VineUploadService:updatePostProgress	(Ljava/lang/String;)V
      //   82: ldc 144
      //   84: invokestatic 149	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
      //   87: aload_0
      //   88: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   91: invokevirtual 153	co/vine/android/api/VineUpload:getPostInfo	()Lco/vine/android/api/VineUpload$PostInfo;
      //   94: astore 39
      //   96: aload_0
      //   97: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   100: astore 40
      //   102: aload_0
      //   103: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   106: invokestatic 157	co/vine/android/service/VineUploadService:access$100	(Lco/vine/android/service/VineUploadService;)Lco/vine/android/util/UploadManager;
      //   109: aload 40
      //   111: aload_0
      //   112: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   115: aload 39
      //   117: invokevirtual 161	co/vine/android/util/UploadManager:postShare	(Landroid/content/Context;Ljava/lang/String;Lco/vine/android/api/VineUpload$PostInfo;)Lco/vine/android/service/PostResult;
      //   120: astore 41
      //   122: aload 41
      //   124: getfield 164	co/vine/android/service/PostResult:success	Z
      //   127: ifne +37 -> 164
      //   130: aload 41
      //   132: getfield 167	co/vine/android/service/PostResult:shouldRefreshSessionKey	Z
      //   135: ifeq +29 -> 164
      //   138: aload 40
      //   140: invokestatic 171	co/vine/android/service/VineUploadService:refreshSessionKey	(Landroid/content/Context;)Z
      //   143: pop
      //   144: aload_0
      //   145: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   148: invokestatic 157	co/vine/android/service/VineUploadService:access$100	(Lco/vine/android/service/VineUploadService;)Lco/vine/android/util/UploadManager;
      //   151: aload 40
      //   153: aload_0
      //   154: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   157: aload 39
      //   159: invokevirtual 161	co/vine/android/util/UploadManager:postShare	(Landroid/content/Context;Ljava/lang/String;Lco/vine/android/api/VineUpload$PostInfo;)Lco/vine/android/service/PostResult;
      //   162: astore 41
      //   164: aload 41
      //   166: getfield 164	co/vine/android/service/PostResult:success	Z
      //   169: ifeq +63 -> 232
      //   172: ldc 173
      //   174: invokestatic 149	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
      //   177: aload_0
      //   178: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   181: invokestatic 176	co/vine/android/service/VineUploadService:access$200	(Lco/vine/android/service/VineUploadService;)V
      //   184: aload_0
      //   185: invokevirtual 113	co/vine/android/service/VineUploadService$ServiceAsyncTask:getContext	()Landroid/content/Context;
      //   188: invokestatic 182	co/vine/android/util/Util:getDefaultSharedPrefs	(Landroid/content/Context;)Landroid/content/SharedPreferences;
      //   191: astore 42
      //   193: aload 42
      //   195: invokeinterface 188 1 0
      //   200: astore 43
      //   202: aload 43
      //   204: ldc 190
      //   206: iconst_1
      //   207: aload 42
      //   209: ldc 190
      //   211: iconst_0
      //   212: invokeinterface 194 3 0
      //   217: iadd
      //   218: invokeinterface 200 3 0
      //   223: pop
      //   224: aload 43
      //   226: invokeinterface 204 1 0
      //   231: pop
      //   232: ldc 2
      //   234: monitorexit
      //   235: aload 41
      //   237: areturn
      //   238: astore 4
      //   240: ldc 2
      //   242: monitorexit
      //   243: aload 4
      //   245: athrow
      //   246: ldc 206
      //   248: aload_0
      //   249: getfield 41	co/vine/android/service/VineUploadService$ServiceAsyncTask:action	Ljava/lang/String;
      //   252: invokevirtual 139	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   255: ifeq +566 -> 821
      //   258: aload_0
      //   259: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   262: invokestatic 210	co/vine/android/service/VineUploadService:access$300	(Lco/vine/android/service/VineUploadService;)Ljava/util/concurrent/ConcurrentHashMap;
      //   265: aload_0
      //   266: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   269: iconst_0
      //   270: invokestatic 216	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   273: invokevirtual 222	java/util/concurrent/ConcurrentHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
      //   276: pop
      //   277: new 51	java/io/File
      //   280: dup
      //   281: aload_0
      //   282: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   285: invokespecial 57	java/io/File:<init>	(Ljava/lang/String;)V
      //   288: astore 7
      //   290: new 224	java/lang/StringBuilder
      //   293: dup
      //   294: invokespecial 225	java/lang/StringBuilder:<init>	()V
      //   297: aload_0
      //   298: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   301: invokevirtual 229	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   304: ldc 231
      //   306: invokevirtual 229	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   309: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   312: astore 8
      //   314: aload 7
      //   316: invokevirtual 238	java/io/File:exists	()Z
      //   319: ifeq +245 -> 564
      //   322: aload_0
      //   323: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   326: invokestatic 243	co/vine/android/recorder/HashAsyncTask:getMD5Checksum	(Ljava/lang/String;)Ljava/lang/String;
      //   329: astore 21
      //   331: aload_0
      //   332: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   335: getfield 246	co/vine/android/api/VineUpload:hash	Ljava/lang/String;
      //   338: astore 22
      //   340: aload 21
      //   342: aload 22
      //   344: invokevirtual 139	java/lang/String:equals	(Ljava/lang/Object;)Z
      //   347: ifne +76 -> 423
      //   350: aload 22
      //   352: ifnull +36 -> 388
      //   355: aload 22
      //   357: invokevirtual 250	java/lang/String:length	()I
      //   360: ifeq +28 -> 388
      //   363: ldc 252
      //   365: aload 21
      //   367: aload 22
      //   369: invokestatic 256	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
      //   372: new 128	co/vine/android/service/PostResult
      //   375: dup
      //   376: iconst_0
      //   377: invokespecial 131	co/vine/android/service/PostResult:<init>	(Z)V
      //   380: astore 38
      //   382: ldc 2
      //   384: monitorexit
      //   385: aload 38
      //   387: areturn
      //   388: new 258	co/vine/android/VineException
      //   391: dup
      //   392: new 224	java/lang/StringBuilder
      //   395: dup
      //   396: invokespecial 225	java/lang/StringBuilder:<init>	()V
      //   399: ldc_w 260
      //   402: invokevirtual 229	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   405: aload 22
      //   407: invokevirtual 229	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   410: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
      //   413: invokespecial 261	co/vine/android/VineException:<init>	(Ljava/lang/String;)V
      //   416: astore 23
      //   418: aload 23
      //   420: invokestatic 267	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;)V
      //   423: aload 7
      //   425: invokevirtual 270	java/io/File:length	()J
      //   428: lstore 24
      //   430: invokestatic 275	java/lang/System:currentTimeMillis	()J
      //   433: lstore 26
      //   435: aload_0
      //   436: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   439: astore 28
      //   441: aload_0
      //   442: getfield 59	co/vine/android/service/VineUploadService$ServiceAsyncTask:mReference	Ljava/io/File;
      //   445: invokevirtual 238	java/io/File:exists	()Z
      //   448: ifeq +139 -> 587
      //   451: aload_0
      //   452: getfield 59	co/vine/android/service/VineUploadService$ServiceAsyncTask:mReference	Ljava/io/File;
      //   455: invokestatic 281	co/vine/android/recorder/RecordSessionManager:readFrameInfo	(Ljava/io/File;)Ljava/util/ArrayList;
      //   458: astore 29
      //   460: aload_0
      //   461: aload 28
      //   463: aload 8
      //   465: aload 29
      //   467: invokestatic 287	co/vine/android/recorder/EncoderManager:transcode	(Lco/vine/android/recorder/EncoderManager$EncoderBoss;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;)V
      //   470: invokestatic 275	java/lang/System:currentTimeMillis	()J
      //   473: lstore 30
      //   475: new 51	java/io/File
      //   478: dup
      //   479: aload 8
      //   481: invokespecial 57	java/io/File:<init>	(Ljava/lang/String;)V
      //   484: astore 32
      //   486: aload 32
      //   488: invokevirtual 270	java/io/File:length	()J
      //   491: lstore 33
      //   493: ldc_w 289
      //   496: lload 30
      //   498: lload 26
      //   500: lsub
      //   501: invokestatic 294	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   504: lload 24
      //   506: invokestatic 294	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   509: lload 33
      //   511: invokestatic 294	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   514: invokestatic 297	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
      //   517: new 51	java/io/File
      //   520: dup
      //   521: aload_0
      //   522: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   525: invokespecial 57	java/io/File:<init>	(Ljava/lang/String;)V
      //   528: astore 35
      //   530: aload 35
      //   532: invokevirtual 300	java/io/File:delete	()Z
      //   535: pop
      //   536: ldc_w 302
      //   539: aload 8
      //   541: invokestatic 305	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
      //   544: aload 8
      //   546: invokestatic 243	co/vine/android/recorder/HashAsyncTask:getMD5Checksum	(Ljava/lang/String;)Ljava/lang/String;
      //   549: astore 37
      //   551: aload_0
      //   552: invokevirtual 113	co/vine/android/service/VineUploadService$ServiceAsyncTask:getContext	()Landroid/content/Context;
      //   555: aload_0
      //   556: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   559: aload 37
      //   561: invokestatic 309	co/vine/android/util/UploadManager:setHash	(Landroid/content/Context;Lco/vine/android/api/VineUpload;Ljava/lang/String;)V
      //   564: aload_0
      //   565: invokevirtual 312	co/vine/android/service/VineUploadService$ServiceAsyncTask:isCancelled	()Z
      //   568: ifeq +25 -> 593
      //   571: new 128	co/vine/android/service/PostResult
      //   574: dup
      //   575: iconst_0
      //   576: invokespecial 131	co/vine/android/service/PostResult:<init>	(Z)V
      //   579: astore 9
      //   581: ldc 2
      //   583: monitorexit
      //   584: aload 9
      //   586: areturn
      //   587: aconst_null
      //   588: astore 29
      //   590: goto -130 -> 460
      //   593: new 51	java/io/File
      //   596: dup
      //   597: aload 8
      //   599: invokespecial 57	java/io/File:<init>	(Ljava/lang/String;)V
      //   602: astore 10
      //   604: aload 10
      //   606: invokevirtual 270	java/io/File:length	()J
      //   609: lstore 11
      //   611: new 51	java/io/File
      //   614: dup
      //   615: aload_0
      //   616: getfield 49	co/vine/android/service/VineUploadService$ServiceAsyncTask:mThumbnail	Ljava/lang/String;
      //   619: invokespecial 57	java/io/File:<init>	(Ljava/lang/String;)V
      //   622: astore 13
      //   624: aload_0
      //   625: lload 11
      //   627: aload 13
      //   629: invokevirtual 270	java/io/File:length	()J
      //   632: ladd
      //   633: putfield 314	co/vine/android/service/VineUploadService$ServiceAsyncTask:mSize	J
      //   636: ldc_w 316
      //   639: aload 10
      //   641: aload_0
      //   642: getfield 314	co/vine/android/service/VineUploadService$ServiceAsyncTask:mSize	J
      //   645: invokestatic 294	java/lang/Long:valueOf	(J)Ljava/lang/Long;
      //   648: invokestatic 318	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
      //   651: aload_0
      //   652: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   655: invokestatic 157	co/vine/android/service/VineUploadService:access$100	(Lco/vine/android/service/VineUploadService;)Lco/vine/android/util/UploadManager;
      //   658: aload_0
      //   659: aload 8
      //   661: aload_0
      //   662: getfield 49	co/vine/android/service/VineUploadService$ServiceAsyncTask:mThumbnail	Ljava/lang/String;
      //   665: aload_0
      //   666: getfield 39	co/vine/android/service/VineUploadService$ServiceAsyncTask:path	Ljava/lang/String;
      //   669: invokevirtual 322	co/vine/android/util/UploadManager:upload	(Lco/vine/android/service/VineUploadService$ServiceAsyncTask;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
      //   672: astore 14
      //   674: aload_0
      //   675: invokevirtual 312	co/vine/android/service/VineUploadService$ServiceAsyncTask:isCancelled	()Z
      //   678: ifeq +19 -> 697
      //   681: new 128	co/vine/android/service/PostResult
      //   684: dup
      //   685: iconst_0
      //   686: invokespecial 131	co/vine/android/service/PostResult:<init>	(Z)V
      //   689: astore 15
      //   691: ldc 2
      //   693: monitorexit
      //   694: aload 15
      //   696: areturn
      //   697: aload 14
      //   699: ifnull +136 -> 835
      //   702: aload_0
      //   703: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   706: invokestatic 326	co/vine/android/service/VineUploadService:access$400	(Lco/vine/android/service/VineUploadService;)[I
      //   709: astore 17
      //   711: aload 17
      //   713: monitorenter
      //   714: aload_0
      //   715: invokevirtual 113	co/vine/android/service/VineUploadService$ServiceAsyncTask:getContext	()Landroid/content/Context;
      //   718: aload_0
      //   719: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   722: invokestatic 330	co/vine/android/util/UploadManager:setUploadTime	(Landroid/content/Context;Lco/vine/android/api/VineUpload;)V
      //   725: aload_0
      //   726: invokevirtual 113	co/vine/android/service/VineUploadService$ServiceAsyncTask:getContext	()Landroid/content/Context;
      //   729: aload_0
      //   730: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   733: aload 14
      //   735: invokestatic 334	co/vine/android/util/UploadManager:setUris	(Landroid/content/Context;Lco/vine/android/api/VineUpload;[Ljava/lang/String;)V
      //   738: aload_0
      //   739: invokevirtual 113	co/vine/android/service/VineUploadService$ServiceAsyncTask:getContext	()Landroid/content/Context;
      //   742: aload_0
      //   743: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   746: iconst_1
      //   747: invokestatic 338	co/vine/android/util/UploadManager:setStatus	(Landroid/content/Context;Lco/vine/android/api/VineUpload;I)V
      //   750: aload_0
      //   751: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   754: getfield 341	co/vine/android/api/VineUpload:postInfo	Ljava/lang/String;
      //   757: invokestatic 347	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
      //   760: ifne +26 -> 786
      //   763: aload_0
      //   764: getfield 32	co/vine/android/service/VineUploadService$ServiceAsyncTask:this$0	Lco/vine/android/service/VineUploadService;
      //   767: aload_0
      //   768: invokevirtual 113	co/vine/android/service/VineUploadService$ServiceAsyncTask:getContext	()Landroid/content/Context;
      //   771: aload_0
      //   772: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   775: aload_0
      //   776: getfield 69	co/vine/android/service/VineUploadService$ServiceAsyncTask:mIsRetry	Z
      //   779: invokestatic 351	co/vine/android/service/VineUploadService:getPostIntent	(Landroid/content/Context;Lco/vine/android/api/VineUpload;Z)Landroid/content/Intent;
      //   782: invokevirtual 355	co/vine/android/service/VineUploadService:startService	(Landroid/content/Intent;)Landroid/content/ComponentName;
      //   785: pop
      //   786: aload 17
      //   788: monitorexit
      //   789: new 128	co/vine/android/service/PostResult
      //   792: dup
      //   793: iconst_1
      //   794: invokespecial 131	co/vine/android/service/PostResult:<init>	(Z)V
      //   797: astore 19
      //   799: ldc 2
      //   801: monitorexit
      //   802: aload 19
      //   804: areturn
      //   805: astore 18
      //   807: aload 17
      //   809: monitorexit
      //   810: aload 18
      //   812: athrow
      //   813: astore_2
      //   814: ldc_w 357
      //   817: aload_2
      //   818: invokestatic 360	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;Ljava/lang/Throwable;)V
      //   821: new 128	co/vine/android/service/PostResult
      //   824: dup
      //   825: iconst_0
      //   826: invokespecial 131	co/vine/android/service/PostResult:<init>	(Z)V
      //   829: astore_3
      //   830: ldc 2
      //   832: monitorexit
      //   833: aload_3
      //   834: areturn
      //   835: ldc_w 362
      //   838: aload_0
      //   839: getfield 121	co/vine/android/service/VineUploadService$ServiceAsyncTask:mUpload	Lco/vine/android/api/VineUpload;
      //   842: getfield 126	co/vine/android/api/VineUpload:status	I
      //   845: invokestatic 216	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
      //   848: invokestatic 305	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
      //   851: new 128	co/vine/android/service/PostResult
      //   854: dup
      //   855: iconst_0
      //   856: invokespecial 131	co/vine/android/service/PostResult:<init>	(Z)V
      //   859: astore 16
      //   861: ldc 2
      //   863: monitorexit
      //   864: aload 16
      //   866: areturn
      //
      // Exception table:
      //   from	to	target	type
      //   3	36	238	finally
      //   36	46	238	finally
      //   46	49	238	finally
      //   52	82	238	finally
      //   82	164	238	finally
      //   164	232	238	finally
      //   232	235	238	finally
      //   240	243	238	finally
      //   246	350	238	finally
      //   355	382	238	finally
      //   382	385	238	finally
      //   388	423	238	finally
      //   423	460	238	finally
      //   460	564	238	finally
      //   564	581	238	finally
      //   581	584	238	finally
      //   593	691	238	finally
      //   691	694	238	finally
      //   702	714	238	finally
      //   789	799	238	finally
      //   799	802	238	finally
      //   810	813	238	finally
      //   814	821	238	finally
      //   821	833	238	finally
      //   835	861	238	finally
      //   861	864	238	finally
      //   714	786	805	finally
      //   786	789	805	finally
      //   807	810	805	finally
      //   3	36	813	java/lang/Exception
      //   36	46	813	java/lang/Exception
      //   52	82	813	java/lang/Exception
      //   82	164	813	java/lang/Exception
      //   164	232	813	java/lang/Exception
      //   246	350	813	java/lang/Exception
      //   355	382	813	java/lang/Exception
      //   388	423	813	java/lang/Exception
      //   423	460	813	java/lang/Exception
      //   460	564	813	java/lang/Exception
      //   564	581	813	java/lang/Exception
      //   593	691	813	java/lang/Exception
      //   702	714	813	java/lang/Exception
      //   789	799	813	java/lang/Exception
      //   810	813	813	java/lang/Exception
      //   835	861	813	java/lang/Exception
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      ServiceAsyncTask localServiceAsyncTask;
      do
      {
        return true;
        if (!(paramObject instanceof ServiceAsyncTask))
          return false;
        localServiceAsyncTask = (ServiceAsyncTask)paramObject;
        if (this.path != null)
        {
          if (this.path.equals(localServiceAsyncTask.path));
        }
        else
          while (localServiceAsyncTask.path != null)
            return false;
        if (this.action == null)
          break;
      }
      while (this.action.equals(localServiceAsyncTask.action));
      while (true)
      {
        return false;
        if (localServiceAsyncTask.action == null)
          break;
      }
    }

    public Context getContext()
    {
      return VineUploadService.this;
    }

    public int hashCode()
    {
      if (this.path != null);
      for (int i = this.path.hashCode(); ; i = 0)
      {
        int j = i * 31;
        String str = this.action;
        int k = 0;
        if (str != null)
          k = this.action.hashCode();
        return j + k;
      }
    }

    protected void onCancelled()
    {
      SLog.d("Task cancelled. {}, {}.", this.path, this.action);
      if (!this.mIsDiscarded)
        VineUploadService.this.discardUpload(this.path);
      onComplete();
    }

    protected void onPostExecute(PostResult paramPostResult)
    {
      boolean bool = paramPostResult.success;
      if (!this.mIsDiscarded)
      {
        if (!bool)
          break label82;
        this.mExecutionStatus = 2;
        if ((!"aUpload".equals(this.action)) || (!TextUtils.isEmpty(this.mUpload.postInfo)))
          break label56;
        this.mExecutionStatus = 3;
      }
      while (true)
      {
        onComplete();
        return;
        label56: if ("bPost".equals(this.action))
        {
          VineUploadService.this.discardUpload(this.path);
          continue;
          label82: this.mExecutionStatus = 1;
          VineUploadService.this.startService(VineUploadService.getNotifyFailedIntent(getContext()));
          if (this.mUpload != null)
            UploadManager.setStatus(getContext(), this.mUpload, 2, paramPostResult.captchaUrl);
        }
      }
    }

    public void progressChanged(VineProgressEvent paramVineProgressEvent)
    {
      this.mCurrentSize += paramVineProgressEvent.getBytesTransfered();
      int i = (int)(100L * this.mCurrentSize / this.mSize);
      if (Math.abs(this.mLastProgress - i) > 2)
      {
        VineUploadService.this.mProgressMap.put(this.path, Integer.valueOf(i));
        VineUploadService.this.updateUploadProgress(this.path, this.mThumbnail);
      }
    }

    public void setIsDiscarded(boolean paramBoolean)
    {
      this.mIsDiscarded = paramBoolean;
    }

    public void updateLastProcess(int paramInt)
    {
      this.mLastProgress = paramInt;
    }

    public void updateProgress(int paramInt)
    {
      if (Math.abs(this.mLastProgress - paramInt) > 2)
      {
        this.mLastProgress = paramInt;
        VineUploadService.this.mProgressMap.put(this.path, Integer.valueOf(paramInt));
        VineUploadService.this.updateTranscodeProgress(this.path, this.mThumbnail);
      }
    }
  }

  public class SessionChangedReceiver extends BroadcastReceiver
  {
    public SessionChangedReceiver()
    {
    }

    public void onReceive(Context paramContext, Intent paramIntent)
    {
      if ((paramIntent != null) && (("co.vine.android.session.logout".equals(paramIntent.getAction())) || ("co.vine.android.session.login".equals(paramIntent.getAction()))))
        VineAccountHelper.resetActiveSession();
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.service.VineUploadService
 * JD-Core Version:    0.6.2
 */