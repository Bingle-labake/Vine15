package com.crashlytics.android;

import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.hardware.SensorManager;
import android.os.Build;
import android.os.Debug;
import android.provider.Settings.Secure;
import android.util.Log;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FilenameFilter;
import java.io.Flushable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.security.GeneralSecurityException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Formatter;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;
import java.util.concurrent.locks.ReentrantLock;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

final class av
{
  public static final Comparator<File> a = new aw();
  private static SSLSocketFactory b;
  private static final ReentrantLock c = new ReentrantLock();

  public static float a(Context paramContext)
  {
    Intent localIntent = paramContext.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
    int i = localIntent.getIntExtra("level", -1);
    int j = localIntent.getIntExtra("scale", -1);
    return i / j;
  }

  public static int a(boolean paramBoolean)
  {
    float f = a(Crashlytics.c());
    if (!paramBoolean)
      return 1;
    if ((paramBoolean) && (f >= 99.0D))
      return 3;
    if ((paramBoolean) && (f < 99.0D))
      return 2;
    return 0;
  }

  public static ActivityManager.RunningAppProcessInfo a(String paramString, Context paramContext)
  {
    List localList = ((ActivityManager)paramContext.getSystemService("activity")).getRunningAppProcesses();
    if (localList != null)
    {
      Iterator localIterator = localList.iterator();
      while (localIterator.hasNext())
      {
        ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)localIterator.next();
        if (localRunningAppProcessInfo.processName.equals(paramString))
          return localRunningAppProcessInfo;
      }
    }
    return null;
  }

  public static SharedPreferences a()
  {
    return Crashlytics.c().getSharedPreferences("com.crashlytics.prefs", 0);
  }

  public static String a(Context paramContext, String paramString)
  {
    int i = paramContext.getResources().getIdentifier(paramString, "string", paramContext.getPackageName());
    if (i > 0)
      return paramContext.getString(i);
    return "";
  }

  // ERROR //
  private static String a(File paramFile, String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 140	java/io/File:exists	()Z
    //   4: istore_2
    //   5: aconst_null
    //   6: astore_3
    //   7: iload_2
    //   8: ifeq +80 -> 88
    //   11: new 142	java/io/BufferedReader
    //   14: dup
    //   15: new 144	java/io/FileReader
    //   18: dup
    //   19: aload_0
    //   20: invokespecial 147	java/io/FileReader:<init>	(Ljava/io/File;)V
    //   23: sipush 1024
    //   26: invokespecial 150	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
    //   29: astore 4
    //   31: aload 4
    //   33: invokevirtual 153	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   36: astore 7
    //   38: aconst_null
    //   39: astore_3
    //   40: aload 7
    //   42: ifnull +39 -> 81
    //   45: ldc 155
    //   47: invokestatic 161	java/util/regex/Pattern:compile	(Ljava/lang/String;)Ljava/util/regex/Pattern;
    //   50: aload 7
    //   52: iconst_2
    //   53: invokevirtual 165	java/util/regex/Pattern:split	(Ljava/lang/CharSequence;I)[Ljava/lang/String;
    //   56: astore 8
    //   58: aload 8
    //   60: arraylength
    //   61: iconst_1
    //   62: if_icmple -31 -> 31
    //   65: aload 8
    //   67: iconst_0
    //   68: aaload
    //   69: aload_1
    //   70: invokevirtual 100	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   73: ifeq -42 -> 31
    //   76: aload 8
    //   78: iconst_1
    //   79: aaload
    //   80: astore_3
    //   81: aload 4
    //   83: ldc 167
    //   85: invokestatic 170	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   88: aload_3
    //   89: areturn
    //   90: astore 5
    //   92: aconst_null
    //   93: astore 4
    //   95: new 172	java/lang/StringBuilder
    //   98: dup
    //   99: ldc 174
    //   101: invokespecial 175	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   104: aload_0
    //   105: invokevirtual 179	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   108: invokevirtual 182	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   111: aload 5
    //   113: invokestatic 185	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   116: aload 4
    //   118: ldc 167
    //   120: invokestatic 170	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   123: aconst_null
    //   124: areturn
    //   125: astore 9
    //   127: aconst_null
    //   128: astore 4
    //   130: aload 9
    //   132: astore 6
    //   134: aload 4
    //   136: ldc 167
    //   138: invokestatic 170	com/crashlytics/android/av:a	(Ljava/io/Closeable;Ljava/lang/String;)V
    //   141: aload 6
    //   143: athrow
    //   144: astore 6
    //   146: goto -12 -> 134
    //   149: astore 5
    //   151: goto -56 -> 95
    //
    // Exception table:
    //   from	to	target	type
    //   11	31	90	java/lang/Exception
    //   11	31	125	finally
    //   31	38	144	finally
    //   45	81	144	finally
    //   95	116	144	finally
    //   31	38	149	java/lang/Exception
    //   45	81	149	java/lang/Exception
  }

  public static String a(InputStream paramInputStream)
    throws IOException
  {
    Scanner localScanner = new Scanner(paramInputStream).useDelimiter("\\A");
    if (localScanner.hasNext())
      return localScanner.next();
    return "";
  }

  public static String a(String paramString)
  {
    return a(paramString.getBytes(), "SHA-1");
  }

  // ERROR //
  public static String a(String paramString1, String paramString2)
  {
    // Byte code:
    //   0: aload_1
    //   1: ldc 217
    //   3: new 219	java/lang/StringBuffer
    //   6: dup
    //   7: new 96	java/lang/String
    //   10: dup
    //   11: iconst_3
    //   12: newarray char
    //   14: dup
    //   15: iconst_0
    //   16: ldc 220
    //   18: castore
    //   19: dup
    //   20: iconst_1
    //   21: ldc 221
    //   23: castore
    //   24: dup
    //   25: iconst_2
    //   26: ldc 222
    //   28: castore
    //   29: invokespecial 225	java/lang/String:<init>	([C)V
    //   32: invokespecial 226	java/lang/StringBuffer:<init>	(Ljava/lang/String;)V
    //   35: invokevirtual 230	java/lang/StringBuffer:reverse	()Ljava/lang/StringBuffer;
    //   38: invokevirtual 231	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   41: invokevirtual 234	java/lang/String:replaceAll	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   44: astore 4
    //   46: iconst_1
    //   47: new 172	java/lang/StringBuilder
    //   50: dup
    //   51: invokespecial 235	java/lang/StringBuilder:<init>	()V
    //   54: aload_0
    //   55: invokevirtual 238	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   58: aload 4
    //   60: invokevirtual 238	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   63: invokevirtual 182	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   66: invokestatic 240	com/crashlytics/android/av:a	(Ljava/lang/String;)Ljava/lang/String;
    //   69: invokestatic 243	com/crashlytics/android/av:a	(ILjava/lang/String;)Ljavax/crypto/Cipher;
    //   72: astore 5
    //   74: new 245	org/json/JSONObject
    //   77: dup
    //   78: invokespecial 246	org/json/JSONObject:<init>	()V
    //   81: astore 6
    //   83: invokestatic 250	com/crashlytics/android/Crashlytics:getInstance	()Lcom/crashlytics/android/Crashlytics;
    //   86: invokevirtual 253	com/crashlytics/android/Crashlytics:b	()Lcom/crashlytics/android/IdManager;
    //   89: astore 7
    //   91: aload 6
    //   93: ldc 255
    //   95: invokevirtual 258	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   98: aload 7
    //   100: invokevirtual 262	com/crashlytics/android/IdManager:b	()Ljava/lang/String;
    //   103: invokevirtual 266	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   106: pop
    //   107: aload 7
    //   109: invokevirtual 270	com/crashlytics/android/IdManager:f	()Ljava/util/Map;
    //   112: invokeinterface 276 1 0
    //   117: invokeinterface 279 1 0
    //   122: astore 9
    //   124: aload 9
    //   126: invokeinterface 84 1 0
    //   131: ifeq +112 -> 243
    //   134: aload 9
    //   136: invokeinterface 88 1 0
    //   141: checkcast 281	java/util/Map$Entry
    //   144: astore 16
    //   146: aload 6
    //   148: aload 16
    //   150: invokeinterface 284 1 0
    //   155: checkcast 286	com/crashlytics/android/IdManager$DeviceIdentifierType
    //   158: invokevirtual 289	com/crashlytics/android/IdManager$DeviceIdentifierType:name	()Ljava/lang/String;
    //   161: invokevirtual 258	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   164: aload 16
    //   166: invokeinterface 292 1 0
    //   171: invokevirtual 266	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   174: pop
    //   175: goto -51 -> 124
    //   178: astore 17
    //   180: new 172	java/lang/StringBuilder
    //   183: dup
    //   184: ldc_w 294
    //   187: invokespecial 175	java/lang/StringBuilder:<init>	(Ljava/lang/String;)V
    //   190: aload 16
    //   192: invokeinterface 284 1 0
    //   197: checkcast 286	com/crashlytics/android/IdManager$DeviceIdentifierType
    //   200: invokevirtual 289	com/crashlytics/android/IdManager$DeviceIdentifierType:name	()Ljava/lang/String;
    //   203: invokevirtual 238	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   206: invokevirtual 182	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   209: aload 17
    //   211: invokestatic 185	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   214: goto -90 -> 124
    //   217: astore_2
    //   218: ldc_w 296
    //   221: aload_2
    //   222: invokestatic 185	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   225: ldc 132
    //   227: astore_3
    //   228: aload_3
    //   229: areturn
    //   230: astore 8
    //   232: ldc_w 298
    //   235: aload 8
    //   237: invokestatic 185	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   240: goto -133 -> 107
    //   243: aload 6
    //   245: ldc_w 300
    //   248: aload 7
    //   250: invokevirtual 302	com/crashlytics/android/IdManager:c	()Ljava/lang/String;
    //   253: invokevirtual 266	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   256: pop
    //   257: aload 6
    //   259: ldc_w 304
    //   262: aload 7
    //   264: invokevirtual 307	com/crashlytics/android/IdManager:d	()Ljava/lang/String;
    //   267: invokevirtual 266	org/json/JSONObject:put	(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   270: pop
    //   271: ldc 132
    //   273: astore_3
    //   274: aload 6
    //   276: invokevirtual 311	org/json/JSONObject:length	()I
    //   279: ifle -51 -> 228
    //   282: aload 5
    //   284: aload 6
    //   286: invokevirtual 312	org/json/JSONObject:toString	()Ljava/lang/String;
    //   289: invokevirtual 207	java/lang/String:getBytes	()[B
    //   292: invokevirtual 318	javax/crypto/Cipher:doFinal	([B)[B
    //   295: invokestatic 321	com/crashlytics/android/av:b	([B)Ljava/lang/String;
    //   298: astore 13
    //   300: aload 13
    //   302: areturn
    //   303: astore 10
    //   305: ldc_w 323
    //   308: aload 10
    //   310: invokestatic 185	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   313: goto -56 -> 257
    //   316: astore 11
    //   318: ldc_w 325
    //   321: aload 11
    //   323: invokestatic 185	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   326: goto -55 -> 271
    //   329: astore 12
    //   331: ldc_w 327
    //   334: aload 12
    //   336: invokestatic 185	com/crashlytics/android/av:a	(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   339: aload_3
    //   340: areturn
    //
    // Exception table:
    //   from	to	target	type
    //   146	175	178	java/lang/Exception
    //   0	74	217	java/security/GeneralSecurityException
    //   91	107	230	java/lang/Exception
    //   243	257	303	java/lang/Exception
    //   257	271	316	java/lang/Exception
    //   282	300	329	java/security/GeneralSecurityException
  }

  public static String a(byte[] paramArrayOfByte)
  {
    return a(paramArrayOfByte, "MD5");
  }

  private static String a(byte[] paramArrayOfByte, String paramString)
  {
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance(paramString);
      localMessageDigest.update(paramArrayOfByte);
      return b(localMessageDigest.digest());
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      a("Could not create hashing algorithm: " + paramString + ", returning empty string.", localNoSuchAlgorithmException);
    }
    return "";
  }

  public static String a(String[] paramArrayOfString)
  {
    if ((paramArrayOfString == null) || (paramArrayOfString.length == 0))
      return null;
    ArrayList localArrayList = new ArrayList();
    int i = paramArrayOfString.length;
    for (int j = 0; j < i; j++)
    {
      String str2 = paramArrayOfString[j];
      if (str2 != null)
        localArrayList.add(str2);
    }
    Collections.sort(localArrayList);
    StringBuilder localStringBuilder = new StringBuilder();
    Iterator localIterator = localArrayList.iterator();
    while (localIterator.hasNext())
      localStringBuilder.append((String)localIterator.next());
    String str1 = localStringBuilder.toString();
    if (str1.length() > 0)
      return a(str1);
    return null;
  }

  private static Cipher a(int paramInt, String paramString)
    throws InvalidKeyException
  {
    if (paramString.length() < 32)
      throw new InvalidKeyException("Key must be at least 32 bytes.");
    SecretKeySpec localSecretKeySpec = new SecretKeySpec(paramString.getBytes(), 0, 32, "AES/ECB/PKCS7Padding");
    try
    {
      Cipher localCipher = Cipher.getInstance("AES/ECB/PKCS7Padding");
      localCipher.init(1, localSecretKeySpec);
      return localCipher;
    }
    catch (GeneralSecurityException localGeneralSecurityException)
    {
      a("Could not create Cipher for AES/ECB/PKCS7Padding - should never happen.", localGeneralSecurityException);
      throw new RuntimeException(localGeneralSecurityException);
    }
  }

  public static SSLSocketFactory a(PinningInfoProvider paramPinningInfoProvider)
  {
    if (b == null)
    {
      c.lock();
      if (b != null)
      {
        c.unlock();
        return b;
      }
    }
    try
    {
      SSLContext localSSLContext = SSLContext.getInstance("TLS");
      localSSLContext.init(null, new TrustManager[] { new ai(new at(paramPinningInfoProvider.getKeyStoreStream(), paramPinningInfoProvider.getKeyStorePassword()), paramPinningInfoProvider.getPins()) }, null);
      b = localSSLContext.getSocketFactory();
      b("Custom SSL pinning enabled");
      return b;
    }
    catch (Exception localException)
    {
      while (true)
      {
        a("Exception while validating pinned certs", localException);
        c.unlock();
      }
    }
    finally
    {
      c.unlock();
    }
  }

  public static void a(Closeable paramCloseable, String paramString)
  {
    if (paramCloseable != null);
    try
    {
      paramCloseable.close();
      return;
    }
    catch (IOException localIOException)
    {
      a(paramString, localIOException);
    }
  }

  public static void a(File paramFile, FilenameFilter paramFilenameFilter, int paramInt, Comparator<File> paramComparator)
  {
    File[] arrayOfFile = paramFile.listFiles(paramFilenameFilter);
    int i;
    int j;
    if ((arrayOfFile != null) && (arrayOfFile.length > paramInt))
    {
      Arrays.sort(arrayOfFile, paramComparator);
      i = arrayOfFile.length;
      j = arrayOfFile.length;
    }
    for (int k = 0; ; k++)
    {
      File localFile;
      if (k < j)
      {
        localFile = arrayOfFile[k];
        if (i > paramInt);
      }
      else
      {
        return;
      }
      localFile.delete();
      i--;
    }
  }

  public static void a(Flushable paramFlushable, String paramString)
  {
    if (paramFlushable != null);
    try
    {
      paramFlushable.flush();
      return;
    }
    catch (IOException localIOException)
    {
      a(paramString, localIOException);
    }
  }

  public static void a(String paramString, Throwable paramThrowable)
  {
    if (Crashlytics.getInstance().getDebugMode())
    {
      Log.e("Crashlytics", paramString, paramThrowable);
      return;
    }
    if (paramThrowable != null)
      paramString = paramString + "; [" + paramThrowable.getClass() + ": " + paramThrowable.getLocalizedMessage() + "]";
    Log.e("Crashlytics", paramString, null);
  }

  public static boolean a(Context paramContext, String paramString, boolean paramBoolean)
  {
    int i = paramContext.getResources().getIdentifier(paramString, "string", paramContext.getPackageName());
    if (i > 0)
      return Boolean.parseBoolean(paramContext.getString(i));
    return true;
  }

  public static byte[] a(Bitmap paramBitmap)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    paramBitmap.compress(Bitmap.CompressFormat.PNG, 100, localByteArrayOutputStream);
    return localByteArrayOutputStream.toByteArray();
  }

  public static Object[] a(int paramInt)
  {
    try
    {
      String[] arrayOfString1 = c(paramInt);
      if (arrayOfString1 != null)
      {
        int i = Integer.parseInt(arrayOfString1[2]);
        String[] arrayOfString2 = c(i);
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = Integer.valueOf(i);
        arrayOfObject[1] = arrayOfString2[(-1 + arrayOfString2.length)];
        return arrayOfObject;
      }
    }
    catch (Exception localException)
    {
      a("createProcBuilder() error getting parent process info", localException);
    }
    return null;
  }

  public static String b()
  {
    String str = a(new File("/proc/cpuinfo"), "Processor");
    if ((str == null) || (str.length() == 0))
      str = "unknown";
    return str;
  }

  public static String b(int paramInt)
  {
    if (paramInt < 0)
      throw new IllegalArgumentException("value must be zero or greater");
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(paramInt);
    return String.format("%1$10s", arrayOfObject).replace(' ', '0');
  }

  public static String b(byte[] paramArrayOfByte)
  {
    Formatter localFormatter = new Formatter();
    int i = paramArrayOfByte.length;
    for (int j = 0; j < i; j++)
    {
      byte b1 = paramArrayOfByte[j];
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Byte.valueOf(b1);
      localFormatter.format("%02x", arrayOfObject);
    }
    String str = localFormatter.toString();
    localFormatter.close();
    return str;
  }

  public static void b(String paramString)
  {
    if (Crashlytics.getInstance().getDebugMode())
      Log.d("Crashlytics", paramString);
  }

  public static boolean b(Context paramContext)
  {
    if (d())
      return false;
    return ((SensorManager)paramContext.getSystemService("sensor")).getDefaultSensor(8) != null;
  }

  public static long c()
  {
    long l = 0L;
    String str1 = a(new File("/proc/meminfo"), "MemTotal");
    if ((str1 == null) || (str1.length() == 0))
      return l;
    String str2 = str1.toUpperCase();
    if (str2.endsWith("KB"))
      l = Long.parseLong(str2.split("KB")[0].trim());
    while (true)
    {
      return l << 10;
      if (str2.endsWith("GB"))
        l = Long.parseLong(str2.toUpperCase().split("GB")[0].trim()) << 10;
      else
        b("Unexpected meminfo format while computing RAM: " + str2);
    }
  }

  public static boolean c(Context paramContext)
  {
    return (0x2 & paramContext.getApplicationInfo().flags) != 0;
  }

  public static boolean c(String paramString)
  {
    return (paramString == null) || (paramString.length() == 0);
  }

  private static String[] c(int paramInt)
  {
    try
    {
      BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec("ps -p " + paramInt).getInputStream()), 1024);
      localBufferedReader.readLine();
      String[] arrayOfString = localBufferedReader.readLine().split("\\s\\s*");
      return arrayOfString;
    }
    catch (Exception localException)
    {
      a("getPsResult failed for pid " + paramInt, localException);
    }
    return null;
  }

  public static boolean d()
  {
    String str = Settings.Secure.getString(Crashlytics.c().getContentResolver(), "android_id");
    return ("sdk".equals(Build.PRODUCT)) || ("google_sdk".equals(Build.PRODUCT)) || (str == null);
  }

  public static boolean e()
  {
    boolean bool = d();
    String str = Build.TAGS;
    if ((!bool) && (str != null) && (str.contains("test-keys")));
    File localFile;
    do
    {
      do
        return true;
      while (new File("/system/app/Superuser.apk").exists());
      localFile = new File("/system/xbin/su");
    }
    while ((!bool) && (localFile.exists()));
    return false;
  }

  public static int f()
  {
    if (d());
    for (int i = 1; ; i = 0)
    {
      if (e())
        i |= 2;
      int j;
      if (!Debug.isDebuggerConnected())
      {
        boolean bool = Debug.waitingForDebugger();
        j = 0;
        if (!bool);
      }
      else
      {
        j = 1;
      }
      if (j != 0)
        i |= 4;
      return i;
    }
  }

  static void g()
  {
    c.lock();
    b = null;
    c.unlock();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.crashlytics.android.av
 * JD-Core Version:    0.6.2
 */