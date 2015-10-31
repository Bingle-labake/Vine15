package co.vine.android.util;

import android.content.Context;
import android.text.TextUtils;
import com.edisonwang.android.slog.SLog;

public class BuildUtil
{
  public static final int APP_TYPE_EXPLORE = 2;
  public static final int APP_TYPE_REGULAR = 1;
  public static final int ENVIRONMENT_DEV = 2;
  public static final int ENVIRONMENT_PRODUCTION = 1;
  public static final int MARKET_AMAZON = 2;
  public static final int MARKET_ASTAR = 3;
  public static final int MARKET_GOOGLE = 1;
  private static Boolean isOldDeviceOrLowEndDevice;
  private static int sAppType = 0;
  private static String sAuthority = "co.vine.android";
  private static int sEnvironment = 0;
  private static boolean sI18nTest = false;
  private static final boolean sI18nTestDefault = true;
  private static BuildUtil sInstance;
  private static boolean sLogsOn;
  private static int sMarket;
  private Context mContext;

  static
  {
    isOldDeviceOrLowEndDevice = null;
    setup("google", "regular", "co.vine.android", "production", false, true);
    CrashUtil.setup(false);
    PlayerUtil.setup("co.vine.android");
    SLog.setup(false, "amazon".equals("google"), "co.vine.android");
  }

  private BuildUtil(Context paramContext)
  {
    this.mContext = paramContext;
  }

  public static BuildUtil get(Context paramContext)
  {
    if (sInstance == null)
      sInstance = new BuildUtil(paramContext);
    return sInstance;
  }

  public static String getAuthority(String paramString)
  {
    return sAuthority + paramString;
  }

  public static int getMarket()
  {
    return sMarket;
  }

  public static boolean isAStar()
  {
    return sMarket == 3;
  }

  public static boolean isAmazon()
  {
    return sMarket == 2;
  }

  public static boolean isExplore()
  {
    return sAppType == 2;
  }

  public static boolean isGoogle()
  {
    return sMarket == 1;
  }

  public static boolean isI18nOn()
  {
    return sLogsOn;
  }

  public static boolean isI18nTestOn()
  {
    return sI18nTest;
  }

  public static boolean isLogsOn()
  {
    return sLogsOn;
  }

  public static boolean isOldDeviceOrLowEndDevice(Context paramContext)
  {
    if (isOldDeviceOrLowEndDevice == null)
      if (!isExplore())
        if (isExplore())
          break label50;
    label50: for (boolean bool2 = true; ; bool2 = false)
    {
      boolean bool3 = SystemUtil.getMemoryRatio(paramContext, bool2) < 1.0D;
      boolean bool1 = false;
      if (bool3)
        bool1 = true;
      isOldDeviceOrLowEndDevice = Boolean.valueOf(bool1);
      return isOldDeviceOrLowEndDevice.booleanValue();
    }
  }

  public static boolean isProduction()
  {
    return sEnvironment == 1;
  }

  public static boolean isRegular()
  {
    return sAppType == 1;
  }

  public static void setup(String paramString1, String paramString2, String paramString3, String paramString4, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ("amazon".equals(paramString1))
    {
      sMarket = 2;
      if (!"production".equals(paramString4))
        break label83;
      sEnvironment = 1;
      label26: if (!"explore".equals(paramString2))
        break label90;
    }
    label83: label90: for (sAppType = 2; ; sAppType = 1)
    {
      if (!TextUtils.isEmpty(paramString3))
        sAuthority = paramString3;
      sLogsOn = paramBoolean1;
      sI18nTest = true;
      return;
      if ("astar".equals(paramString1))
      {
        sMarket = 3;
        break;
      }
      sMarket = 1;
      break;
      sEnvironment = 2;
      break label26;
    }
  }

  public String getAmazonBucket()
  {
    switch (sEnvironment)
    {
    default:
      return this.mContext.getString(2131624005);
    case 1:
    }
    return this.mContext.getString(2131624004);
  }

  public String getBaseCdnUrl()
  {
    switch (sEnvironment)
    {
    default:
      return this.mContext.getString(2131624422);
    case 1:
    }
    return this.mContext.getString(2131624421);
  }

  public String getBaseUrl()
  {
    switch (sEnvironment)
    {
    default:
      return this.mContext.getString(2131624419);
    case 1:
    }
    return this.mContext.getString(2131624418);
  }

  public String getExploreUrl()
  {
    switch (sEnvironment)
    {
    default:
      return this.mContext.getString(2131624108);
    case 1:
    }
    return this.mContext.getString(2131624107);
  }

  public String getMediaUrl()
  {
    switch (sEnvironment)
    {
    default:
      return this.mContext.getString(2131624424);
    case 1:
    }
    return this.mContext.getString(2131624423);
  }

  public String getSenderId()
  {
    switch (sEnvironment)
    {
    default:
      return this.mContext.getString(2131624273);
    case 1:
    }
    return this.mContext.getString(2131624274);
  }

  public String getStatusUrl()
  {
    switch (sEnvironment)
    {
    default:
      return this.mContext.getString(2131624367);
    case 1:
    }
    return this.mContext.getString(2131624366);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.BuildUtil
 * JD-Core Version:    0.6.2
 */