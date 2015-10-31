package co.vine.android;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.database.sqlite.SQLiteException;
import android.media.MediaPlayer;
import android.media.MediaPlayer.OnErrorListener;
import android.media.MediaPlayer.OnPreparedListener;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.ActionBar;
import android.text.Spannable;
import android.text.Spanned;
import android.text.method.LinkMovementMethod;
import android.text.style.ForegroundColorSpan;
import android.text.style.StyleSpan;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.TextView;
import co.vine.android.api.VineError.VineKnownErrors;
import co.vine.android.api.VineLogin;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.client.AppSessionListener;
import co.vine.android.client.Session;
import co.vine.android.player.VideoViewInterface;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.FlurryUtils;
import co.vine.android.util.SystemUtil;
import co.vine.android.util.SystemUtil.PrefBooleanState;
import co.vine.android.util.Util;
import co.vine.android.widgets.PromptDialogSupportFragment;
import co.vine.android.widgets.PromptDialogSupportFragment.OnDialogDoneListener;
import com.edisonwang.android.slog.SLog;
import com.twitter.android.sdk.Twitter;

public class StartActivity extends BaseControllerActionBarActivity
  implements View.OnClickListener, PromptDialogSupportFragment.OnDialogDoneListener
{
  public static final String ACTION_NOTIFICATION_PRESSED = "co.vine.android.NOTIFICATION_PRESSED";
  public static final String ACTION_RECORD = "co.vine.android.RECORD";
  public static final String ACTION_VIEW_UPLOAD_LIST = "co.vine.android.UPLOAD_LIST";
  private static final int DIALOG_ACTIVATE_ACCOUNT = 1;
  public static final String EXTRA_LOGIN_REQUEST = "login_request";
  private static final String PREF_LOG_STARTUP_FAIL = "pref_log_startup_fail";
  private static final int REQUEST_CODE_TWITTER_SDK = 1;
  private static final String STATE_AUTH_INTENT = "auth_intent";
  private static final String STATE_STOP_POSITION = "state_p";
  private Intent mAuthIntent;
  private Handler mHandler = new Handler();
  private boolean mLoginRequest;
  private int mStopPosition;
  private Twitter mTwitter;
  private VideoViewInterface mVideoView;

  private static void broadcastFinish(Context paramContext)
  {
    Intent localIntent = new Intent();
    localIntent.setAction("co.vine.android.FINISH");
    paramContext.sendBroadcast(localIntent);
  }

  public static Intent getStartIntent(Context paramContext)
  {
    return getStartIntent(paramContext, "android.intent.action.VIEW");
  }

  public static Intent getStartIntent(Context paramContext, String paramString)
  {
    Intent localIntent = new Intent(paramContext, StartActivity.class);
    localIntent.setAction(paramString);
    localIntent.setFlags(268468224);
    return localIntent;
  }

  private void loginCheckTwitter(Intent paramIntent, boolean paramBoolean)
  {
    if (paramIntent == null)
      return;
    String str1 = paramIntent.getStringExtra("screen_name");
    String str2 = paramIntent.getStringExtra("tk");
    String str3 = paramIntent.getStringExtra("ts");
    ProgressDialog localProgressDialog = new ProgressDialog(this, 2131689512);
    localProgressDialog.setProgressStyle(0);
    localProgressDialog.setMessage(getString(2131624353));
    localProgressDialog.show();
    this.mProgressDialog = localProgressDialog;
    this.mAppController.loginCheckTwitter(str1, str2, str3, paramIntent.getLongExtra("user_id", 0L), paramBoolean);
  }

  private void openStartVideo()
  {
    this.mVideoView.setOnPreparedListener(null);
    this.mVideoView.setOnErrorListener(null);
    this.mVideoView.setVideoPathDirect(SystemUtil.getVideoUrlFromResource(this, 2131099649));
    this.mVideoView.seekTo(this.mStopPosition);
    this.mVideoView.start();
  }

  public static void toStart(Context paramContext)
  {
    paramContext.startActivity(getStartIntent(paramContext));
    if ((BuildUtil.isExplore()) && (!(paramContext instanceof StartActivity)))
      broadcastFinish(paramContext);
  }

  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    if (paramInt1 == 1)
    {
      loginCheckTwitter(paramIntent, false);
      this.mAuthIntent = paramIntent;
    }
  }

  public void onClick(View paramView)
  {
    switch (paramView.getId())
    {
    case 2131362170:
    default:
    case 2131362169:
    case 2131362171:
    case 2131362172:
    }
    while (true)
    {
      return;
      if (this.mLoginRequest)
      {
        startActivity(LoginActivity.getIntentWithFinish(this));
        return;
      }
      startActivity(LoginActivity.getIntent(this));
      return;
      Intent localIntent = new Intent(this, SignUpPagerActivity.class);
      if (this.mLoginRequest)
        localIntent.putExtra("finish", true);
      startActivity(localIntent);
      return;
      try
      {
        if (!this.mTwitter.startAuthActivityForResult(this, 1))
          if (this.mLoginRequest)
          {
            startActivity(LoginTwitterActivity.getIntentWithFinish(this));
            return;
          }
      }
      catch (SecurityException localSecurityException)
      {
        if (this.mLoginRequest)
        {
          startActivity(LoginTwitterActivity.getIntentWithFinish(this));
          return;
          startActivity(LoginTwitterActivity.getIntent(this));
          return;
        }
        startActivity(LoginTwitterActivity.getIntent(this));
      }
    }
  }

  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903143, false);
    if (Build.VERSION.SDK_INT <= 14)
    {
      ActionBar localActionBar = getSupportActionBar();
      if (localActionBar != null)
        localActionBar.hide();
    }
    Intent localIntent1 = getIntent();
    while (true)
    {
      AppController localAppController;
      boolean bool;
      AppImpl localAppImpl;
      try
      {
        setRequestedOrientation(1);
        localAppController = AppController.getInstance(this);
        if (localIntent1 == null)
          break label785;
        str = localIntent1.getAction();
        bool = "co.vine.android.RECORD".equals(str);
        if ((paramBundle != null) && (paramBundle.containsKey("auth_intent")))
        {
          this.mAuthIntent = ((Intent)paramBundle.getParcelable("auth_intent"));
          loginCheckTwitter(this.mAuthIntent, false);
        }
        localAppImpl = AppImpl.getInstance();
        localAppImpl.updateClientProfile(this, localAppController, bool);
        if (localIntent1 != null)
        {
          this.mLoginRequest = localIntent1.getBooleanExtra("login_request", false);
          if (!localAppController.getActiveSession().isLoggedIn())
            break label384;
          if (this.mLoginRequest)
          {
            setResult(-1);
            finish();
          }
        }
        else
        {
          this.mLoginRequest = false;
          continue;
        }
      }
      catch (SQLiteException localSQLiteException)
      {
        SharedPreferences localSharedPreferences = Util.getDefaultSharedPrefs(this);
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(localSharedPreferences.getInt("pref_log_startup_fail", 0));
        CrashUtil.logException(localSQLiteException, "pref_log_startup_fail: {}.", arrayOfObject);
        Util.showCenteredToast(this, 2131624365);
        localSharedPreferences.edit().putInt("pref_log_startup_fail", 1).commit();
        finish();
        return;
      }
      Intent localIntent2;
      if (!bool)
      {
        localIntent2 = new Intent(this, HomeTabActivity.class);
        localIntent2.setFlags(335544320);
        localIntent2.setAction(str);
        if ("android.intent.action.VIEW".equals(str))
          localIntent2.setData(getIntent().getData());
      }
      while (true)
      {
        if (localIntent2 != null)
          startActivity(localIntent2);
        finish();
        return;
        if ("co.vine.android.NOTIFICATION_PRESSED".equals(str))
        {
          this.mAppController.clearPushNotifications();
          localIntent2.setFlags(67108864);
          continue;
          localIntent2 = localAppImpl.getRecordingIntent(this, 131072, "StartActivity: " + getCallingActivity());
        }
      }
      label384: StyleSpan localStyleSpan = new StyleSpan(1);
      StyleSpan[] arrayOfStyleSpan = { localStyleSpan };
      Button localButton1 = (Button)findViewById(2131362171);
      localButton1.setText(Util.getSpannedText(arrayOfStyleSpan, getString(2131624363), '"'));
      localButton1.setOnClickListener(this);
      Button localButton2 = (Button)findViewById(2131362172);
      localButton2.setText(Util.getSpannedText(arrayOfStyleSpan, getString(2131624364), '"'));
      localButton2.setOnClickListener(this);
      TextView localTextView = (TextView)findViewById(2131362169);
      localTextView.setMovementMethod(LinkMovementMethod.getInstance());
      Spanned localSpanned = Util.getSpannedText(arrayOfStyleSpan, getString(2131624362), '"');
      localTextView.setText(localSpanned);
      Spannable localSpannable = (Spannable)localTextView.getText();
      int i = localSpanned.getSpanStart(localStyleSpan);
      int j = localSpanned.getSpanEnd(localStyleSpan);
      Util.safeSetSpan(localSpannable, new ForegroundColorSpan(getResources().getColor(2131296358)), i, j, 33);
      localTextView.setOnClickListener(this);
      this.mTwitter = this.mAppController.getTwitter();
      this.mVideoView = ((VideoViewInterface)findViewById(2131362168));
      this.mVideoView.setKeepScreenOn(true);
      this.mVideoView.setLooping(true);
      if (SystemUtil.isNormalVideoPlayable(this) == SystemUtil.PrefBooleanState.UNKNOWN)
      {
        this.mVideoView.setVideoPathDirect(SystemUtil.getVideoUrlFromResource(this, 2131099650));
        VideoViewInterface localVideoViewInterface1 = this.mVideoView;
        MediaPlayer.OnErrorListener local1 = new MediaPlayer.OnErrorListener()
        {
          public boolean onError(MediaPlayer paramAnonymousMediaPlayer, int paramAnonymousInt1, int paramAnonymousInt2)
          {
            SLog.d("Video test failed.");
            SystemUtil.setNormalVideoPlayable(StartActivity.this.getApplicationContext(), false);
            StartActivity.this.mHandler.postDelayed(new Runnable()
            {
              public void run()
              {
                StartActivity.this.openStartVideo();
              }
            }
            , 50L);
            return true;
          }
        };
        localVideoViewInterface1.setOnErrorListener(local1);
        VideoViewInterface localVideoViewInterface2 = this.mVideoView;
        MediaPlayer.OnPreparedListener local2 = new MediaPlayer.OnPreparedListener()
        {
          public void onPrepared(MediaPlayer paramAnonymousMediaPlayer)
          {
            SystemUtil.setNormalVideoPlayable(StartActivity.this.getApplicationContext(), true);
            StartActivity.this.mVideoView.start();
            SLog.d("Video test completed, assuming success, may change later.");
          }
        };
        localVideoViewInterface2.setOnPreparedListener(local2);
      }
      while (true)
      {
        if ((paramBundle != null) && (paramBundle.containsKey("state_p")))
          this.mStopPosition = paramBundle.getInt("state_p");
        StartSessionListener localStartSessionListener = new StartSessionListener();
        this.mAppSessionListener = localStartSessionListener;
        this.mAppController = localAppController;
        Util.getDefaultSharedPrefs(this).edit().putInt("pref_log_startup_fail", 0).commit();
        return;
        openStartVideo();
      }
      label785: String str = null;
    }
  }

  protected void onDestroy()
  {
    super.onDestroy();
    if (this.mVideoView != null)
      this.mVideoView.suspend();
  }

  public void onDialogDone(DialogInterface paramDialogInterface, int paramInt1, int paramInt2)
  {
    switch (paramInt1)
    {
    default:
    case 1:
    }
    do
    {
      return;
      switch (paramInt2)
      {
      default:
        return;
      case -1:
      }
    }
    while (this.mAuthIntent == null);
    loginCheckTwitter(this.mAuthIntent, true);
  }

  public void onNewIntent(Intent paramIntent)
  {
    setRequestedOrientation(1);
    AppController localAppController = AppController.getInstance(this);
    String str = getIntent().getAction();
    boolean bool = "co.vine.android.RECORD".equals(str);
    AppImpl localAppImpl = AppImpl.getInstance();
    localAppImpl.updateClientProfile(this, localAppController, bool);
    this.mLoginRequest = paramIntent.getBooleanExtra("login_request", false);
    if (localAppController.getActiveSession().isLoggedIn())
    {
      if (this.mLoginRequest)
      {
        setResult(-1);
        finish();
      }
    }
    else
      return;
    Intent localIntent;
    if (!bool)
    {
      localIntent = new Intent(this, HomeTabActivity.class);
      localIntent.setFlags(335544320);
      localIntent.setAction(str);
      if ("android.intent.action.VIEW".equals(str))
        localIntent.setData(getIntent().getData());
    }
    while (true)
    {
      if (localIntent != null)
        startActivity(localIntent);
      finish();
      return;
      if ("co.vine.android.NOTIFICATION_PRESSED".equals(str))
      {
        localIntent.setAction(str);
        this.mAppController.clearPushNotifications();
        localIntent.setFlags(67108864);
        continue;
        localIntent = localAppImpl.getRecordingIntent(this, 131072, "StartActivity: " + getCallingActivity());
      }
    }
  }

  protected void onPause()
  {
    super.onPause();
    if (this.mVideoView != null)
    {
      this.mStopPosition = this.mVideoView.getCurrentPosition();
      this.mVideoView.pause();
    }
    dismissDialog();
  }

  protected void onResume()
  {
    super.onResume();
    if (this.mVideoView != null)
    {
      this.mVideoView.seekTo(this.mStopPosition);
      if (!this.mVideoView.isPlaying())
        break label72;
      this.mVideoView.resume();
    }
    while (true)
    {
      if ((this.mAppController.isLoggedIn()) && (this.mLoginRequest))
      {
        setResult(-1);
        finish();
      }
      return;
      label72: this.mVideoView.start();
    }
  }

  protected void onSaveInstanceState(Bundle paramBundle)
  {
    super.onSaveInstanceState(paramBundle);
    if (this.mAuthIntent != null)
      paramBundle.putParcelable("auth_intent", this.mAuthIntent);
  }

  protected void onStop()
  {
    FlurryUtils.trackLockOutSessionCount();
    super.onStop();
  }

  class StartSessionListener extends AppSessionListener
  {
    StartSessionListener()
    {
    }

    public void onCheckTwitterComplete(String paramString1, int paramInt1, String paramString2, int paramInt2, boolean paramBoolean, VineUser paramVineUser, VineLogin paramVineLogin)
    {
      if ((paramBoolean) && (paramInt1 == 200))
      {
        StartActivity.this.mAppController.loginComplete(StartActivity.this.mAppController.getActiveSession(), paramInt1, paramVineUser.username, null, paramVineLogin, paramVineUser.avatarUrl);
        if (StartActivity.this.mLoginRequest)
        {
          StartActivity.this.setResult(-1);
          StartActivity.this.finish();
          return;
        }
        StartActivity.toStart(StartActivity.this);
        return;
      }
      StartActivity.this.dismissDialog();
      if (paramInt1 == 400)
      {
        Intent localIntent = new Intent(StartActivity.this, SignUpPagerActivity.class);
        localIntent.putExtra("user", paramVineLogin);
        StartActivity.this.startActivity(localIntent);
        return;
      }
      if (paramInt2 == VineError.VineKnownErrors.ACCOUNT_DEACTIVATED.code)
      {
        PromptDialogSupportFragment localPromptDialogSupportFragment = PromptDialogSupportFragment.newInstance(1);
        localPromptDialogSupportFragment.setMessage(2131624284);
        localPromptDialogSupportFragment.setTitle(2131624285);
        localPromptDialogSupportFragment.setNegativeButton(2131624018);
        localPromptDialogSupportFragment.setPositiveButton(2131624283);
        localPromptDialogSupportFragment.show(StartActivity.this.getSupportFragmentManager());
        return;
      }
      Util.showCenteredToast(StartActivity.this, paramString2);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.StartActivity
 * JD-Core Version:    0.6.2
 */