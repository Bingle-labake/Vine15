package co.vine.android;

import android.annotation.TargetApi;
import android.app.Application;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Handler;
import co.vine.android.client.AppController;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.Util;
import com.crashlytics.android.Crashlytics;
import com.flurry.org.apache.avro.reflect.Nullable;
import java.util.Locale;

public class VineApplication extends Application
{
  private static VineApplication INSTANCE;

  @Nullable
  public static VineApplication getInstance()
  {
    return INSTANCE;
  }

  public Locale getLocale()
  {
    return getResources().getConfiguration().locale;
  }

  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    if (BuildUtil.isI18nOn())
    {
      final Locale localLocale = Util.getCustomLocale(this);
      if ((localLocale != null) && (!localLocale.equals(paramConfiguration.locale)))
        new Handler().postDelayed(new Runnable()
        {
          public void run()
          {
            Util.forceCustomLocale(VineApplication.INSTANCE, localLocale, true);
          }
        }
        , 500L);
    }
  }

  public void onCreate()
  {
    super.onCreate();
    if (BuildUtil.isI18nOn())
    {
      if (getResources() == null)
        return;
      Util.forceCustomLocale(this);
    }
    if (!BuildUtil.isLogsOn())
      Crashlytics.start(this);
    INSTANCE = this;
  }

  public void onLowMemory()
  {
    super.onLowMemory();
    CrashUtil.log("onLowMemory happened.");
    AppController localAppController = AppController.getInstance(this);
    if (localAppController != null)
      localAppController.onLowMemory();
  }

  @TargetApi(14)
  public void onTrimMemory(int paramInt)
  {
    super.onTrimMemory(paramInt);
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    CrashUtil.log("onTrimMemory happened: {}.", arrayOfObject);
    AppController localAppController = AppController.getInstance(this);
    if (localAppController != null)
      localAppController.onTrimMemory(paramInt);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.VineApplication
 * JD-Core Version:    0.6.2
 */