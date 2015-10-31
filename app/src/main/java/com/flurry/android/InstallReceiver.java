package com.flurry.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.util.Log;
import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public final class InstallReceiver extends BroadcastReceiver
{
  private final Handler aG;
  private File eq = null;

  public InstallReceiver()
  {
    HandlerThread localHandlerThread = new HandlerThread("InstallReceiver");
    localHandlerThread.start();
    this.aG = new Handler(localHandlerThread.getLooper());
  }

  // ERROR //
  private static String a(File paramFile)
  {
    // Byte code:
    //   0: new 42	java/io/FileInputStream
    //   3: dup
    //   4: aload_0
    //   5: invokespecial 45	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   8: astore_1
    //   9: new 47	java/lang/StringBuffer
    //   12: dup
    //   13: invokespecial 48	java/lang/StringBuffer:<init>	()V
    //   16: astore_2
    //   17: sipush 1024
    //   20: newarray byte
    //   22: astore 6
    //   24: aload_1
    //   25: aload 6
    //   27: invokevirtual 52	java/io/FileInputStream:read	([B)I
    //   30: istore 7
    //   32: iload 7
    //   34: ifle +54 -> 88
    //   37: aload_2
    //   38: new 54	java/lang/String
    //   41: dup
    //   42: aload 6
    //   44: iconst_0
    //   45: iload 7
    //   47: invokespecial 57	java/lang/String:<init>	([BII)V
    //   50: invokevirtual 61	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   53: pop
    //   54: goto -30 -> 24
    //   57: astore 4
    //   59: ldc 18
    //   61: ldc 63
    //   63: aload 4
    //   65: invokestatic 69	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   68: aload_1
    //   69: invokestatic 74	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   72: aconst_null
    //   73: astore 5
    //   75: aload_2
    //   76: ifnull +9 -> 85
    //   79: aload_2
    //   80: invokevirtual 78	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   83: astore 5
    //   85: aload 5
    //   87: areturn
    //   88: aload_1
    //   89: invokestatic 74	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   92: goto -20 -> 72
    //   95: astore 9
    //   97: aconst_null
    //   98: astore_1
    //   99: aload 9
    //   101: astore_3
    //   102: aload_1
    //   103: invokestatic 74	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   106: aload_3
    //   107: athrow
    //   108: astore_3
    //   109: goto -7 -> 102
    //   112: astore 4
    //   114: aconst_null
    //   115: astore_2
    //   116: aconst_null
    //   117: astore_1
    //   118: goto -59 -> 59
    //   121: astore 4
    //   123: aconst_null
    //   124: astore_2
    //   125: goto -66 -> 59
    //
    // Exception table:
    //   from	to	target	type
    //   17	24	57	java/lang/Throwable
    //   24	32	57	java/lang/Throwable
    //   37	54	57	java/lang/Throwable
    //   0	9	95	finally
    //   9	17	108	finally
    //   17	24	108	finally
    //   24	32	108	finally
    //   37	54	108	finally
    //   59	68	108	finally
    //   0	9	112	java/lang/Throwable
    //   9	17	121	java/lang/Throwable
  }

  static Map<String, List<String>> e(String paramString)
  {
    HashMap localHashMap = new HashMap();
    String[] arrayOfString1 = paramString.split("&");
    int i = arrayOfString1.length;
    int j = 0;
    if (j < i)
    {
      String[] arrayOfString2 = arrayOfString1[j].split("=");
      if (arrayOfString2.length != 2)
        db.c("InstallReceiver", "Invalid referrer Element: " + arrayOfString1[j] + " in referrer tag " + paramString);
      while (true)
      {
        j++;
        break;
        String str1 = URLDecoder.decode(arrayOfString2[0]);
        String str2 = URLDecoder.decode(arrayOfString2[1]);
        if (localHashMap.get(str1) == null)
          localHashMap.put(str1, new ArrayList());
        ((List)localHashMap.get(str1)).add(str2);
      }
    }
    StringBuilder localStringBuilder = new StringBuilder();
    if (localHashMap.get("utm_source") == null)
      localStringBuilder.append("Campaign Source is missing.\n");
    if (localHashMap.get("utm_medium") == null)
      localStringBuilder.append("Campaign Medium is missing.\n");
    if (localHashMap.get("utm_campaign") == null)
      localStringBuilder.append("Campaign Name is missing.\n");
    if (localStringBuilder.length() > 0)
      Log.w("Detected missing referrer keys", localStringBuilder.toString());
    return localHashMap;
  }

  private void x(String paramString)
  {
    try
    {
      cj localcj = new cj(this, paramString);
      this.aG.post(localcj);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final void onReceive(Context paramContext, Intent paramIntent)
  {
    db.e("InstallReceiver", "Received an Install nofication of " + paramIntent.getAction());
    this.eq = paramContext.getFileStreamPath(".flurryinstallreceiver.");
    db.e("InstallReceiver", "fInstallReceiverFile is " + this.eq);
    if (FlurryAgent.isCaptureUncaughtExceptions())
      Thread.setDefaultUncaughtExceptionHandler(new FlurryAgent.FlurryDefaultExceptionHandler());
    String str = paramIntent.getExtras().getString("referrer");
    db.e("InstallReceiver", "Received an Install referrer of " + str);
    if ((str == null) || (!"com.android.vending.INSTALL_REFERRER".equals(paramIntent.getAction())))
    {
      db.e("InstallReceiver", "referrer is null");
      return;
    }
    if (!str.contains("="))
    {
      db.e("InstallReceiver", "referrer is before decoding: " + str);
      str = URLDecoder.decode(str);
      db.e("InstallReceiver", "referrer is: " + str);
    }
    x(str);
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.InstallReceiver
 * JD-Core Version:    0.6.2
 */