package com.flurry.android;

import android.app.KeyguardManager;
import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Pair;
import android.view.ViewGroup;
import com.flurry.org.apache.avro.io.BinaryDecoder;
import com.flurry.org.apache.avro.io.BinaryEncoder;
import com.flurry.org.apache.avro.io.DecoderFactory;
import com.flurry.org.apache.avro.io.EncoderFactory;
import com.flurry.org.apache.avro.specific.SpecificDatumReader;
import com.flurry.org.apache.avro.specific.SpecificDatumWriter;
import com.flurry.org.apache.avro.specific.SpecificRecordBase;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

public class FlurryAds
  implements bm
{
  private static List<Integer> cr;
  private static DecoderFactory cs;
  private static ag ct;
  static String d = "FlurryAgent";
  private static FlurryAds dc;
  private String aS;
  private String aW;
  private Map<Integer, ByteBuffer> aX;
  private long bb;
  private long bc;
  private boolean cA = true;
  private volatile String cB = null;
  private volatile String cC = null;
  private volatile float cD;
  private volatile float cE;
  private volatile Map<String, String> cF;
  private cz cG;
  private AdUnit cH;
  private long cI;
  aj cJ;
  private Handler cK;
  dc cL;
  FlurryFreqCapManager cM = FlurryFreqCapManager.an();
  private ICustomAdNetworkHandler cN;
  private final k cO;
  private final bq cP;
  private FlurryAdListener cQ;
  private int cR;
  private volatile List<cz> cS = new CopyOnWriteArrayList();
  private volatile Map<String, cz> cT = new HashMap();
  private volatile List<cz> cU = new ArrayList();
  private volatile List<String> cV = new ArrayList();
  private volatile boolean cW = false;
  private Map<String, String> cX;
  private AdUnit cY;
  private bf cZ;
  private w cu;
  private boolean cv = false;
  private boolean cw = false;
  private File cx = null;
  private File cy = null;
  private String cz;
  private final Map<String, String> da;
  private final Set<String> db;
  private boolean dd;
  private FlurryUserIdProvider de;

  FlurryAds()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("open", "directOpen");
    localHashMap.put("expand", "doExpand");
    localHashMap.put("collapse", "doCollapse");
    this.da = Collections.unmodifiableMap(localHashMap);
    HashSet localHashSet = new HashSet();
    localHashSet.addAll(Arrays.asList(new String[] { "closeAd", "processRedirect", "nextFrame", "nextAdUnit", "notifyUser" }));
    this.db = Collections.unmodifiableSet(localHashSet);
    HandlerThread localHandlerThread = new HandlerThread("FlurryAdThread");
    localHandlerThread.start();
    this.cK = new Handler(localHandlerThread.getLooper());
    this.cJ = new aj();
    Integer[] arrayOfInteger = new Integer[6];
    arrayOfInteger[0] = Integer.valueOf(0);
    arrayOfInteger[1] = Integer.valueOf(1);
    arrayOfInteger[2] = Integer.valueOf(2);
    arrayOfInteger[3] = Integer.valueOf(3);
    arrayOfInteger[4] = Integer.valueOf(4);
    arrayOfInteger[5] = Integer.valueOf(5);
    cr = Arrays.asList(arrayOfInteger);
    cs = new DecoderFactory();
    ct = new ag(this);
    this.cu = new w(this);
    this.cL = new dc();
    this.aS = Build.VERSION.RELEASE;
    this.cz = Build.DEVICE;
    this.cF = new HashMap();
    this.cO = new j();
    this.cP = new h();
  }

  private Map<CharSequence, CharSequence> N()
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = this.cX.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      String str1 = (String)localEntry.getKey();
      String str2 = (String)localEntry.getValue();
      if (str1 == null)
        str1 = "";
      if (str2 == null)
        str2 = "";
      localHashMap.put(str1, str2);
    }
    return localHashMap;
  }

  private void P()
  {
    try
    {
      cq localcq = new cq(this);
      this.cK.post(localcq);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private byte[] Q()
  {
    List localList1 = R();
    SdkLogRequest localSdkLogRequest;
    SpecificDatumWriter localSpecificDatumWriter;
    ByteArrayOutputStream localByteArrayOutputStream;
    BinaryEncoder localBinaryEncoder;
    synchronized (this.cS)
    {
      List localList3 = ct.a(this.cS);
      if (localList3.size() == 0)
        return null;
      localSdkLogRequest = SdkLogRequest.aa().setApiKey(FlurryAgent.w()).setAdReportedIds(localList1).setSdkAdLogs(localList3).setTestDevice(false).setAgentTimestamp(System.currentTimeMillis()).build();
      new StringBuilder().append("Got ad log request:").append(localSdkLogRequest.toString()).toString();
      localSpecificDatumWriter = new SpecificDatumWriter(SdkLogRequest.class);
      localByteArrayOutputStream = new ByteArrayOutputStream();
      localBinaryEncoder = EncoderFactory.get().directBinaryEncoder(localByteArrayOutputStream, null);
    }
    try
    {
      localSpecificDatumWriter.write(localSdkLogRequest, localBinaryEncoder);
      localBinaryEncoder.flush();
      return localByteArrayOutputStream.toByteArray();
      localObject = finally;
      throw localObject;
    }
    catch (IOException localIOException)
    {
      new StringBuilder().append("Error generating adlog request").append(localIOException.getMessage()).toString();
    }
    return null;
  }

  private List<AdReportedId> R()
  {
    ArrayList localArrayList = new ArrayList();
    ByteBuffer localByteBuffer = ByteBuffer.wrap(this.aW.getBytes());
    localArrayList.add(AdReportedId.aq().setId(localByteBuffer).setType(0).build());
    Iterator localIterator = this.aX.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localArrayList.add(AdReportedId.aq().setId((ByteBuffer)localEntry.getValue()).setType(((Integer)localEntry.getKey()).intValue()).build());
    }
    return localArrayList;
  }

  private void T()
  {
    try
    {
      new cm(this).execute(new Void[0]);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void V()
  {
    try
    {
      new co(this).execute(new Void[0]);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private bf a(Context paramContext, AdUnit paramAdUnit)
  {
    this.cY = paramAdUnit;
    if (paramAdUnit == null)
      return null;
    List localList = paramAdUnit.getAdFrames();
    int i;
    String str1;
    String str2;
    cz localcz2;
    AdCreative localAdCreative;
    if (localList.size() > 0)
    {
      AdFrame localAdFrame = (AdFrame)localList.get(0);
      i = localAdFrame.getBinding().intValue();
      str1 = localAdFrame.getContent().toString();
      str2 = localAdFrame.getAdSpaceLayout().getFormat().toString();
      String str3 = localAdFrame.getAdGuid().toString();
      cz localcz1 = (cz)this.cT.get(str3);
      if (localcz1 == null)
        localcz1 = cx.a(this, str3);
      localcz2 = a(localcz1, "requested", true, null);
      onEvent(new cw("filled", Collections.emptyMap(), paramContext, paramAdUnit, localcz2, 0), this, 1);
      localAdCreative = cx.b(localAdFrame.getAdSpaceLayout());
      if ((this.cY != null) && (this.cY == paramAdUnit))
        break label178;
    }
    while (true)
    {
      return this.cZ;
      return null;
      label178: this.cZ = null;
      ICustomAdNetworkHandler localICustomAdNetworkHandler = this.cN;
      if ((i == 4) && (localICustomAdNetworkHandler != null))
      {
        AdNetworkView localAdNetworkView = localICustomAdNetworkHandler.getAdFromNetwork(paramContext, localAdCreative, str1);
        if (localAdNetworkView != null)
        {
          localAdNetworkView.K = this;
          localAdNetworkView.L = localcz2;
          localAdNetworkView.N = 0;
          localAdNetworkView.M = paramAdUnit;
          this.cZ = new at(localAdNetworkView, paramAdUnit);
        }
      }
      else if (str2.equals("takeover"))
      {
        this.cG = localcz2;
        this.cH = paramAdUnit;
        ao localao = this.cP.a(paramContext, this, localcz2, paramAdUnit);
        if (localao != null)
          this.cZ = new cb(localao, paramAdUnit);
      }
      else
      {
        p localp = this.cO.b(paramContext, this, localcz2, paramAdUnit);
        if (localp != null)
          this.cZ = new at(localp, paramAdUnit);
      }
    }
  }

  private bu a(String paramString, boolean paramBoolean, Map<String, String> paramMap)
  {
    try
    {
      bu localbu = new bu(paramString, paramBoolean, M(), paramMap);
      return localbu;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private static <A extends SpecificRecordBase> A a(byte[] paramArrayOfByte, Class<A> paramClass)
  {
    BinaryDecoder localBinaryDecoder = cs.binaryDecoder(new ByteArrayInputStream(paramArrayOfByte), null);
    try
    {
      SpecificRecordBase localSpecificRecordBase = (SpecificRecordBase)new SpecificDatumReader(paramClass).read(null, localBinaryDecoder);
      return localSpecificRecordBase;
    }
    catch (ClassCastException localClassCastException)
    {
      new StringBuilder().append("ClassCastException in parseAvroBinary:").append(localClassCastException.getMessage()).toString();
      new StringBuilder().append("ClassCastException in parseAvroBinary: bytes = ").append(paramArrayOfByte).append(" type = ").append(paramClass.getSimpleName()).toString();
      return null;
    }
    catch (IOException localIOException)
    {
      new StringBuilder().append("IOException in parseAvroBinary:").append(localIOException.getMessage()).toString();
      new StringBuilder().append("IOException in parseAvroBinary: bytes = ").append(paramArrayOfByte).append(" type = ").append(paramClass.getSimpleName()).toString();
    }
    return null;
  }

  private String a(cz paramcz, AdUnit paramAdUnit, af paramaf, String paramString)
  {
    Pattern localPattern = Pattern.compile(".*?(%\\{\\w+\\}).*?");
    for (Matcher localMatcher = localPattern.matcher(paramString); localMatcher.matches(); localMatcher = localPattern.matcher(paramString))
      paramString = this.cu.a(paramcz, paramAdUnit, paramString, localMatcher.group(1));
    return paramString;
  }

  private static List<af> a(AdFrame paramAdFrame, cw paramcw)
  {
    ArrayList localArrayList = new ArrayList();
    List localList = paramAdFrame.getCallbacks();
    String str1 = paramcw.eW;
    Iterator localIterator1 = localList.iterator();
    while (localIterator1.hasNext())
    {
      Callback localCallback = (Callback)localIterator1.next();
      if (localCallback.getEvent().toString().equals(str1))
      {
        Iterator localIterator2 = localCallback.getActions().iterator();
        while (localIterator2.hasNext())
        {
          CharSequence localCharSequence = (CharSequence)localIterator2.next();
          HashMap localHashMap = new HashMap();
          Object localObject = localCharSequence.toString();
          int i = ((String)localObject).indexOf('?');
          if (i != -1)
          {
            String str2 = ((String)localObject).substring(0, i);
            String str3 = ((String)localObject).substring(i + 1);
            if (str3.contains("%{eventParams}"))
            {
              str3 = str3.replace("%{eventParams}", "");
              localHashMap.putAll(paramcw.bv);
            }
            localHashMap.putAll(bd.t(str3));
            localObject = str2;
          }
          localArrayList.add(new af((String)localObject, localHashMap, paramcw));
        }
      }
    }
    return localArrayList;
  }

  private void a(Context paramContext, String paramString, boolean paramBoolean, AdUnit paramAdUnit)
  {
    this.cK.post(new cu(this, paramString, paramAdUnit, paramContext, paramBoolean));
  }

  private void a(FlurryFreqCapManager paramFlurryFreqCapManager, DataOutputStream paramDataOutputStream)
  {
    try
    {
      Iterator localIterator = paramFlurryFreqCapManager.ao().iterator();
      while (localIterator.hasNext())
      {
        FlurryFreqCapInfo localFlurryFreqCapInfo = (FlurryFreqCapInfo)localIterator.next();
        try
        {
          paramDataOutputStream.writeShort(1);
          localFlurryFreqCapInfo.a(paramDataOutputStream);
        }
        catch (IOException localIOException)
        {
          db.c(d, "unable to convert freqCap to byte[]: " + localFlurryFreqCapInfo.getIdHash());
        }
      }
    }
    finally
    {
    }
  }

  private void a(SdkLogResponse paramSdkLogResponse)
  {
    try
    {
      if (paramSdkLogResponse.getResult().toString().equals("success"))
        this.cS.removeAll(this.cU);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  private void a(List<cz> paramList, DataOutputStream paramDataOutputStream)
  {
    try
    {
      int i = paramList.size();
      int j = 0;
      while (true)
        if (j < i)
          try
          {
            ((cz)paramList.get(j)).a(paramDataOutputStream);
            j++;
          }
          catch (IOException localIOException)
          {
            while (true)
              db.c(d, "unable to convert adLog to byte[]: " + ((cz)paramList.get(j)).at());
          }
    }
    finally
    {
    }
  }

  private boolean a(Context paramContext, String paramString, FlurryAdSize paramFlurryAdSize, long paramLong)
  {
    boolean bool2;
    if (i(paramString))
      bool2 = true;
    while (true)
    {
      return bool2;
      bw localbw = new bw(this, paramContext, paramString, paramFlurryAdSize, null, false, false);
      localbw.execute(new Void[0]);
      try
      {
        localbw.get(paramLong, TimeUnit.MILLISECONDS);
        boolean bool1 = i(paramString);
        bool2 = false;
        if (bool1)
          return true;
      }
      catch (InterruptedException localInterruptedException)
      {
        localInterruptedException.printStackTrace();
        return false;
      }
      catch (ExecutionException localExecutionException)
      {
        localExecutionException.printStackTrace();
        return false;
      }
      catch (TimeoutException localTimeoutException)
      {
      }
    }
    return false;
  }

  static boolean a(Context paramContext, String paramString1, String paramString2)
  {
    Intent localIntent = new Intent(paramString2);
    localIntent.setData(Uri.parse(paramString1));
    return bd.a(paramContext, localIntent);
  }

  private static byte[] a(InputStream paramInputStream)
    throws IOException
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    byte[] arrayOfByte = new byte[''];
    while (true)
    {
      int i = paramInputStream.read(arrayOfByte);
      if (i == -1)
        break;
      localByteArrayOutputStream.write(arrayOfByte, 0, i);
    }
    return localByteArrayOutputStream.toByteArray();
  }

  private byte[] a(String paramString, int paramInt1, int paramInt2, int paramInt3, int paramInt4, boolean paramBoolean, FlurryAdSize paramFlurryAdSize)
  {
    List localList = R();
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = this.cM.ao().iterator();
    while (localIterator.hasNext())
    {
      FlurryFreqCapInfo localFlurryFreqCapInfo = (FlurryFreqCapInfo)localIterator.next();
      localArrayList.add(FrequencyCapInfo.ak().setIdHash(localFlurryFreqCapInfo.getIdHash()).setExpirationTime(localFlurryFreqCapInfo.getExpirationTime()).setNewCap(localFlurryFreqCapInfo.getNewCap()).setPreviousCap(localFlurryFreqCapInfo.getPreviousCap()).setPreviousCapType(localFlurryFreqCapInfo.getPreviousCapType()).setServeTime(localFlurryFreqCapInfo.getServeTime()).setViews(localFlurryFreqCapInfo.getViews()).build());
    }
    AdRequest localAdRequest = AdRequest.ab().setApiKey(FlurryAgent.w()).setAdSpaceName("").setBindings(cr).setAdReportedIds(localList).setLocation(Location.as().setLat(this.cD).setLon(this.cE).build()).setTestDevice(this.cW).setAgentVersion(Integer.toString(FlurryAgent.getAgentVersion())).setSessionId(this.bb).setAdViewContainer(AdViewContainer.A().setScreenHeight(paramInt4).setScreenWidth(paramInt3).setViewHeight(paramInt2).setViewWidth(paramInt1).build()).setLocale(FlurryAgent.getLocale()).setTimezone(FlurryAgent.x()).setOsVersion(this.aS).setDevicePlatform(this.cz).setCanDoSKAppStore(false).setNetworkStatus(1).setFrequencyCapInfos(localArrayList).build();
    if (paramBoolean)
      localAdRequest.a(Boolean.valueOf(paramBoolean));
    while (true)
    {
      if (paramFlurryAdSize != null)
        localAdRequest.a(TestAds.al().setAdspacePlacement(paramFlurryAdSize.getValue()).build());
      if (this.cX != null)
        localAdRequest.c(N());
      new StringBuilder().append("Got ad request: ").append(localAdRequest).toString();
      SpecificDatumWriter localSpecificDatumWriter = new SpecificDatumWriter(AdRequest.class);
      ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
      BinaryEncoder localBinaryEncoder = EncoderFactory.get().directBinaryEncoder(localByteArrayOutputStream, null);
      try
      {
        localSpecificDatumWriter.write(localAdRequest, localBinaryEncoder);
        localBinaryEncoder.flush();
        return localByteArrayOutputStream.toByteArray();
        localAdRequest.b(paramString);
      }
      catch (IOException localIOException)
      {
        localIOException.getMessage();
      }
    }
    return new byte[0];
  }

  private static int b(byte[] paramArrayOfByte)
  {
    CrcMessageDigest localCrcMessageDigest = new CrcMessageDigest();
    localCrcMessageDigest.update(paramArrayOfByte);
    return localCrcMessageDigest.getChecksum();
  }

  private boolean b(byte[] paramArrayOfByte, String paramString)
  {
    if (paramString == null)
      return false;
    StringBuilder localStringBuilder1;
    String str1;
    if (paramString.equals("/v5/getAds.do"))
    {
      localStringBuilder1 = new StringBuilder();
      if (this.cB != null)
        str1 = this.cB;
    }
    while (true)
    {
      String str2 = str1 + paramString;
      byte[] arrayOfByte = c(paramArrayOfByte, str2);
      if (arrayOfByte != null);
      try
      {
        if (paramString.equals("/postAdLog.do"))
          c(arrayOfByte);
        return true;
        if (FlurryAgent.getUseHttps())
        {
          str1 = "https://ads.flurry.com";
          continue;
        }
        str1 = "http://ads.flurry.com";
        continue;
        StringBuilder localStringBuilder2 = new StringBuilder();
        String str3;
        if (this.cC != null)
          str3 = this.cC;
        while (true)
        {
          str2 = str3 + paramString;
          break;
          if (FlurryAgent.getUseHttps())
            str3 = "https://adlog.flurry.com";
          else
            str3 = "http://adlog.flurry.com";
        }
      }
      catch (IOException localIOException)
      {
        while (true)
          db.d(d, "IOException: " + localIOException.toString());
      }
    }
  }

  private void c(byte[] paramArrayOfByte)
    throws IOException
  {
    SdkLogResponse localSdkLogResponse = (SdkLogResponse)a(paramArrayOfByte, SdkLogResponse.class);
    if (localSdkLogResponse != null)
    {
      new StringBuilder().append("Got ad log response: ").append(localSdkLogResponse).toString();
      if (!localSdkLogResponse.getResult().toString().equals("success"))
        break label58;
      a(localSdkLogResponse);
    }
    while (true)
    {
      return;
      label58: Iterator localIterator = localSdkLogResponse.getErrors().iterator();
      while (localIterator.hasNext())
      {
        CharSequence localCharSequence = (CharSequence)localIterator.next();
        db.d(d, localCharSequence.toString());
      }
    }
  }

  private byte[] c(byte[] paramArrayOfByte, String paramString)
  {
    ByteArrayEntity localByteArrayEntity = new ByteArrayEntity(paramArrayOfByte);
    localByteArrayEntity.setContentType("avro/binary");
    HttpPost localHttpPost = new HttpPost(paramString);
    localHttpPost.setEntity(localByteArrayEntity);
    localHttpPost.setHeader("accept", "avro/binary");
    localHttpPost.setHeader("FM-Checksum", Integer.toString(b(paramArrayOfByte)));
    BasicHttpParams localBasicHttpParams = new BasicHttpParams();
    HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 10000);
    HttpConnectionParams.setSoTimeout(localBasicHttpParams, 15000);
    localHttpPost.getParams().setBooleanParameter("http.protocol.expect-continue", false);
    HttpClient localHttpClient = cn.a(localBasicHttpParams);
    byte[] arrayOfByte;
    try
    {
      HttpResponse localHttpResponse = localHttpClient.execute(localHttpPost);
      int i = localHttpResponse.getStatusLine().getStatusCode();
      if ((i == 200) && (localHttpResponse.getEntity() != null) && (localHttpResponse.getEntity().getContentLength() != 0L))
      {
        db.e(d, "Request successful");
        arrayOfByte = a(localHttpResponse.getEntity().getContent());
        localByteArrayEntity.consumeContent();
        String str = Integer.toString(b(arrayOfByte));
        if (!localHttpResponse.containsHeader("FM-Checksum"))
          break label330;
        if (localHttpResponse.getFirstHeader("FM-Checksum").getValue().equals(str))
          return arrayOfByte;
      }
      else
      {
        db.d(d, "Request to url = " + paramString + " failed with HTTP = " + i);
      }
      return null;
    }
    catch (IOException localIOException)
    {
      while (true)
        db.b(d, "Request to url = " + paramString + " failed with IOException = " + localIOException.toString(), localIOException);
    }
    label330: return arrayOfByte;
  }

  public static void clearTargetingKeywords()
  {
    getInstance().cX = null;
  }

  public static void clearUserCookies()
  {
    getInstance().cF.clear();
  }

  public static void displayAd(Context paramContext, String paramString, ViewGroup paramViewGroup)
  {
    if (paramContext == null)
    {
      db.d(d, "Context passed to displayAd was null.");
      return;
    }
    if (paramString == null)
    {
      db.d(d, "Ad space name passed to displayAd was null.");
      return;
    }
    if (paramString.length() == 0)
    {
      db.d(d, "Ad space name passed to displayAd was empty.");
      return;
    }
    if (paramViewGroup == null)
    {
      db.d(d, "ViewGroup  passed to displayAd was null.");
      return;
    }
    getInstance().g(paramContext);
    while (true)
    {
      FlurryAds localFlurryAds;
      try
      {
        localFlurryAds = dc;
        bf localbf = localFlurryAds.n(paramString);
        if (localbf == null)
          break;
        if (localFlurryAds.cQ != null)
        {
          if ((localbf instanceof at))
            localFlurryAds.cQ.shouldDisplayAd(paramString.toString(), FlurryAdType.WEB_BANNER);
        }
        else
        {
          localbf.a(paramContext, paramViewGroup);
          return;
        }
      }
      catch (Throwable localThrowable)
      {
        db.b(d, "", localThrowable);
        return;
      }
      localFlurryAds.cQ.shouldDisplayAd(paramString.toString(), FlurryAdType.WEB_TAKEOVER);
    }
  }

  static boolean e(Context paramContext, String paramString)
  {
    int i = 0;
    while (true)
      if (i < 5)
      {
        if ((i(paramContext) == true) && (!h(paramContext)))
        {
          HttpResponse localHttpResponse = bd.a(paramString, 10000, 15000, true);
          if ((localHttpResponse == null) || (localHttpResponse.getStatusLine().getStatusCode() != 200))
            break label87;
          new StringBuilder().append("URL hit succeeded for: ").append(paramString).toString();
          return true;
        }
        try
        {
          Thread.sleep(100L);
          label87: i++;
        }
        catch (InterruptedException localInterruptedException)
        {
          while (true)
            localInterruptedException.getMessage();
        }
      }
    return false;
  }

  public static void enableTestAds(boolean paramBoolean)
  {
    getInstance().cW = paramBoolean;
  }

  public static void fetchAd(Context paramContext, String paramString, ViewGroup paramViewGroup, FlurryAdSize paramFlurryAdSize)
  {
    if (paramContext == null)
      db.d(d, "Context passed to fetchAd was null.");
    FlurryAds localFlurryAds;
    do
    {
      return;
      if (paramString == null)
      {
        db.d(d, "Ad space name passed to fetchAd was null.");
        return;
      }
      if (paramString.length() == 0)
      {
        db.d(d, "Ad space name passed to fetchAd was empty.");
        return;
      }
      if (paramViewGroup == null)
      {
        db.d(d, "ViewGroup passed to fetchAd was null.");
        return;
      }
      if (paramFlurryAdSize == null)
      {
        db.d(d, "FlurryAdSize passed to fetchAd was null.");
        return;
      }
      getInstance().g(paramContext);
      try
      {
        localFlurryAds = dc;
        if ((localFlurryAds.i(paramString)) && (!h(paramContext)))
        {
          localFlurryAds.c(paramContext, paramString);
          return;
        }
      }
      catch (Throwable localThrowable)
      {
        db.b(d, "", localThrowable);
        return;
      }
    }
    while (h(paramContext));
    new bw(localFlurryAds, paramContext, paramString, paramFlurryAdSize, paramViewGroup, true, false).execute(new Void[0]);
  }

  private void g(Context paramContext)
  {
    try
    {
      if (!this.dd)
      {
        this.cx = paramContext.getFileStreamPath(".flurryadlog." + Integer.toString(FlurryAgent.w().hashCode(), 16));
        this.cy = paramContext.getFileStreamPath(".flurryfreqcap." + Integer.toString(FlurryAgent.w().hashCode(), 16));
        String str = paramContext.getPackageName();
        this.cA = a(paramContext, "market://details?id=" + str, "android.intent.action.VIEW");
        this.cJ.bE = paramContext;
        T();
        db.c(d, "Attempting to load FreqCap data");
        V();
        this.dd = true;
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public static boolean getAd(Context paramContext, String paramString, ViewGroup paramViewGroup, FlurryAdSize paramFlurryAdSize, long paramLong)
  {
    if (paramContext == null)
    {
      db.d(d, "Context passed to getAd was null.");
      return false;
    }
    if (paramString == null)
    {
      db.d(d, "Ad space name passed to getAd was null.");
      return false;
    }
    if (paramString.length() == 0)
    {
      db.d(d, "Ad space name passed to getAd was empty.");
      return false;
    }
    if (paramViewGroup == null)
    {
      db.d(d, "ViewGroup passed to getAd was null.");
      return false;
    }
    if (paramFlurryAdSize == null)
    {
      db.d(d, "FlurryAdSize passed to getAd was null.");
      return false;
    }
    getInstance().g(paramContext);
    try
    {
      boolean bool = dc.a(paramContext, paramString, paramFlurryAdSize, paramViewGroup, paramLong);
      return bool;
    }
    catch (Throwable localThrowable)
    {
      db.b(d, "", localThrowable);
    }
    return false;
  }

  static FlurryAds getInstance()
  {
    if (dc == null)
      dc = new FlurryAds();
    return dc;
  }

  private static boolean h(Context paramContext)
  {
    return ((KeyguardManager)paramContext.getSystemService("keyguard")).inKeyguardRestrictedInputMode();
  }

  private static boolean i(Context paramContext)
  {
    boolean bool;
    if (paramContext.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE") != 0)
      bool = true;
    while (true)
    {
      return bool;
      NetworkInfo localNetworkInfo = ((ConnectivityManager)paramContext.getSystemService("connectivity")).getActiveNetworkInfo();
      if ((localNetworkInfo != null) && ((localNetworkInfo.isConnected()) || (localNetworkInfo.isRoaming())));
      for (bool = true; !bool; bool = false)
      {
        db.g(d, "No connectivity found.");
        return bool;
      }
    }
  }

  private boolean i(String paramString)
  {
    return this.cJ.i(paramString);
  }

  public static void initializeAds(Context paramContext)
  {
    if (paramContext == null)
    {
      db.d(d, "Context passed to initializeAds was null.");
      return;
    }
    getInstance().g(paramContext);
    try
    {
      FlurryAds localFlurryAds = dc;
      db.e(d, "Initializing ads -- requesting ads with precaching enabled on the server");
      boolean bool = FlurryAgent.m();
      int i = 0;
      if (!bool)
        i = 500;
      localFlurryAds.cK.postDelayed(new cr(localFlurryAds, paramContext), i);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b(d, "", localThrowable);
    }
  }

  public static boolean isAdAvailable(Context paramContext, String paramString, FlurryAdSize paramFlurryAdSize, long paramLong)
  {
    if (paramContext == null)
    {
      db.d(d, "Context passed to isAdAvailable was null.");
      return false;
    }
    if (paramString == null)
    {
      db.d(d, "Ad space name passed to isAdAvailable was null.");
      return false;
    }
    if (paramString.length() == 0)
    {
      db.d(d, "Ad space name passed to isAdAvailable was empty.");
      return false;
    }
    if (paramFlurryAdSize == null)
    {
      db.d(d, "FlurryAdSize passed to isAdAvailable was null.");
      return false;
    }
    getInstance().g(paramContext);
    try
    {
      boolean bool = dc.a(paramContext, paramString, paramFlurryAdSize, paramLong);
      return bool;
    }
    catch (Throwable localThrowable)
    {
      db.b(d, "", localThrowable);
    }
    return false;
  }

  private AdUnit l(String paramString)
  {
    return this.cJ.h(paramString);
  }

  private bf n(String paramString)
  {
    return this.cL.n(paramString);
  }

  private void o(String paramString)
  {
    this.cL.o(paramString);
  }

  public static void removeAd(Context paramContext, String paramString, ViewGroup paramViewGroup)
  {
    if (paramContext == null)
    {
      db.d(d, "Context passed to removeAd was null.");
      return;
    }
    if (paramString == null)
    {
      db.d(d, "Ad space name passed to removeAd was null.");
      return;
    }
    if (paramString.length() == 0)
    {
      db.d(d, "Ad space name passed to removeAd was empty.");
      return;
    }
    if (paramViewGroup == null)
    {
      db.d(d, "ViewGroup passed to removeAd was null.");
      return;
    }
    getInstance().g(paramContext);
    try
    {
      dc.d(paramContext, paramString);
      return;
    }
    catch (Throwable localThrowable)
    {
      db.b(d, "", localThrowable);
    }
  }

  public static void setAdListener(FlurryAdListener paramFlurryAdListener)
  {
    getInstance().cQ = paramFlurryAdListener;
  }

  public static void setAdLogUrl(String paramString)
  {
    getInstance().cC = paramString;
  }

  public static void setAdServerUrl(String paramString)
  {
    getInstance().cB = paramString;
  }

  public static void setCustomAdNetworkHandler(ICustomAdNetworkHandler paramICustomAdNetworkHandler)
  {
    if (paramICustomAdNetworkHandler == null)
    {
      db.d(d, "ICustomAdNetworkHandler passed to setCustomAdNetworkHandler was null.");
      return;
    }
    getInstance().cN = paramICustomAdNetworkHandler;
  }

  public static void setLocation(float paramFloat1, float paramFloat2)
  {
    getInstance().cD = paramFloat1;
    getInstance().cE = paramFloat2;
  }

  public static void setTargetingKeywords(Map<String, String> paramMap)
  {
    if (paramMap == null)
      db.d(d, "targetingKeywords Map passed to setTargetingKeywords was null.");
    while (paramMap == null)
      return;
    getInstance().cX = paramMap;
  }

  public static void setUserCookies(Map<String, String> paramMap)
  {
    if (paramMap == null)
      db.d(d, "userCookies Map passed to setUserCookies was null.");
    while (true)
    {
      return;
      FlurryAds localFlurryAds = getInstance();
      if ((paramMap != null) && (paramMap.size() > 0))
      {
        Iterator localIterator = paramMap.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          if ((localEntry.getKey() != null) && (localEntry.getValue() != null))
            localFlurryAds.cF.put(localEntry.getKey(), localEntry.getValue());
          else
            db.g(d, "User cookie keys and values may not be null.");
        }
      }
    }
  }

  static String w()
  {
    return FlurryAgent.w();
  }

  final void J()
  {
    this.cM.ap();
  }

  final void K()
  {
    P();
  }

  final long L()
  {
    return this.bb;
  }

  final long M()
  {
    try
    {
      long l1 = SystemClock.elapsedRealtime() - this.bc;
      if (l1 > this.cI);
      while (true)
      {
        this.cI = l1;
        long l2 = this.cI;
        return l2;
        l1 = 1L + this.cI;
        this.cI = l1;
      }
    }
    finally
    {
    }
  }

  final Map<String, String> O()
  {
    Map localMap = this.cF;
    FlurryUserIdProvider localFlurryUserIdProvider;
    if (this.de != null)
    {
      localFlurryUserIdProvider = this.de;
      if (localFlurryUserIdProvider.mContext != null)
        break label48;
    }
    label48: for (String str = ""; ; str = localFlurryUserIdProvider.mContext.getSharedPreferences("FLURRY_SHARED_PREFERENCES", 0).getString("flurry_last_user_id", ""))
    {
      if (!TextUtils.isEmpty(str))
        localMap.put("appCloudUserId", str);
      return localMap;
    }
  }

  // ERROR //
  final void S()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 99	com/flurry/android/FlurryAds:cx	Ljava/io/File;
    //   6: invokestatic 1508	com/flurry/android/bc:b	(Ljava/io/File;)Z
    //   9: istore 5
    //   11: iload 5
    //   13: ifne +10 -> 23
    //   16: aconst_null
    //   17: invokestatic 1511	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   20: aload_0
    //   21: monitorexit
    //   22: return
    //   23: new 741	java/io/DataOutputStream
    //   26: dup
    //   27: new 1513	java/io/FileOutputStream
    //   30: dup
    //   31: aload_0
    //   32: getfield 99	com/flurry/android/FlurryAds:cx	Ljava/io/File;
    //   35: invokespecial 1516	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   38: invokespecial 1519	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   41: astore_2
    //   42: aload_2
    //   43: ldc_w 1520
    //   46: invokevirtual 745	java/io/DataOutputStream:writeShort	(I)V
    //   49: aload_0
    //   50: getfield 120	com/flurry/android/FlurryAds:cS	Ljava/util/List;
    //   53: astore 6
    //   55: aload 6
    //   57: monitorenter
    //   58: aload_0
    //   59: aload_0
    //   60: getfield 120	com/flurry/android/FlurryAds:cS	Ljava/util/List;
    //   63: aload_2
    //   64: invokespecial 1522	com/flurry/android/FlurryAds:a	(Ljava/util/List;Ljava/io/DataOutputStream;)V
    //   67: aload 6
    //   69: monitorexit
    //   70: aload_2
    //   71: iconst_0
    //   72: invokevirtual 745	java/io/DataOutputStream:writeShort	(I)V
    //   75: aload_2
    //   76: invokestatic 1511	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   79: goto -59 -> 20
    //   82: astore 4
    //   84: aload_0
    //   85: monitorexit
    //   86: aload 4
    //   88: athrow
    //   89: astore 7
    //   91: aload 6
    //   93: monitorexit
    //   94: aload 7
    //   96: athrow
    //   97: astore_1
    //   98: getstatic 90	com/flurry/android/FlurryAds:d	Ljava/lang/String;
    //   101: ldc_w 307
    //   104: aload_1
    //   105: invokestatic 1207	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   108: aload_2
    //   109: invokestatic 1511	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   112: goto -92 -> 20
    //   115: aload_2
    //   116: invokestatic 1511	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   119: aload_3
    //   120: athrow
    //   121: astore_3
    //   122: goto -7 -> 115
    //   125: astore_1
    //   126: aconst_null
    //   127: astore_2
    //   128: goto -30 -> 98
    //   131: astore_3
    //   132: aconst_null
    //   133: astore_2
    //   134: goto -19 -> 115
    //
    // Exception table:
    //   from	to	target	type
    //   16	20	82	finally
    //   75	79	82	finally
    //   108	112	82	finally
    //   115	121	82	finally
    //   58	70	89	finally
    //   91	94	89	finally
    //   42	58	97	java/lang/Throwable
    //   70	75	97	java/lang/Throwable
    //   94	97	97	java/lang/Throwable
    //   42	58	121	finally
    //   70	75	121	finally
    //   94	97	121	finally
    //   98	108	121	finally
    //   2	11	125	java/lang/Throwable
    //   23	42	125	java/lang/Throwable
    //   2	11	131	finally
    //   23	42	131	finally
  }

  // ERROR //
  final void U()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 115	com/flurry/android/FlurryAds:cM	Lcom/flurry/android/FlurryFreqCapManager;
    //   6: invokevirtual 1462	com/flurry/android/FlurryFreqCapManager:ap	()V
    //   9: aload_0
    //   10: getfield 101	com/flurry/android/FlurryAds:cy	Ljava/io/File;
    //   13: invokestatic 1508	com/flurry/android/bc:b	(Ljava/io/File;)Z
    //   16: istore 5
    //   18: iload 5
    //   20: ifne +10 -> 30
    //   23: aconst_null
    //   24: invokestatic 1511	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   27: aload_0
    //   28: monitorexit
    //   29: return
    //   30: new 741	java/io/DataOutputStream
    //   33: dup
    //   34: new 1513	java/io/FileOutputStream
    //   37: dup
    //   38: aload_0
    //   39: getfield 101	com/flurry/android/FlurryAds:cy	Ljava/io/File;
    //   42: invokespecial 1516	java/io/FileOutputStream:<init>	(Ljava/io/File;)V
    //   45: invokespecial 1519	java/io/DataOutputStream:<init>	(Ljava/io/OutputStream;)V
    //   48: astore_3
    //   49: aload_0
    //   50: getfield 115	com/flurry/android/FlurryAds:cM	Lcom/flurry/android/FlurryFreqCapManager;
    //   53: astore 6
    //   55: aload 6
    //   57: monitorenter
    //   58: aload_0
    //   59: aload_0
    //   60: getfield 115	com/flurry/android/FlurryAds:cM	Lcom/flurry/android/FlurryFreqCapManager;
    //   63: aload_3
    //   64: invokespecial 1525	com/flurry/android/FlurryAds:a	(Lcom/flurry/android/FlurryFreqCapManager;Ljava/io/DataOutputStream;)V
    //   67: aload 6
    //   69: monitorexit
    //   70: aload_3
    //   71: iconst_0
    //   72: invokevirtual 745	java/io/DataOutputStream:writeShort	(I)V
    //   75: aload_3
    //   76: invokestatic 1511	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   79: goto -52 -> 27
    //   82: astore_1
    //   83: aload_0
    //   84: monitorexit
    //   85: aload_1
    //   86: athrow
    //   87: astore 7
    //   89: aload 6
    //   91: monitorexit
    //   92: aload 7
    //   94: athrow
    //   95: astore_2
    //   96: getstatic 90	com/flurry/android/FlurryAds:d	Ljava/lang/String;
    //   99: ldc_w 307
    //   102: aload_2
    //   103: invokestatic 1207	com/flurry/android/db:b	(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    //   106: aload_3
    //   107: invokestatic 1511	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   110: goto -83 -> 27
    //   113: aload_3
    //   114: invokestatic 1511	com/flurry/android/bd:a	(Ljava/io/Closeable;)V
    //   117: aload 4
    //   119: athrow
    //   120: astore 4
    //   122: goto -9 -> 113
    //   125: astore_2
    //   126: aconst_null
    //   127: astore_3
    //   128: goto -32 -> 96
    //   131: astore 4
    //   133: aconst_null
    //   134: astore_3
    //   135: goto -22 -> 113
    //
    // Exception table:
    //   from	to	target	type
    //   2	9	82	finally
    //   23	27	82	finally
    //   75	79	82	finally
    //   106	110	82	finally
    //   113	120	82	finally
    //   58	70	87	finally
    //   89	92	87	finally
    //   49	58	95	java/lang/Throwable
    //   70	75	95	java/lang/Throwable
    //   92	95	95	java/lang/Throwable
    //   49	58	120	finally
    //   70	75	120	finally
    //   92	95	120	finally
    //   96	106	120	finally
    //   9	18	125	java/lang/Throwable
    //   30	49	125	java/lang/Throwable
    //   9	18	131	finally
    //   30	49	131	finally
  }

  final cz W()
  {
    return this.cG;
  }

  final AdUnit X()
  {
    return this.cH;
  }

  final cz a(cz paramcz, String paramString, boolean paramBoolean, Map<String, String> paramMap)
  {
    try
    {
      new StringBuilder().append("changeAdState(").append(paramcz).append(", ").append(paramString).append(", ").append(paramBoolean).append(", ").append(paramMap).append(")").toString();
      try
      {
        if (!this.cS.contains(paramcz))
        {
          this.cS.add(paramcz);
          new StringBuilder().append("changeAdState added adLog = ").append(paramcz).toString();
        }
        paramcz.a(a(paramString, paramBoolean, paramMap));
        return paramcz;
      }
      finally
      {
      }
    }
    finally
    {
    }
  }

  final List<AdUnit> a(Context paramContext, String paramString, ViewGroup paramViewGroup, boolean paramBoolean, FlurryAdSize paramFlurryAdSize)
  {
    this.cM.ap();
    int i = bd.n(paramContext);
    int j = bd.o(paramContext);
    switch (paramContext.getResources().getConfiguration().orientation)
    {
    default:
    case 2:
    }
    byte[] arrayOfByte1;
    for (Pair localPair1 = Pair.create(Integer.valueOf(i), Integer.valueOf(j)); ; localPair1 = Pair.create(Integer.valueOf(j), Integer.valueOf(i)))
    {
      int k = ((Integer)localPair1.first).intValue();
      int m = ((Integer)localPair1.second).intValue();
      Pair localPair2 = Pair.create(Integer.valueOf(bd.n(paramContext)), Integer.valueOf(bd.o(paramContext)));
      int n = ((Integer)localPair2.first).intValue();
      int i1 = ((Integer)localPair2.second).intValue();
      if ((paramFlurryAdSize.equals(FlurryAdSize.BANNER_BOTTOM)) || (paramFlurryAdSize.equals(FlurryAdSize.BANNER_TOP)))
      {
        if ((paramViewGroup != null) && (paramViewGroup.getHeight() > 0))
          i1 = bd.a(paramContext, paramViewGroup.getHeight());
        if ((paramViewGroup != null) && (paramViewGroup.getWidth() > 0))
          n = bd.a(paramContext, paramViewGroup.getWidth());
      }
      arrayOfByte1 = a(paramString, n, i1, k, m, paramBoolean, paramFlurryAdSize);
      if ((arrayOfByte1 != null) && (arrayOfByte1.length >= 1))
        break;
      return Collections.emptyList();
    }
    String str;
    if (this.cB != null)
      str = this.cB + "/v5/getAds.do";
    byte[] arrayOfByte2;
    while (true)
    {
      arrayOfByte2 = c(arrayOfByte1, str);
      if ((arrayOfByte2 != null) && (arrayOfByte2.length >= 1))
        break;
      return Collections.emptyList();
      if (FlurryAgent.getUseHttps())
        str = "https://ads.flurry.com/v5/getAds.do";
      else
        str = "http://ads.flurry.com/v5/getAds.do";
    }
    AdResponse localAdResponse = (AdResponse)a(arrayOfByte2, AdResponse.class);
    if (localAdResponse == null)
      return Collections.emptyList();
    new StringBuilder().append("Got ad response: ").append(localAdResponse).toString();
    if (localAdResponse.getErrors().size() > 0)
    {
      db.d(d, "Ad server responded with the following error(s):");
      Iterator localIterator = localAdResponse.getErrors().iterator();
      while (localIterator.hasNext())
      {
        CharSequence localCharSequence = (CharSequence)localIterator.next();
        db.d(d, localCharSequence.toString());
      }
      return Collections.emptyList();
    }
    if ((!TextUtils.isEmpty(paramString)) && ((localAdResponse.getAdUnits() == null) || (localAdResponse.getAdUnits().size() == 0)))
    {
      db.d(d, "Ad server responded but sent no ad units.");
      return Collections.emptyList();
    }
    return localAdResponse.getAdUnits();
  }

  final void a(Context paramContext, long paramLong1, long paramLong2)
  {
    this.de = new FlurryUserIdProvider(paramContext);
    this.bb = paramLong1;
    this.bc = paramLong2;
    this.cI = 0L;
  }

  final void a(Context paramContext, String paramString, AdUnit paramAdUnit)
  {
    if (paramString.startsWith("market://details?id="))
    {
      String str1 = paramAdUnit.getAdSpace().toString();
      if (this.cA)
      {
        if (!b(paramContext, paramString, str1))
          db.d(d, "Cannot launch Google Play url " + paramString);
        return;
      }
      String str2 = paramString.substring("market://details?id=".length());
      b(paramContext, "https://market.android.com/details?id=" + str2, str1);
      return;
    }
    db.g(d, "Unexpected Google Play url scheme: " + paramString);
  }

  final void a(AdUnit paramAdUnit)
  {
    this.cH = paramAdUnit;
  }

  final void a(cz paramcz)
  {
    try
    {
      if (this.cS.size() < 32767)
      {
        this.cS.add(paramcz);
        this.cT.put(paramcz.at(), paramcz);
      }
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  final boolean a(Context paramContext, Intent paramIntent, String paramString)
  {
    boolean bool1 = false;
    ComponentName localComponentName;
    if (paramContext != null)
    {
      bool1 = false;
      if (paramIntent != null)
      {
        bool1 = false;
        if (paramString != null)
        {
          boolean bool2 = bd.a(paramContext, paramIntent);
          bool1 = false;
          if (bool2)
          {
            if ((paramContext == null) || (paramIntent == null))
              break label151;
            localComponentName = paramIntent.resolveActivity(paramContext.getPackageManager());
          }
        }
      }
    }
    label151: for (boolean bool3 = paramContext.getPackageName().equals(localComponentName.getPackageName()); ; bool3 = false)
    {
      Intent localIntent;
      if (bool3)
        localIntent = new Intent(paramIntent);
      while (true)
      {
        if (localIntent != null)
          localIntent.putExtra("adSpaceName", paramString);
        try
        {
          paramContext.startActivity(localIntent);
          bool1 = true;
          return bool1;
          localIntent = new Intent(paramContext, FlurryFullscreenTakeoverActivity.class);
          localIntent.putExtra("targetIntent", paramIntent);
        }
        catch (ActivityNotFoundException localActivityNotFoundException)
        {
          db.b(d, "Cannot launch Activity", localActivityNotFoundException);
          return false;
        }
      }
    }
  }

  final boolean a(Context paramContext, String paramString, ViewGroup paramViewGroup)
  {
    c(paramContext, paramString);
    if (n(paramString) == null)
      return false;
    displayAd(paramContext, paramString, paramViewGroup);
    return true;
  }

  final boolean a(Context paramContext, String paramString, FlurryAdSize paramFlurryAdSize, ViewGroup paramViewGroup, long paramLong)
  {
    if (!i(paramString))
    {
      if ((i(paramContext)) && (!h(paramContext)))
      {
        boolean bool1;
        if (paramLong == 0L)
          bool1 = true;
        while (true)
        {
          boolean bool2;
          bw localbw;
          if (paramLong == 0L)
          {
            bool2 = true;
            localbw = new bw(this, paramContext, paramString, paramFlurryAdSize, paramViewGroup, bool1, bool2);
            localbw.execute(new Void[0]);
            if (paramLong <= 0L)
              break label171;
          }
          try
          {
            localbw.get(paramLong, TimeUnit.MILLISECONDS);
            if (!i(paramString))
              break label171;
            boolean bool3 = a(paramContext, paramString, paramViewGroup);
            return bool3;
            bool1 = false;
            continue;
            bool2 = false;
          }
          catch (InterruptedException localInterruptedException)
          {
            localInterruptedException.printStackTrace();
            return false;
          }
          catch (ExecutionException localExecutionException)
          {
            localExecutionException.printStackTrace();
            return false;
          }
          catch (TimeoutException localTimeoutException)
          {
            return false;
          }
        }
      }
      if ((!i(paramContext)) && (this.cQ != null))
        this.cQ.spaceDidFailToReceiveAd(paramString.toString());
      label171: return false;
    }
    if (!h(paramContext))
      return a(paramContext, paramString, paramViewGroup);
    return false;
  }

  final void b(cz paramcz)
  {
    this.cG = paramcz;
  }

  final void b(DataInputStream paramDataInputStream)
    throws IOException
  {
    try
    {
      while (paramDataInputStream.readUnsignedShort() != 0)
        synchronized (this.cS)
        {
          this.cS.add(new cz(paramDataInputStream));
        }
    }
    finally
    {
    }
    this.cv = true;
  }

  final void b(String paramString, boolean paramBoolean)
  {
    this.cR = (1 + this.cR);
    if ((1 == this.cR) && (this.cQ != null))
      this.cQ.onAdOpened(paramString);
    if ((paramBoolean) && (this.cQ != null))
      this.cQ.onApplicationExit(paramString);
  }

  final void b(Map<Integer, ByteBuffer> paramMap)
  {
    this.aX = paramMap;
  }

  final boolean b(Context paramContext, String paramString1, String paramString2)
  {
    return a(paramContext, new Intent("android.intent.action.VIEW").setData(Uri.parse(paramString1)), paramString2);
  }

  final void c(Context paramContext, String paramString)
  {
    AdUnit localAdUnit = l(paramString);
    if (localAdUnit == null)
      if (this.cQ != null)
        this.cQ.spaceDidFailToReceiveAd(paramString.toString());
    do
    {
      return;
      this.cZ = null;
      bf localbf = a(paramContext, localAdUnit);
      this.cL.a(paramString, localbf);
    }
    while (this.cQ == null);
    this.cQ.spaceDidReceiveAd(paramString.toString());
  }

  final void c(DataInputStream paramDataInputStream)
    throws IOException
  {
    try
    {
      while (paramDataInputStream.readShort() != 0)
        synchronized (this.cM)
        {
          this.cM.a(new FlurryFreqCapInfo(paramDataInputStream));
        }
    }
    finally
    {
    }
    this.cw = true;
  }

  final void d(Context paramContext, String paramString)
  {
    new StringBuilder().append("_removeAd(context = ").append(paramContext).append(", adSpaceName = ").append(paramString).append(")").toString();
    ac localac = this.cL.A(paramString);
    if (localac == null)
    {
      o(paramString);
      return;
    }
    localac.stop();
    ViewGroup localViewGroup = localac.h();
    if (localViewGroup != null)
    {
      localac.removeAllViews();
      localViewGroup.removeView(localac);
    }
    o(paramString);
    this.cL.B(paramString);
  }

  final void d(List<cz> paramList)
  {
    this.cU = paramList;
  }

  final void e(List<AdUnit> paramList)
  {
    this.cJ.b(paramList);
  }

  final String getPhoneId()
  {
    return this.aW;
  }

  final void j(String paramString)
  {
    this.cR = (-1 + this.cR);
    if ((this.cR == 0) && (this.cQ != null))
      this.cQ.onAdClosed(paramString);
  }

  final void k(String paramString)
  {
    this.aW = paramString;
  }

  final void m(String paramString)
  {
    byte[] arrayOfByte = Q();
    if (arrayOfByte != null)
      b(arrayOfByte, paramString);
  }

  public void onEvent(cw paramcw, bm parambm, int paramInt)
  {
    new StringBuilder().append("onEvent:event=").append(paramcw.eW).append(",params=").append(paramcw.bv).toString();
    List localList = a((AdFrame)paramcw.M.getAdFrames().get(paramcw.eX), paramcw);
    if (localList.isEmpty())
    {
      Iterator localIterator4 = this.da.entrySet().iterator();
      while (localIterator4.hasNext())
      {
        Map.Entry localEntry2 = (Map.Entry)localIterator4.next();
        if (((String)localEntry2.getKey()).equals(paramcw.eW))
          localList.add(new af((String)localEntry2.getValue(), paramcw.bv, paramcw));
      }
    }
    if (paramcw.eW.equals("adWillClose"))
    {
      Iterator localIterator3 = localList.iterator();
      af localaf3;
      do
      {
        if (!localIterator3.hasNext())
          break;
        localaf3 = (af)localIterator3.next();
      }
      while (!this.db.contains(localaf3.bu));
    }
    for (int i = 1; ; i = 0)
    {
      if (i == 0)
        localList.add(new af("closeAd", Collections.emptyMap(), paramcw));
      if ((paramcw.eW.equals("renderFailed")) && (this.cQ != null))
        this.cQ.onRenderFailed(paramcw.M.getAdSpace().toString());
      if ((paramcw.eW.equals("clicked")) && (this.cQ != null))
        this.cQ.onAdClicked(paramcw.M.getAdSpace().toString());
      if ((paramcw.eW.equals("videoCompleted")) && (this.cQ != null))
        this.cQ.onVideoCompleted(paramcw.M.getAdSpace().toString());
      Iterator localIterator1 = localList.iterator();
      Object localObject1 = null;
      af localaf2;
      if (localIterator1.hasNext())
      {
        localaf2 = (af)localIterator1.next();
        if (!localaf2.bu.equals("logEvent"))
          break label632;
        localaf2.bv.put("__sendToServer", "true");
      }
      label632: for (Object localObject2 = localaf2; ; localObject2 = localObject1)
      {
        if (localaf2.bu.equals("loadAdComponents"))
        {
          Iterator localIterator2 = localaf2.bw.bv.entrySet().iterator();
          while (localIterator2.hasNext())
          {
            Map.Entry localEntry1 = (Map.Entry)localIterator2.next();
            localaf2.bv.put(((String)localEntry1.getKey()).toString(), ((String)localEntry1.getValue()).toString());
          }
        }
        db.f(d, localaf2.toString());
        parambm.performAction$3deb3ec3(localaf2, this, paramInt + 1);
        localObject1 = localObject2;
        break;
        if (localObject1 == null)
        {
          HashMap localHashMap = new HashMap();
          localHashMap.put("__sendToServer", "false");
          af localaf1 = new af("logEvent", localHashMap, paramcw);
          parambm.performAction$3deb3ec3(localaf1, this, paramInt + 1);
          db.f(d, localaf1.toString());
        }
        return;
      }
    }
  }

  public void performAction$3deb3ec3(af paramaf, FlurryAds paramFlurryAds, int paramInt)
  {
    boolean bool1 = true;
    new StringBuilder().append("performAction:action=").append(paramaf.bu).append(",params=").append(paramaf.bv).append(",triggering event=").append(paramaf.bw.eW).toString();
    String str1 = paramaf.bu;
    Context localContext = paramaf.bw.J;
    cz localcz = paramaf.bw.L;
    AdUnit localAdUnit = paramaf.bw.M;
    String str2 = localAdUnit.getAdSpace().toString();
    if (paramInt > 10)
      new StringBuilder().append("Maximum depth for event/action loop exceeded when performing action:").append(str1).append(",").append(paramaf.bv).append(",triggered by:").append(paramaf.bw.eW).toString();
    label856: FlurryFreqCapInfo localFlurryFreqCapInfo1;
    do
    {
      do
      {
        do
        {
          do
          {
            do
            {
              do
              {
                do
                {
                  do
                  {
                    do
                    {
                      do
                      {
                        return;
                        if (str1.equals("directOpen"))
                        {
                          if (paramaf.bv.containsKey("url"))
                          {
                            String str15 = (String)paramaf.bv.get("url");
                            if (str15.startsWith("market://"))
                            {
                              a(localContext, str15, localAdUnit);
                              return;
                            }
                            if ("true".equals(paramaf.bv.get("native")))
                            {
                              b(localContext, a(localcz, localAdUnit, paramaf, str15), str2);
                              return;
                            }
                            Intent localIntent3 = new Intent(localContext, FlurryFullscreenTakeoverActivity.class);
                            localIntent3.putExtra("url", str15);
                            if (bd.a(localContext, localIntent3))
                            {
                              a(localContext, localIntent3, str2);
                              return;
                            }
                            db.g(d, "Can't start FlurryFullscreenTakeoverActivity, was it declared in the manifest? Falling back to default browser");
                            b(localContext, str15, str2);
                            return;
                          }
                          db.d(d, "failed to perform directOpen action: no url in " + paramaf.bw.eW);
                          return;
                        }
                        if (!str1.equals("delete"))
                          break;
                        if (paramaf.bv.containsKey("count"))
                        {
                          String str14 = (String)paramaf.bv.get("count");
                          try
                          {
                            int m = Integer.parseInt(str14);
                            k = m;
                            this.cJ.a(str2, k);
                            return;
                          }
                          catch (NumberFormatException localNumberFormatException2)
                          {
                            while (true)
                            {
                              new StringBuilder().append("caught NumberFormatException with count parameter in deleteAds:").append(str14).toString();
                              int k = -1;
                            }
                          }
                        }
                      }
                      while (!paramaf.bv.containsKey("groupId"));
                      String str13 = (String)paramaf.bv.get("groupId");
                      this.cJ.b(str2, str13);
                      return;
                      if (!str1.equals("processRedirect"))
                        break;
                    }
                    while (!paramaf.bv.containsKey("url"));
                    String str10 = (String)paramaf.bv.get("url");
                    if ("true".equals(paramaf.bv.get("native")))
                    {
                      b(localContext, a(localcz, localAdUnit, paramaf, str10), str2);
                      return;
                    }
                    if (str10.startsWith("http"))
                    {
                      String str11 = a(localcz, localAdUnit, paramaf, str10);
                      ab localab = new ab(this, localContext, str11);
                      try
                      {
                        str12 = (String)localab.execute(new Void[0]).get();
                        if (str12 != null)
                        {
                          a(localContext, str12, bool1, localAdUnit);
                          return;
                        }
                      }
                      catch (InterruptedException localInterruptedException)
                      {
                        while (true)
                        {
                          localInterruptedException.printStackTrace();
                          str12 = "";
                        }
                      }
                      catch (ExecutionException localExecutionException)
                      {
                        while (true)
                        {
                          localExecutionException.printStackTrace();
                          String str12 = "";
                        }
                        db.g(d, "Redirect URL could not be found for: " + str11);
                        return;
                      }
                    }
                    a(localContext, str10, false, localAdUnit);
                    return;
                    if (!str1.equals("verifyUrl"))
                      break;
                  }
                  while (!paramaf.bv.containsKey("url"));
                  String str8 = (String)paramaf.bv.get("url");
                  Intent localIntent2 = localContext.getPackageManager().getLaunchIntentForPackage(str8);
                  if ((localIntent2 != null) && (bd.a(localContext, localIntent2)))
                    if (!bool1)
                      break label856;
                  for (String str9 = "urlVerified"; ; str9 = "urlNotVerified")
                  {
                    paramFlurryAds.onEvent(new cw(str9, Collections.emptyMap(), paramaf.bw.J, localAdUnit, localcz, paramaf.bw.eX), this, paramInt + 1);
                    return;
                    bool1 = false;
                    break;
                  }
                  if (!str1.equals("launchPackage"))
                    break;
                }
                while (!paramaf.bv.containsKey("package"));
                String str7 = (String)paramaf.bv.get("package");
                Intent localIntent1 = localContext.getPackageManager().getLaunchIntentForPackage(str7);
                if ((localIntent1 != null) && (bd.a(localContext, localIntent1)))
                {
                  a(localContext, localIntent1, localAdUnit.getAdSpace().toString());
                  return;
                }
                a(localContext, "https://play.google.com/store/apps/details?id=" + str7, false, localAdUnit);
                return;
                if (!str1.equals("sendUrlAsync"))
                  break;
              }
              while (!paramaf.bv.containsKey("url"));
              String str6 = a(localcz, localAdUnit, paramaf, (String)paramaf.bv.get("url"));
              new StringBuilder().append("url after is: ").append(str6).toString();
              ct localct = new ct(this, localContext, str6);
              this.cK.post(localct);
              return;
              if (str1.equals("sendAdLogs"))
              {
                P();
                return;
              }
              if (str1.equals("logEvent"))
              {
                if ((paramaf.bv.containsKey("__sendToServer")) && (((String)paramaf.bv.get("__sendToServer")).equals("true")));
                for (boolean bool3 = bool1; ; bool3 = false)
                {
                  paramaf.bv.remove("__sendToServer");
                  a(paramaf.bw.L, paramaf.bw.eW, bool3, paramaf.bv);
                  return;
                }
              }
            }
            while (str1.equals("nextFrame"));
            if (str1.equals("nextAdUnit"))
            {
              ac localac = this.cL.A(str2);
              if ((localac != null) && (paramaf.bv.containsKey("delay")))
              {
                int i = paramaf.bw.eX;
                boolean bool2 = false;
                if (localAdUnit != null)
                {
                  int j = localAdUnit.getAdFrames().size();
                  bool2 = false;
                  if (j > 0)
                    bool2 = ((AdFrame)localAdUnit.getAdFrames().get(i)).getAdSpaceLayout().getFormat().toString().equals("banner");
                }
                if (bool2)
                  try
                  {
                    long l2 = Long.parseLong((String)paramaf.bv.get("delay"));
                    l1 = l2;
                    localac.a(l1 * 1000L);
                    return;
                  }
                  catch (NumberFormatException localNumberFormatException1)
                  {
                    while (true)
                    {
                      new StringBuilder().append("caught NumberFormatException with delay parameter in nextAdUnit:").append((String)paramaf.bv.get("delay")).toString();
                      long l1 = 30L;
                    }
                  }
              }
              if (localac != null)
              {
                localac.post(new cp(this, localContext, str2, localac));
                return;
              }
              if (paramaf.bw.eW.equals("renderFailed"))
              {
                c(localContext, str2);
                return;
              }
              this.cY = l(str2);
              a(localContext, this.cY);
              return;
            }
            if (!str1.equals("checkCap"))
              break;
          }
          while (!paramaf.bv.containsKey("idHash"));
          String str4 = (String)paramaf.bv.get("idHash");
          FlurryFreqCapInfo localFlurryFreqCapInfo2 = this.cM.y(str4);
          String str5 = "capNotExhausted";
          if ((localFlurryFreqCapInfo2 != null) && (FlurryFreqCapManager.d(localFlurryFreqCapInfo2.getExpirationTime())))
          {
            db.f(d, "Discarding expired frequency cap info for idHash=" + str4);
            this.cM.z(str4);
            localFlurryFreqCapInfo2 = null;
          }
          if ((localFlurryFreqCapInfo2 != null) && (localFlurryFreqCapInfo2.getViews() >= localFlurryFreqCapInfo2.getNewCap()))
          {
            db.f(d, "Frequency cap exhausted for idHash=" + str4);
            str5 = "capExhausted";
          }
          paramFlurryAds.onEvent(new cw(str5, Collections.emptyMap(), paramaf.bw.J, localAdUnit, localcz, paramaf.bw.eX), this, paramInt + 1);
          return;
          if (!str1.equals("updateViewCount"))
            break;
        }
        while (!paramaf.bv.containsKey("idHash"));
        String str3 = (String)paramaf.bv.get("idHash");
        localFlurryFreqCapInfo1 = this.cM.y(str3);
      }
      while (localFlurryFreqCapInfo1 == null);
      localFlurryFreqCapInfo1.updateViews();
      db.f(d, "updateViewCount:idHash=" + localFlurryFreqCapInfo1.getIdHash() + ",newCap=" + localFlurryFreqCapInfo1.getNewCap() + ",prevCap=" + localFlurryFreqCapInfo1.getPreviousCap() + ",views=" + localFlurryFreqCapInfo1.getViews());
    }
    while (localFlurryFreqCapInfo1.getViews() <= localFlurryFreqCapInfo1.getNewCap());
    new StringBuilder().append("FlurryAdAction: !! rendering a capped object: ").append(localFlurryFreqCapInfo1.getIdHash()).toString();
    return;
    new StringBuilder().append("Unknown action:").append(str1).append(",triggered by:").append(paramaf.bw.eW).toString();
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     com.flurry.android.FlurryAds
 * JD-Core Version:    0.6.2
 */