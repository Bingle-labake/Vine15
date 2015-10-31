package co.vine.android.util;

import com.crashlytics.android.Crashlytics;
import com.edisonwang.android.slog.FormattingTuple;
import com.edisonwang.android.slog.MessageFormatter;
import com.edisonwang.android.slog.SLog;

public class CrashUtil
{
  private static boolean sLogsOn;

  public static void log(String paramString)
  {
    if (sLogsOn)
    {
      SLog.i2(paramString);
      return;
    }
    Crashlytics.log(paramString);
  }

  public static void log(String paramString, Object[] paramArrayOfObject)
  {
    String str = MessageFormatter.format(paramString, paramArrayOfObject).getMessage();
    if (sLogsOn)
    {
      SLog.i2(str);
      return;
    }
    Crashlytics.log(str);
  }

  public static void logException(Throwable paramThrowable)
  {
    if (sLogsOn)
    {
      SLog.e2("Exception was logged.", paramThrowable);
      return;
    }
    Crashlytics.logException(paramThrowable);
    Crashlytics.log("Last Exception was " + paramThrowable);
  }

  public static void logException(Throwable paramThrowable, String paramString, Object[] paramArrayOfObject)
  {
    String str = MessageFormatter.format(paramString, paramArrayOfObject).getMessage();
    if (sLogsOn)
    {
      SLog.e2(str, paramThrowable);
      return;
    }
    Crashlytics.log(str);
    Crashlytics.logException(paramThrowable);
  }

  public static void setup(boolean paramBoolean)
  {
    sLogsOn = paramBoolean;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.CrashUtil
 * JD-Core Version:    0.6.2
 */