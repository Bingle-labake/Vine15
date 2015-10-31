package co.vine.android;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.support.v7.app.ActionBar;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import co.vine.android.client.AppController;
import co.vine.android.client.Session;
import co.vine.android.client.VineAccountHelper;
import co.vine.android.provider.VineDatabaseHelper;
import co.vine.android.service.GCMRegistrationService;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.SystemUtil;
import co.vine.android.util.Util;
import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class DebugHomeActivity extends BaseControllerActionBarActivity
{
  private static final boolean HIDE_SENSITIVE_DATA;

  static
  {
    if (!BuildUtil.isLogsOn());
    for (boolean bool = true; ; bool = false)
    {
      HIDE_SENSITIVE_DATA = bool;
      return;
    }
  }

  @TargetApi(11)
  private void appendMemoryInfo(StringBuilder paramStringBuilder)
  {
    ActivityManager localActivityManager = (ActivityManager)getSystemService("activity");
    localActivityManager.getMemoryInfo(new ActivityManager.MemoryInfo());
    if ((Build.VERSION.SDK_INT >= 11) && (!BuildUtil.isExplore()));
    for (int i = localActivityManager.getLargeMemoryClass(); ; i = localActivityManager.getMemoryClass())
    {
      paramStringBuilder.append("\nMemory Info: " + i + "MB");
      return;
    }
  }

  private int getNumCores()
  {
    try
    {
      int i = new File("/sys/devices/system/cpu/").listFiles(new FileFilter()
      {
        public boolean accept(File paramAnonymousFile)
        {
          return Pattern.matches("cpu[0-9]+", paramAnonymousFile.getName());
        }
      }).length;
      return i;
    }
    catch (Exception localException)
    {
    }
    return 1;
  }

  private void handleDebugQuery(String paramString)
  {
    if (paramString != null)
    {
      if (paramString.startsWith("p:"))
        SingleActivity.start(this, Long.parseLong(paramString.substring(2)));
      if (paramString.startsWith("s:"))
        SingleActivity.start(this, paramString.substring(2));
      if (paramString.startsWith("u:"))
        ProfileActivity.start(this, Long.parseLong(paramString.substring(2)), "Debug Screen");
    }
  }

  protected void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle, 2130903078, true);
    final Session localSession = this.mAppController.getActiveSession();
    TextView localTextView = (TextView)findViewById(2131361909);
    Button localButton1 = (Button)findViewById(2131361910);
    if (!HIDE_SENSITIVE_DATA)
    {
      View.OnClickListener local1 = new View.OnClickListener()
      {
        public void onClick(View paramAnonymousView)
        {
          Log.d("VINEDEBUG", "vine-session-id: " + localSession.getSessionKey());
        }
      };
      localButton1.setOnClickListener(local1);
    }
    while (true)
    {
      final StringBuilder localStringBuilder = new StringBuilder();
      setupActionBar(Boolean.valueOf(true), Boolean.valueOf(true), null, Boolean.valueOf(true));
      ActionBar localActionBar = getSupportActionBar();
      if (localActionBar != null)
        localActionBar.setTitle("Debug Screen");
      localStringBuilder.append("Hardware Device: " + Build.DEVICE + "\n");
      localStringBuilder.append("Hardware Model: " + Build.MODEL + "\n");
      localStringBuilder.append("Hardware info: (" + Build.CPU_ABI + "." + Build.HARDWARE + "." + Build.BRAND + "." + Build.PRODUCT + "." + Build.MANUFACTURER + "." + Build.CPU_ABI2 + ")\n");
      localStringBuilder.append("Number cores: " + getNumCores() + "\n");
      localStringBuilder.append("Android OS Version: " + Build.VERSION.RELEASE + " " + Build.VERSION.SDK_INT + Build.VERSION.INCREMENTAL + " (" + Build.VERSION.CODENAME + ")");
      localStringBuilder.append("\nMarket: ");
      switch (BuildUtil.getMarket())
      {
      default:
        localStringBuilder.append("Other\n");
        label397: localStringBuilder.append("\nApp: ");
        if (BuildUtil.isExplore())
        {
          localStringBuilder.append("Explore\n");
          label421: long l = VineDatabaseHelper.getDatabasePath(this).length();
          localStringBuilder.append("Main database size: " + l / 1000000.0D + " MB\n");
          localStringBuilder.append("Authority: " + BuildUtil.getAuthority("") + "\n");
          appendMemoryInfo(localStringBuilder);
        }
        break;
      case 1:
      case 2:
      case 3:
      }
      try
      {
        PackageInfo localPackageInfo = getPackageManager().getPackageInfo("co.vine.android", 0);
        localStringBuilder.append("\nVine for Android Version: ").append(localPackageInfo.versionName);
        localStringBuilder.append("\nVine for Android Build: ").append(localPackageInfo.versionCode);
        if (!HIDE_SENSITIVE_DATA)
        {
          localStringBuilder.append("\nInstalled: ").append(Util.DATE_TIME_RFC1123.format(new Date(localPackageInfo.firstInstallTime)));
          localStringBuilder.append("\nUpdated: ").append(Util.DATE_TIME_RFC1123.format(new Date(localPackageInfo.lastUpdateTime)));
        }
        DisplayMetrics localDisplayMetrics = new DisplayMetrics();
        getWindowManager().getDefaultDisplay().getMetrics(localDisplayMetrics);
        localStringBuilder.append("\nScreen Density: ");
        switch (localDisplayMetrics.densityDpi)
        {
        default:
          localStringBuilder.append(" UNKNOWN: " + localDisplayMetrics.densityDpi);
          localStringBuilder.append("\nScreen Size: " + localDisplayMetrics.widthPixels + "x" + localDisplayMetrics.heightPixels);
          localStringBuilder.append("\nNormal Video Playable: " + SystemUtil.isNormalVideoPlayable(this) + " account: " + VineAccountHelper.isNormalVideoPlayable(this));
          localStringBuilder.append("\nLogged in user: ").append(localSession.getLoginEmail());
          if (!HIDE_SENSITIVE_DATA)
          {
            localStringBuilder.append("\nLogged in user id: ").append(localSession.getUserId());
            localStringBuilder.append("\nLogged in session key: ").append(localSession.getSessionKey());
          }
          localStringBuilder.append("\nLogged in name: ").append(localSession.getName());
          if (!HIDE_SENSITIVE_DATA)
            localStringBuilder.append("\nLogged in avatar: ").append(localSession.getAvatarUrl());
          AccountManager localAccountManager = AccountManager.get(this);
          Account localAccount = VineAccountHelper.getAccount(this, this.mAppController.getActiveSession().getLoginEmail());
          if (Integer.parseInt(localAccountManager.getUserData(localAccount, "account_login_type")) == 2)
          {
            localStringBuilder.append("\nLogged in with Twitter.");
            if (!TextUtils.isEmpty(VineAccountHelper.getTwitterToken(localAccountManager, localAccount)))
              break label1537;
            localStringBuilder.append("\nNot connected to Twitter.");
            if (!HIDE_SENSITIVE_DATA)
            {
              SharedPreferences localSharedPreferences = GCMRegistrationService.getGCMPreferences(this);
              localStringBuilder.append("\n\nGCM: " + localSharedPreferences.getString("registrationId", "Not registered"));
              localStringBuilder.append("\nGCM sent to vinepi: " + localSharedPreferences.getBoolean("registrationIdSent", false));
              localStringBuilder.append("\n\nAPI: " + BuildUtil.get(this).getBaseUrl());
              localStringBuilder.append("\nAmazon: " + getString(2131624006));
              localStringBuilder.append("\nAmazon Bucket: " + BuildUtil.get(this).getAmazonBucket());
              localStringBuilder.append("\nTwitter: " + getString(2131624391));
              localStringBuilder.append("\nExplore: " + BuildUtil.get(this).getExploreUrl());
            }
            AppImpl.getInstance().appendDebugInfo(this, localStringBuilder, HIDE_SENSITIVE_DATA);
            localTextView.setText(localStringBuilder.toString());
            if (BuildUtil.isLogsOn())
            {
              Button localButton2 = new Button(this);
              localButton2.setText("Send Logs");
              View.OnClickListener local2 = new View.OnClickListener()
              {
                public void onClick(View paramAnonymousView)
                {
                  File localFile = new File(DebugHomeActivity.this.getExternalCacheDir(), "vine_log.txt");
                  try
                  {
                    OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(new FileOutputStream(localFile));
                    localOutputStreamWriter.write(localStringBuilder.toString());
                    localOutputStreamWriter.flush();
                    localOutputStreamWriter.close();
                    Intent localIntent = new Intent("co.vine.android.intent.action.SEND_LOGS");
                    DebugHomeActivity.this.startActivity(localIntent);
                    return;
                  }
                  catch (IOException localIOException)
                  {
                    Toast.makeText(DebugHomeActivity.this, "Failed to send log.", 0).show();
                  }
                }
              };
              localButton2.setOnClickListener(local2);
              ((ViewGroup)localTextView.getParent()).addView(localButton2);
            }
            if (HIDE_SENSITIVE_DATA)
              break label1549;
            final EditText localEditText = (EditText)findViewById(2131361912);
            View localView = findViewById(2131361913);
            View.OnClickListener local3 = new View.OnClickListener()
            {
              public void onClick(View paramAnonymousView)
              {
                DebugHomeActivity.this.handleDebugQuery(localEditText.getText().toString());
              }
            };
            localView.setOnClickListener(local3);
            return;
            localButton1.setVisibility(8);
            continue;
            localStringBuilder.append("Google\n");
            break label397;
            localStringBuilder.append("Amazon\n");
            break label397;
            localStringBuilder.append("Astar\n");
            break label397;
            if (BuildUtil.isRegular())
            {
              localStringBuilder.append("Main\n");
              break label421;
            }
            localStringBuilder.append("Other\n");
          }
          break;
        case 120:
        case 160:
        case 240:
        case 213:
        case 320:
        case 480:
        }
      }
      catch (PackageManager.NameNotFoundException localNameNotFoundException)
      {
        while (true)
        {
          localNameNotFoundException.printStackTrace();
          continue;
          localStringBuilder.append(" LDPI");
          continue;
          localStringBuilder.append(" MDPI");
          continue;
          localStringBuilder.append(" HDPI");
          continue;
          localStringBuilder.append(" TVDPI");
          continue;
          localStringBuilder.append(" XHDPI");
          continue;
          localStringBuilder.append(" XXHDPI");
          continue;
          localStringBuilder.append("\nNot logged in with Twitter.");
          continue;
          label1537: localStringBuilder.append("\nConnected to Twitter.");
        }
        label1549: ((LinearLayout)findViewById(2131361911)).setVisibility(8);
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.DebugHomeActivity
 * JD-Core Version:    0.6.2
 */