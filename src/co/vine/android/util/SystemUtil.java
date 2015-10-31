package co.vine.android.util;

import android.annotation.TargetApi;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import android.os.Process;
import android.util.SparseArray;
import co.vine.android.VineException;
import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.util.Iterator;
import java.util.List;

public class SystemUtil
{
  private static double MEMORY_RATIO = 0.0D;
  private static final int TARGET_KEY_SINGLE_PLAYER = 1;
  private static final int TARGET_KEY_VIEW_SERVER = 0;
  private static final String TARGET_PROCESS_DEFAULT = null;
  private static final String TARGET_PROCESS_RECORD = ":record";
  private static final String TARGET_SINGLE_PLAYER = ":record";
  private static final String TARGET_VIEW_SERVER = TARGET_PROCESS_DEFAULT;
  private static String mProcessName;
  private static String mSubProcessName;
  private static final SparseArray<Boolean> mTargetProcessInfo = new SparseArray();

  public static double getMemoryRatio(Context paramContext, boolean paramBoolean)
  {
    if ((MEMORY_RATIO != -1.0D) || (!paramBoolean));
    try
    {
      if (Build.VERSION.SDK_INT >= 14)
      {
        int k = getMemoryRatioForLargeMemoryClass(paramContext);
        i = k;
        if (i != 0)
          break label65;
      }
      label65: for (double d = 1.0D; ; d = i / 128.0D)
      {
        MEMORY_RATIO = d;
        return MEMORY_RATIO;
        int j = ((ActivityManager)paramContext.getSystemService("activity")).getMemoryClass();
        return j;
      }
    }
    catch (Exception localException)
    {
      while (true)
        int i = 0;
    }
  }

  @TargetApi(14)
  public static int getMemoryRatioForLargeMemoryClass(Context paramContext)
  {
    return ((ActivityManager)paramContext.getSystemService("activity")).getLargeMemoryClass();
  }

  public static String getVideoUrlFromResource(Context paramContext, int paramInt)
  {
    return "android.resource://" + paramContext.getPackageName() + "/" + paramInt;
  }

  private static void initProcessName(Context paramContext)
  {
    try
    {
      if (mProcessName != null)
        break label115;
      mProcessName = paramContext.getPackageName();
      List localList = ((ActivityManager)paramContext.getSystemService("activity")).getRunningAppProcesses();
      if (localList != null)
      {
        Iterator localIterator = localList.iterator();
        while (localIterator.hasNext())
        {
          ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)localIterator.next();
          if (Process.myPid() == localRunningAppProcessInfo.pid)
            mProcessName = localRunningAppProcessInfo.processName;
        }
      }
    }
    finally
    {
    }
    int i = mProcessName.indexOf(':');
    if (i != -1);
    for (mSubProcessName = mProcessName.substring(i); ; mSubProcessName = "")
      label115: return;
  }

  public static PrefBooleanState isNormalVideoPlayable(Context paramContext)
  {
    return PrefBooleanState.valueOf(paramContext.getSharedPreferences("normalVideoTestPlayable", 0).getString("normalVideoTestPlayable", PrefBooleanState.UNKNOWN.name()));
  }

  public static boolean isSinglePlayerEnabled(Context paramContext)
  {
    return (SLog.sIsAmazon) || (isTargetProcess(paramContext, 1, ":record"));
  }

  private static boolean isTargetProcess(Context paramContext, int paramInt, String paramString)
  {
    Boolean localBoolean = (Boolean)mTargetProcessInfo.get(paramInt, null);
    if (localBoolean == null)
    {
      initProcessName(paramContext);
      if (paramString != null)
        break label61;
    }
    label61: for (localBoolean = Boolean.valueOf(SLog.getAuthority().equals(mProcessName)); ; localBoolean = Boolean.valueOf(paramString.equals(mSubProcessName)))
    {
      mTargetProcessInfo.put(paramInt, localBoolean);
      SLog.i("Is target process for {} a {}: {}.", Integer.valueOf(paramInt), paramString, localBoolean);
      return localBoolean.booleanValue();
    }
  }

  public static boolean isViewServerEnabled(Context paramContext)
  {
    boolean bool1 = SLog.sLogsOn;
    boolean bool2 = false;
    if (bool1)
    {
      boolean bool3 = isTargetProcess(paramContext, 0, TARGET_VIEW_SERVER);
      bool2 = false;
      if (bool3)
        bool2 = true;
    }
    return bool2;
  }

  public static void quietlyEnsureParentExists(File paramFile)
  {
    try
    {
      if (!paramFile.exists())
      {
        File localFile = paramFile.getParentFile();
        if ((localFile != null) && (!localFile.exists()))
        {
          CrashUtil.logException(new VineException("Invalid folder, but we caught it."));
          localFile.mkdirs();
        }
      }
      return;
    }
    catch (Exception localException)
    {
      CrashUtil.logException(new VineException("Failed to make parent folder."));
    }
  }

  public static void setNormalVideoPlayable(Context paramContext, boolean paramBoolean)
  {
    SharedPreferences.Editor localEditor = paramContext.getSharedPreferences("normalVideoTestPlayable", 0).edit();
    if (paramBoolean);
    for (PrefBooleanState localPrefBooleanState = PrefBooleanState.TRUE; ; localPrefBooleanState = PrefBooleanState.FALSE)
    {
      localEditor.putString("normalVideoTestPlayable", localPrefBooleanState.name()).commit();
      return;
    }
  }

  public static enum PrefBooleanState
  {
    static
    {
      TRUE = new PrefBooleanState("TRUE", 1);
      FALSE = new PrefBooleanState("FALSE", 2);
      PrefBooleanState[] arrayOfPrefBooleanState = new PrefBooleanState[3];
      arrayOfPrefBooleanState[0] = UNKNOWN;
      arrayOfPrefBooleanState[1] = TRUE;
      arrayOfPrefBooleanState[2] = FALSE;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.SystemUtil
 * JD-Core Version:    0.6.2
 */