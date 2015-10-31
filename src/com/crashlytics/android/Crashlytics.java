package com.crashlytics.android;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import java.io.File;
import java.net.URL;
import java.util.Collections;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;

public final class Crashlytics
{
  private static Crashlytics b = null;
  private static ContextWrapper n;
  private static String o;
  private static String p;
  private static String q;
  private static String r;
  private static String s;
  private static String t;
  private static File u;
  private static boolean v = false;
  private static PinningInfoProvider w = null;
  String a = null;
  private ao c;
  private CrashlyticsListener d;
  private E e;
  private final long f = System.currentTimeMillis();
  private final ConcurrentHashMap<String, String> g = new ConcurrentHashMap();
  private IdManager h = null;
  private String i = null;
  private String j = null;
  private String k = null;
  private String l;
  private SettingsController m;
  private final Object x = new Object();

  private h a(ah paramah)
  {
    String[] arrayOfString = new String[1];
    arrayOfString[0] = this.l;
    String str = av.a(arrayOfString);
    return new h(s, o, r, q, str, p, 0, t, "0", paramah);
  }

  private <T> T a(D<T> paramD, T paramT)
  {
    synchronized (this.x)
    {
      if (this.c == null)
        return paramT;
      Object localObject3 = paramD.a(this.c);
      paramT = localObject3;
    }
  }

  private static String a(String paramString)
  {
    if (paramString != null)
    {
      paramString = paramString.trim();
      if (paramString.length() > 1024)
        paramString = paramString.substring(0, 1024);
    }
    return paramString;
  }

