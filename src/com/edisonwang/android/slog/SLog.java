package com.edisonwang.android.slog;

import android.util.Log;

public class SLog
{
  private static final String TAG = "Playback_";
  private static String sAuthority;
  public static boolean sIsAmazon;
  public static boolean sLogsOn;

  public static void d(String paramString)
  {
    if (sLogsOn)
      Log.d("Playback_" + getCallingClass(), getCallingLine() + paramString);
  }

  public static void d(String paramString, Object paramObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject);
      Log.d("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void d(String paramString, Object paramObject1, Object paramObject2)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject1, paramObject2);
      Log.d("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void d(String paramString, Object paramObject1, Object paramObject2, Object paramObject3)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject1, paramObject2, paramObject3);
      Log.d("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void d(String paramString, Object paramObject1, Object paramObject2, Throwable paramThrowable)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject1, paramObject2);
      Log.d("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage(), paramThrowable);
    }
  }

  public static void d(String paramString, Object paramObject, Throwable paramThrowable)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject);
      Log.d("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage(), paramThrowable);
    }
  }

  public static void d(String paramString, Throwable paramThrowable)
  {
    if (sLogsOn)
      Log.d("Playback_" + getCallingClass(), getCallingLine() + paramString, paramThrowable);
  }

  public static void d(String paramString, Object[] paramArrayOfObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramArrayOfObject);
      Log.d("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void d(String paramString, Object[] paramArrayOfObject, Throwable paramThrowable)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramArrayOfObject);
      Log.d("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage(), paramThrowable);
    }
  }

  public static void e(String paramString)
  {
    if (sLogsOn)
      Log.e("Playback_" + getCallingClass(), getCallingLine() + paramString);
  }

  public static void e(String paramString, Object paramObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject);
      Log.e("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void e(String paramString, Object paramObject1, Object paramObject2)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject1, paramObject2);
      Log.e("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void e(String paramString, Object paramObject, Throwable paramThrowable)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject);
      Log.e("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage(), paramThrowable);
    }
  }

  public static void e(String paramString, Throwable paramThrowable)
  {
    if (sLogsOn)
      Log.e("Playback_" + getCallingClass(), getCallingLine() + paramString, paramThrowable);
  }

  public static void e(String paramString, Object[] paramArrayOfObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramArrayOfObject);
      Log.e("Playback_" + getCallingClass(), localFormattingTuple.getMessage());
    }
  }

  public static void e(String paramString, Object[] paramArrayOfObject, Throwable paramThrowable)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramArrayOfObject);
      Log.e("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage(), paramThrowable);
    }
  }

  public static void e2(String paramString, Exception paramException)
  {
    if (sLogsOn)
      Log.e("Playback_" + getCallingClass2(), getCallingLine2() + paramString);
  }

  public static void e2(String paramString, Throwable paramThrowable)
  {
    if (sLogsOn)
      Log.e("Playback_" + getCallingClass2(), getCallingLine2() + paramString, paramThrowable);
  }

  public static String getAuthority()
  {
    return sAuthority;
  }

  private static String getCallingClass()
  {
    String str = java.lang.Thread.currentThread().getStackTrace()[4].getClassName();
    int i = str.lastIndexOf('.');
    if (i >= -1 + str.length())
      str = "";
    while (i < 0)
      return str;
    return str.substring(i + 1);
  }

  private static String getCallingClass2()
  {
    String str = java.lang.Thread.currentThread().getStackTrace()[5].getClassName();
    int i = str.lastIndexOf('.');
    if (i >= -1 + str.length())
      str = "";
    while (i < 0)
      return str;
    return str.substring(i + 1);
  }

  private static String getCallingLine()
  {
    return java.lang.Thread.currentThread().getStackTrace()[4].getMethodName() + "()" + ":" + java.lang.Thread.currentThread().getStackTrace()[4].getLineNumber() + " - ";
  }

  private static String getCallingLine2()
  {
    return java.lang.Thread.currentThread().getStackTrace()[5].getMethodName() + "()" + ":" + java.lang.Thread.currentThread().getStackTrace()[5].getLineNumber() + " - ";
  }

  public static void i(String paramString)
  {
    if (sLogsOn)
      Log.i("Playback_" + getCallingClass(), getCallingLine() + paramString);
  }

  public static void i(String paramString, Object paramObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject);
      Log.i("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void i(String paramString, Object paramObject1, Object paramObject2)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject1, paramObject2);
      Log.i("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void i(String paramString, Object paramObject1, Object paramObject2, Object paramObject3)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject1, paramObject2, paramObject3);
      Log.i("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void i(String paramString, Object paramObject, Throwable paramThrowable)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject);
      Log.i("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage(), paramThrowable);
    }
  }

  public static void i(String paramString, Throwable paramThrowable)
  {
    if (sLogsOn)
      Log.i("Playback_" + getCallingClass(), getCallingLine() + paramString, paramThrowable);
  }

  public static void i(String paramString, Object[] paramArrayOfObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramArrayOfObject);
      Log.i("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void i2(String paramString)
  {
    if (sLogsOn)
      Log.i("Playback_" + getCallingClass2(), getCallingLine2() + paramString);
  }

  public static void setup(boolean paramBoolean1, boolean paramBoolean2, String paramString)
  {
    sLogsOn = paramBoolean1;
    sIsAmazon = paramBoolean2;
    sAuthority = paramString;
  }

  public static void v(String paramString)
  {
    if (sLogsOn)
      Log.v("Playback_" + getCallingClass(), getCallingLine() + paramString);
  }

  public static void v(String paramString, Object paramObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject);
      Log.v("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void v(String paramString, Object paramObject1, Object paramObject2)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject1, paramObject2);
      Log.v("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void v(String paramString, Throwable paramThrowable)
  {
    if (sLogsOn)
      Log.v("Playback_" + getCallingClass(), getCallingLine() + paramString, paramThrowable);
  }

  public static void v(String paramString, Object[] paramArrayOfObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramArrayOfObject);
      Log.v("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void w(String paramString)
  {
    if (sLogsOn)
      Log.w("Playback_" + getCallingClass(), getCallingLine() + paramString);
  }

  public static void w(String paramString, Object paramObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject);
      Log.w("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void w(String paramString, Object paramObject1, Object paramObject2)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramObject1, paramObject2);
      Log.w("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void w(String paramString, Throwable paramThrowable)
  {
    if (sLogsOn)
      Log.w("Playback_" + getCallingClass(), getCallingLine() + paramString, paramThrowable);
  }

  public static void w(String paramString, Object[] paramArrayOfObject)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramArrayOfObject);
      Log.w("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage());
    }
  }

  public static void w(String paramString, Object[] paramArrayOfObject, Throwable paramThrowable)
  {
    if (sLogsOn)
    {
      FormattingTuple localFormattingTuple = MessageFormatter.format(paramString, paramArrayOfObject);
      Log.w("Playback_" + getCallingClass(), getCallingLine() + localFormattingTuple.getMessage(), paramThrowable);
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.edisonwang.android.slog.SLog
 * JD-Core Version:    0.6.2
 */