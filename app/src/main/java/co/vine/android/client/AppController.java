package co.vine.android.client;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.database.CursorWindow;
import android.graphics.Bitmap;
import android.graphics.Point;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.os.Process;
import android.support.v4.app.Fragment;
import android.text.TextUtils;
import android.view.WindowManager;
import co.vine.android.AppImpl;
import co.vine.android.LoginTwitterActivity;
import co.vine.android.StartActivity;
import co.vine.android.api.ServerStatus;
import co.vine.android.api.TwitterUser;
import co.vine.android.api.VineEntity;
import co.vine.android.api.VineLogin;
import co.vine.android.api.VinePost;
import co.vine.android.api.VineRepost;
import co.vine.android.api.VineUser;
import co.vine.android.network.HttpResult;
import co.vine.android.provider.SettingsManager;
import co.vine.android.service.GCMRegistrationService;
import co.vine.android.service.PendingAction;
import co.vine.android.service.VineService;
import co.vine.android.service.VineService.VineServiceBinder;
import co.vine.android.service.VineServiceResponder;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageKey;
import co.vine.android.util.image.ImageUtils;
import co.vine.android.util.image.PhotoImagesCache;
import co.vine.android.util.image.PhotoImagesListener;
import co.vine.android.util.image.UrlImage;
import co.vine.android.util.video.UrlVideo;
import co.vine.android.util.video.VideoCache;
import co.vine.android.util.video.VideoKey;
import co.vine.android.util.video.VideoListener;
import com.crashlytics.android.Crashlytics;
import com.edisonwang.android.slog.SLog;
import com.facebook.Session.Builder;
import com.facebook.Session.OpenRequest;
import com.facebook.Session.StatusCallback;
import com.facebook.SessionDefaultAudience;
import com.facebook.SessionLoginBehavior;
import com.facebook.SessionState;
import com.facebook.SharedPreferencesTokenCachingStrategy;
import com.twitter.android.sdk.Twitter;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class AppController
  implements PhotoImagesListener, VideoListener, Session.StatusCallback
{
  private static final long CLEANUP_INTERVAL = 3600000L;
  private static final String KEY_FACEBOOK_TOKEN = "KEY_FACEBOOK_TOKEN";
  private static final long LOOP_COUNT_INTERVAL = 300000L;
  private static final String PREF_LAST_USER_ID = "last_user_id";
  public static final String PUBLISH_ACTIONS = "publish_actions";
  public static final int REQUEST_CODE_TWITTER_SDK = 1;
  public static final int REQUEST_CODE_TWITTER_XAUTH = 2;
  private static final long SERVER_REFRESH_INTERVAL = 3600000L;
  public static final int STATUS_CODE_CAPTCHA_FAIL = 455;
  private static final int TYPEAHEAD_DEFAULT_FETCH_THRESHOLD = 2;
  private static final int TYPEAHEAD_DEFAULT_MAX_COMPOSE = 50;
  private static final long TYPEAHEAD_DEFAULT_THROTTLE = 300L;
  private static final int TYPEAHEAD_TAGS_FETCH_THRESHOLD = 3;
  private static AppController sInstance;
  final Context mContext;
  private final Handler mHandler;
  private ArrayList<AppSessionListener> mListeners;
  private LoopCountRunnable mLoopCountRunnable;
  private final PhotoImagesCache mPhotoImagesCache;
  private ServerStatusRunnable mServerStatusRunnable;
  private final VineServiceConnection mServiceConnection = new VineServiceConnection();
  private final VineServiceResponder mServiceResponder;
  private final Twitter mTwitter;
  private final VideoCache mVideoCache;

  static
  {
    if ((SLog.sLogsOn) && (!BuildUtil.isExplore()))
      SLog.d("Start changing value.");
    try
    {
      Field localField2 = CursorWindow.class.getDeclaredField("sCursorWindowSize");
      localField2.setAccessible(true);
      Object localObject = localField2.get(null);
      SLog.d("Original value: {}.", localObject);
      if (((Integer)localObject).intValue() < 10000000)
        localField2.set(null, Integer.valueOf(10000000));
      SLog.d("Sucessfully updated sCursorWindowSize.");
    }
    catch (Exception localException1)
    {
      try
      {
        while (true)
        {
          Field localField1 = CursorWindow.class.getDeclaredField("sCursorWindowSize");
          localField1.setAccessible(true);
          SLog.d("Verify value: {}.", localField1.get(null));
          SLog.d("End changing value.");
          return;
          localException1 = localException1;
          SLog.e("You are too evil.", localException1);
        }
      }
      catch (Exception localException2)
      {
        while (true)
          SLog.e("You are too evil.", localException2);
      }
    }
  }

  private AppController(Context paramContext)
  {
    this.mContext = paramContext;
    this.mHandler = new Handler(Looper.getMainLooper());
    this.mListeners = new ArrayList();
    Point localPoint = Util.getDisplaySize(((WindowManager)paramContext.getSystemService("window")).getDefaultDisplay());
    this.mPhotoImagesCache = new PhotoImagesCache(paramContext, Math.max(localPoint.x, localPoint.y), 31457280);
    this.mPhotoImagesCache.addListener(this);
    this.mVideoCache = new VideoCache(paramContext, 0);
    this.mVideoCache.addListener(this);
    this.mTwitter = new Twitter(TwitterVineApp.API_KEY, TwitterVineApp.API_SECRET);
    this.mServiceResponder = new VineServiceResponder()
    {
      public void onServiceResponse(int paramAnonymousInt1, int paramAnonymousInt2, String paramAnonymousString, Bundle paramAnonymousBundle)
      {
        AppController.this.handleServiceResponse(paramAnonymousInt1, paramAnonymousInt2, paramAnonymousString, paramAnonymousBundle);
      }
    };
    this.mServerStatusRunnable = new ServerStatusRunnable();
    this.mLoopCountRunnable = new LoopCountRunnable();
    SLog.i("App Controller pid: {}", Integer.valueOf(Process.myPid()));
    paramContext.bindService(new Intent(paramContext, VineService.class), this.mServiceConnection, 1);
  }

  public static void clearFileCache(Context paramContext)
  {
    Util.removeCache(paramContext);
    ImageUtils.removeFiles(paramContext);
  }

  private Bundle createServiceBundle()
  {
    return createServiceBundle(getActiveSession());
  }

  private Bundle createServiceBundle(Session paramSession)
  {
    return injectServiceBundle(new Bundle(), paramSession);
  }

  private String executeServiceAction(int paramInt, Bundle paramBundle)
  {
    Crashlytics.setInt("Last Service Action Code", paramInt);
    return this.mServiceConnection.queueAndExecute(paramInt, paramBundle, this.mServiceResponder);
  }

  private Session getActiveSession(boolean paramBoolean)
  {
    return VineAccountHelper.getActiveSession(this.mContext, paramBoolean);
  }

  public static AppController getInstance(Context paramContext)
  {
    try
    {
      if (sInstance == null)
        sInstance = new AppController(paramContext.getApplicationContext());
      AppController localAppController = sInstance;
      return localAppController;
    }
    finally
    {
    }
  }

  private Bundle injectServiceBundle(Bundle paramBundle, Session paramSession)
  {
    paramBundle.putString("s_key", paramSession.getSessionKey());
    paramBundle.putLong("s_owner_id", paramSession.getUserId());
    paramBundle.putString("a_name", paramSession.getName());
    paramBundle.putString("email", paramSession.getLoginEmail());
    return paramBundle;
  }

  private void onLogout()
  {
    if (getLoginStatus().equals(Session.LoginStatus.LOGGED_OUT))
      return;
    String str = getActiveSession().getSessionKey();
    Util.getDefaultSharedPrefs(this.mContext).edit().clear().commit();
    clearDbAll();
    clearFileCache();
    this.mContext.startService(GCMRegistrationService.getUnregisterIntent(this.mContext, getActiveId(), str));
    Util.getDefaultSharedPrefs(this.mContext).edit().putLong("last_user_id", getActiveId()).commit();
    SettingsManager.setCurrentAccount(this.mContext, null, null, 0L);
    Session localSession = VineAccountHelper.getCachedActiveSession();
    VineAccountHelper.removeAccount(this.mContext, localSession.getLoginEmail());
    if (localSession != null)
      localSession.logout();
    Intent localIntent1 = new Intent("co.vine.android.session.logout");
    this.mContext.sendBroadcast(localIntent1);
    Intent localIntent2 = AppImpl.getInstance().getClearNotificationsIntent(this.mContext);
    if (localIntent2 != null)
      this.mContext.startService(localIntent2);
    StartActivity.toStart(this.mContext);
  }

  private String performCleanup(Session paramSession, long paramLong)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("time", paramLong);
    return executeServiceAction(29, localBundle);
  }

  public static void setPendingFacebookToken(Context paramContext, String paramString)
  {
    Util.getDefaultSharedPrefs(paramContext).edit().putString("KEY_FACEBOOK_TOKEN", paramString).commit();
  }

  public static void startTwitterAuthWithFinish(Twitter paramTwitter, Activity paramActivity)
  {
    try
    {
      if (!paramTwitter.startAuthActivityForResult(paramActivity, 1))
        paramActivity.startActivityForResult(LoginTwitterActivity.getIntentWithFinish(paramActivity), 2);
      return;
    }
    catch (SecurityException localSecurityException)
    {
      paramActivity.startActivityForResult(LoginTwitterActivity.getIntentWithFinish(paramActivity), 2);
    }
  }

  public String acceptFollowRequest(Session paramSession, long paramLong)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("user_id", paramLong);
    localBundle.putBoolean("accept", true);
    return executeServiceAction(50, localBundle);
  }

  public String acceptRejectRequest(Session paramSession, long paramLong)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("user_id", paramLong);
    localBundle.putBoolean("accept", false);
    return executeServiceAction(50, localBundle);
  }

  public void addListener(AppSessionListener paramAppSessionListener)
  {
    if (this.mListeners.contains(paramAppSessionListener))
      return;
    this.mListeners.add(paramAppSessionListener);
  }

  public boolean attemptCancelVideoFetchRequest(VideoKey paramVideoKey)
  {
    return this.mVideoCache.cancel(paramVideoKey) > 0;
  }

  public String blockUser(long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("user_id", getActiveId());
    localBundle.putLong("block_user_id", paramLong);
    return executeServiceAction(47, localBundle);
  }

  public void call(com.facebook.Session paramSession, SessionState paramSessionState, Exception paramException)
  {
    SLog.d("Session state has changed: {}.", paramSession.getState().name(), paramException);
    ArrayList localArrayList = this.mListeners;
    for (int i = -1 + localArrayList.size(); i >= 0; i--)
      ((AppSessionListener)localArrayList.get(i)).onFacebookSessionChanged(paramSession, paramSessionState, paramException);
  }

  public String clearDbAll()
  {
    return executeServiceAction(59, createServiceBundle());
  }

  public String clearDbCache(boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putBoolean("notify", paramBoolean);
    return executeServiceAction(58, localBundle);
  }

  public void clearFacebookToken()
  {
    com.facebook.Session localSession = com.facebook.Session.getActiveSession();
    if (localSession == null)
      localSession = com.facebook.Session.openActiveSessionFromCache(this.mContext);
    if (localSession != null)
      localSession.closeAndClearTokenInformation();
  }

  public void clearFileCache()
  {
    clearFileCache(this.mContext);
  }

  public String clearGcmRegId(String paramString1, long paramLong, String paramString2)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("gcmRegId", paramString1);
    localBundle.putLong("user_id", paramLong);
    localBundle.putString("s_key", paramString2);
    return executeServiceAction(61, localBundle);
  }

  public void clearPushNotifications()
  {
    executeServiceAction(62, new Bundle());
  }

  public void connectToFacebookInitialize(Fragment paramFragment)
  {
    Context localContext = this.mContext;
    com.facebook.Session localSession = new Session.Builder(localContext).setApplicationId(localContext.getString(2131624110)).setTokenCachingStrategy(new SharedPreferencesTokenCachingStrategy(localContext)).build();
    com.facebook.Session.setActiveSession(localSession);
    if (!localSession.isOpened())
    {
      ArrayList localArrayList = new ArrayList();
      localArrayList.add("basic_info");
      Session.OpenRequest localOpenRequest = new Session.OpenRequest(paramFragment);
      localOpenRequest.setPermissions(localArrayList);
      localOpenRequest.setLoginBehavior(SessionLoginBehavior.SSO_WITH_FALLBACK);
      localSession.openForRead(localOpenRequest);
    }
  }

  public void connectToFacebookPublish(Fragment paramFragment)
  {
    Context localContext = this.mContext;
    com.facebook.Session localSession = new Session.Builder(localContext).setApplicationId(localContext.getString(2131624110)).setTokenCachingStrategy(new SharedPreferencesTokenCachingStrategy(localContext)).build();
    com.facebook.Session.setActiveSession(localSession);
    if (!localSession.isOpened())
    {
      ArrayList localArrayList = new ArrayList();
      localArrayList.add("publish_actions");
      Session.OpenRequest localOpenRequest = new Session.OpenRequest(paramFragment);
      localOpenRequest.setDefaultAudience(SessionDefaultAudience.FRIENDS);
      localOpenRequest.setPermissions(localArrayList);
      localOpenRequest.setLoginBehavior(SessionLoginBehavior.SSO_WITH_FALLBACK);
      localSession.openForPublish(localOpenRequest);
    }
  }

  public String connectTwitter(Session paramSession, String paramString1, String paramString2, String paramString3, long paramLong)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putString("username", paramString1);
    localBundle.putString("key", paramString2);
    localBundle.putString("secret", paramString3);
    localBundle.putLong("user_id", paramLong);
    return executeServiceAction(32, localBundle);
  }

  public String deactivateAccount()
  {
    return executeServiceAction(67, createServiceBundle());
  }

  public String deleteComment(long paramLong, String paramString)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("post_id", paramLong);
    localBundle.putString("comment_id", paramString);
    return executeServiceAction(30, localBundle);
  }

  public String deletePost(Session paramSession, long paramLong)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong);
    return executeServiceAction(31, localBundle);
  }

  public String deleteSession(String paramString)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("s_key", paramString);
    return executeServiceAction(64, localBundle);
  }

  public void determineCleanup(Session paramSession)
  {
    SharedPreferences localSharedPreferences = Util.getSharedPrefs(this.mContext, "last_cleanup");
    long l = localSharedPreferences.getLong("last_cleanup", 0L);
    if (l > 0L)
    {
      if (System.currentTimeMillis() - l > 3600000L)
      {
        new Handler(this.mContext.getMainLooper());
        performCleanup(paramSession, l);
      }
      return;
    }
    SharedPreferences.Editor localEditor = localSharedPreferences.edit();
    localEditor.putLong("last_cleanup", System.currentTimeMillis());
    localEditor.commit();
  }

  public void determineServerStatus()
  {
    SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(this.mContext);
    long l1 = localSharedPreferences.getLong("server_upload_last_refresh", 0L);
    long l2 = System.currentTimeMillis() - l1;
    long l3 = System.currentTimeMillis() - l2;
    if ((l1 <= 0L) || (l2 > 3600000L))
    {
      fetchServerStatus();
      localSharedPreferences.edit().putLong("server_upload_last_refresh", System.currentTimeMillis()).commit();
      if (this.mHandler != null)
      {
        this.mHandler.removeCallbacks(this.mServerStatusRunnable);
        this.mHandler.postDelayed(this.mServerStatusRunnable, 3600000L);
      }
    }
    while (this.mHandler == null)
      return;
    this.mHandler.removeCallbacks(this.mServerStatusRunnable);
    Handler localHandler = this.mHandler;
    ServerStatusRunnable localServerStatusRunnable = this.mServerStatusRunnable;
    if (l3 > 0L);
    while (true)
    {
      localHandler.postDelayed(localServerStatusRunnable, l3);
      return;
      l3 = 3600000L;
    }
  }

  public String disableReposts(long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("user_id", paramLong);
    return executeServiceAction(69, localBundle);
  }

  public String disconnectTwitter(Session paramSession)
  {
    return executeServiceAction(33, createServiceBundle(paramSession));
  }

  public String enableReposts(long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("user_id", paramLong);
    return executeServiceAction(68, localBundle);
  }

  public String expireTimeline(boolean paramBoolean, int paramInt, String paramString)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putBoolean("also_fetch_posts", paramBoolean);
    localBundle.putInt("type", paramInt);
    localBundle.putString("tag_name", paramString);
    return executeServiceAction(45, localBundle);
  }

  public void failRequest(String paramString, int paramInt, Bundle paramBundle)
  {
    paramBundle.putString("rid", paramString);
    notifyListeners(paramString, paramInt, 455, null, paramBundle);
  }

  public String fetchActivity(Session paramSession, int paramInt, boolean paramBoolean1, boolean paramBoolean2)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putInt("page_type", paramInt);
    localBundle.putBoolean("follow_reqs", paramBoolean1);
    localBundle.putBoolean("clear", paramBoolean2);
    return executeServiceAction(20, localBundle);
  }

  public String fetchAddressFriends(Session paramSession)
  {
    return executeServiceAction(16, createServiceBundle(paramSession));
  }

  public String fetchChannels(int paramInt)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putInt("page_type", paramInt);
    return executeServiceAction(53, localBundle);
  }

  public String fetchComments(long paramLong, int paramInt1, int paramInt2)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("post_id", paramLong);
    localBundle.putInt("page_type", paramInt1);
    localBundle.putInt("size", paramInt2);
    return executeServiceAction(12, localBundle);
  }

  public String fetchFollowers(long paramLong, int paramInt)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("profile_id", paramLong);
    localBundle.putInt("page_type", paramInt);
    return executeServiceAction(22, localBundle);
  }

  public String fetchFollowing(long paramLong, int paramInt)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("profile_id", paramLong);
    localBundle.putInt("page_type", paramInt);
    return executeServiceAction(23, localBundle);
  }

  public String fetchFriends(long paramLong)
  {
    fetchFollowers(paramLong, 1);
    return fetchFollowing(paramLong, 1);
  }

  public String fetchPendingNotificationCount(Session paramSession)
  {
    return executeServiceAction(65, createServiceBundle(paramSession));
  }

  public String fetchPost(Session paramSession, long paramLong)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong);
    return executeServiceAction(28, localBundle);
  }

  public String fetchPostId(Session paramSession, String paramString)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putString("post_share_id", paramString);
    return executeServiceAction(36, localBundle);
  }

  public String fetchPostLikers(Session paramSession, long paramLong, int paramInt)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong);
    localBundle.putInt("page_type", paramInt);
    return executeServiceAction(11, localBundle);
  }

  public String fetchPosts(Session paramSession, int paramInt1, long paramLong, int paramInt2, int paramInt3, boolean paramBoolean, String paramString1, String paramString2, Uri paramUri)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putInt("size", paramInt1);
    localBundle.putInt("type", paramInt2);
    localBundle.putInt("page_type", paramInt3);
    localBundle.putLong("profile_id", paramLong);
    localBundle.putBoolean("user_init", paramBoolean);
    if (paramString1 != null)
      localBundle.putString("tag_name", paramString1);
    if (paramString2 != null)
      localBundle.putString("sort", paramString2);
    localBundle.putParcelable("data", paramUri);
    return executeServiceAction(13, localBundle);
  }

  public String fetchReviners(Session paramSession, long paramLong, int paramInt)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong);
    localBundle.putInt("page_type", paramInt);
    return executeServiceAction(56, localBundle);
  }

  public String fetchServerStatus()
  {
    return executeServiceAction(38, createServiceBundle());
  }

  public String fetchTagTypeahead(String paramString)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("q", paramString);
    return executeServiceAction(40, localBundle);
  }

  public String fetchTwitterFriends(Session paramSession, String paramString1, String paramString2)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putString("key", paramString1);
    localBundle.putString("secret", paramString2);
    return executeServiceAction(15, localBundle);
  }

  public String fetchTwitterUser(VineLogin paramVineLogin)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putParcelable("login", paramVineLogin);
    return executeServiceAction(7, localBundle);
  }

  public String fetchUser(long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("user_id", paramLong);
    return executeServiceAction(21, localBundle);
  }

  public String fetchUserId(ArrayList<String> paramArrayList)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putStringArrayList("vanity_url", paramArrayList);
    return executeServiceAction(75, localBundle);
  }

  public String fetchUserTypeahead(String paramString)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("q", paramString);
    return executeServiceAction(39, localBundle);
  }

  public String fetchUsersMe(long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("s_owner_id", paramLong);
    return executeServiceAction(10, localBundle);
  }

  public void followEditorsPicks(boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle(getActiveSession());
    if (paramBoolean);
    for (int i = 1; ; i = 0)
    {
      localBundle.putInt("should_follow_editors_picks", i);
      executeServiceAction(44, localBundle);
      return;
    }
  }

  public String followUser(Session paramSession, long paramLong, boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("follow_id", paramLong);
    localBundle.putBoolean("notify", paramBoolean);
    return executeServiceAction(18, localBundle);
  }

  public String generateReqIdForCanceledCaptcha()
  {
    return this.mServiceConnection.generateRequestId();
  }

  public long getActiveId()
  {
    return getActiveSession().getUserId();
  }

  public Session getActiveSession()
  {
    return getActiveSession(false);
  }

  public Session getActiveSessionReadOnly()
  {
    return getActiveSession(true);
  }

  public String getBlockedUsers()
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("user_id", getActiveId());
    return executeServiceAction(46, localBundle);
  }

  public void getEditions()
  {
    executeServiceAction(70, createServiceBundle());
  }

  public Session.LoginStatus getLoginStatus()
  {
    return getActiveSession().getLoginStatus();
  }

  public String getPendingFacebookToken()
  {
    return Util.getDefaultSharedPrefs(this.mContext).getString("KEY_FACEBOOK_TOKEN", null);
  }

  public Bitmap getPhotoBitmap(ImageKey paramImageKey)
  {
    return this.mPhotoImagesCache.getBitmap(getActiveId(), paramImageKey);
  }

  public Session getSession(String paramString)
  {
    return VineAccountHelper.getSession(this.mContext, paramString);
  }

  public Twitter getTwitter()
  {
    return this.mTwitter;
  }

  public String getTwitterAuth(String paramString1, String paramString2, String paramString3)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("uri", paramString1);
    localBundle.putString("key", paramString2);
    localBundle.putString("secret", paramString3);
    return executeServiceAction(5, localBundle);
  }

  public int getTypeaheadFetchThreshold(String paramString)
  {
    if ("tag".equals(paramString))
      return 3;
    return 2;
  }

  public int getTypeaheadMaxCompose()
  {
    return 50;
  }

  public long getTypeaheadThrottle()
  {
    return 300L;
  }

  public com.facebook.Session getValidFacebookSession(Activity paramActivity, boolean paramBoolean)
  {
    com.facebook.Session localSession = com.facebook.Session.getActiveSession();
    int i;
    if (localSession != null)
    {
      i = 1;
      if (i == 0)
        localSession = com.facebook.Session.openActiveSession(paramActivity, false, this);
      if ((localSession != null) && (!localSession.getState().isClosed()))
        break label53;
      SLog.d("There were no Facebook session.");
      localSession = null;
    }
    label53: 
    do
    {
      return localSession;
      i = 0;
      break;
      com.facebook.Session.setActiveSession(localSession);
      SessionState localSessionState = localSession.getState();
      SLog.d("Old Facebook Session state : {}", localSessionState);
      if ((localSessionState != SessionState.CREATED_TOKEN_LOADED) && (!localSessionState.isOpened()))
        break label140;
      SLog.d("State is created or opened.");
      if (!localSession.getPermissions().contains("publish_actions"))
        break label128;
      SLog.d("Permission is good.");
    }
    while ((i != 0) || (!paramBoolean));
    localSession.close();
    return localSession;
    label128: localSession.closeAndClearTokenInformation();
    SLog.d("Permission missing.");
    return null;
    label140: localSession.close();
    SLog.d("Session state is invalid.");
    return null;
  }

  public String getVideoFilePath(VideoKey paramVideoKey)
  {
    return this.mVideoCache.getFile(getActiveId(), paramVideoKey, false);
  }

  void handleServiceResponse(int paramInt1, int paramInt2, String paramString, Bundle paramBundle)
  {
    String str1 = paramBundle.getString("rid");
    PendingAction localPendingAction = this.mServiceConnection.remove(str1);
    if (paramBundle.getBoolean("logged_out"))
      onLogout();
    while (true)
    {
      return;
      if (paramBundle.getBoolean("refresh_session", false))
        refreshSessionKey(paramBundle.getString("s_key"));
      String str2 = paramBundle.getString("captcha_url");
      paramBundle.remove("captcha_url");
      if (str2 == null)
        break;
      Iterator localIterator = this.mListeners.iterator();
      while (localIterator.hasNext())
        ((AppSessionListener)localIterator.next()).onCaptchaRequired(str1, str2, localPendingAction);
    }
    notifyListeners(str1, paramInt1, paramInt2, paramString, paramBundle);
  }

  public boolean isConnectedToFacebook(Activity paramActivity)
  {
    return getValidFacebookSession(paramActivity, true) != null;
  }

  public boolean isLoggedIn()
  {
    return VineAccountHelper.isLoggedIn(this.mContext, false);
  }

  public boolean isLoggedInReadOnly()
  {
    return VineAccountHelper.isLoggedIn(this.mContext, true);
  }

  public boolean isPendingRequest(String paramString)
  {
    return this.mServiceConnection.isPending(paramString);
  }

  public String likePost(String paramString1, Session paramSession, long paramLong1, long paramLong2, String paramString2, boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong1);
    localBundle.putLong("user_id", paramLong2);
    localBundle.putString("username", paramString2);
    localBundle.putBoolean("notify", paramBoolean);
    FlurryUtils.trackLikePost(paramLong1, paramString1);
    return executeServiceAction(24, localBundle);
  }

  public String login(Session paramSession, VineLogin paramVineLogin, String paramString, boolean paramBoolean)
  {
    paramSession.setLoginStatus(Session.LoginStatus.LOGGING_IN);
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putParcelable("login", paramVineLogin);
    localBundle.putString("pass", paramString);
    localBundle.putBoolean("reactivate", paramBoolean);
    return executeServiceAction(2, localBundle);
  }

  public String loginCheckTwitter(String paramString1, String paramString2, String paramString3, long paramLong, boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("username", paramString1);
    localBundle.putString("key", paramString2);
    localBundle.putString("secret", paramString3);
    localBundle.putLong("t_id", paramLong);
    localBundle.putBoolean("reactivate", paramBoolean);
    return executeServiceAction(6, localBundle);
  }

  public VineLogin loginComplete(Session paramSession, int paramInt, Bundle paramBundle)
  {
    if ((VineLogin)paramBundle.getParcelable("login") != null)
      return loginComplete(paramSession, paramInt, paramBundle.getString("a_name"), paramBundle.getString("pass"), (VineLogin)paramBundle.getParcelable("login"), paramBundle.getString("avatar_url"));
    return null;
  }

  public VineLogin loginComplete(Session paramSession, int paramInt, String paramString1, String paramString2, VineLogin paramVineLogin, String paramString3)
  {
    if (paramInt == 200)
    {
      paramSession.setLoginStatus(Session.LoginStatus.LOGGED_IN);
      switch (paramVineLogin.loginType)
      {
      default:
        throw new UnsupportedOperationException("Unsupported login type.");
      case 2:
      case 1:
      }
      for (String str = paramString1; ; str = paramVineLogin.username)
      {
        paramSession.setUserId(paramVineLogin.userId);
        paramSession.setName(paramString1);
        paramSession.setSessionKey(paramVineLogin.key);
        paramSession.setLoginEmail(str);
        paramSession.setAvatarUrl(paramString3);
        VineAccountHelper.createAccount(this.mContext, str, paramVineLogin, paramString2, paramString3, paramString1);
        SettingsManager.setCurrentAccount(this.mContext, str, paramString1, paramVineLogin.userId);
        if (Util.getDefaultSharedPrefs(this.mContext).getLong("last_user_id", 0L) != paramVineLogin.userId)
        {
          clearFacebookToken();
          Intent localIntent = AppImpl.getInstance().getDiscardAllIntent(this.mContext);
          if (localIntent != null)
            this.mContext.startService(localIntent);
        }
        if (paramVineLogin.edition != null)
          Util.getDefaultSharedPrefs(this.mContext).edit().putString("settings_edition", paramVineLogin.edition).commit();
        fetchFriends(paramVineLogin.userId);
        return paramVineLogin;
      }
    }
    return null;
  }

  public String loginWithxAuth(String paramString1, String paramString2)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("username", paramString1);
    localBundle.putString("pass", paramString2);
    return executeServiceAction(8, localBundle);
  }

  public String logout(Session paramSession)
  {
    if ((paramSession.getLoginStatus() == Session.LoginStatus.LOGGED_IN) || (paramSession.getLoginStatus() == Session.LoginStatus.LOGGING_IN))
    {
      paramSession.setLoginStatus(Session.LoginStatus.LOGGING_OUT);
      return executeServiceAction(3, createServiceBundle(paramSession));
    }
    return null;
  }

  public void mergeSinglePost(Bundle paramBundle)
  {
    if (isLoggedInReadOnly())
      executeServiceAction(57, injectServiceBundle(paramBundle, getActiveSession()));
  }

  void notifyListeners(String paramString1, int paramInt1, int paramInt2, String paramString2, Bundle paramBundle)
  {
    switch (paramInt1)
    {
    case 30:
    case 34:
    case 35:
    case 43:
    case 56:
    case 57:
    case 59:
    case 62:
    case 64:
    case 66:
    case 72:
    case 73:
    case 74:
    default:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 11:
    case 22:
    case 23:
    case 13:
    case 12:
    case 14:
    case 27:
    case 31:
    case 10:
    case 15:
    case 16:
    case 18:
    case 19:
    case 44:
    case 20:
    case 17:
    case 21:
    case 26:
    case 71:
    case 29:
    case 32:
    case 33:
    case 24:
    case 25:
    case 54:
    case 55:
    case 36:
    case 75:
    case 28:
    case 37:
    case 60:
    case 61:
    case 38:
    case 41:
    case 39:
    case 40:
    case 42:
    case 45:
    case 67:
    case 46:
    case 47:
    case 48:
    case 49:
    case 68:
    case 69:
    case 50:
    case 51:
    case 52:
    case 53:
    case 63:
    case 65:
    case 58:
    case 70:
    }
    while (true)
    {
      return;
      VineLogin localVineLogin3 = loginComplete(VineAccountHelper.getCachedActiveSession(), paramInt2, paramBundle);
      int i23 = paramBundle.getInt("error_code", -1);
      Intent localIntent3 = new Intent("co.vine.android.session.login");
      this.mContext.sendBroadcast(localIntent3);
      Iterator localIterator54 = this.mListeners.iterator();
      while (localIterator54.hasNext())
        ((AppSessionListener)localIterator54.next()).onLoginComplete(VineAccountHelper.getCachedActiveSession(), paramString1, paramInt2, paramString2, i23, localVineLogin3);
      continue;
      onLogout();
      return;
      VineLogin localVineLogin2 = (VineLogin)paramBundle.getParcelable("login");
      String str11 = paramBundle.getString("pass");
      String str12 = paramBundle.getString("a_name");
      String str13 = paramBundle.getString("avatar_url");
      Iterator localIterator53 = this.mListeners.iterator();
      while (localIterator53.hasNext())
        ((AppSessionListener)localIterator53.next()).onSignUpComplete(paramString1, paramInt2, paramString2, localVineLogin2, str12, str11, str13);
      Intent localIntent2 = new Intent("co.vine.android.session.login");
      this.mContext.sendBroadcast(localIntent2);
      return;
      Iterator localIterator52 = this.mListeners.iterator();
      while (localIterator52.hasNext())
        ((AppSessionListener)localIterator52.next()).onGetTwitterAuthUrlComplete(paramString1, paramBundle.getString("load_url"));
      continue;
      Iterator localIterator51 = this.mListeners.iterator();
      while (localIterator51.hasNext())
        ((AppSessionListener)localIterator51.next()).onCheckTwitterComplete(paramString1, paramInt2, paramString2, paramBundle.getInt("error_code", -1), paramBundle.getBoolean("a_exists"), (VineUser)paramBundle.getParcelable("user"), (VineLogin)paramBundle.getParcelable("login"));
      Intent localIntent1 = new Intent("co.vine.android.session.login");
      this.mContext.sendBroadcast(localIntent1);
      return;
      Iterator localIterator50 = this.mListeners.iterator();
      while (localIterator50.hasNext())
        ((AppSessionListener)localIterator50.next()).onGetTwitterUserComplete(paramString1, paramInt2, paramString2, (TwitterUser)paramBundle.getParcelable("t_user"), (VineLogin)paramBundle.getParcelable("login"));
      continue;
      VineLogin localVineLogin1 = (VineLogin)paramBundle.getParcelable("login");
      Iterator localIterator49 = this.mListeners.iterator();
      while (localIterator49.hasNext())
        ((AppSessionListener)localIterator49.next()).onTwitterxAuthComplete(paramString1, paramInt2, paramString2, localVineLogin1);
      continue;
      Iterator localIterator48 = this.mListeners.iterator();
      while (localIterator48.hasNext())
        ((AppSessionListener)localIterator48.next()).onResetPasswordComplete(paramString1, paramInt2, paramString2);
      continue;
      int i20 = paramBundle.getInt("count", 0);
      int i21 = paramBundle.getInt("next_page", 0);
      int i22 = paramBundle.getInt("previous_page", 0);
      Iterator localIterator47 = this.mListeners.iterator();
      while (localIterator47.hasNext())
        ((AppSessionListener)localIterator47.next()).onGetUsersComplete(VineAccountHelper.getCachedActiveSession(), paramString1, paramInt2, paramString2, i20, null, i21, i22);
      continue;
      int i14 = paramBundle.getInt("type", -1);
      int i15 = paramBundle.getInt("count", 0);
      int i16 = paramBundle.getInt("size", 0);
      String str9 = paramBundle.getString("tag_name");
      int i17 = paramBundle.getInt("page_type");
      int i18 = paramBundle.getInt("next_page");
      int i19 = paramBundle.getInt("previous_page");
      long l15 = paramBundle.getLong("time");
      String str10 = paramBundle.getString("title");
      boolean bool12 = paramBundle.getBoolean("user_init");
      boolean bool13 = paramBundle.getBoolean("in_memory", false);
      if (bool13);
      for (ArrayList localArrayList4 = paramBundle.getParcelableArrayList("posts"); ; localArrayList4 = null)
      {
        Iterator localIterator46 = this.mListeners.iterator();
        while (localIterator46.hasNext())
          ((AppSessionListener)localIterator46.next()).onGetTimeLineComplete(paramString1, paramInt2, paramString2, i14, i15, bool13, localArrayList4, str9, i17, i18, i19, l15, bool12, i16, str10);
      }
      if (paramInt2 == 200)
      {
        determineCleanup(getActiveSession());
        return;
        Iterator localIterator45 = this.mListeners.iterator();
        while (localIterator45.hasNext())
          ((AppSessionListener)localIterator45.next()).onGetCommentsComplete(paramString1, paramInt2, paramString2, paramBundle.getLong("post_id"), paramBundle.getInt("resp_code"));
        continue;
        long l14 = paramBundle.getLong("post_id");
        String str8 = paramBundle.getString("comment");
        Iterator localIterator44 = this.mListeners.iterator();
        while (localIterator44.hasNext())
          ((AppSessionListener)localIterator44.next()).onPostCommentComplete(paramString1, paramInt2, paramString2, l14, str8);
        continue;
        long l13 = paramBundle.getLong("post_id");
        Iterator localIterator43 = this.mListeners.iterator();
        while (localIterator43.hasNext())
          ((AppSessionListener)localIterator43.next()).onReportPostComplete(paramString1, paramInt2, paramString2, l13);
        continue;
        SharedPreferences localSharedPreferences5 = Util.getDefaultSharedPrefs(this.mContext);
        SharedPreferences.Editor localEditor8 = localSharedPreferences5.edit();
        int i12 = localSharedPreferences5.getInt("profile_post_count", 0);
        if (i12 > 0);
        for (int i13 = i12 - 1; ; i13 = 0)
        {
          localEditor8.putInt("profile_post_count", i13);
          localEditor8.commit();
          Iterator localIterator42 = this.mListeners.iterator();
          while (localIterator42.hasNext())
            ((AppSessionListener)localIterator42.next()).onDeletePostComplete(paramString1, paramInt2, paramString2);
          break;
        }
        VineUser localVineUser2 = (VineUser)paramBundle.getParcelable("user");
        long l12 = paramBundle.getLong("s_owner_id");
        SharedPreferences.Editor localEditor7;
        boolean bool10;
        if (localVineUser2 != null)
        {
          localEditor7 = Util.getDefaultSharedPrefs(this.mContext).edit();
          localEditor7.putString("settings_profile_name", localVineUser2.username);
          localEditor7.putString("settings_profile_description", localVineUser2.description);
          localEditor7.putString("settings_profile_location", localVineUser2.location);
          localEditor7.putString("settings_profile_phone", localVineUser2.phoneNumber);
          localEditor7.putString("settings_profile_email", localVineUser2.email);
          localEditor7.putString("settings_profile_avatar_url", localVineUser2.avatarUrl);
          localEditor7.putInt("profile_follow_count", localVineUser2.followingCount);
          localEditor7.putInt("profile_follower_count", localVineUser2.followerCount);
          localEditor7.putInt("profile_authored_post_count", localVineUser2.authoredPostCount);
          localEditor7.putInt("profile_post_count", localVineUser2.postCount);
          localEditor7.putInt("profile_like_count", localVineUser2.likeCount);
          if (localVineUser2.twitterConnected != 1)
            break label1749;
          bool10 = true;
          label1621: localEditor7.putBoolean("settings_twitter_connected", bool10);
          if (localVineUser2.includePromoted != 1)
            break label1755;
        }
        label1749: label1755: for (boolean bool11 = true; ; bool11 = false)
        {
          localEditor7.putBoolean("settings_follow_editors_picks", bool11);
          localEditor7.putBoolean("settings_private", localVineUser2.isPrivate());
          if (localVineUser2.edition != null)
            localEditor7.putString("settings_edition", localVineUser2.edition);
          localEditor7.apply();
          Iterator localIterator41 = this.mListeners.iterator();
          while (localIterator41.hasNext())
            ((AppSessionListener)localIterator41.next()).onGetUsersMeComplete(paramString1, paramInt2, paramString2, l12, localVineUser2);
          break;
          bool10 = false;
          break label1621;
        }
        int i11 = paramBundle.getInt("count", 0);
        Iterator localIterator40 = this.mListeners.iterator();
        while (localIterator40.hasNext())
          ((AppSessionListener)localIterator40.next()).onGetTwitterFriendsComplete(paramString1, paramInt2, paramString2, i11);
        continue;
        int i10 = paramBundle.getInt("count", 0);
        Iterator localIterator39 = this.mListeners.iterator();
        while (localIterator39.hasNext())
          ((AppSessionListener)localIterator39.next()).onGetAddressFriendsComplete(paramString1, paramInt2, paramString2, i10);
        continue;
        long l11 = paramBundle.getLong("follow_id");
        fetchPosts(getActiveSession(), 10, l11, 1, 1, false, String.valueOf(getActiveId()), null, null);
        SharedPreferences localSharedPreferences4 = Util.getDefaultSharedPrefs(this.mContext);
        SharedPreferences.Editor localEditor6 = localSharedPreferences4.edit();
        localEditor6.putInt("profile_follow_count", 1 + localSharedPreferences4.getInt("profile_follow_count", 0));
        localEditor6.commit();
        Iterator localIterator38 = this.mListeners.iterator();
        while (localIterator38.hasNext())
          ((AppSessionListener)localIterator38.next()).onFollowComplete(paramString1, paramInt2, paramString2, l11);
        continue;
        long l10 = paramBundle.getLong("follow_id");
        removeFollowPosts(getActiveSession(), l10);
        SharedPreferences localSharedPreferences3 = Util.getDefaultSharedPrefs(this.mContext);
        SharedPreferences.Editor localEditor5 = localSharedPreferences3.edit();
        int i8 = localSharedPreferences3.getInt("profile_follow_count", 0);
        if (i8 > 0);
        for (int i9 = i8 - 1; ; i9 = 0)
        {
          localEditor5.putInt("profile_follow_count", i9);
          localEditor5.commit();
          Iterator localIterator37 = this.mListeners.iterator();
          while (localIterator37.hasNext())
            ((AppSessionListener)localIterator37.next()).onUnFollowComplete(paramString1, paramInt2, paramString2, l10);
          break;
        }
        boolean bool9 = paramBundle.getBoolean("should_follow_editors_picks");
        if (!bool9)
          expireTimeline(true, 1, String.valueOf(VineAccountHelper.getCachedActiveSession().getUserId()));
        while (true)
        {
          Iterator localIterator36 = this.mListeners.iterator();
          while (localIterator36.hasNext())
            ((AppSessionListener)localIterator36.next()).onUpdateFollowEditorsPicksComplete(paramString1, paramInt2, paramString2, bool9);
          break;
          fetchPosts(getActiveSession(), 10, 0L, 1, 1, true, String.valueOf(getActiveId()), null, null);
        }
        int i6 = paramBundle.getInt("count");
        int i7 = paramBundle.getInt("follow_reqs_c", 0);
        Iterator localIterator35 = this.mListeners.iterator();
        while (localIterator35.hasNext())
          ((AppSessionListener)localIterator35.next()).onGetActivityComplete(paramString1, paramInt2, paramString2, i6, i7);
        continue;
        Iterator localIterator34 = this.mListeners.iterator();
        while (localIterator34.hasNext())
          ((AppSessionListener)localIterator34.next()).onRemoveUsersComplete(paramString1);
        continue;
        VineUser localVineUser1 = (VineUser)paramBundle.getParcelable("user");
        Iterator localIterator33 = this.mListeners.iterator();
        while (localIterator33.hasNext())
          ((AppSessionListener)localIterator33.next()).onGetUserComplete(paramString1, paramInt2, paramString2, localVineUser1);
        continue;
        String str7 = paramBundle.getString("avatar_url");
        Iterator localIterator32 = this.mListeners.iterator();
        while (localIterator32.hasNext())
          ((AppSessionListener)localIterator32.next()).onUpdateProfileComplete(paramString1, paramInt2, paramString2, str7);
        continue;
        SLog.d("Edition update success. New edition is {}", paramBundle.getString("edition"));
        Iterator localIterator31 = this.mListeners.iterator();
        while (localIterator31.hasNext())
          ((AppSessionListener)localIterator31.next()).onUpdateEditionComplete(paramString1, paramInt2, paramString2);
        continue;
        SharedPreferences.Editor localEditor4 = Util.getSharedPrefs(this.mContext, "last_cleanup").edit();
        localEditor4.putLong("last_cleanup", System.currentTimeMillis());
        localEditor4.commit();
        return;
        String str4 = paramBundle.getString("username");
        String str5 = paramBundle.getString("key");
        String str6 = paramBundle.getString("secret");
        long l9 = paramBundle.getLong("user_id");
        Iterator localIterator30 = this.mListeners.iterator();
        while (localIterator30.hasNext())
          ((AppSessionListener)localIterator30.next()).onConnectTwitterComplete(paramString1, paramInt2, paramString2, str4, str5, str6, l9);
        continue;
        Iterator localIterator29 = this.mListeners.iterator();
        while (localIterator29.hasNext())
          ((AppSessionListener)localIterator29.next()).onDisconnectTwitterComplete(paramString1, paramInt2, paramString2);
        continue;
        long l8 = paramBundle.getLong("post_id");
        if (paramInt2 == 200)
        {
          SharedPreferences localSharedPreferences2 = Util.getDefaultSharedPrefs(this.mContext);
          SharedPreferences.Editor localEditor3 = localSharedPreferences2.edit();
          localEditor3.putInt("profile_like_count", 1 + localSharedPreferences2.getInt("profile_like_count", 0));
          localEditor3.commit();
        }
        Iterator localIterator28 = this.mListeners.iterator();
        while (localIterator28.hasNext())
          ((AppSessionListener)localIterator28.next()).onLikePost(paramString1, paramInt2, paramString2, l8);
        continue;
        long l7 = paramBundle.getLong("post_id");
        SharedPreferences.Editor localEditor2;
        int i4;
        if (paramInt2 == 200)
        {
          SharedPreferences localSharedPreferences1 = Util.getDefaultSharedPrefs(this.mContext);
          localEditor2 = localSharedPreferences1.edit();
          i4 = localSharedPreferences1.getInt("profile_like_count", 0);
          if (i4 <= 0)
            break label2874;
        }
        label2874: for (int i5 = i4 - 1; ; i5 = 0)
        {
          localEditor2.putInt("profile_like_count", i5);
          localEditor2.commit();
          Iterator localIterator27 = this.mListeners.iterator();
          while (localIterator27.hasNext())
            ((AppSessionListener)localIterator27.next()).onUnlikePost(paramString1, paramInt2, paramString2, l7);
          break;
        }
        long l6 = paramBundle.getLong("post_id");
        VineRepost localVineRepost = (VineRepost)paramBundle.getSerializable("repost");
        Iterator localIterator26 = this.mListeners.iterator();
        while (localIterator26.hasNext())
          ((AppSessionListener)localIterator26.next()).onRevine(paramString1, paramInt2, paramString2, l6, localVineRepost);
        continue;
        long l5 = paramBundle.getLong("post_id");
        Iterator localIterator25 = this.mListeners.iterator();
        while (localIterator25.hasNext())
          ((AppSessionListener)localIterator25.next()).onUnrevine(paramString1, paramInt2, paramString2, l5);
        continue;
        long l4 = paramBundle.getLong("post_id");
        Iterator localIterator24 = this.mListeners.iterator();
        while (localIterator24.hasNext())
          ((AppSessionListener)localIterator24.next()).onGetPostIdComplete(paramString1, paramInt2, paramString2, l4);
        continue;
        long l3 = paramBundle.getLong("user_id");
        Iterator localIterator23 = this.mListeners.iterator();
        while (localIterator23.hasNext())
          ((AppSessionListener)localIterator23.next()).onGetUserIdComplete(paramString1, paramInt2, paramString2, l3);
        continue;
        Iterator localIterator22 = this.mListeners.iterator();
        while (localIterator22.hasNext())
          ((AppSessionListener)localIterator22.next()).onGetSinglePostComplete(paramString1, paramInt2, paramString2);
        continue;
        Iterator localIterator21 = this.mListeners.iterator();
        while (localIterator21.hasNext())
          ((AppSessionListener)localIterator21.next()).onConnectFacebookComplete(paramString1, paramInt2, paramString2);
        continue;
        long l2 = paramBundle.getLong("user_id");
        Iterator localIterator20 = this.mListeners.iterator();
        while (localIterator20.hasNext())
          ((AppSessionListener)localIterator20.next()).onGcmRegistrationComplete(paramString1, paramInt2, paramString2, l2);
        continue;
        deleteSession(paramBundle.getString("s_key"));
        return;
        ServerStatus localServerStatus = (ServerStatus)paramBundle.getParcelable("server_status");
        if ((paramInt2 == 200) && (localServerStatus != null) && (!TextUtils.isEmpty(localServerStatus.uploadType)))
        {
          SharedPreferences.Editor localEditor1 = Util.getDefaultSharedPrefs(this.mContext).edit();
          localEditor1.putString("server_upload_type", localServerStatus.uploadType);
          localEditor1.commit();
          return;
          int i1 = paramBundle.getInt("count", 0);
          int i2 = paramBundle.getInt("next_page", 0);
          int i3 = paramBundle.getInt("previous_page", 0);
          Iterator localIterator19 = this.mListeners.iterator();
          while (localIterator19.hasNext())
            ((AppSessionListener)localIterator19.next()).onUserSearchComplete(paramString1, paramInt2, paramString2, i1, i2, i3);
          continue;
          String str3 = paramBundle.getString("q");
          ArrayList localArrayList3 = paramBundle.getParcelableArrayList("users");
          Iterator localIterator18 = this.mListeners.iterator();
          while (localIterator18.hasNext())
            ((AppSessionListener)localIterator18.next()).onGetUserTypeAheadComplete(paramString1, paramInt2, paramString2, str3, localArrayList3);
          continue;
          String str2 = paramBundle.getString("q");
          ArrayList localArrayList2 = paramBundle.getParcelableArrayList("tags");
          Iterator localIterator17 = this.mListeners.iterator();
          while (localIterator17.hasNext())
            ((AppSessionListener)localIterator17.next()).onGetTagTypeAheadComplete(paramString1, paramInt2, paramString2, str2, localArrayList2);
          continue;
          int k = paramBundle.getInt("count", 0);
          int m = paramBundle.getInt("next_page", 0);
          int n = paramBundle.getInt("previous_page", 0);
          Iterator localIterator16 = this.mListeners.iterator();
          while (localIterator16.hasNext())
            ((AppSessionListener)localIterator16.next()).onTagSearchComplete(paramString1, paramInt2, paramString2, k, m, n);
          continue;
          int j = paramBundle.getInt("type");
          String str1 = paramBundle.getString("tag_name");
          if (paramBundle.getBoolean("also_fetch_posts", false))
          {
            fetchPosts(getActiveSession(), 10, getActiveId(), j, 1, true, str1, null, null);
            return;
            boolean bool8 = paramBundle.getBoolean("response_success", false);
            Iterator localIterator15 = this.mListeners.iterator();
            while (localIterator15.hasNext())
              ((AppSessionListener)localIterator15.next()).onDeactivateAccountComplete(paramString1, paramInt2, paramString2, bool8);
            continue;
            ArrayList localArrayList1 = paramBundle.getParcelableArrayList("blocked_users");
            Iterator localIterator14 = this.mListeners.iterator();
            while (localIterator14.hasNext())
              ((AppSessionListener)localIterator14.next()).onGetBlockedUsersComplete(paramString1, paramInt2, paramString2, localArrayList1);
            continue;
            boolean bool7 = paramBundle.getBoolean("response_success", false);
            Iterator localIterator13 = this.mListeners.iterator();
            while (localIterator13.hasNext())
              ((AppSessionListener)localIterator13.next()).onBlockUserComplete(paramString1, paramInt2, paramString2, bool7);
            continue;
            boolean bool6 = paramBundle.getBoolean("response_success", false);
            Iterator localIterator12 = this.mListeners.iterator();
            while (localIterator12.hasNext())
              ((AppSessionListener)localIterator12.next()).onUnblockUserComplete(paramString1, paramInt2, paramString2, bool6);
            continue;
            Iterator localIterator11 = this.mListeners.iterator();
            while (localIterator11.hasNext())
              ((AppSessionListener)localIterator11.next()).onReportUserComplete(paramString1, paramInt2, paramString2);
            continue;
            boolean bool5 = paramBundle.getBoolean("response_success", false);
            Iterator localIterator10 = this.mListeners.iterator();
            while (localIterator10.hasNext())
              ((AppSessionListener)localIterator10.next()).onEnableUserRepostsComplete(paramString1, paramInt2, paramString2, bool5);
            continue;
            boolean bool4 = paramBundle.getBoolean("response_success", false);
            Iterator localIterator9 = this.mListeners.iterator();
            while (localIterator9.hasNext())
              ((AppSessionListener)localIterator9.next()).onDisableUserRepostsComplete(paramString1, paramInt2, paramString2, bool4);
            continue;
            long l1 = paramBundle.getLong("user_id");
            boolean bool3 = paramBundle.getBoolean("accept");
            Iterator localIterator8 = this.mListeners.iterator();
            while (localIterator8.hasNext())
              ((AppSessionListener)localIterator8.next()).onRespondFollowRequestComplete(paramString1, paramInt2, paramString2, bool3, l1);
            continue;
            boolean bool2 = paramBundle.getBoolean("explicit");
            Iterator localIterator7 = this.mListeners.iterator();
            while (localIterator7.hasNext())
              ((AppSessionListener)localIterator7.next()).onUpdateExplicitComplete(paramString1, paramInt2, paramString2, bool2);
            continue;
            boolean bool1 = paramBundle.getBoolean("priv");
            Iterator localIterator6 = this.mListeners.iterator();
            while (localIterator6.hasNext())
              ((AppSessionListener)localIterator6.next()).onUpdatePrivateComplete(paramString1, paramInt2, paramString2, bool1);
            Iterator localIterator5 = this.mListeners.iterator();
            while (localIterator5.hasNext())
              ((AppSessionListener)localIterator5.next()).onGetChannelsComplete(paramString1, paramInt2, paramString2);
            continue;
            Iterator localIterator4 = this.mListeners.iterator();
            while (localIterator4.hasNext())
              ((AppSessionListener)localIterator4.next()).onSharePostComplete(paramString1, paramInt2, paramString2);
            continue;
            int i = paramBundle.getInt("count");
            if (paramInt2 == 200)
              Util.getDefaultSharedPrefs(this.mContext).edit().putInt("unread_notification_count", i).commit();
            Iterator localIterator3 = this.mListeners.iterator();
            while (localIterator3.hasNext())
              ((AppSessionListener)localIterator3.next()).onGetPendingNotificationCountComplete(paramString1, paramInt2, paramString2, i);
            continue;
            clearFileCache();
            Iterator localIterator2 = this.mListeners.iterator();
            while (localIterator2.hasNext())
              ((AppSessionListener)localIterator2.next()).onClearCacheComplete(paramString1, paramInt2, paramString2);
            continue;
            Iterator localIterator1 = this.mListeners.iterator();
            while (localIterator1.hasNext())
              ((AppSessionListener)localIterator1.next()).onGetEditionsComplete(paramInt2, (ArrayList)paramBundle.getSerializable("editions"));
          }
        }
      }
    }
  }

  public void onLowMemory()
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
      ((AppSessionListener)localIterator.next()).onLowMemory();
  }

  public void onPhotoImageError(PhotoImagesCache paramPhotoImagesCache, ImageKey paramImageKey, HttpResult paramHttpResult)
  {
    ArrayList localArrayList = this.mListeners;
    for (int i = -1 + localArrayList.size(); i >= 0; i--)
      ((AppSessionListener)localArrayList.get(i)).onPhotoImageError(paramImageKey, paramHttpResult);
  }

  public void onPhotoImageLoaded(PhotoImagesCache paramPhotoImagesCache, HashMap<ImageKey, UrlImage> paramHashMap)
  {
    SLog.d("Image has loaded.");
    ArrayList localArrayList = this.mListeners;
    for (int i = -1 + localArrayList.size(); i >= 0; i--)
      ((AppSessionListener)localArrayList.get(i)).onPhotoImageLoaded(paramHashMap);
  }

  public void onTrimMemory(int paramInt)
  {
    Iterator localIterator = this.mListeners.iterator();
    while (localIterator.hasNext())
      ((AppSessionListener)localIterator.next()).onTrimMemory(paramInt);
  }

  public void onVideoPathError(VideoCache paramVideoCache, VideoKey paramVideoKey, HttpResult paramHttpResult)
  {
    ArrayList localArrayList = this.mListeners;
    for (int i = -1 + localArrayList.size(); i >= 0; i--)
      ((AppSessionListener)localArrayList.get(i)).onVideoPathError(paramVideoKey, paramHttpResult);
  }

  public void onVideoPathObtained(VideoCache paramVideoCache, HashMap<VideoKey, UrlVideo> paramHashMap)
  {
    ArrayList localArrayList = this.mListeners;
    for (int i = -1 + localArrayList.size(); i >= 0; i--)
      ((AppSessionListener)localArrayList.get(i)).onVideoPathObtained(paramHashMap);
  }

  public String peekVideoFilePath(VideoKey paramVideoKey)
  {
    return this.mVideoCache.getFile(getActiveId(), paramVideoKey, true);
  }

  public String postComment(long paramLong, Session paramSession, String paramString, ArrayList<VineEntity> paramArrayList)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("post_id", paramLong);
    localBundle.putLong("user_id", paramSession.getUserId());
    localBundle.putString("username", paramSession.getName());
    localBundle.putString("comment", Util.cleanse(paramString));
    localBundle.putString("avatar_url", paramSession.getAvatarUrl());
    localBundle.putParcelableArrayList("entities", paramArrayList);
    return executeServiceAction(14, localBundle);
  }

  public void refreshSessionKey(String paramString)
  {
    Session localSession = VineAccountHelper.getCachedActiveSession();
    if (localSession != null)
      localSession.setSessionKey(paramString);
  }

  public String removeFollowPosts(Session paramSession, long paramLong)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("user_id", paramLong);
    return executeServiceAction(34, localBundle);
  }

  public void removeListener(AppSessionListener paramAppSessionListener)
  {
    this.mListeners.remove(paramAppSessionListener);
  }

  public String removeUsers(Session paramSession, int paramInt)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putInt("type", paramInt);
    return executeServiceAction(17, localBundle);
  }

  public String reportPerson(long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("user_id", paramLong);
    return executeServiceAction(49, localBundle);
  }

  public String reportPost(Session paramSession, long paramLong)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong);
    return executeServiceAction(27, localBundle);
  }

  public String resetPassword(String paramString)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("login", paramString);
    return executeServiceAction(9, localBundle);
  }

  public String retryRequest(int paramInt, Bundle paramBundle)
  {
    injectServiceBundle(paramBundle, getActiveSession());
    return executeServiceAction(paramInt, paramBundle);
  }

  public String revine(String paramString1, Session paramSession, long paramLong, String paramString2)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong);
    localBundle.putString("username", paramString2);
    FlurryUtils.trackRevine(paramLong, paramString1);
    return executeServiceAction(54, localBundle);
  }

  public String saveLoadedPosts(ArrayList<VinePost> paramArrayList, int paramInt1, String paramString, int paramInt2, int paramInt3, int paramInt4, long paramLong, boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putParcelableArrayList("posts", paramArrayList);
    localBundle.putInt("type", paramInt1);
    localBundle.putString("tag_name", paramString);
    localBundle.putInt("page_type", paramInt2);
    localBundle.putInt("next_page", paramInt3);
    localBundle.putInt("previous_page", paramInt4);
    localBundle.putLong("time", paramLong);
    localBundle.putBoolean("user_init", paramBoolean);
    return executeServiceAction(43, localBundle);
  }

  public void scheduleLoopCounts()
  {
    if (this.mHandler != null)
    {
      this.mHandler.removeCallbacks(this.mLoopCountRunnable);
      this.mHandler.postDelayed(this.mLoopCountRunnable, 300000L);
    }
  }

  public String searchTags(String paramString, int paramInt)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("q", paramString);
    localBundle.putInt("page_type", paramInt);
    return executeServiceAction(42, localBundle);
  }

  public String searchUsers(String paramString, int paramInt)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("q", paramString);
    localBundle.putInt("page_type", paramInt);
    return executeServiceAction(41, localBundle);
  }

  public String sendFacebookToken()
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("facebook_token", getPendingFacebookToken());
    return executeServiceAction(37, localBundle);
  }

  public String sendGcmRegId(String paramString, long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("gcmRegId", paramString);
    localBundle.putLong("user_id", paramLong);
    return executeServiceAction(60, localBundle);
  }

  public String sendLoopCounts()
  {
    scheduleLoopCounts();
    return executeServiceAction(66, createServiceBundle());
  }

  public String setHideProfileReposts(long paramLong, boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("user_id", paramLong);
    localBundle.putBoolean("block_profile_reposts", paramBoolean);
    return executeServiceAction(73, localBundle);
  }

  public void setSessionKey(String paramString)
  {
    Session localSession = VineAccountHelper.getCachedActiveSession();
    if (localSession != null)
      localSession.setSessionKey(paramString);
  }

  public void sharePost(String paramString1, String paramString2, long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("network", paramString1);
    localBundle.putString("message", paramString2);
    localBundle.putLong("post_id", paramLong);
    executeServiceAction(63, localBundle);
  }

  public String signUp(String paramString1, String paramString2, String paramString3, String paramString4, Uri paramUri, TwitterUser paramTwitterUser, VineLogin paramVineLogin)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putString("login", paramString1);
    localBundle.putString("pass", paramString2);
    localBundle.putString("a_name", paramString3);
    localBundle.putString("phone", paramString4);
    localBundle.putParcelable("uri", paramUri);
    localBundle.putParcelable("t_user", paramTwitterUser);
    if (paramVineLogin != null)
    {
      localBundle.putString("key", paramVineLogin.twitterToken);
      localBundle.putString("secret", paramVineLogin.twitterSecret);
    }
    return executeServiceAction(4, localBundle);
  }

  public String unRevine(String paramString, Session paramSession, long paramLong1, long paramLong2, boolean paramBoolean1, long paramLong3, boolean paramBoolean2)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong1);
    localBundle.putLong("repost_id", paramLong2);
    localBundle.putBoolean("notify", paramBoolean2);
    localBundle.putBoolean("following", paramBoolean1);
    FlurryUtils.trackUnRevine(paramString);
    return executeServiceAction(55, localBundle);
  }

  public String unblockUser(long paramLong)
  {
    Bundle localBundle = createServiceBundle();
    localBundle.putLong("user_id", getActiveId());
    localBundle.putLong("block_user_id", paramLong);
    return executeServiceAction(48, localBundle);
  }

  public String unfollowUser(Session paramSession, long paramLong, boolean paramBoolean)
  {
    return unfollowUser(paramSession, paramLong, paramBoolean, -1L);
  }

  public String unfollowUser(Session paramSession, long paramLong1, boolean paramBoolean, long paramLong2)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("follow_id", paramLong1);
    localBundle.putLong("profile_id", paramLong2);
    localBundle.putLong("user_id", getActiveId());
    localBundle.putBoolean("notify", paramBoolean);
    return executeServiceAction(19, localBundle);
  }

  public String unlikePost(String paramString, Session paramSession, long paramLong, boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putLong("post_id", paramLong);
    localBundle.putBoolean("notify", paramBoolean);
    FlurryUtils.trackUnLikePost(paramString);
    return executeServiceAction(25, localBundle);
  }

  public String updateClientProfile()
  {
    SLog.d("Update Client Profile.");
    return executeServiceAction(35, new Bundle());
  }

  public void updateCredentials(String paramString)
  {
    getActiveSession().setSessionKey(paramString);
  }

  public String updateEdition(Session paramSession, String paramString)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putString("edition", paramString);
    SLog.d("Updating edition code to {}", paramString);
    return executeServiceAction(71, localBundle);
  }

  public String updateExplicit(Session paramSession, boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putBoolean("explicit", paramBoolean);
    return executeServiceAction(51, localBundle);
  }

  public String updatePrivate(Session paramSession, boolean paramBoolean)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putBoolean("priv", paramBoolean);
    return executeServiceAction(52, localBundle);
  }

  public String updateProfile(Session paramSession, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, Uri paramUri)
  {
    Bundle localBundle = createServiceBundle(paramSession);
    localBundle.putString("a_name", paramString1);
    localBundle.putString("desc", Util.cleanse(paramString2));
    localBundle.putString("location", Util.cleanse(paramString3));
    localBundle.putString("email", paramString4);
    localBundle.putString("phone", paramString5);
    if (paramUri != null)
      localBundle.putParcelable("uri", paramUri);
    return executeServiceAction(26, localBundle);
  }

  class LoopCountRunnable
    implements Runnable
  {
    LoopCountRunnable()
    {
    }

    public void run()
    {
      AppController.this.sendLoopCounts();
    }
  }

  class ServerStatusRunnable
    implements Runnable
  {
    ServerStatusRunnable()
    {
    }

    public void run()
    {
      AppController.this.determineServerStatus();
    }
  }

  private static class VineServiceConnection
    implements ServiceConnection
  {
    private final int[] mLock = new int[0];
    private final HashMap<String, PendingAction> mPendingQueue = new HashMap();
    private final HashMap<String, PendingAction> mRequestQueue = new HashMap();
    private VineService mService;

    public void cancelAll()
    {
      synchronized (this.mLock)
      {
        this.mRequestQueue.clear();
        return;
      }
    }

    public String generateRequestId()
    {
      return Util.randomString(6);
    }

    public boolean isPending(String paramString)
    {
      synchronized (this.mLock)
      {
        boolean bool = this.mRequestQueue.containsKey(paramString);
        return bool;
      }
    }

    public void onServiceConnected(ComponentName paramComponentName, IBinder paramIBinder)
    {
      synchronized (this.mLock)
      {
        if (!(paramIBinder instanceof VineService.VineServiceBinder))
          break label101;
        this.mService = ((VineService.VineServiceBinder)paramIBinder).getService();
        this.mRequestQueue.putAll(this.mPendingQueue);
        Iterator localIterator = this.mPendingQueue.values().iterator();
        if (localIterator.hasNext())
        {
          PendingAction localPendingAction = (PendingAction)localIterator.next();
          this.mService.postAction(localPendingAction);
        }
      }
      this.mPendingQueue.clear();
      while (true)
      {
        return;
        label101: SLog.d("on service connected called from another thread: probably called from start service..");
      }
    }

    public void onServiceDisconnected(ComponentName paramComponentName)
    {
      synchronized (this.mLock)
      {
        this.mService = null;
        return;
      }
    }

    public String queueAndExecute(int paramInt, Bundle paramBundle, VineServiceResponder paramVineServiceResponder)
    {
      String str = generateRequestId();
      PendingAction localPendingAction = new PendingAction(paramInt, paramBundle, paramVineServiceResponder);
      paramBundle.putString("rid", str);
      synchronized (this.mLock)
      {
        if (this.mService != null)
        {
          this.mRequestQueue.put(str, localPendingAction);
          this.mService.postAction(localPendingAction);
          return str;
        }
        this.mPendingQueue.put(str, localPendingAction);
      }
    }

    public PendingAction remove(String paramString)
    {
      synchronized (this.mLock)
      {
        PendingAction localPendingAction = (PendingAction)this.mRequestQueue.get(paramString);
        this.mRequestQueue.remove(paramString);
        return localPendingAction;
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.client.AppController
 * JD-Core Version:    0.6.2
 */