  // ERROR //
  private void a(Context paramContext, float paramFloat)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 66	com/crashlytics/android/Crashlytics:x	Ljava/lang/Object;
    //   4: astore 9
    //   6: aload 9
    //   8: monitorenter
    //   9: aload_0
    //   10: aload_0
    //   11: getfield 137	com/crashlytics/android/Crashlytics:m	Lcom/crashlytics/android/SettingsController;
    //   14: invokevirtual 142	com/crashlytics/android/SettingsController:a	()Lcom/crashlytics/android/ao;
    //   17: putfield 114	com/crashlytics/android/Crashlytics:c	Lcom/crashlytics/android/ao;
    //   20: aload_0
    //   21: getfield 114	com/crashlytics/android/Crashlytics:c	Lcom/crashlytics/android/ao;
    //   24: ifnull +438 -> 462
    //   27: aload_0
    //   28: getfield 114	com/crashlytics/android/Crashlytics:c	Lcom/crashlytics/android/ao;
    //   31: invokevirtual 147	com/crashlytics/android/ao:b	()Lcom/crashlytics/android/i;
    //   34: astore 11
    //   36: aload 11
    //   38: invokevirtual 152	com/crashlytics/android/i:e	()Z
    //   41: ifeq +136 -> 177
    //   44: aload_0
    //   45: invokestatic 155	com/crashlytics/android/Crashlytics:u	()Lcom/crashlytics/android/ah;
    //   48: invokespecial 157	com/crashlytics/android/Crashlytics:a	(Lcom/crashlytics/android/ah;)Lcom/crashlytics/android/h;
    //   51: astore 23
    //   53: new 159	com/crashlytics/android/W
    //   56: dup
    //   57: invokestatic 161	com/crashlytics/android/Crashlytics:j	()Ljava/lang/String;
    //   60: aload 11
    //   62: invokevirtual 163	com/crashlytics/android/i:a	()Ljava/lang/String;
    //   65: invokespecial 166	com/crashlytics/android/W:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   68: aload 23
    //   70: invokevirtual 169	com/crashlytics/android/W:a	(Lcom/crashlytics/android/h;)Z
    //   73: ifeq +92 -> 165
    //   76: aload_0
    //   77: invokespecial 171	com/crashlytics/android/Crashlytics:t	()Z
    //   80: istore 24
    //   82: iload 24
    //   84: istore 20
    //   86: aload_0
    //   87: getfield 114	com/crashlytics/android/Crashlytics:c	Lcom/crashlytics/android/ao;
    //   90: invokevirtual 174	com/crashlytics/android/ao:c	()Lcom/crashlytics/android/ar;
    //   93: invokevirtual 178	com/crashlytics/android/ar:a	()Z
    //   96: istore 21
    //   98: iload 20
    //   100: istore 5
    //   102: iload 21
    //   104: istore 4
    //   106: aload 9
    //   108: monitorexit
    //   109: iload 5
    //   111: ifeq +338 -> 449
    //   114: iload 4
    //   116: ifeq +333 -> 449
    //   119: aload_0
    //   120: getfield 82	com/crashlytics/android/Crashlytics:e	Lcom/crashlytics/android/E;
    //   123: invokevirtual 182	com/crashlytics/android/E:c	()V
    //   126: aload_0
    //   127: invokevirtual 185	com/crashlytics/android/Crashlytics:q	()Lcom/crashlytics/android/Y;
    //   130: astore 8
    //   132: iconst_0
    //   133: istore 6
    //   135: aload 8
    //   137: ifnull +17 -> 154
    //   140: new 187	com/crashlytics/android/al
    //   143: dup
    //   144: aload 8
    //   146: invokespecial 190	com/crashlytics/android/al:<init>	(Lcom/crashlytics/android/Y;)V
    //   149: aload_1
    //   150: fload_2
    //   151: invokevirtual 192	com/crashlytics/android/al:a	(Landroid/content/Context;F)V
    //   154: iload 6
    //   156: ifeq +8 -> 164
    //   159: ldc 194
    //   161: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   164: return
    //   165: ldc 199
    //   167: aconst_null
    //   168: invokestatic 202	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   171: iconst_0
    //   172: istore 20
    //   174: goto -88 -> 86
    //   177: aload 11
    //   179: invokevirtual 204	com/crashlytics/android/i:f	()Z
    //   182: ifeq +12 -> 194
    //   185: aload_0
    //   186: invokespecial 171	com/crashlytics/android/Crashlytics:t	()Z
    //   189: istore 20
    //   191: goto -105 -> 86
    //   194: aload 11
    //   196: invokevirtual 206	com/crashlytics/android/i:c	()Z
    //   199: ifeq +24 -> 223
    //   202: ldc 208
    //   204: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   207: aload_0
    //   208: aload 11
    //   210: invokestatic 155	com/crashlytics/android/Crashlytics:u	()Lcom/crashlytics/android/ah;
    //   213: invokespecial 211	com/crashlytics/android/Crashlytics:a	(Lcom/crashlytics/android/i;Lcom/crashlytics/android/ah;)Z
    //   216: pop
    //   217: iconst_1
    //   218: istore 20
    //   220: goto -134 -> 86
    //   223: invokestatic 155	com/crashlytics/android/Crashlytics:u	()Lcom/crashlytics/android/ah;
    //   226: astore 12
    //   228: aload 11
    //   230: invokevirtual 214	com/crashlytics/android/i:d	()Lcom/crashlytics/android/c;
    //   233: astore 13
    //   235: aconst_null
    //   236: astore 14
    //   238: aload 13
    //   240: ifnonnull +25 -> 265
    //   243: aload 14
    //   245: ifnull +226 -> 471
    //   248: ldc 216
    //   250: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   253: aload_0
    //   254: aload 11
    //   256: aload 14
    //   258: invokespecial 211	com/crashlytics/android/Crashlytics:a	(Lcom/crashlytics/android/i;Lcom/crashlytics/android/ah;)Z
    //   261: pop
    //   262: goto +209 -> 471
    //   265: aload 12
    //   267: ifnull +188 -> 455
    //   270: ldc 218
    //   272: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   275: aload 12
    //   277: invokevirtual 222	com/crashlytics/android/ah:c	()I
    //   280: aload 12
    //   282: invokevirtual 224	com/crashlytics/android/ah:d	()I
    //   285: imul
    //   286: istore 15
    //   288: aload 13
    //   290: invokevirtual 228	com/crashlytics/android/c:b	()I
    //   293: aload 13
    //   295: invokevirtual 229	com/crashlytics/android/c:c	()I
    //   298: imul
    //   299: istore 16
    //   301: aload 12
    //   303: invokevirtual 230	com/crashlytics/android/ah:a	()Ljava/lang/String;
    //   306: astore 17
    //   308: aload 13
    //   310: invokevirtual 231	com/crashlytics/android/c:a	()Ljava/lang/String;
    //   313: astore 18
    //   315: aload 17
    //   317: ifnull +8 -> 325
    //   320: aload 18
    //   322: ifnonnull +39 -> 361
    //   325: ldc 233
    //   327: aconst_null
    //   328: invokestatic 202	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   331: aconst_null
    //   332: astore 14
    //   334: goto -91 -> 243
    //   337: astore 10
    //   339: iconst_0
    //   340: istore 4
    //   342: iconst_0
    //   343: istore 5
    //   345: aload 9
    //   347: monitorexit
    //   348: aload 10
    //   350: athrow
    //   351: astore_3
    //   352: ldc 235
    //   354: aload_3
    //   355: invokestatic 202	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   358: goto -249 -> 109
    //   361: iload 15
    //   363: iload 16
    //   365: if_icmpne +24 -> 389
    //   368: aload 17
    //   370: aload 18
    //   372: invokevirtual 239	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   375: ifeq +14 -> 389
    //   378: ldc 241
    //   380: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   383: aconst_null
    //   384: astore 14
    //   386: goto -143 -> 243
    //   389: iload 15
    //   391: iload 16
    //   393: if_icmpge +62 -> 455
    //   396: ldc 241
    //   398: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   401: aconst_null
    //   402: astore 14
    //   404: goto -161 -> 243
    //   407: astore 7
    //   409: ldc 243
    //   411: aload 7
    //   413: invokestatic 202	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   416: iconst_0
    //   417: istore 6
    //   419: goto -265 -> 154
    //   422: astore_3
    //   423: iconst_0
    //   424: istore 4
    //   426: iconst_0
    //   427: istore 5
    //   429: goto -77 -> 352
    //   432: astore 10
    //   434: iload 20
    //   436: istore 5
    //   438: iconst_0
    //   439: istore 4
    //   441: goto -96 -> 345
    //   444: astore 10
    //   446: goto -101 -> 345
    //   449: iconst_1
    //   450: istore 6
    //   452: goto -298 -> 154
    //   455: aload 12
    //   457: astore 14
    //   459: goto -216 -> 243
    //   462: iconst_0
    //   463: istore 4
    //   465: iconst_0
    //   466: istore 5
    //   468: goto -362 -> 106
    //   471: iconst_1
    //   472: istore 20
    //   474: goto -388 -> 86
    //
    // Exception table:
    //   from	to	target	type
    //   9	82	337	finally
    //   165	171	337	finally
    //   177	191	337	finally
    //   194	217	337	finally
    //   223	235	337	finally
    //   248	262	337	finally
    //   270	315	337	finally
    //   325	331	337	finally
    //   368	383	337	finally
    //   396	401	337	finally
    //   345	351	351	java/lang/Exception
    //   119	132	407	java/lang/Exception
    //   140	154	407	java/lang/Exception
    //   0	9	422	java/lang/Exception
    //   86	98	432	finally
    //   106	109	444	finally
  }

  // ERROR //
  private void a(String paramString, Context paramContext, float paramFloat)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   5: ifnull +11 -> 16
    //   8: ldc 250
    //   10: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   13: aload_0
    //   14: monitorexit
    //   15: return
    //   16: ldc 252
    //   18: new 254	java/lang/StringBuilder
    //   21: dup
    //   22: ldc_w 256
    //   25: invokespecial 258	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   28: invokestatic 261	com/crashlytics/android/Crashlytics:getCrashlyticsVersion	()Ljava/lang/String;
    //   31: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   34: invokevirtual 268	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   37: invokestatic 273	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   40: pop
    //   41: aload_1
    //   42: putstatic 96	com/crashlytics/android/Crashlytics:s	Ljava/lang/String;
    //   45: new 275	android/content/ContextWrapper
    //   48: dup
    //   49: aload_2
    //   50: invokevirtual 281	android/content/Context:getApplicationContext	()Landroid/content/Context;
    //   53: invokespecial 284	android/content/ContextWrapper:<init>	(Landroid/content/Context;)V
    //   56: putstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   59: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   62: invokevirtual 287	android/content/ContextWrapper:getPackageName	()Ljava/lang/String;
    //   65: putstatic 98	com/crashlytics/android/Crashlytics:o	Ljava/lang/String;
    //   68: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   71: invokevirtual 291	android/content/ContextWrapper:getPackageManager	()Landroid/content/pm/PackageManager;
    //   74: getstatic 98	com/crashlytics/android/Crashlytics:o	Ljava/lang/String;
    //   77: iconst_0
    //   78: invokevirtual 297	android/content/pm/PackageManager:getPackageInfo	(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    //   81: astore 22
    //   83: aload 22
    //   85: getfield 303	android/content/pm/PackageInfo:versionCode	I
    //   88: invokestatic 308	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   91: putstatic 102	com/crashlytics/android/Crashlytics:q	Ljava/lang/String;
    //   94: aload 22
    //   96: getfield 311	android/content/pm/PackageInfo:versionName	Ljava/lang/String;
    //   99: putstatic 100	com/crashlytics/android/Crashlytics:r	Ljava/lang/String;
    //   102: aload_2
    //   103: invokevirtual 312	android/content/Context:getPackageManager	()Landroid/content/pm/PackageManager;
    //   106: aload_2
    //   107: invokevirtual 316	android/content/Context:getApplicationInfo	()Landroid/content/pm/ApplicationInfo;
    //   110: invokevirtual 320	android/content/pm/PackageManager:getApplicationLabel	(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;
    //   113: invokevirtual 321	java/lang/Object:toString	()Ljava/lang/String;
    //   116: putstatic 104	com/crashlytics/android/Crashlytics:p	Ljava/lang/String;
    //   119: aload_2
    //   120: invokevirtual 316	android/content/Context:getApplicationInfo	()Landroid/content/pm/ApplicationInfo;
    //   123: getfield 326	android/content/pm/ApplicationInfo:targetSdkVersion	I
    //   126: invokestatic 308	java/lang/Integer:toString	(I)Ljava/lang/String;
    //   129: putstatic 106	com/crashlytics/android/Crashlytics:t	Ljava/lang/String;
    //   132: getstatic 98	com/crashlytics/android/Crashlytics:o	Ljava/lang/String;
    //   135: astore 23
    //   137: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   140: invokevirtual 330	android/content/ContextWrapper:getResources	()Landroid/content/res/Resources;
    //   143: ldc_w 332
    //   146: ldc_w 334
    //   149: aload 23
    //   151: invokevirtual 340	android/content/res/Resources:getIdentifier	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    //   154: istore 24
    //   156: aconst_null
    //   157: astore 25
    //   159: iload 24
    //   161: ifeq +39 -> 200
    //   164: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   167: invokevirtual 330	android/content/ContextWrapper:getResources	()Landroid/content/res/Resources;
    //   170: iload 24
    //   172: invokevirtual 343	android/content/res/Resources:getString	(I)Ljava/lang/String;
    //   175: astore 25
    //   177: new 254	java/lang/StringBuilder
    //   180: dup
    //   181: ldc_w 345
    //   184: invokespecial 258	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   187: aload_0
    //   188: getfield 87	com/crashlytics/android/Crashlytics:l	Ljava/lang/String;
    //   191: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   194: invokevirtual 268	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   197: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   200: aload_0
    //   201: aload 25
    //   203: putfield 87	com/crashlytics/android/Crashlytics:l	Ljava/lang/String;
    //   206: new 347	java/io/File
    //   209: dup
    //   210: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   213: invokevirtual 351	android/content/Context:getFilesDir	()Ljava/io/File;
    //   216: ldc_w 353
    //   219: invokespecial 356	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   222: astore 26
    //   224: aload 26
    //   226: putstatic 358	com/crashlytics/android/Crashlytics:u	Ljava/io/File;
    //   229: aload 26
    //   231: invokevirtual 361	java/io/File:exists	()Z
    //   234: ifne +10 -> 244
    //   237: getstatic 358	com/crashlytics/android/Crashlytics:u	Ljava/io/File;
    //   240: invokevirtual 364	java/io/File:mkdirs	()Z
    //   243: pop
    //   244: aload_0
    //   245: new 366	com/crashlytics/android/IdManager
    //   248: dup
    //   249: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   252: invokespecial 367	com/crashlytics/android/IdManager:<init>	(Landroid/content/Context;)V
    //   255: putfield 56	com/crashlytics/android/Crashlytics:h	Lcom/crashlytics/android/IdManager;
    //   258: new 369	com/crashlytics/android/j
    //   261: dup
    //   262: aload_0
    //   263: getfield 87	com/crashlytics/android/Crashlytics:l	Ljava/lang/String;
    //   266: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   269: ldc_w 371
    //   272: iconst_1
    //   273: invokestatic 374	com/crashlytics/android/av:a	(Landroid/content/Context;Ljava/lang/String;Z)Z
    //   276: invokespecial 377	com/crashlytics/android/j:<init>	(Ljava/lang/String;Z)V
    //   279: aload_1
    //   280: getstatic 98	com/crashlytics/android/Crashlytics:o	Ljava/lang/String;
    //   283: invokevirtual 379	com/crashlytics/android/j:a	(Ljava/lang/String;Ljava/lang/String;)V
    //   286: iconst_1
    //   287: anewarray 4	java/lang/Object
    //   290: astore 7
    //   292: aload 7
    //   294: iconst_0
    //   295: getstatic 98	com/crashlytics/android/Crashlytics:o	Ljava/lang/String;
    //   298: aastore
    //   299: ldc_w 381
    //   302: aload 7
    //   304: invokestatic 385	java/lang/String:format	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    //   307: astore 8
    //   309: new 387	com/crashlytics/android/ab
    //   312: dup
    //   313: invokestatic 161	com/crashlytics/android/Crashlytics:j	()Ljava/lang/String;
    //   316: aload 8
    //   318: invokespecial 388	com/crashlytics/android/ab:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   321: astore 9
    //   323: new 390	com/crashlytics/android/Z
    //   326: dup
    //   327: invokespecial 391	com/crashlytics/android/Z:<init>	()V
    //   330: astore 10
    //   332: new 393	com/crashlytics/android/ap
    //   335: dup
    //   336: invokespecial 394	com/crashlytics/android/ap:<init>	()V
    //   339: astore 11
    //   341: new 396	com/crashlytics/android/m
    //   344: dup
    //   345: invokespecial 397	com/crashlytics/android/m:<init>	()V
    //   348: astore 12
    //   350: aload_0
    //   351: getfield 137	com/crashlytics/android/Crashlytics:m	Lcom/crashlytics/android/SettingsController;
    //   354: ifnonnull +74 -> 428
    //   357: getstatic 96	com/crashlytics/android/Crashlytics:s	Ljava/lang/String;
    //   360: getstatic 98	com/crashlytics/android/Crashlytics:o	Ljava/lang/String;
    //   363: invokestatic 400	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   366: astore 19
    //   368: iconst_1
    //   369: anewarray 85	java/lang/String
    //   372: astore 20
    //   374: aload 20
    //   376: iconst_0
    //   377: aload_0
    //   378: getfield 87	com/crashlytics/android/Crashlytics:l	Ljava/lang/String;
    //   381: aastore
    //   382: aload 20
    //   384: invokestatic 92	com/crashlytics/android/av:a	([Ljava/lang/String;)Ljava/lang/String;
    //   387: astore 21
    //   389: aload_0
    //   390: new 139	com/crashlytics/android/SettingsController
    //   393: dup
    //   394: new 402	com/crashlytics/android/aq
    //   397: dup
    //   398: getstatic 96	com/crashlytics/android/Crashlytics:s	Ljava/lang/String;
    //   401: aload 19
    //   403: aload 21
    //   405: getstatic 100	com/crashlytics/android/Crashlytics:r	Ljava/lang/String;
    //   408: getstatic 102	com/crashlytics/android/Crashlytics:q	Ljava/lang/String;
    //   411: invokespecial 405	com/crashlytics/android/aq:<init>	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    //   414: aload 10
    //   416: aload 11
    //   418: aload 12
    //   420: aload 9
    //   422: invokespecial 408	com/crashlytics/android/SettingsController:<init>	(Lcom/crashlytics/android/aq;Lcom/crashlytics/android/Z;Lcom/crashlytics/android/ap;Lcom/crashlytics/android/m;Lcom/crashlytics/android/as;)V
    //   425: putfield 137	com/crashlytics/android/Crashlytics:m	Lcom/crashlytics/android/SettingsController;
    //   428: ldc_w 410
    //   431: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   434: aload_0
    //   435: new 180	com/crashlytics/android/E
    //   438: dup
    //   439: invokestatic 416	java/lang/Thread:getDefaultUncaughtExceptionHandler	()Ljava/lang/Thread$UncaughtExceptionHandler;
    //   442: aload_0
    //   443: getfield 418	com/crashlytics/android/Crashlytics:d	Lcom/crashlytics/android/CrashlyticsListener;
    //   446: aload_0
    //   447: getfield 87	com/crashlytics/android/Crashlytics:l	Ljava/lang/String;
    //   450: invokespecial 421	com/crashlytics/android/E:<init>	(Ljava/lang/Thread$UncaughtExceptionHandler;Lcom/crashlytics/android/CrashlyticsListener;Ljava/lang/String;)V
    //   453: putfield 82	com/crashlytics/android/Crashlytics:e	Lcom/crashlytics/android/E;
    //   456: aload_0
    //   457: getfield 82	com/crashlytics/android/Crashlytics:e	Lcom/crashlytics/android/E;
    //   460: invokestatic 425	java/lang/Thread:setDefaultUncaughtExceptionHandler	(Ljava/lang/Thread$UncaughtExceptionHandler;)V
    //   463: ldc_w 427
    //   466: invokestatic 197	com/crashlytics/android/av:b	(Ljava/lang/String;)V
    //   469: new 347	java/io/File
    //   472: dup
    //   473: getstatic 358	com/crashlytics/android/Crashlytics:u	Ljava/io/File;
    //   476: ldc_w 429
    //   479: invokespecial 356	java/io/File:<init>	(Ljava/io/File;Ljava/lang/String;)V
    //   482: astore 13
    //   484: new 431	com/crashlytics/android/t
    //   487: dup
    //   488: aload_0
    //   489: aload_2
    //   490: fload_3
    //   491: aload 13
    //   493: invokespecial 434	com/crashlytics/android/t:<init>	(Lcom/crashlytics/android/Crashlytics;Landroid/content/Context;FLjava/io/File;)V
    //   496: astore 14
    //   498: aload 13
    //   500: invokevirtual 361	java/io/File:exists	()Z
    //   503: ifeq +38 -> 541
    //   506: aload_0
    //   507: aload_2
    //   508: fload_3
    //   509: invokespecial 245	com/crashlytics/android/Crashlytics:a	(Landroid/content/Context;F)V
    //   512: aload 13
    //   514: invokevirtual 437	java/io/File:delete	()Z
    //   517: pop
    //   518: goto -505 -> 13
    //   521: astore 4
    //   523: aload_0
    //   524: monitorexit
    //   525: aload 4
    //   527: athrow
    //   528: astore 6
    //   530: ldc_w 439
    //   533: aload 6
    //   535: invokestatic 202	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   538: goto -294 -> 244
    //   541: aload 13
    //   543: invokevirtual 442	java/io/File:createNewFile	()Z
    //   546: pop
    //   547: aload 14
    //   549: iconst_0
    //   550: anewarray 444	java/lang/Void
    //   553: invokevirtual 450	android/os/AsyncTask:execute	([Ljava/lang/Object;)Landroid/os/AsyncTask;
    //   556: pop
    //   557: goto -544 -> 13
    //   560: astore 15
    //   562: ldc_w 452
    //   565: aload 15
    //   567: invokestatic 202	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   570: goto -23 -> 547
    //
    // Exception table:
    //   from	to	target	type
    //   2	13	521	finally
    //   16	59	521	finally
    //   59	156	521	finally
    //   164	200	521	finally
    //   200	244	521	finally
    //   244	428	521	finally
    //   428	518	521	finally
    //   530	538	521	finally
    //   541	547	521	finally
    //   547	557	521	finally
    //   562	570	521	finally
    //   59	156	528	java/lang/Exception
    //   164	200	528	java/lang/Exception
    //   200	244	528	java/lang/Exception
    //   541	547	560	java/lang/Exception
  }

  static void a(boolean paramBoolean)
  {
    av.a().edit().putBoolean("always_send_reports_opt_in", true).commit();
  }

  private boolean a(i parami, ah paramah)
  {
    h localh = a(paramah);
    return new au(j(), parami.a()).a(localh);
  }

  private static String b(Context paramContext)
  {
    String str1;
    try
    {
      Context localContext = paramContext.getApplicationContext();
      String str2 = localContext.getPackageName();
      Bundle localBundle = localContext.getPackageManager().getApplicationInfo(str2, 128).metaData;
      if (localBundle != null)
      {
        String str3 = localBundle.getString("com.crashlytics.ApiKey");
        str1 = str3;
        if (av.c(str1))
        {
          int i1 = paramContext.getResources().getIdentifier("com.crashlytics.ApiKey", "string", o);
          if (i1 != 0)
            str1 = paramContext.getResources().getString(i1);
        }
        if (!av.c(str1))
          break label150;
        if ((!v) && (!av.c(paramContext)))
          break label143;
        throw new IllegalArgumentException("Crashlytics could not be initialized, API key missing from AndroidManifest.xml. Add the following tag to your Application element \n\t<meta-data android:name=\"com.crashlytics.ApiKey\" android:value=\"YOUR_API_KEY\"/>");
      }
    }
    catch (Exception localException)
    {
      while (true)
      {
        av.b("Caught non-fatal exception while retrieving apiKey: " + localException);
        str1 = null;
      }
      label143: av.a("Crashlytics could not be initialized, API key missing from AndroidManifest.xml. Add the following tag to your Application element \n\t<meta-data android:name=\"com.crashlytics.ApiKey\" android:value=\"YOUR_API_KEY\"/>", null);
    }
    label150: return str1;
  }

  static ContextWrapper c()
  {
    return n;
  }

  static String d()
  {
    return o;
  }

  static String e()
  {
    return r;
  }

  static String f()
  {
    return q;
  }

  static String g()
  {
    return s;
  }

  public static String getCrashlyticsVersion()
  {
    return "1.0.0.22";
  }

  public static Crashlytics getInstance()
  {
    try
    {
      if (b == null)
        b = new Crashlytics();
      Crashlytics localCrashlytics = b;
      return localCrashlytics;
    }
    finally
    {
    }
  }

  public static PinningInfoProvider getPinningInfoProvider()
  {
    return w;
  }

  static File h()
  {
    return u;
  }

  static String i()
  {
    return p;
  }

  static String j()
  {
    return av.a(n, "com.crashlytics.ApiEndpoint");
  }

  static boolean l()
  {
    return av.a().getBoolean("always_send_reports_opt_in", false);
  }

  public static void log(int paramInt, String paramString1, String paramString2)
  {
    log(paramString2);
    Log.println(paramInt, paramString1, paramString2);
  }

  public static void log(String paramString)
  {
    if ((b == null) || (b.e == null))
    {
      av.a("Crashlytics must be initialized by calling Crashlytics.start(Context) prior to logging messages.", null);
      return;
    }
    new Thread(new s(System.currentTimeMillis() - b.f, paramString), "Crashlytics Logger").start();
  }

  public static void logException(Throwable paramThrowable)
  {
    if ((b == null) || (b.e == null))
    {
      av.a("Crashlytics must be initialized by calling Crashlytics.start(Context) prior to logging exceptions.", null);
      return;
    }
    b.e.a(Thread.currentThread(), paramThrowable);
  }

  public static void setApplicationInstallationIdentifier(String paramString)
  {
    getInstance().a = a(paramString);
  }

  public static void setBool(String paramString, boolean paramBoolean)
  {
    setString(paramString, Boolean.toString(paramBoolean));
  }

  public static void setDouble(String paramString, double paramDouble)
  {
    setString(paramString, Double.toString(paramDouble));
  }

  public static void setFloat(String paramString, float paramFloat)
  {
    setString(paramString, Float.toString(paramFloat));
  }

  public static void setInt(String paramString, int paramInt)
  {
    setString(paramString, Integer.toString(paramInt));
  }

  public static void setLong(String paramString, long paramLong)
  {
    setString(paramString, Long.toString(paramLong));
  }

  public static void setPinningInfoProvider(PinningInfoProvider paramPinningInfoProvider)
  {
    if (w != paramPinningInfoProvider)
    {
      w = paramPinningInfoProvider;
      av.g();
    }
  }

  public static void setString(String paramString1, String paramString2)
  {
    if (paramString1 == null)
    {
      if ((n != null) && (av.c(n)))
        throw new IllegalArgumentException("Custom attribute key cannot be null.");
      av.a("Attempting to set custom attribute with null key, ignoring.", null);
      return;
    }
    String str1 = a(paramString1);
    if ((getInstance().g.size() < 64) || (getInstance().g.containsKey(str1)))
    {
      if (paramString2 == null);
      for (String str2 = ""; ; str2 = a(paramString2))
      {
        b.g.put(str1, str2);
        return;
      }
    }
    av.b("Exceeded maximum number of custom attributes (64)");
  }

  public static void setUserEmail(String paramString)
  {
    getInstance().j = a(paramString);
  }

  public static void setUserIdentifier(String paramString)
  {
    getInstance().i = a(paramString);
  }

  public static void setUserName(String paramString)
  {
    getInstance().k = a(paramString);
  }

  public static void start(Context paramContext)
  {
    start(paramContext, 1.0F);
  }

  public static void start(Context paramContext, float paramFloat)
  {
    if (paramContext == null)
      throw new IllegalArgumentException("context cannot be null.");
    String str = b(paramContext);
    if (str == null)
      return;
    try
    {
      getInstance().a(str, paramContext, paramFloat);
      return;
    }
    catch (CrashlyticsMissingDependencyException localCrashlyticsMissingDependencyException)
    {
      throw localCrashlyticsMissingDependencyException;
    }
    catch (Exception localException)
    {
      av.a("Crashlytics was not started due to an exception during initialization", localException);
    }
  }

  private boolean t()
  {
    synchronized (this.x)
    {
      this.c = this.m.a(SettingsController.CacheBehavior.SKIP_CACHE_LOOKUP);
      if (this.c == null)
        av.a("Failed to force reload of settings from Crashlytics.", null);
      if (this.c != null)
      {
        bool = true;
        return bool;
      }
      boolean bool = false;
    }
  }

  // ERROR //
  private static ah u()
  {
    // Byte code:
    //   0: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   3: invokevirtual 726	android/content/ContextWrapper:getApplicationContext	()Landroid/content/Context;
    //   6: invokevirtual 316	android/content/Context:getApplicationInfo	()Landroid/content/pm/ApplicationInfo;
    //   9: getfield 729	android/content/pm/ApplicationInfo:icon	I
    //   12: istore_3
    //   13: getstatic 248	com/crashlytics/android/Crashlytics:n	Landroid/content/ContextWrapper;
    //   16: invokevirtual 330	android/content/ContextWrapper:getResources	()Landroid/content/res/Resources;
    //   19: iload_3
    //   20: invokevirtual 733	android/content/res/Resources:openRawResource	(I)Ljava/io/InputStream;
    //   23: astore 4
    //   25: aload 4
    //   27: astore_1
    //   28: aload_1
    //   29: invokestatic 739	android/graphics/BitmapFactory:decodeStream	(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    //   32: astore 5
    //   34: aload 5
    //   36: invokestatic 742	com/crashlytics/android/av:a	(Landroid/graphics/Bitmap;)[B
    //   39: astore 6
    //   41: new 220	com/crashlytics/android/ah
    //   44: dup
    //   45: aload 6
    //   47: invokestatic 745	com/crashlytics/android/av:a	([B)Ljava/lang/String;
    //   50: aload 6
    //   52: aload 5
    //   54: invokevirtual 750	android/graphics/Bitmap:getWidth	()I
    //   57: aload 5
    //   59: invokevirtual 753	android/graphics/Bitmap:getHeight	()I
    //   62: invokespecial 756	com/crashlytics/android/ah:<init>	(Ljava/lang/String;[BII)V
    //   65: astore 7
    //   67: aload_1
    //   68: ldc_w 758
    //   71: invokestatic 761	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   74: aload 7
    //   76: areturn
    //   77: astore_2
    //   78: aconst_null
    //   79: astore_1
    //   80: ldc_w 763
    //   83: aload_2
    //   84: invokestatic 202	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   87: aload_1
    //   88: ldc_w 758
    //   91: invokestatic 761	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   94: aconst_null
    //   95: areturn
    //   96: astore_0
    //   97: aconst_null
    //   98: astore_1
    //   99: aload_1
    //   100: ldc_w 758
    //   103: invokestatic 761	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   106: aload_0
    //   107: athrow
    //   108: astore_0
    //   109: goto -10 -> 99
    //   112: astore_2
    //   113: goto -33 -> 80
    //
    // Exception table:
    //   from	to	target	type
    //   0	25	77	android/content/res/Resources$NotFoundException
    //   0	25	96	finally
    //   28	67	108	finally
    //   80	87	108	finally
    //   28	67	112	android/content/res/Resources$NotFoundException
  }

  final Map<String, String> a()
  {
    return Collections.unmodifiableMap(this.g);
  }

  final boolean a(Context paramContext)
  {
    return ((Boolean)a(new v(this, paramContext), Boolean.valueOf(true))).booleanValue();
  }

  final IdManager b()
  {
    return this.h;
  }

  public final void crash()
  {
    new CrashTest().indexOutOfBounds();
  }

  public final boolean getDebugMode()
  {
    return v;
  }

  final boolean k()
  {
    return ((Boolean)a(new u(this), Boolean.valueOf(false))).booleanValue();
  }

  final E m()
  {
    return this.e;
  }

  final String n()
  {
    if (this.h.a())
      return this.i;
    return null;
  }

  final String o()
  {
    if (this.h.a())
      return this.j;
    return null;
  }

  final String p()
  {
    if (this.h.a())
      return this.k;
    return null;
  }

  final Y q()
  {
    return (Y)a(new w(this), null);
  }

  final ar r()
  {
    return (ar)a(new x(this), null);
  }

  public final void setDebugMode(boolean paramBoolean)
  {
    v = paramBoolean;
  }

  public final void setListener(CrashlyticsListener paramCrashlyticsListener)
  {
    this.d = paramCrashlyticsListener;
  }

  public final boolean verifyPinning(URL paramURL)
  {
    if (w != null);
    while (true)
    {
      try
      {
        HttpRequest localHttpRequest = HttpRequest.a(paramURL);
        SSLSocketFactory localSSLSocketFactory = av.a(w);
        ((HttpsURLConnection)localHttpRequest.a()).setSSLSocketFactory(localSSLSocketFactory);
        int i1 = localHttpRequest.b();
        if ((i1 >= 200) && (i1 < 300))
        {
          bool = true;
          return bool;
        }
        bool = false;
        continue;
      }
      catch (Exception localException)
      {
        av.a("Could not verify SSL pinning", localException);
        return false;
      }
      boolean bool = false;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.Crashlytics
 * JD-Core Version:    0.6.2
 */