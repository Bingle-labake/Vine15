package com.flurry.android;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.location.Criteria;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.SystemClock;
import android.telephony.TelephonyManager;
import android.util.Log;
import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.TimeZone;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public final class FlurryAgent
  implements LocationListener
{
  private static long aA = 10000L;
  private static boolean aB = true;
  private static boolean aC = false;
  private static boolean aD = false;
  private static boolean aE = true;
  private static Criteria aF = null;
  private static AtomicInteger aH = new AtomicInteger(0);
  private static AtomicInteger aI = new AtomicInteger(0);
  private static final String[] av = { "9774d56d682e549c", "dead00beef" };
  private static volatile String aw = null;
  private static volatile String ax = "http://data.flurry.com/aap.do";
  private static volatile String ay = "https://data.flurry.com/aap.do";
  static FlurryAgent az = new FlurryAgent();
  FlurryAds Q = FlurryAds.getInstance();
  private final Handler aG;
  private File aJ;
  private File aK = null;
  private File aL = null;
  private volatile boolean aM = false;
  private volatile boolean aN = false;
  private long aO;
  private Map<Context, Context> aP = new WeakHashMap();
  private String aQ;
  private String aR;
  private String aS;
  private boolean aT = true;
  private List<byte[]> aU;
  private LocationManager aV;
  private String aW;
  private Map<Integer, ByteBuffer> aX = new HashMap();
  private boolean aY;
  private long aZ;
  private List<byte[]> ba = new ArrayList();
  private long bb;
  private long bc;
  private long bd;
  private String be = "";
  private String bf = "";
  private byte bg = -1;
  private String bh = "";
  private byte bi = -1;
  private Long bj;
  private int bk;
  private Location bl;
  private Map<String, i> bm = new HashMap();
  private List<bs> bn = new ArrayList();
  private boolean bo;
  private int bp;
  private List<ci> bq = new ArrayList();
  private int br;
  private Map<String, List<String>> bs;
  private Map<String, List<String>> bt;

  private FlurryAgent()
  {
    HandlerThread localHandlerThread = new HandlerThread("FlurryAgent");
    localHandlerThread.start();
    this.aG = new Handler(localHandlerThread.getLooper());
  }

  private static double a(double paramDouble)
  {
    return Math.round(paramDouble * 1000.0D) / 1000.0D;
  }

  // ERROR //
  private static String a(File paramFile)
  {
    // Byte code:
    //   0: new 218	java/io/FileInputStream
    //   3: dup
    //   4: aload_0
    //   5: invokespecial 221	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   8: astore_1
    //   9: new 223	java/lang/StringBuffer
    //   12: dup
    //   13: invokespecial 224	java/lang/StringBuffer:<init>	()V
    //   16: astore_2
    //   17: sipush 1024
    //   20: newarray byte
    //   22: astore 6
    //   24: aload_1
    //   25: aload 6
    //   27: invokevirtual 228	java/io/FileInputStream:read	([B)I
    //   30: istore 7
    //   32: iload 7
    //   34: ifle +54 -> 88
    //   37: aload_2
    //   38: new 86	java/lang/String
    //   41: dup
    //   42: aload 6
    //   44: iconst_0
    //   45: iload 7
    //   47: invokespecial 231	java/lang/String:<init>	([BII)V
    //   50: invokevirtual 235	java/lang/StringBuffer:append	(Ljava/lang/String;)Ljava/lang/StringBuffer;
    //   53: pop
    //   54: goto -30 -> 24
    //   57: astore 4
    //   59: ldc 186
    //   61: ldc 237
    //   63: aload 4
    //   65: invokestatic 243	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   68: aload_1
    //   69: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   72: aconst_null
    //   73: astore 5
    //   75: aload_2
    //   76: ifnull +9 -> 85
    //   79: aload_2
    //   80: invokevirtual 252	java/lang/StringBuffer:toString	()Ljava/lang/String;
    //   83: astore 5
    //   85: aload 5
    //   87: areturn
    //   88: aload_1
    //   89: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   92: goto -20 -> 72
    //   95: astore 9
    //   97: aconst_null
    //   98: astore_1
    //   99: aload 9
    //   101: astore_3
    //   102: aload_1
    //   103: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
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

  private void a(Context paramContext, String paramString)
  {
    while (true)
    {
      try
      {
        if ((this.aQ != null) && (!this.aQ.equals(paramString)))
          db.d("FlurryAgent", "onStartSession called with different api keys: " + this.aQ + " and " + paramString);
        if ((Context)this.aP.put(paramContext, paramContext) != null)
          db.g("FlurryAgent", "onStartSession called with duplicate context, use a specific Activity or Service as context instead of using a global context");
        if (this.aM)
          break label745;
        db.c("FlurryAgent", "Initializing Flurry session");
        this.aQ = paramString;
        this.aK = paramContext.getFileStreamPath(".flurryagent." + Integer.toString(this.aQ.hashCode(), 16));
        this.aJ = paramContext.getFileStreamPath(".flurryb.");
        this.aL = paramContext.getFileStreamPath(".flurryinstallreceiver.");
        if (aE)
          Thread.setDefaultUncaughtExceptionHandler(new FlurryAgent.FlurryDefaultExceptionHandler());
        Context localContext = paramContext.getApplicationContext();
        if (this.aS == null)
          this.aS = d(localContext);
        String str1 = localContext.getPackageName();
        if ((this.aR != null) && (!this.aR.equals(str1)))
          db.d("FlurryAgent", "onStartSession called from different application packages: " + this.aR + " and " + str1);
        this.aR = str1;
        long l = SystemClock.elapsedRealtime();
        if (l - this.aO <= aA)
          break;
        db.c("FlurryAgent", "New session");
        this.bb = System.currentTimeMillis();
        this.bc = l;
        this.bd = -1L;
        this.bh = "";
        this.bk = 0;
        this.bl = null;
        this.bf = TimeZone.getDefault().getID();
        this.be = (Locale.getDefault().getLanguage() + "_" + Locale.getDefault().getCountry());
        this.bm = new HashMap();
        this.bn = new ArrayList();
        this.bo = true;
        this.bq = new ArrayList();
        this.bp = 0;
        this.br = 0;
        aH.set(0);
        aI.set(0);
        if (n())
          this.Q.a(paramContext, this.bb, this.bc);
        a(new d(this, localContext, this.aT));
        if (!(paramContext instanceof Activity))
          break label740;
        Bundle localBundle = ((Activity)paramContext).getIntent().getExtras();
        if (localBundle == null)
          break label740;
        new StringBuilder().append("Launch Options Bundle is present ").append(localBundle.toString()).toString();
        this.bt = new HashMap();
        Iterator localIterator = localBundle.keySet().iterator();
        if (!localIterator.hasNext())
          break label740;
        String str2 = (String)localIterator.next();
        if (str2 == null)
          continue;
        Object localObject2 = localBundle.get(str2);
        if (localObject2 != null)
        {
          str3 = localObject2.toString();
          this.bt.put(str2, new ArrayList(Arrays.asList(new String[] { str3 })));
          new StringBuilder().append("Launch options Key: ").append(str2).append(". Its value: ").append(str3).toString();
          continue;
        }
      }
      finally
      {
      }
      String str3 = "null";
    }
    db.c("FlurryAgent", "Continuing previous session");
    if (!this.ba.isEmpty())
      this.ba.remove(-1 + this.ba.size());
    if (n())
      this.Q.J();
    label740: this.aM = true;
    label745:
  }

  private void a(Context paramContext, boolean paramBoolean)
  {
    if (paramContext != null);
    try
    {
      if ((Context)this.aP.remove(paramContext) == null)
        db.g("FlurryAgent", "onEndSession called without context from corresponding onStartSession");
      if ((this.aM) && (this.aP.isEmpty()))
      {
        db.c("FlurryAgent", "Ending session");
        v();
        if (paramContext != null)
          break label203;
      }
      label203: Context localContext;
      for (Object localObject2 = null; ; localObject2 = localContext)
      {
        if (paramContext != null)
        {
          String str = ((Context)localObject2).getPackageName();
          if (!this.aR.equals(str))
            db.d("FlurryAgent", "onEndSession called from different application package, expected: " + this.aR + " actual: " + str);
        }
        long l = SystemClock.elapsedRealtime();
        this.aO = l;
        this.bd = (l - this.bc);
        if (id() == null)
          db.d("FlurryAgent", "Not creating report because of bad Android ID or generated ID is null");
        a(new a(this, paramBoolean, (Context)localObject2));
        if (n())
          this.Q.K();
        this.aM = false;
        return;
        localContext = paramContext.getApplicationContext();
      }
    }
    finally
    {
    }
  }

  private void a(bk parambk)
  {
    this.aG.post(parambk);
  }

  private void a(DataInputStream paramDataInputStream)
    throws IOException
  {
    int i = 0;
    int j;
    try
    {
      j = paramDataInputStream.readUnsignedShort();
      if (j > 2)
      {
        db.d("FlurryAgent", "Unknown agent file version: " + j);
        throw new IOException("Unknown agent file version: " + j);
      }
    }
    finally
    {
    }
    String str1;
    if (j >= 2)
    {
      str1 = paramDataInputStream.readUTF();
      db.c("FlurryAgent", "Loading API key: " + f(this.aQ));
      if (str1.equals(this.aQ))
      {
        String str2 = paramDataInputStream.readUTF();
        if (id() == null)
          db.c("FlurryAgent", "Loading phoneId: " + str2);
        g(str2);
        this.aY = paramDataInputStream.readBoolean();
        this.aZ = paramDataInputStream.readLong();
        db.c("FlurryAgent", "Loading session reports");
        while (true)
        {
          int k = paramDataInputStream.readUnsignedShort();
          if (k == 0)
            break;
          byte[] arrayOfByte = new byte[k];
          paramDataInputStream.readFully(arrayOfByte);
          this.ba.add(0, arrayOfByte);
          StringBuilder localStringBuilder = new StringBuilder().append("Session report added: ");
          i++;
          db.c("FlurryAgent", i);
        }
        db.c("FlurryAgent", "Persistent file loaded");
        this.aN = true;
      }
    }
    while (true)
    {
      return;
      db.c("FlurryAgent", "Api keys do not match, old: " + f(str1) + ", new: " + f(this.aQ));
      continue;
      db.g("FlurryAgent", "Deleting old file version: " + j);
    }
  }

  private void a(String paramString1, String paramString2, String paramString3, Throwable paramThrowable)
  {
    label293: 
    while (true)
    {
      try
      {
        if (this.bq == null)
        {
          db.d("FlurryAgent", "onError called before onStartSession.  Error: " + paramString1);
          return;
        }
        if ((paramString1 != null) && ("uncaught".equals(paramString1)))
        {
          i = 1;
          this.bk = (1 + this.bk);
          if (this.bq.size() >= 50)
            break label168;
          Long localLong2 = Long.valueOf(System.currentTimeMillis());
          ci localci3 = new ci(aI.incrementAndGet(), localLong2.longValue(), paramString1, paramString2, paramString3, paramThrowable);
          this.bq.add(localci3);
          db.c("FlurryAgent", "Error logged: " + localci3.am());
          continue;
        }
      }
      finally
      {
      }
      int i = 0;
      continue;
      label168: if (i != 0);
      for (int j = 0; ; j++)
      {
        if (j >= this.bq.size())
          break label293;
        ci localci1 = (ci)this.bq.get(j);
        if ((localci1.am() != null) && (!"uncaught".equals(localci1.am())))
        {
          Long localLong1 = Long.valueOf(System.currentTimeMillis());
          ci localci2 = new ci(aI.incrementAndGet(), localLong1.longValue(), paramString1, paramString2, paramString3, paramThrowable);
          this.bq.set(j, localci2);
          break;
          db.c("FlurryAgent", "Max errors logged. No more errors logged.");
          break;
        }
      }
    }
  }

  private void a(String paramString, Map<String, String> paramMap, boolean paramBoolean)
  {
    while (true)
    {
      long l;
      String str;
      i locali1;
      Object localObject2;
      try
      {
        if (this.bn == null)
        {
          db.d("FlurryAgent", "onEvent called before onStartSession.  Event: " + paramString);
          return;
        }
        l = SystemClock.elapsedRealtime() - this.bc;
        str = bd.sanitize(paramString);
        if (str.length() == 0)
          continue;
        locali1 = (i)this.bm.get(str);
        if (locali1 != null)
          break label273;
        if (this.bm.size() < 100)
        {
          i locali2 = new i();
          locali2.value = 1;
          this.bm.put(str, locali2);
          db.c("FlurryAgent", "Event count incremented: " + str);
          if ((!aB) || (this.bn.size() >= 1000) || (this.bp >= 160000))
            break label380;
          if (paramMap != null)
            break label388;
          localObject2 = Collections.emptyMap();
          if (((Map)localObject2).size() <= 10)
            break label288;
          db.g("FlurryAgent", "MaxEventParams exceeded: " + ((Map)localObject2).size());
          continue;
        }
      }
      finally
      {
      }
      db.g("FlurryAgent", "Too many different events. Event not counted: " + str);
      continue;
      label273: locali1.value = (1 + locali1.value);
      continue;
      label288: bs localbs = new bs(aH.incrementAndGet(), str, (Map)localObject2, l, paramBoolean);
      if (localbs.getBytes().length + this.bp <= 160000)
      {
        this.bn.add(localbs);
        this.bp += localbs.getBytes().length;
      }
      else
      {
        this.bp = 160000;
        this.bo = false;
        db.g("FlurryAgent", "Event Log size exceeded. No more event details logged.");
        continue;
        label380: this.bo = false;
        continue;
        label388: localObject2 = paramMap;
      }
    }
  }

  private boolean a(byte[] paramArrayOfByte)
    throws IOException
  {
    String str1 = r();
    boolean bool1;
    if (str1 == null)
      bool1 = false;
    while (true)
    {
      return bool1;
      try
      {
        boolean bool3 = a(paramArrayOfByte, str1);
        bool1 = bool3;
        if ((bool1) || (aw != null) || (!aC) || (aD));
      }
      catch (Exception localException1)
      {
        String str2;
        synchronized (az)
        {
          while (true)
          {
            aD = true;
            str2 = r();
            if (str2 != null)
              break;
            return false;
            localException1 = localException1;
            db.c("FlurryAgent", "Sending report exception: " + localException1.getMessage());
            bool1 = false;
          }
        }
        try
        {
          boolean bool2 = a(paramArrayOfByte, str2);
          return bool2;
          localObject = finally;
          throw localObject;
        }
        catch (Exception localException2)
        {
        }
      }
    }
    return bool1;
  }

  private boolean a(byte[] paramArrayOfByte, String paramString)
    throws IOException
  {
    boolean bool = true;
    if ("local".equals(paramString))
      return bool;
    db.c("FlurryAgent", "Sending report to: " + paramString);
    ByteArrayEntity localByteArrayEntity = new ByteArrayEntity(paramArrayOfByte);
    localByteArrayEntity.setContentType("application/octet-stream");
    HttpPost localHttpPost = new HttpPost(paramString);
    localHttpPost.setEntity(localByteArrayEntity);
    BasicHttpParams localBasicHttpParams = new BasicHttpParams();
    HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 10000);
    HttpConnectionParams.setSoTimeout(localBasicHttpParams, 15000);
    localHttpPost.getParams().setBooleanParameter("http.protocol.expect-continue", false);
    int i = cn.a(localBasicHttpParams).execute(localHttpPost).getStatusLine().getStatusCode();
    if (i == 200);
    while (true)
    {
      try
      {
        db.c("FlurryAgent", "Report successful");
        this.aY = true;
        this.ba.removeAll(this.aU);
        this.aU = null;
        return bool;
      }
      finally
      {
      }
      db.c("FlurryAgent", "Report failed. HTTP response: " + i);
      bool = false;
    }
  }

  // ERROR //
  private void b(Context paramContext)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: invokespecial 769	com/flurry/android/FlurryAgent:c	(Landroid/content/Context;)Ljava/lang/String;
    //   7: astore_3
    //   8: aload_0
    //   9: getfield 133	com/flurry/android/FlurryAgent:aK	Ljava/io/File;
    //   12: invokevirtual 774	java/io/File:exists	()Z
    //   15: ifeq +336 -> 351
    //   18: ldc 186
    //   20: new 261	java/lang/StringBuilder
    //   23: dup
    //   24: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   27: ldc_w 776
    //   30: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   33: aload_0
    //   34: getfield 133	com/flurry/android/FlurryAgent:aK	Ljava/io/File;
    //   37: invokevirtual 779	java/io/File:getAbsolutePath	()Ljava/lang/String;
    //   40: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   43: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   46: invokestatic 781	com/flurry/android/db:e	(Ljava/lang/String;Ljava/lang/String;)V
    //   49: new 548	java/io/DataInputStream
    //   52: dup
    //   53: new 218	java/io/FileInputStream
    //   56: dup
    //   57: aload_0
    //   58: getfield 133	com/flurry/android/FlurryAgent:aK	Ljava/io/File;
    //   61: invokespecial 221	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   64: invokespecial 784	java/io/DataInputStream:<init>	(Ljava/io/InputStream;)V
    //   67: astore 7
    //   69: aload 7
    //   71: invokevirtual 551	java/io/DataInputStream:readUnsignedShort	()I
    //   74: ldc_w 785
    //   77: if_icmpne +201 -> 278
    //   80: aload_0
    //   81: aload 7
    //   83: invokespecial 787	com/flurry/android/FlurryAgent:a	(Ljava/io/DataInputStream;)V
    //   86: aload 7
    //   88: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   91: aload_0
    //   92: getfield 139	com/flurry/android/FlurryAgent:aN	Z
    //   95: ifne +21 -> 116
    //   98: aload_0
    //   99: getfield 133	com/flurry/android/FlurryAgent:aK	Ljava/io/File;
    //   102: invokevirtual 790	java/io/File:delete	()Z
    //   105: ifeq +221 -> 326
    //   108: ldc 186
    //   110: ldc_w 792
    //   113: invokestatic 292	com/flurry/android/db:c	(Ljava/lang/String;Ljava/lang/String;)V
    //   116: aload_0
    //   117: getfield 139	com/flurry/android/FlurryAgent:aN	Z
    //   120: ifne +21 -> 141
    //   123: aload_0
    //   124: iconst_0
    //   125: putfield 574	com/flurry/android/FlurryAgent:aY	Z
    //   128: aload_0
    //   129: aload_0
    //   130: getfield 355	com/flurry/android/FlurryAgent:bb	J
    //   133: putfield 579	com/flurry/android/FlurryAgent:aZ	J
    //   136: aload_0
    //   137: iconst_1
    //   138: putfield 139	com/flurry/android/FlurryAgent:aN	Z
    //   141: aload_3
    //   142: ifnonnull +233 -> 375
    //   145: invokestatic 796	java/lang/Math:random	()D
    //   148: invokestatic 801	java/lang/Double:doubleToLongBits	(D)J
    //   151: ldc2_w 802
    //   154: invokestatic 806	java/lang/System:nanoTime	()J
    //   157: bipush 37
    //   159: aload_0
    //   160: getfield 255	com/flurry/android/FlurryAgent:aQ	Ljava/lang/String;
    //   163: invokevirtual 298	java/lang/String:hashCode	()I
    //   166: imul
    //   167: i2l
    //   168: ladd
    //   169: lmul
    //   170: ladd
    //   171: lstore 4
    //   173: new 261	java/lang/StringBuilder
    //   176: dup
    //   177: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   180: ldc_w 808
    //   183: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   186: lload 4
    //   188: bipush 16
    //   190: invokestatic 811	java/lang/Long:toString	(JI)Ljava/lang/String;
    //   193: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   199: astore 6
    //   201: ldc 186
    //   203: ldc_w 813
    //   206: invokestatic 781	com/flurry/android/db:e	(Ljava/lang/String;Ljava/lang/String;)V
    //   209: aload_0
    //   210: aload 6
    //   212: invokespecial 569	com/flurry/android/FlurryAgent:g	(Ljava/lang/String;)V
    //   215: invokestatic 400	com/flurry/android/FlurryAgent:n	()Z
    //   218: ifeq +25 -> 243
    //   221: aload_0
    //   222: getfield 182	com/flurry/android/FlurryAgent:Q	Lcom/flurry/android/FlurryAds;
    //   225: aload_0
    //   226: getfield 815	com/flurry/android/FlurryAgent:aW	Ljava/lang/String;
    //   229: invokevirtual 818	com/flurry/android/FlurryAds:k	(Ljava/lang/String;)V
    //   232: aload_0
    //   233: getfield 182	com/flurry/android/FlurryAgent:Q	Lcom/flurry/android/FlurryAds;
    //   236: aload_0
    //   237: getfield 151	com/flurry/android/FlurryAgent:aX	Ljava/util/Map;
    //   240: invokevirtual 821	com/flurry/android/FlurryAds:b	(Ljava/util/Map;)V
    //   243: aload 6
    //   245: ldc_w 823
    //   248: invokevirtual 827	java/lang/String:startsWith	(Ljava/lang/String;)Z
    //   251: ifne +20 -> 271
    //   254: aload_0
    //   255: getfield 311	com/flurry/android/FlurryAgent:aJ	Ljava/io/File;
    //   258: invokevirtual 774	java/io/File:exists	()Z
    //   261: ifne +10 -> 271
    //   264: aload_0
    //   265: aload_1
    //   266: aload 6
    //   268: invokespecial 829	com/flurry/android/FlurryAgent:b	(Landroid/content/Context;Ljava/lang/String;)V
    //   271: aload_0
    //   272: invokespecial 832	com/flurry/android/FlurryAgent:t	()V
    //   275: aload_0
    //   276: monitorexit
    //   277: return
    //   278: ldc 186
    //   280: ldc_w 834
    //   283: invokestatic 292	com/flurry/android/db:c	(Ljava/lang/String;Ljava/lang/String;)V
    //   286: goto -200 -> 86
    //   289: astore 9
    //   291: ldc 186
    //   293: ldc 237
    //   295: aload 9
    //   297: invokestatic 243	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   300: aload 7
    //   302: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   305: goto -214 -> 91
    //   308: astore_2
    //   309: aload_0
    //   310: monitorexit
    //   311: aload_2
    //   312: athrow
    //   313: astore 8
    //   315: aconst_null
    //   316: astore 7
    //   318: aload 7
    //   320: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   323: aload 8
    //   325: athrow
    //   326: ldc 186
    //   328: ldc_w 836
    //   331: invokestatic 274	com/flurry/android/db:d	(Ljava/lang/String;Ljava/lang/String;)V
    //   334: goto -218 -> 116
    //   337: astore 10
    //   339: ldc 186
    //   341: ldc 158
    //   343: aload 10
    //   345: invokestatic 243	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   348: goto -232 -> 116
    //   351: ldc 186
    //   353: ldc_w 838
    //   356: invokestatic 781	com/flurry/android/db:e	(Ljava/lang/String;Ljava/lang/String;)V
    //   359: goto -243 -> 116
    //   362: astore 8
    //   364: goto -46 -> 318
    //   367: astore 9
    //   369: aconst_null
    //   370: astore 7
    //   372: goto -81 -> 291
    //   375: aload_3
    //   376: astore 6
    //   378: goto -169 -> 209
    //
    // Exception table:
    //   from	to	target	type
    //   69	86	289	java/lang/Throwable
    //   278	286	289	java/lang/Throwable
    //   2	49	308	finally
    //   86	91	308	finally
    //   91	116	308	finally
    //   116	141	308	finally
    //   145	209	308	finally
    //   209	243	308	finally
    //   243	271	308	finally
    //   271	275	308	finally
    //   300	305	308	finally
    //   318	326	308	finally
    //   326	334	308	finally
    //   339	348	308	finally
    //   351	359	308	finally
    //   49	69	313	finally
    //   91	116	337	java/lang/Throwable
    //   326	334	337	java/lang/Throwable
    //   69	86	362	finally
    //   278	286	362	finally
    //   291	300	362	finally
    //   49	69	367	java/lang/Throwable
  }

  // ERROR //
  private void b(Context paramContext, String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: aload_1
    //   4: ldc_w 309
    //   7: invokevirtual 307	android/content/Context:getFileStreamPath	(Ljava/lang/String;)Ljava/io/File;
    //   10: putfield 311	com/flurry/android/FlurryAgent:aJ	Ljava/io/File;
    //   13: aload_0
    //   14: getfield 311	com/flurry/android/FlurryAgent:aJ	Ljava/io/File;
    //   17: invokestatic 843	com/flurry/android/bc:b	(Ljava/io/File;)Z
    //   20: istore 4
    //   22: iload 4
    //   24: ifne +6 -> 30
    //   27: aload_0
    //   28: monitorexit
    //   29: return
    //   30: new 845	java/io/DataOutputStream
    //   33: dup
    //   34: new 847	java/io/FileOutputStream
    //   37: dup
    //   38: aload_0
    //   39: getfield 311	com/flurry/android/FlurryAgent:aJ	Ljava/io/File;
    //   42: invokespecial 848	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   45: invokespecial 851	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   48: astore 5
    //   50: aload 5
    //   52: iconst_1
    //   53: invokevirtual 854	java/io/DataOutputStream:writeInt	(I)V
    //   56: aload 5
    //   58: aload_2
    //   59: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   62: aload 5
    //   64: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   67: goto -40 -> 27
    //   70: astore_3
    //   71: aload_0
    //   72: monitorexit
    //   73: aload_3
    //   74: athrow
    //   75: astore 6
    //   77: aconst_null
    //   78: astore 5
    //   80: ldc 186
    //   82: ldc_w 859
    //   85: aload 6
    //   87: invokestatic 243	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   90: aload 5
    //   92: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   95: goto -68 -> 27
    //   98: aload 5
    //   100: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   103: aload 7
    //   105: athrow
    //   106: astore 7
    //   108: goto -10 -> 98
    //   111: astore 6
    //   113: goto -33 -> 80
    //   116: astore 7
    //   118: aconst_null
    //   119: astore 5
    //   121: goto -23 -> 98
    //
    // Exception table:
    //   from	to	target	type
    //   2	22	70	finally
    //   62	67	70	finally
    //   90	95	70	finally
    //   98	106	70	finally
    //   30	50	75	java/lang/Throwable
    //   50	62	106	finally
    //   80	90	106	finally
    //   50	62	111	java/lang/Throwable
    //   30	50	116	finally
  }

  private void b(String paramString, Map<String, String> paramMap)
  {
    while (true)
    {
      bs localbs;
      HashMap localHashMap;
      try
      {
        Iterator localIterator = this.bn.iterator();
        int i;
        if (localIterator.hasNext())
        {
          localbs = (bs)localIterator.next();
          if (!localbs.w(paramString))
            continue;
          long l = SystemClock.elapsedRealtime() - this.bc;
          if ((paramMap != null) && (paramMap.size() > 0) && (this.bp < 160000))
          {
            i = this.bp - localbs.getBytes().length;
            localHashMap = new HashMap(localbs.getParameters());
            localbs.d(paramMap);
            if (i + localbs.getBytes().length > 160000)
              break label212;
            if (localbs.getParameters().size() <= 10)
              continue;
            db.g("FlurryAgent", "MaxEventParams exceeded on endEvent: " + localbs.getParameters().size());
            localbs.e(localHashMap);
          }
          localbs.c(l);
        }
        return;
        this.bp = (i + localbs.getBytes().length);
        continue;
      }
      finally
      {
      }
      label212: localbs.e(localHashMap);
      this.bo = false;
      this.bp = 160000;
      db.g("FlurryAgent", "Event Log size exceeded. No more event details logged.");
    }
  }

  // ERROR //
  private String c(Context paramContext)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 504	com/flurry/android/FlurryAgent:id	()Ljava/lang/String;
    //   4: astore_2
    //   5: aload_2
    //   6: ifnull +5 -> 11
    //   9: aload_2
    //   10: areturn
    //   11: aload_1
    //   12: invokevirtual 886	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   15: ldc_w 888
    //   18: invokestatic 894	android/provider/Settings$Secure:getString	(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;
    //   21: astore_3
    //   22: iconst_0
    //   23: istore 4
    //   25: aload_3
    //   26: ifnull +34 -> 60
    //   29: aload_3
    //   30: invokevirtual 643	java/lang/String:length	()I
    //   33: istore 11
    //   35: iconst_0
    //   36: istore 4
    //   38: iload 11
    //   40: ifle +20 -> 60
    //   43: aload_3
    //   44: ldc_w 469
    //   47: invokevirtual 259	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   50: istore 12
    //   52: iconst_0
    //   53: istore 4
    //   55: iload 12
    //   57: ifeq +29 -> 86
    //   60: iload 4
    //   62: ifeq +75 -> 137
    //   65: new 261	java/lang/StringBuilder
    //   68: dup
    //   69: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   72: ldc_w 823
    //   75: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   78: aload_3
    //   79: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   82: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   85: areturn
    //   86: getstatic 92	com/flurry/android/FlurryAgent:av	[Ljava/lang/String;
    //   89: astore 13
    //   91: aload 13
    //   93: arraylength
    //   94: istore 14
    //   96: iconst_0
    //   97: istore 15
    //   99: iload 15
    //   101: iload 14
    //   103: if_icmpge +28 -> 131
    //   106: aload_3
    //   107: aload 13
    //   109: iload 15
    //   111: aaload
    //   112: invokevirtual 259	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   115: istore 16
    //   117: iconst_0
    //   118: istore 4
    //   120: iload 16
    //   122: ifne -62 -> 60
    //   125: iinc 15 1
    //   128: goto -29 -> 99
    //   131: iconst_1
    //   132: istore 4
    //   134: goto -74 -> 60
    //   137: aload_1
    //   138: ldc_w 309
    //   141: invokevirtual 307	android/content/Context:getFileStreamPath	(Ljava/lang/String;)Ljava/io/File;
    //   144: astore 5
    //   146: aload 5
    //   148: invokevirtual 774	java/io/File:exists	()Z
    //   151: ifeq -142 -> 9
    //   154: new 548	java/io/DataInputStream
    //   157: dup
    //   158: new 218	java/io/FileInputStream
    //   161: dup
    //   162: aload 5
    //   164: invokespecial 221	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   167: invokespecial 784	java/io/DataInputStream:<init>	(Ljava/io/InputStream;)V
    //   170: astore 6
    //   172: aload 6
    //   174: invokevirtual 897	java/io/DataInputStream:readInt	()I
    //   177: pop
    //   178: aload 6
    //   180: invokevirtual 560	java/io/DataInputStream:readUTF	()Ljava/lang/String;
    //   183: astore 10
    //   185: aload 6
    //   187: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   190: aload 10
    //   192: areturn
    //   193: astore 7
    //   195: aconst_null
    //   196: astore 6
    //   198: ldc 186
    //   200: ldc_w 899
    //   203: aload 7
    //   205: invokestatic 243	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   208: aload 6
    //   210: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   213: aload_2
    //   214: areturn
    //   215: astore 8
    //   217: aconst_null
    //   218: astore 6
    //   220: aload 6
    //   222: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   225: aload 8
    //   227: athrow
    //   228: astore 8
    //   230: goto -10 -> 220
    //   233: astore 7
    //   235: goto -37 -> 198
    //
    // Exception table:
    //   from	to	target	type
    //   154	172	193	java/lang/Throwable
    //   154	172	215	finally
    //   172	185	228	finally
    //   198	208	228	finally
    //   172	185	233	java/lang/Throwable
  }

  private static String d(Context paramContext)
  {
    try
    {
      PackageInfo localPackageInfo = paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 0);
      if (localPackageInfo.versionName != null)
        return localPackageInfo.versionName;
      if (localPackageInfo.versionCode != 0)
      {
        String str = Integer.toString(localPackageInfo.versionCode);
        return str;
      }
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "", localThrowable);
    }
    return "Unknown";
  }

  private Location e(Context paramContext)
  {
    if ((paramContext.checkCallingOrSelfPermission("android.permission.ACCESS_FINE_LOCATION") == 0) || (paramContext.checkCallingOrSelfPermission("android.permission.ACCESS_COARSE_LOCATION") == 0))
    {
      LocationManager localLocationManager = (LocationManager)paramContext.getSystemService("location");
      try
      {
        if (this.aV == null)
          this.aV = localLocationManager;
        while (true)
        {
          Criteria localCriteria = aF;
          if (localCriteria == null)
            localCriteria = new Criteria();
          String str = localLocationManager.getBestProvider(localCriteria, true);
          if (str == null)
            break;
          localLocationManager.requestLocationUpdates(str, 0L, 0.0F, this, Looper.getMainLooper());
          return localLocationManager.getLastKnownLocation(str);
          localLocationManager = this.aV;
        }
      }
      finally
      {
      }
    }
    return null;
  }

  private static Map<String, List<String>> e(String paramString)
  {
    HashMap localHashMap = new HashMap();
    String[] arrayOfString1 = paramString.split("&");
    int i = arrayOfString1.length;
    int j = 0;
    if (j < i)
    {
      String[] arrayOfString2 = arrayOfString1[j].split("=");
      if (arrayOfString2.length != 2)
        db.c("FlurryAgent", "Invalid referrer Element: " + arrayOfString1[j] + " in referrer tag " + paramString);
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

  public static void endTimedEvent(String paramString)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String eventId passed to endTimedEvent was null.");
      return;
    }
    try
    {
      az.b(paramString, null);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "Failed to signify the end of event: " + paramString, localThrowable);
    }
  }

  public static void endTimedEvent(String paramString, Map<String, String> paramMap)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String eventId passed to endTimedEvent was null.");
      return;
    }
    if (paramMap == null)
    {
      db.d("FlurryAgent", "String eventId passed to endTimedEvent was null.");
      return;
    }
    try
    {
      az.b(paramString, paramMap);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "Failed to signify the end of event: " + paramString, localThrowable);
    }
  }

  private static String f(String paramString)
  {
    if ((paramString != null) && (paramString.length() > 4))
    {
      StringBuilder localStringBuilder = new StringBuilder();
      for (int i = 0; i < -4 + paramString.length(); i++)
        localStringBuilder.append('*');
      localStringBuilder.append(paramString.substring(-4 + paramString.length()));
      paramString = localStringBuilder.toString();
    }
    return paramString;
  }

  private static byte[] f(Context paramContext)
  {
    String str;
    if (paramContext.checkCallingOrSelfPermission("android.permission.READ_PHONE_STATE") == 0)
    {
      TelephonyManager localTelephonyManager = (TelephonyManager)paramContext.getSystemService("phone");
      if (localTelephonyManager != null)
      {
        str = localTelephonyManager.getDeviceId();
        if ((str == null) || (str.trim().length() <= 0));
      }
    }
    try
    {
      byte[] arrayOfByte = bd.r(str);
      if ((arrayOfByte != null) && (arrayOfByte.length == 20))
        return arrayOfByte;
      db.d("FlurryAgent", "sha1 is not 20 bytes long: " + Arrays.toString(arrayOfByte));
      label95: return null;
    }
    catch (Exception localException)
    {
      break label95;
    }
  }

  private void g(String paramString)
  {
    if (paramString != null);
    try
    {
      this.aW = paramString;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public static int getAgentVersion()
  {
    return 148;
  }

  public static boolean getForbidPlaintextFallback()
  {
    return false;
  }

  static String getLocale()
  {
    return az.be;
  }

  public static String getPhoneId()
  {
    return az.id();
  }

  public static boolean getUseHttps()
  {
    return aC;
  }

  private String id()
  {
    try
    {
      String str = this.aW;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  protected static boolean isCaptureUncaughtExceptions()
  {
    return aE;
  }

  public static void logEvent(String paramString)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String eventId passed to logEvent was null.");
      return;
    }
    try
    {
      az.a(paramString, null, false);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "Failed to log event: " + paramString, localThrowable);
    }
  }

  public static void logEvent(String paramString, Map<String, String> paramMap)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String eventId passed to logEvent was null.");
      return;
    }
    if (paramMap == null)
    {
      db.d("FlurryAgent", "String parameters passed to logEvent was null.");
      return;
    }
    try
    {
      az.a(paramString, paramMap, false);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "Failed to log event: " + paramString, localThrowable);
    }
  }

  public static void logEvent(String paramString, Map<String, String> paramMap, boolean paramBoolean)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String eventId passed to logEvent was null.");
      return;
    }
    if (paramMap == null)
    {
      db.d("FlurryAgent", "String parameters passed to logEvent was null.");
      return;
    }
    try
    {
      az.a(paramString, paramMap, paramBoolean);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "Failed to log event: " + paramString, localThrowable);
    }
  }

  public static void logEvent(String paramString, boolean paramBoolean)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String eventId passed to logEvent was null.");
      return;
    }
    try
    {
      az.a(paramString, null, paramBoolean);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "Failed to log event: " + paramString, localThrowable);
    }
  }

  static boolean m()
  {
    return (az.aN) && (az.aM);
  }

  static boolean n()
  {
    if ((az != null) && (az.Q != null));
    while (true)
    {
      return true;
      try
      {
        Class localClass = Class.forName("com.flurry.android.FlurryAds");
        if (localClass == null)
          return false;
      }
      catch (Throwable localThrowable)
      {
        new StringBuilder().append("isAppSpotEnabled caught:").append(localThrowable.toString()).toString();
      }
    }
    return false;
  }

  // ERROR //
  private void o()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 1064	java/io/ByteArrayOutputStream
    //   5: dup
    //   6: invokespecial 1065	java/io/ByteArrayOutputStream:<init>	()V
    //   9: astore_1
    //   10: new 845	java/io/DataOutputStream
    //   13: dup
    //   14: aload_1
    //   15: invokespecial 851	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   18: astore_2
    //   19: aload_2
    //   20: iconst_1
    //   21: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   24: aload_2
    //   25: aload_0
    //   26: getfield 328	com/flurry/android/FlurryAgent:aS	Ljava/lang/String;
    //   29: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   32: aload_2
    //   33: aload_0
    //   34: getfield 355	com/flurry/android/FlurryAgent:bb	J
    //   37: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   40: aload_2
    //   41: aload_0
    //   42: getfield 361	com/flurry/android/FlurryAgent:bd	J
    //   45: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   48: aload_2
    //   49: lconst_0
    //   50: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   53: aload_2
    //   54: aload_0
    //   55: getfield 160	com/flurry/android/FlurryAgent:be	Ljava/lang/String;
    //   58: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   61: aload_2
    //   62: aload_0
    //   63: getfield 162	com/flurry/android/FlurryAgent:bf	Ljava/lang/String;
    //   66: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   69: aload_2
    //   70: aload_0
    //   71: getfield 164	com/flurry/android/FlurryAgent:bg	B
    //   74: invokevirtual 1074	java/io/DataOutputStream:writeByte	(I)V
    //   77: aload_0
    //   78: getfield 166	com/flurry/android/FlurryAgent:bh	Ljava/lang/String;
    //   81: ifnonnull +170 -> 251
    //   84: ldc 158
    //   86: astore 7
    //   88: aload_2
    //   89: aload 7
    //   91: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   94: aload_0
    //   95: getfield 365	com/flurry/android/FlurryAgent:bl	Landroid/location/Location;
    //   98: ifnonnull +162 -> 260
    //   101: aload_2
    //   102: iconst_0
    //   103: invokevirtual 1078	java/io/DataOutputStream:writeBoolean	(Z)V
    //   106: aload_2
    //   107: aload_0
    //   108: getfield 393	com/flurry/android/FlurryAgent:br	I
    //   111: invokevirtual 854	java/io/DataOutputStream:writeInt	(I)V
    //   114: aload_2
    //   115: iconst_m1
    //   116: invokevirtual 1074	java/io/DataOutputStream:writeByte	(I)V
    //   119: aload_2
    //   120: iconst_m1
    //   121: invokevirtual 1074	java/io/DataOutputStream:writeByte	(I)V
    //   124: aload_2
    //   125: aload_0
    //   126: getfield 168	com/flurry/android/FlurryAgent:bi	B
    //   129: invokevirtual 1074	java/io/DataOutputStream:writeByte	(I)V
    //   132: aload_0
    //   133: getfield 1080	com/flurry/android/FlurryAgent:bj	Ljava/lang/Long;
    //   136: ifnonnull +185 -> 321
    //   139: aload_2
    //   140: iconst_0
    //   141: invokevirtual 1078	java/io/DataOutputStream:writeBoolean	(Z)V
    //   144: aload_2
    //   145: aload_0
    //   146: getfield 170	com/flurry/android/FlurryAgent:bm	Ljava/util/Map;
    //   149: invokeinterface 648 1 0
    //   154: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   157: aload_0
    //   158: getfield 170	com/flurry/android/FlurryAgent:bm	Ljava/util/Map;
    //   161: invokeinterface 1083 1 0
    //   166: invokeinterface 440 1 0
    //   171: astore 8
    //   173: aload 8
    //   175: invokeinterface 445 1 0
    //   180: ifeq +160 -> 340
    //   183: aload 8
    //   185: invokeinterface 449 1 0
    //   190: checkcast 1085	java/util/Map$Entry
    //   193: astore 15
    //   195: aload_2
    //   196: aload 15
    //   198: invokeinterface 1088 1 0
    //   203: checkcast 86	java/lang/String
    //   206: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   209: aload_2
    //   210: aload 15
    //   212: invokeinterface 1091 1 0
    //   217: checkcast 647	com/flurry/android/i
    //   220: getfield 652	com/flurry/android/i:value	I
    //   223: invokevirtual 854	java/io/DataOutputStream:writeInt	(I)V
    //   226: goto -53 -> 173
    //   229: astore 5
    //   231: aload_2
    //   232: astore 6
    //   234: ldc 186
    //   236: ldc 158
    //   238: aload 5
    //   240: invokestatic 243	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   243: aload 6
    //   245: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   248: aload_0
    //   249: monitorexit
    //   250: return
    //   251: aload_0
    //   252: getfield 166	com/flurry/android/FlurryAgent:bh	Ljava/lang/String;
    //   255: astore 7
    //   257: goto -169 -> 88
    //   260: aload_2
    //   261: iconst_1
    //   262: invokevirtual 1078	java/io/DataOutputStream:writeBoolean	(Z)V
    //   265: aload_2
    //   266: aload_0
    //   267: getfield 365	com/flurry/android/FlurryAgent:bl	Landroid/location/Location;
    //   270: invokevirtual 1096	android/location/Location:getLatitude	()D
    //   273: invokestatic 1098	com/flurry/android/FlurryAgent:a	(D)D
    //   276: invokevirtual 1102	java/io/DataOutputStream:writeDouble	(D)V
    //   279: aload_2
    //   280: aload_0
    //   281: getfield 365	com/flurry/android/FlurryAgent:bl	Landroid/location/Location;
    //   284: invokevirtual 1105	android/location/Location:getLongitude	()D
    //   287: invokestatic 1098	com/flurry/android/FlurryAgent:a	(D)D
    //   290: invokevirtual 1102	java/io/DataOutputStream:writeDouble	(D)V
    //   293: aload_2
    //   294: aload_0
    //   295: getfield 365	com/flurry/android/FlurryAgent:bl	Landroid/location/Location;
    //   298: invokevirtual 1109	android/location/Location:getAccuracy	()F
    //   301: invokevirtual 1113	java/io/DataOutputStream:writeFloat	(F)V
    //   304: goto -198 -> 106
    //   307: astore_3
    //   308: aload_2
    //   309: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   312: aload_3
    //   313: athrow
    //   314: astore 4
    //   316: aload_0
    //   317: monitorexit
    //   318: aload 4
    //   320: athrow
    //   321: aload_2
    //   322: iconst_1
    //   323: invokevirtual 1078	java/io/DataOutputStream:writeBoolean	(Z)V
    //   326: aload_2
    //   327: aload_0
    //   328: getfield 1080	com/flurry/android/FlurryAgent:bj	Ljava/lang/Long;
    //   331: invokevirtual 617	java/lang/Long:longValue	()J
    //   334: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   337: goto -193 -> 144
    //   340: aload_2
    //   341: aload_0
    //   342: getfield 172	com/flurry/android/FlurryAgent:bn	Ljava/util/List;
    //   345: invokeinterface 479 1 0
    //   350: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   353: aload_0
    //   354: getfield 172	com/flurry/android/FlurryAgent:bn	Ljava/util/List;
    //   357: invokeinterface 865 1 0
    //   362: astore 9
    //   364: aload 9
    //   366: invokeinterface 445 1 0
    //   371: ifeq +23 -> 394
    //   374: aload_2
    //   375: aload 9
    //   377: invokeinterface 449 1 0
    //   382: checkcast 667	com/flurry/android/bs
    //   385: invokevirtual 674	com/flurry/android/bs:getBytes	()[B
    //   388: invokevirtual 1116	java/io/DataOutputStream:write	([B)V
    //   391: goto -27 -> 364
    //   394: aload_2
    //   395: aload_0
    //   396: getfield 389	com/flurry/android/FlurryAgent:bo	Z
    //   399: invokevirtual 1078	java/io/DataOutputStream:writeBoolean	(Z)V
    //   402: iconst_0
    //   403: istore 10
    //   405: iconst_0
    //   406: istore 11
    //   408: iconst_0
    //   409: istore 12
    //   411: iload 10
    //   413: aload_0
    //   414: getfield 174	com/flurry/android/FlurryAgent:bq	Ljava/util/List;
    //   417: invokeinterface 479 1 0
    //   422: if_icmpge +42 -> 464
    //   425: iload 12
    //   427: aload_0
    //   428: getfield 174	com/flurry/android/FlurryAgent:bq	Ljava/util/List;
    //   431: iload 10
    //   433: invokeinterface 629 2 0
    //   438: checkcast 611	com/flurry/android/ci
    //   441: invokevirtual 1117	com/flurry/android/ci:getBytes	()[B
    //   444: arraylength
    //   445: iadd
    //   446: istore 12
    //   448: iload 12
    //   450: ldc_w 655
    //   453: if_icmple +114 -> 567
    //   456: ldc 186
    //   458: ldc_w 1119
    //   461: invokestatic 287	com/flurry/android/db:g	(Ljava/lang/String;Ljava/lang/String;)V
    //   464: aload_2
    //   465: aload_0
    //   466: getfield 363	com/flurry/android/FlurryAgent:bk	I
    //   469: invokevirtual 854	java/io/DataOutputStream:writeInt	(I)V
    //   472: aload_2
    //   473: iload 11
    //   475: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   478: iconst_0
    //   479: istore 13
    //   481: iload 13
    //   483: iload 11
    //   485: if_icmpge +30 -> 515
    //   488: aload_2
    //   489: aload_0
    //   490: getfield 174	com/flurry/android/FlurryAgent:bq	Ljava/util/List;
    //   493: iload 13
    //   495: invokeinterface 629 2 0
    //   500: checkcast 611	com/flurry/android/ci
    //   503: invokevirtual 1117	com/flurry/android/ci:getBytes	()[B
    //   506: invokevirtual 1116	java/io/DataOutputStream:write	([B)V
    //   509: iinc 13 1
    //   512: goto -31 -> 481
    //   515: aload_2
    //   516: iconst_0
    //   517: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   520: aload_2
    //   521: iconst_0
    //   522: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   525: aload_0
    //   526: getfield 156	com/flurry/android/FlurryAgent:ba	Ljava/util/List;
    //   529: aload_1
    //   530: invokevirtual 1122	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   533: invokeinterface 622 2 0
    //   538: pop
    //   539: aload_2
    //   540: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   543: goto -295 -> 248
    //   546: astore_3
    //   547: aconst_null
    //   548: astore_2
    //   549: goto -241 -> 308
    //   552: astore_3
    //   553: aload 6
    //   555: astore_2
    //   556: goto -248 -> 308
    //   559: astore 5
    //   561: aconst_null
    //   562: astore 6
    //   564: goto -330 -> 234
    //   567: iinc 11 1
    //   570: iinc 10 1
    //   573: goto -162 -> 411
    //
    // Exception table:
    //   from	to	target	type
    //   19	84	229	java/io/IOException
    //   88	106	229	java/io/IOException
    //   106	144	229	java/io/IOException
    //   144	173	229	java/io/IOException
    //   173	226	229	java/io/IOException
    //   251	257	229	java/io/IOException
    //   260	304	229	java/io/IOException
    //   321	337	229	java/io/IOException
    //   340	364	229	java/io/IOException
    //   364	391	229	java/io/IOException
    //   394	402	229	java/io/IOException
    //   411	448	229	java/io/IOException
    //   456	464	229	java/io/IOException
    //   464	478	229	java/io/IOException
    //   488	509	229	java/io/IOException
    //   515	539	229	java/io/IOException
    //   19	84	307	finally
    //   88	106	307	finally
    //   106	144	307	finally
    //   144	173	307	finally
    //   173	226	307	finally
    //   251	257	307	finally
    //   260	304	307	finally
    //   321	337	307	finally
    //   340	364	307	finally
    //   364	391	307	finally
    //   394	402	307	finally
    //   411	448	307	finally
    //   456	464	307	finally
    //   464	478	307	finally
    //   488	509	307	finally
    //   515	539	307	finally
    //   243	248	314	finally
    //   308	314	314	finally
    //   539	543	314	finally
    //   2	19	546	finally
    //   234	243	552	finally
    //   2	19	559	java/io/IOException
  }

  public static void onEndSession(Context paramContext)
  {
    if (paramContext == null)
      throw new NullPointerException("Null context");
    try
    {
      az.a(paramContext, false);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "", localThrowable);
    }
  }

  public static void onError(String paramString1, String paramString2, String paramString3)
  {
    if (paramString1 == null)
    {
      db.d("FlurryAgent", "String errorId passed to onError was null.");
      return;
    }
    if (paramString2 == null)
    {
      db.d("FlurryAgent", "String message passed to onError was null.");
      return;
    }
    if (paramString3 == null)
    {
      db.d("FlurryAgent", "String errorClass passed to onError was null.");
      return;
    }
    while (true)
    {
      StackTraceElement[] arrayOfStackTraceElement1;
      try
      {
        arrayOfStackTraceElement1 = Thread.currentThread().getStackTrace();
        if ((arrayOfStackTraceElement1 != null) && (arrayOfStackTraceElement1.length > 2))
        {
          arrayOfStackTraceElement2 = new StackTraceElement[-2 + arrayOfStackTraceElement1.length];
          System.arraycopy(arrayOfStackTraceElement1, 2, arrayOfStackTraceElement2, 0, arrayOfStackTraceElement2.length);
          Throwable localThrowable2 = new Throwable(paramString2);
          localThrowable2.setStackTrace(arrayOfStackTraceElement2);
          az.a(paramString1, paramString2, paramString3, localThrowable2);
          return;
        }
      }
      catch (Throwable localThrowable1)
      {
        db.b("FlurryAgent", "", localThrowable1);
        return;
      }
      StackTraceElement[] arrayOfStackTraceElement2 = arrayOfStackTraceElement1;
    }
  }

  public static void onError(String paramString1, String paramString2, Throwable paramThrowable)
  {
    if (paramString1 == null)
    {
      db.d("FlurryAgent", "String errorId passed to onError was null.");
      return;
    }
    if (paramString2 == null)
    {
      db.d("FlurryAgent", "String message passed to onError was null.");
      return;
    }
    if (paramThrowable == null)
    {
      db.d("FlurryAgent", "Throwable passed to onError was null.");
      return;
    }
    try
    {
      az.a(paramString1, paramString2, paramThrowable.getClass().getName(), paramThrowable);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "", localThrowable);
    }
  }

  public static void onEvent(String paramString)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String eventId passed to onEvent was null.");
      return;
    }
    try
    {
      az.a(paramString, null, false);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "", localThrowable);
    }
  }

  public static void onEvent(String paramString, Map<String, String> paramMap)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String eventId passed to onEvent was null.");
      return;
    }
    if (paramMap == null)
    {
      db.d("FlurryAgent", "Parameters Map passed to onEvent was null.");
      return;
    }
    try
    {
      az.a(paramString, paramMap, false);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "", localThrowable);
    }
  }

  public static void onPageView()
  {
    try
    {
      az.p();
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "", localThrowable);
    }
  }

  public static void onStartSession(Context paramContext, String paramString)
  {
    if (paramContext == null)
      throw new NullPointerException("Null context");
    if ((paramString == null) || (paramString.length() == 0))
      throw new IllegalArgumentException("Api key not specified");
    try
    {
      az.a(paramContext, paramString);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b("FlurryAgent", "", localThrowable);
    }
  }

  private void p()
  {
    try
    {
      this.br = (1 + this.br);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  // ERROR //
  private byte[] q()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: new 1188	com/flurry/android/CrcMessageDigest
    //   5: dup
    //   6: invokespecial 1189	com/flurry/android/CrcMessageDigest:<init>	()V
    //   9: astore_1
    //   10: new 1064	java/io/ByteArrayOutputStream
    //   13: dup
    //   14: invokespecial 1065	java/io/ByteArrayOutputStream:<init>	()V
    //   17: astore_2
    //   18: new 1191	java/security/DigestOutputStream
    //   21: dup
    //   22: aload_2
    //   23: aload_1
    //   24: invokespecial 1194	java/security/DigestOutputStream:<init>	(Ljava/io/OutputStream;Ljava/security/MessageDigest;)V
    //   27: astore_3
    //   28: new 845	java/io/DataOutputStream
    //   31: dup
    //   32: aload_3
    //   33: invokespecial 851	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   36: astore 4
    //   38: aload 4
    //   40: bipush 26
    //   42: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   45: aload 4
    //   47: iconst_0
    //   48: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   51: aload 4
    //   53: lconst_0
    //   54: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   57: aload 4
    //   59: iconst_0
    //   60: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   63: aload 4
    //   65: iconst_3
    //   66: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   69: aload 4
    //   71: sipush 148
    //   74: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   77: aload 4
    //   79: invokestatic 353	java/lang/System:currentTimeMillis	()J
    //   82: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   85: aload 4
    //   87: aload_0
    //   88: getfield 255	com/flurry/android/FlurryAgent:aQ	Ljava/lang/String;
    //   91: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   94: aload 4
    //   96: aload_0
    //   97: getfield 328	com/flurry/android/FlurryAgent:aS	Ljava/lang/String;
    //   100: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   103: aload 4
    //   105: iconst_1
    //   106: aload_0
    //   107: getfield 151	com/flurry/android/FlurryAgent:aX	Ljava/util/Map;
    //   110: invokeinterface 648 1 0
    //   115: iadd
    //   116: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   119: aload 4
    //   121: iconst_0
    //   122: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   125: aload 4
    //   127: aload_0
    //   128: invokespecial 504	com/flurry/android/FlurryAgent:id	()Ljava/lang/String;
    //   131: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   134: aload_0
    //   135: getfield 151	com/flurry/android/FlurryAgent:aX	Ljava/util/Map;
    //   138: invokeinterface 492 1 0
    //   143: ifne +121 -> 264
    //   146: aload_0
    //   147: getfield 151	com/flurry/android/FlurryAgent:aX	Ljava/util/Map;
    //   150: invokeinterface 1083 1 0
    //   155: invokeinterface 440 1 0
    //   160: astore 31
    //   162: aload 31
    //   164: invokeinterface 445 1 0
    //   169: ifeq +95 -> 264
    //   172: aload 31
    //   174: invokeinterface 449 1 0
    //   179: checkcast 1085	java/util/Map$Entry
    //   182: astore 32
    //   184: aload 4
    //   186: aload 32
    //   188: invokeinterface 1088 1 0
    //   193: checkcast 300	java/lang/Integer
    //   196: invokevirtual 1197	java/lang/Integer:intValue	()I
    //   199: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   202: aload 32
    //   204: invokeinterface 1091 1 0
    //   209: checkcast 532	java/nio/ByteBuffer
    //   212: invokevirtual 1200	java/nio/ByteBuffer:array	()[B
    //   215: astore 33
    //   217: aload 4
    //   219: aload 33
    //   221: arraylength
    //   222: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   225: aload 4
    //   227: aload 33
    //   229: invokevirtual 1116	java/io/DataOutputStream:write	([B)V
    //   232: goto -70 -> 162
    //   235: astore 7
    //   237: aload 4
    //   239: astore 8
    //   241: ldc 186
    //   243: ldc_w 1202
    //   246: aload 7
    //   248: invokestatic 243	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   251: aload 8
    //   253: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   256: aconst_null
    //   257: astore 9
    //   259: aload_0
    //   260: monitorexit
    //   261: aload 9
    //   263: areturn
    //   264: aload 4
    //   266: iconst_0
    //   267: invokevirtual 1074	java/io/DataOutputStream:writeByte	(I)V
    //   270: aload 4
    //   272: aload_0
    //   273: getfield 579	com/flurry/android/FlurryAgent:aZ	J
    //   276: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   279: aload 4
    //   281: aload_0
    //   282: getfield 355	com/flurry/android/FlurryAgent:bb	J
    //   285: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   288: aload 4
    //   290: bipush 6
    //   292: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   295: aload 4
    //   297: ldc_w 1204
    //   300: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   303: aload 4
    //   305: getstatic 1209	android/os/Build:MODEL	Ljava/lang/String;
    //   308: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   311: aload 4
    //   313: ldc_w 1211
    //   316: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   319: aload 4
    //   321: getstatic 1214	android/os/Build:BRAND	Ljava/lang/String;
    //   324: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   327: aload 4
    //   329: ldc_w 1216
    //   332: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   335: aload 4
    //   337: getstatic 1218	android/os/Build:ID	Ljava/lang/String;
    //   340: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   343: aload 4
    //   345: ldc_w 1220
    //   348: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   351: aload 4
    //   353: getstatic 1225	android/os/Build$VERSION:RELEASE	Ljava/lang/String;
    //   356: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   359: aload 4
    //   361: ldc_w 1227
    //   364: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   367: aload 4
    //   369: getstatic 1230	android/os/Build:DEVICE	Ljava/lang/String;
    //   372: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   375: aload 4
    //   377: ldc_w 1232
    //   380: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   383: aload 4
    //   385: getstatic 1235	android/os/Build:PRODUCT	Ljava/lang/String;
    //   388: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   391: aload_0
    //   392: getfield 1237	com/flurry/android/FlurryAgent:bs	Ljava/util/Map;
    //   395: ifnull +325 -> 720
    //   398: aload_0
    //   399: getfield 1237	com/flurry/android/FlurryAgent:bs	Ljava/util/Map;
    //   402: invokeinterface 1238 1 0
    //   407: invokeinterface 1239 1 0
    //   412: istore 10
    //   414: new 261	java/lang/StringBuilder
    //   417: dup
    //   418: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   421: ldc_w 1241
    //   424: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   427: iload 10
    //   429: invokevirtual 556	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   432: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   435: pop
    //   436: iload 10
    //   438: ifne +31 -> 469
    //   441: new 261	java/lang/StringBuilder
    //   444: dup
    //   445: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   448: ldc_w 1243
    //   451: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   454: aload_0
    //   455: getfield 135	com/flurry/android/FlurryAgent:aL	Ljava/io/File;
    //   458: invokevirtual 1246	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   461: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   464: pop
    //   465: aload_0
    //   466: invokespecial 832	com/flurry/android/FlurryAgent:t	()V
    //   469: aload 4
    //   471: iload 10
    //   473: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   476: aload_0
    //   477: getfield 1237	com/flurry/android/FlurryAgent:bs	Ljava/util/Map;
    //   480: ifnull +246 -> 726
    //   483: aload_0
    //   484: getfield 1237	com/flurry/android/FlurryAgent:bs	Ljava/util/Map;
    //   487: invokeinterface 1083 1 0
    //   492: invokeinterface 440 1 0
    //   497: astore 24
    //   499: aload 24
    //   501: invokeinterface 445 1 0
    //   506: ifeq +220 -> 726
    //   509: aload 24
    //   511: invokeinterface 449 1 0
    //   516: checkcast 1085	java/util/Map$Entry
    //   519: astore 25
    //   521: new 261	java/lang/StringBuilder
    //   524: dup
    //   525: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   528: ldc_w 1248
    //   531: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   534: aload 25
    //   536: invokeinterface 1088 1 0
    //   541: checkcast 86	java/lang/String
    //   544: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   547: ldc_w 972
    //   550: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   553: aload 25
    //   555: invokeinterface 1091 1 0
    //   560: invokevirtual 1246	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   563: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   566: pop
    //   567: aload 4
    //   569: aload 25
    //   571: invokeinterface 1088 1 0
    //   576: checkcast 86	java/lang/String
    //   579: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   582: new 261	java/lang/StringBuilder
    //   585: dup
    //   586: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   589: ldc_w 1250
    //   592: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   595: aload 25
    //   597: invokeinterface 1088 1 0
    //   602: checkcast 86	java/lang/String
    //   605: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   608: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   611: pop
    //   612: aload 4
    //   614: aload 25
    //   616: invokeinterface 1091 1 0
    //   621: checkcast 473	java/util/List
    //   624: invokeinterface 479 1 0
    //   629: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   632: aload 25
    //   634: invokeinterface 1091 1 0
    //   639: checkcast 473	java/util/List
    //   642: invokeinterface 865 1 0
    //   647: astore 28
    //   649: aload 28
    //   651: invokeinterface 445 1 0
    //   656: ifeq -157 -> 499
    //   659: aload 28
    //   661: invokeinterface 449 1 0
    //   666: checkcast 86	java/lang/String
    //   669: astore 29
    //   671: aload 4
    //   673: aload 29
    //   675: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   678: new 261	java/lang/StringBuilder
    //   681: dup
    //   682: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   685: ldc_w 1252
    //   688: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   691: aload 29
    //   693: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   696: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   699: pop
    //   700: goto -51 -> 649
    //   703: astore 5
    //   705: aload 4
    //   707: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   710: aload 5
    //   712: athrow
    //   713: astore 6
    //   715: aload_0
    //   716: monitorexit
    //   717: aload 6
    //   719: athrow
    //   720: iconst_0
    //   721: istore 10
    //   723: goto -309 -> 414
    //   726: aload 4
    //   728: iconst_0
    //   729: invokevirtual 1078	java/io/DataOutputStream:writeBoolean	(Z)V
    //   732: aload_0
    //   733: getfield 430	com/flurry/android/FlurryAgent:bt	Ljava/util/Map;
    //   736: ifnull +359 -> 1095
    //   739: aload_0
    //   740: getfield 430	com/flurry/android/FlurryAgent:bt	Ljava/util/Map;
    //   743: invokeinterface 1238 1 0
    //   748: invokeinterface 1239 1 0
    //   753: istore 13
    //   755: new 261	java/lang/StringBuilder
    //   758: dup
    //   759: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   762: ldc_w 1254
    //   765: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   768: iload 13
    //   770: invokevirtual 556	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   773: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   776: pop
    //   777: aload 4
    //   779: iload 13
    //   781: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   784: aload_0
    //   785: getfield 430	com/flurry/android/FlurryAgent:bt	Ljava/util/Map;
    //   788: ifnull +177 -> 965
    //   791: aload_0
    //   792: getfield 430	com/flurry/android/FlurryAgent:bt	Ljava/util/Map;
    //   795: invokeinterface 1083 1 0
    //   800: invokeinterface 440 1 0
    //   805: astore 18
    //   807: aload 18
    //   809: invokeinterface 445 1 0
    //   814: ifeq +151 -> 965
    //   817: aload 18
    //   819: invokeinterface 449 1 0
    //   824: checkcast 1085	java/util/Map$Entry
    //   827: astore 19
    //   829: new 261	java/lang/StringBuilder
    //   832: dup
    //   833: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   836: ldc_w 1256
    //   839: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   842: aload 19
    //   844: invokeinterface 1088 1 0
    //   849: checkcast 86	java/lang/String
    //   852: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   855: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   858: pop
    //   859: aload 4
    //   861: aload 19
    //   863: invokeinterface 1088 1 0
    //   868: checkcast 86	java/lang/String
    //   871: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   874: aload 4
    //   876: aload 19
    //   878: invokeinterface 1091 1 0
    //   883: checkcast 473	java/util/List
    //   886: invokeinterface 479 1 0
    //   891: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   894: aload 19
    //   896: invokeinterface 1091 1 0
    //   901: checkcast 473	java/util/List
    //   904: invokeinterface 865 1 0
    //   909: astore 21
    //   911: aload 21
    //   913: invokeinterface 445 1 0
    //   918: ifeq -111 -> 807
    //   921: aload 21
    //   923: invokeinterface 449 1 0
    //   928: checkcast 86	java/lang/String
    //   931: astore 22
    //   933: aload 4
    //   935: aload 22
    //   937: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   940: new 261	java/lang/StringBuilder
    //   943: dup
    //   944: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   947: ldc_w 1258
    //   950: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   953: aload 22
    //   955: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   958: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   961: pop
    //   962: goto -51 -> 911
    //   965: aload_0
    //   966: getfield 156	com/flurry/android/FlurryAgent:ba	Ljava/util/List;
    //   969: invokeinterface 479 1 0
    //   974: istore 15
    //   976: aload 4
    //   978: iload 15
    //   980: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   983: iconst_0
    //   984: istore 16
    //   986: iload 16
    //   988: iload 15
    //   990: if_icmpge +28 -> 1018
    //   993: aload 4
    //   995: aload_0
    //   996: getfield 156	com/flurry/android/FlurryAgent:ba	Ljava/util/List;
    //   999: iload 16
    //   1001: invokeinterface 629 2 0
    //   1006: checkcast 1260	[B
    //   1009: invokevirtual 1116	java/io/DataOutputStream:write	([B)V
    //   1012: iinc 16 1
    //   1015: goto -29 -> 986
    //   1018: aload_0
    //   1019: new 153	java/util/ArrayList
    //   1022: dup
    //   1023: aload_0
    //   1024: getfield 156	com/flurry/android/FlurryAgent:ba	Ljava/util/List;
    //   1027: invokespecial 463	java/util/ArrayList:<init>	(Ljava/util/Collection;)V
    //   1030: putfield 761	com/flurry/android/FlurryAgent:aU	Ljava/util/List;
    //   1033: aload_3
    //   1034: iconst_0
    //   1035: invokevirtual 1263	java/security/DigestOutputStream:on	(Z)V
    //   1038: aload 4
    //   1040: aload_1
    //   1041: invokevirtual 1266	com/flurry/android/CrcMessageDigest:getDigest	()[B
    //   1044: invokevirtual 1116	java/io/DataOutputStream:write	([B)V
    //   1047: aload 4
    //   1049: invokevirtual 1269	java/io/DataOutputStream:close	()V
    //   1052: aload_2
    //   1053: invokevirtual 1122	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   1056: astore 17
    //   1058: aload 17
    //   1060: astore 9
    //   1062: aload 4
    //   1064: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   1067: goto -808 -> 259
    //   1070: astore 5
    //   1072: aconst_null
    //   1073: astore 4
    //   1075: goto -370 -> 705
    //   1078: astore 5
    //   1080: aload 8
    //   1082: astore 4
    //   1084: goto -379 -> 705
    //   1087: astore 7
    //   1089: aconst_null
    //   1090: astore 8
    //   1092: goto -851 -> 241
    //   1095: iconst_0
    //   1096: istore 13
    //   1098: goto -343 -> 755
    //
    // Exception table:
    //   from	to	target	type
    //   38	162	235	java/lang/Throwable
    //   162	232	235	java/lang/Throwable
    //   264	414	235	java/lang/Throwable
    //   414	436	235	java/lang/Throwable
    //   441	469	235	java/lang/Throwable
    //   469	499	235	java/lang/Throwable
    //   499	649	235	java/lang/Throwable
    //   649	700	235	java/lang/Throwable
    //   726	755	235	java/lang/Throwable
    //   755	807	235	java/lang/Throwable
    //   807	911	235	java/lang/Throwable
    //   911	962	235	java/lang/Throwable
    //   965	983	235	java/lang/Throwable
    //   993	1012	235	java/lang/Throwable
    //   1018	1058	235	java/lang/Throwable
    //   38	162	703	finally
    //   162	232	703	finally
    //   264	414	703	finally
    //   414	436	703	finally
    //   441	469	703	finally
    //   469	499	703	finally
    //   499	649	703	finally
    //   649	700	703	finally
    //   726	755	703	finally
    //   755	807	703	finally
    //   807	911	703	finally
    //   911	962	703	finally
    //   965	983	703	finally
    //   993	1012	703	finally
    //   1018	1058	703	finally
    //   251	256	713	finally
    //   705	713	713	finally
    //   1062	1067	713	finally
    //   2	38	1070	finally
    //   241	251	1078	finally
    //   2	38	1087	java/lang/Throwable
  }

  private static String r()
  {
    if (aw != null)
      return aw;
    if (aD)
      return ax;
    if (aC)
      return ay;
    return ax;
  }

  private void s()
  {
    while (true)
    {
      try
      {
        db.c("FlurryAgent", "generating report");
        byte[] arrayOfByte = q();
        if (arrayOfByte != null)
        {
          if (a(arrayOfByte))
          {
            StringBuilder localStringBuilder = new StringBuilder().append("Done sending ");
            if (!this.aM)
              break label107;
            str = "initial ";
            db.c("FlurryAgent", str + "agent report");
            u();
          }
        }
        else
        {
          db.c("FlurryAgent", "Error generating report");
          return;
        }
      }
      catch (IOException localIOException)
      {
        db.a("FlurryAgent", "", localIOException);
        return;
      }
      catch (Throwable localThrowable)
      {
        db.b("FlurryAgent", "", localThrowable);
      }
      return;
      label107: String str = "";
    }
  }

  public static void setAge(int paramInt)
  {
    if ((paramInt > 0) && (paramInt < 110))
    {
      Date localDate = new Date(new Date(System.currentTimeMillis() - 31449600000L * paramInt).getYear(), 1, 1);
      az.bj = Long.valueOf(localDate.getTime());
    }
  }

  public static void setCaptureUncaughtExceptions(boolean paramBoolean)
  {
    synchronized (az)
    {
      if (az.aM)
      {
        db.d("FlurryAgent", "Cannot setCaptureUncaughtExceptions after onStartSession");
        return;
      }
      aE = paramBoolean;
      return;
    }
  }

  public static void setContinueSessionMillis(long paramLong)
  {
    if (paramLong < 5000L)
    {
      db.d("FlurryAgent", "Invalid time set for session resumption: " + paramLong);
      return;
    }
    synchronized (az)
    {
      aA = paramLong;
      return;
    }
  }

  public static void setGender(byte paramByte)
  {
    switch (paramByte)
    {
    default:
      az.bi = -1;
      return;
    case 0:
    case 1:
    }
    az.bi = paramByte;
  }

  public static void setLocationCriteria(Criteria paramCriteria)
  {
    synchronized (az)
    {
      aF = paramCriteria;
      return;
    }
  }

  public static void setLogEnabled(boolean paramBoolean)
  {
    FlurryAgent localFlurryAgent = az;
    if (paramBoolean);
    try
    {
      db.ax();
      while (true)
      {
        return;
        db.aw();
      }
    }
    finally
    {
    }
  }

  public static void setLogEvents(boolean paramBoolean)
  {
    synchronized (az)
    {
      aB = paramBoolean;
      return;
    }
  }

  public static void setLogLevel(int paramInt)
  {
    synchronized (az)
    {
      db.setLogLevel(paramInt);
      return;
    }
  }

  public static void setReportLocation(boolean paramBoolean)
  {
    synchronized (az)
    {
      az.aT = paramBoolean;
      return;
    }
  }

  public static void setReportUrl(String paramString)
  {
    if (paramString != null)
      paramString.endsWith(".do");
    aw = paramString;
  }

  public static void setUseHttps(boolean paramBoolean)
  {
    aC = paramBoolean;
  }

  public static void setUserId(String paramString)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String userId passed to setUserId was null.");
      return;
    }
    synchronized (az)
    {
      az.bh = bd.sanitize(paramString);
      return;
    }
  }

  public static void setVersionName(String paramString)
  {
    if (paramString == null)
    {
      db.d("FlurryAgent", "String versionName passed to setVersionName was null.");
      return;
    }
    synchronized (az)
    {
      az.aS = paramString;
      return;
    }
  }

  private void t()
  {
    if (this.aL.exists())
    {
      db.e("FlurryAgent", "Loading referrer info from file:  " + this.aL.getAbsolutePath());
      String str = a(this.aL);
      if (str != null)
        this.bs = e(str);
    }
  }

  // ERROR //
  private void u()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 133	com/flurry/android/FlurryAgent:aK	Ljava/io/File;
    //   6: invokestatic 843	com/flurry/android/bc:b	(Ljava/io/File;)Z
    //   9: istore 5
    //   11: iload 5
    //   13: ifne +10 -> 23
    //   16: aconst_null
    //   17: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   20: aload_0
    //   21: monitorexit
    //   22: return
    //   23: new 845	java/io/DataOutputStream
    //   26: dup
    //   27: new 847	java/io/FileOutputStream
    //   30: dup
    //   31: aload_0
    //   32: getfield 133	com/flurry/android/FlurryAgent:aK	Ljava/io/File;
    //   35: invokespecial 848	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   38: invokespecial 851	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   41: astore_2
    //   42: aload_2
    //   43: ldc_w 785
    //   46: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   49: aload_2
    //   50: iconst_2
    //   51: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   54: aload_2
    //   55: aload_0
    //   56: getfield 255	com/flurry/android/FlurryAgent:aQ	Ljava/lang/String;
    //   59: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   62: aload_2
    //   63: aload_0
    //   64: invokespecial 504	com/flurry/android/FlurryAgent:id	()Ljava/lang/String;
    //   67: invokevirtual 857	java/io/DataOutputStream:writeUTF	(Ljava/lang/String;)V
    //   70: aload_2
    //   71: aload_0
    //   72: getfield 574	com/flurry/android/FlurryAgent:aY	Z
    //   75: invokevirtual 1078	java/io/DataOutputStream:writeBoolean	(Z)V
    //   78: aload_2
    //   79: aload_0
    //   80: getfield 579	com/flurry/android/FlurryAgent:aZ	J
    //   83: invokevirtual 1071	java/io/DataOutputStream:writeLong	(J)V
    //   86: iconst_m1
    //   87: aload_0
    //   88: getfield 156	com/flurry/android/FlurryAgent:ba	Ljava/util/List;
    //   91: invokeinterface 479 1 0
    //   96: iadd
    //   97: istore 6
    //   99: iload 6
    //   101: iflt +65 -> 166
    //   104: aload_0
    //   105: getfield 156	com/flurry/android/FlurryAgent:ba	Ljava/util/List;
    //   108: iload 6
    //   110: invokeinterface 629 2 0
    //   115: checkcast 1260	[B
    //   118: astore 7
    //   120: aload 7
    //   122: arraylength
    //   123: istore 8
    //   125: iload 8
    //   127: iconst_2
    //   128: iadd
    //   129: aload_2
    //   130: invokevirtual 1346	java/io/DataOutputStream:size	()I
    //   133: iadd
    //   134: ldc_w 1347
    //   137: if_icmple +46 -> 183
    //   140: ldc 186
    //   142: new 261	java/lang/StringBuilder
    //   145: dup
    //   146: invokespecial 262	java/lang/StringBuilder:<init>	()V
    //   149: ldc_w 1349
    //   152: invokevirtual 267	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   155: iload 6
    //   157: invokevirtual 556	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   160: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   163: invokestatic 292	com/flurry/android/db:c	(Ljava/lang/String;Ljava/lang/String;)V
    //   166: aload_2
    //   167: iconst_0
    //   168: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   171: aload_2
    //   172: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   175: goto -155 -> 20
    //   178: astore_3
    //   179: aload_0
    //   180: monitorexit
    //   181: aload_3
    //   182: athrow
    //   183: aload_2
    //   184: iload 8
    //   186: invokevirtual 1068	java/io/DataOutputStream:writeShort	(I)V
    //   189: aload_2
    //   190: aload 7
    //   192: invokevirtual 1116	java/io/DataOutputStream:write	([B)V
    //   195: iinc 6 255
    //   198: goto -99 -> 99
    //   201: astore 4
    //   203: aconst_null
    //   204: astore_2
    //   205: ldc 186
    //   207: ldc 158
    //   209: aload 4
    //   211: invokestatic 243	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   214: aload_2
    //   215: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   218: goto -198 -> 20
    //   221: aload_2
    //   222: invokestatic 248	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   225: aload_1
    //   226: athrow
    //   227: astore_1
    //   228: goto -7 -> 221
    //   231: astore 4
    //   233: goto -28 -> 205
    //   236: astore_1
    //   237: aconst_null
    //   238: astore_2
    //   239: goto -18 -> 221
    //
    // Exception table:
    //   from	to	target	type
    //   16	20	178	finally
    //   171	175	178	finally
    //   214	218	178	finally
    //   221	227	178	finally
    //   2	11	201	java/lang/Throwable
    //   23	42	201	java/lang/Throwable
    //   42	99	227	finally
    //   104	166	227	finally
    //   166	171	227	finally
    //   183	195	227	finally
    //   205	214	227	finally
    //   42	99	231	java/lang/Throwable
    //   104	166	231	java/lang/Throwable
    //   166	171	231	java/lang/Throwable
    //   183	195	231	java/lang/Throwable
    //   2	11	236	finally
    //   23	42	236	finally
  }

  private void v()
  {
    try
    {
      if (this.aV != null)
        this.aV.removeUpdates(this);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  static String w()
  {
    return az.aQ;
  }

  static String x()
  {
    return az.bf;
  }

  final void a(Throwable paramThrowable)
  {
    paramThrowable.printStackTrace();
    String str = "";
    StackTraceElement[] arrayOfStackTraceElement = paramThrowable.getStackTrace();
    if ((arrayOfStackTraceElement != null) && (arrayOfStackTraceElement.length > 0))
    {
      StringBuilder localStringBuilder = new StringBuilder();
      if (paramThrowable.getMessage() != null)
        localStringBuilder.append(" (" + paramThrowable.getMessage() + ")\n");
      str = localStringBuilder.toString();
    }
    while (true)
    {
      onError("uncaught", str, paramThrowable);
      this.aP.clear();
      a(null, true);
      return;
      if (paramThrowable.getMessage() != null)
        str = paramThrowable.getMessage();
    }
  }

  public final void onLocationChanged(Location paramLocation)
  {
    try
    {
      this.bl = paramLocation;
      v();
      return;
    }
    catch (Throwable localThrowable)
    {
      while (true)
        db.b("FlurryAgent", "", localThrowable);
    }
    finally
    {
    }
  }

  public final void onProviderDisabled(String paramString)
  {
  }

  public final void onProviderEnabled(String paramString)
  {
  }

  public final void onStatusChanged(String paramString, int paramInt, Bundle paramBundle)
  {
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.FlurryAgent
 * JD-Core Version:    0.6.2
 */