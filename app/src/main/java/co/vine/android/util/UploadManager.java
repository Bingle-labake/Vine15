package co.vine.android.util;

import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.database.Cursor;
import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import co.vine.android.VineException;
import co.vine.android.api.VineUpload;
import co.vine.android.api.VineUpload.PostInfo;
import co.vine.android.client.AppController;
import co.vine.android.client.Session;
import co.vine.android.provider.VineUploadProvider;
import co.vine.android.provider.VineUploads.Uploads;
import co.vine.android.provider.VineUploadsDatabaseSQL.UploadsQuery;
import co.vine.android.recorder.HashAsyncTask;
import co.vine.android.recorder.RecordConfigUtils;
import co.vine.android.recorder.RecordConfigUtils.RecordConfig;
import co.vine.android.recorder.RecordSessionManager;
import co.vine.android.recorder.RecordingFile;
import co.vine.android.service.PostResult;
import co.vine.android.service.VineUploadService;
import co.vine.android.service.VineUploadService.ServiceAsyncTask;
import com.edisonwang.android.slog.SLog;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

public class UploadManager
{
  public static final long EXPIRE_TIME = 86400000L;
  private static final int[] SHARED_LOCK = new int[0];
  public static final int STATUS_FAILED = 2;
  public static final int STATUS_INVALID = -1;
  public static final int STATUS_NEED_POST = 1;
  public static final int STATUS_NEED_UPLOAD = 0;
  private static final String SUB_PREF_HASH = "_hash.sub";
  private static final String SUB_PREF_POST = "_post.sub";
  private static final String SUB_PREF_THUMBNAIL = "_thumbnail_url.sub";
  private static final String SUB_PREF_VIDEO = "_video_url.sub";
  private static final String SUB_UPLOAD_TIME = "_upload_time.sub";
  private static final String TYPE_VINE_POST = "type_post";
  private static SharedPreferences mUploadPref;
  private final MediaUtility mMediaUtility;

  public UploadManager(Context paramContext)
  {
    this.mMediaUtility = new MediaUtility(paramContext);
  }

  public static void addOrUpdateUpload(Context paramContext, String paramString1, String paramString2, String paramString3, RecordSessionManager paramRecordSessionManager)
  {
    long l = AppController.getInstance(paramContext).getActiveSessionReadOnly().getUserId();
    Uri.Builder localBuilder1 = getBaseUri();
    localBuilder1.path("uploads/upload");
    localBuilder1.appendEncodedPath(String.valueOf(l));
    localBuilder1.appendQueryParameter("path", paramString1);
    Cursor localCursor = paramContext.getContentResolver().query(localBuilder1.build(), VineUploadsDatabaseSQL.UploadsQuery.PROJECTION, null, null, null);
    ContentValues localContentValues = new ContentValues();
    if ((localCursor == null) || (localCursor.getCount() < 1))
    {
      String str = RecordConfigUtils.getThumbnailPath(paramString1);
      localContentValues.put("path", paramString1);
      localContentValues.put("thumbnail_path", str);
      localContentValues.put("hash", paramString2);
      localContentValues.put("status", Integer.valueOf(0));
      localContentValues.put("reference", paramString3);
      localContentValues.put("owner_id", Long.valueOf(l));
      Uri.Builder localBuilder2 = getBaseUri().path("uploads/put_new_upload");
      paramContext.getContentResolver().insert(localBuilder2.build(), localContentValues);
    }
    while (true)
    {
      if (localCursor != null)
        localCursor.close();
      return;
      String[] arrayOfString = { paramString1 };
      if (!TextUtils.isEmpty(paramString2))
        localContentValues.put("hash", paramString2);
      localContentValues.put("status", Integer.valueOf(0));
      Uri.Builder localBuilder3 = getBaseUri().path("uploads/put_values");
      paramContext.getContentResolver().update(localBuilder3.build(), localContentValues, "path=?", arrayOfString);
    }
  }

  public static String addToUploadQueue(Context paramContext, RecordingFile paramRecordingFile, String paramString1, String paramString2)
    throws IOException
  {
    try
    {
      String str = addToUploadQueue(paramContext, RecordConfigUtils.getGenericConfig(paramContext).processDir, paramRecordingFile, paramString1, paramString2);
      return str;
    }
    catch (Exception localException)
    {
    }
    return addToUploadQueue(paramContext, paramContext.getCacheDir(), paramRecordingFile, paramString1, paramString2);
  }

  private static String addToUploadQueue(Context paramContext, File paramFile, RecordingFile paramRecordingFile, String paramString1, String paramString2)
    throws IOException
  {
    String str1 = String.valueOf(System.currentTimeMillis());
    String str2 = RecordConfigUtils.copyForUpload(paramFile, paramRecordingFile.getVideoPath(), str1).getPath();
    String str3 = RecordConfigUtils.copyForUpload(paramFile, paramString1, RecordConfigUtils.getThumbnailPath(str1)).getPath();
    RecordConfigUtils.copyForUpload(paramFile, RecordSessionManager.getFrameInfoFile(paramRecordingFile.folder).getPath(), RecordConfigUtils.getFrameInfoPath(str1));
    paramContext.startService(VineUploadService.getUploadIntent(paramContext, str2, paramRecordingFile.getHash(), str3, paramString2));
    return str2;
  }

  @Deprecated
  public static void clearSp()
  {
    synchronized (SHARED_LOCK)
    {
      mUploadPref.edit().clear().commit();
      return;
    }
  }

  public static void clearUploadCaptchas(Context paramContext)
  {
    Uri.Builder localBuilder = getBaseUri().path("uploads/put_values");
    ContentValues localContentValues = new ContentValues();
    localContentValues.put("captcha_url", "");
    paramContext.getContentResolver().update(localBuilder.build(), localContentValues, "1", null);
  }

  public static void deleteUploadRecord(Context paramContext, String paramString)
  {
    Uri.Builder localBuilder = getBaseUri();
    localBuilder.path("uploads/delete_upload");
    String[] arrayOfString = { paramString };
    paramContext.getContentResolver().delete(localBuilder.build(), "path=?", arrayOfString);
  }

  public static LinkedHashMap<String, Integer> getAllPaths(Context paramContext)
  {
    LinkedHashMap localLinkedHashMap = new LinkedHashMap();
    long l = AppController.getInstance(paramContext).getActiveSessionReadOnly().getUserId();
    Uri localUri = ContentUris.withAppendedId(VineUploads.Uploads.CONTENT_URI, l);
    Cursor localCursor = paramContext.getContentResolver().query(localUri, VineUploadsDatabaseSQL.UploadsQuery.PROJECTION, null, null, "_id ASC");
    if (localCursor != null)
    {
      while (localCursor.moveToNext())
        localLinkedHashMap.put(localCursor.getString(1), Integer.valueOf(localCursor.getInt(3)));
      localCursor.close();
    }
    return localLinkedHashMap;
  }

  private static Uri.Builder getBaseUri()
  {
    Uri.Builder localBuilder = new Uri.Builder();
    localBuilder.scheme("content").authority(VineUploadProvider.AUTHORITY);
    return localBuilder;
  }

  @Deprecated
  public static String getHashSp(String paramString)
  {
    synchronized (SHARED_LOCK)
    {
      String str = mUploadPref.getString(paramString + "_hash.sub", null);
      return str;
    }
  }

  public static LinkedList<String> getPendingPaths(Context paramContext)
  {
    LinkedList localLinkedList = new LinkedList();
    LinkedHashMap localLinkedHashMap = getAllPaths(paramContext);
    Iterator localIterator = localLinkedHashMap.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      int i = ((Integer)localLinkedHashMap.get(str)).intValue();
      if ((i != 2) && (i != -1))
        localLinkedList.add(str);
    }
    return localLinkedList;
  }

  @Deprecated
  public static HashMap<String, String> getPendingPathsSp()
  {
    while (true)
    {
      HashMap localHashMap;
      String str;
      int i;
      synchronized (SHARED_LOCK)
      {
        localHashMap = new HashMap();
        Iterator localIterator = mUploadPref.getAll().keySet().iterator();
        if (!localIterator.hasNext())
          break label171;
        str = (String)localIterator.next();
        if (!isKey(str))
          continue;
        SLog.d("Key: {}", str);
        i = getStatusSp(str);
        if (!isUploadExpiredSp(str))
          break label178;
        switch (i)
        {
        case 0:
          localHashMap.put(str, "cNotify");
        case 1:
        }
      }
      localHashMap.put(str, "aUpload");
      continue;
      localHashMap.put(str, "cNotify");
      continue;
      SLog.d("File does not exist any more (uploaded).");
      localHashMap.put(str, "bPost");
      continue;
      label171: return localHashMap;
      continue;
      label178: switch (i)
      {
      case 0:
      case 1:
      }
    }
  }

  @Deprecated
  public static String getPostInfoSp(String paramString)
  {
    synchronized (SHARED_LOCK)
    {
      String str = mUploadPref.getString(paramString + "_post.sub", null);
      return str;
    }
  }

  public static Cursor getReferenceCursor(Context paramContext, String paramString)
  {
    if (TextUtils.isEmpty(paramString))
      return null;
    long l = AppController.getInstance(paramContext).getActiveSessionReadOnly().getUserId();
    Uri.Builder localBuilder = getBaseUri();
    localBuilder.path("uploads/reference");
    localBuilder.appendEncodedPath(String.valueOf(l));
    localBuilder.appendQueryParameter("reference", paramString);
    return paramContext.getContentResolver().query(localBuilder.build(), VineUploadsDatabaseSQL.UploadsQuery.PROJECTION, null, null, null);
  }

  @Deprecated
  public static int getStatusSp(String paramString)
  {
    synchronized (SHARED_LOCK)
    {
      int i = mUploadPref.getInt(paramString, -1);
      return i;
    }
  }

  public static VineUpload getUpload(Context paramContext, String paramString)
  {
    long l = AppController.getInstance(paramContext).getActiveSessionReadOnly().getUserId();
    Uri.Builder localBuilder = getBaseUri();
    localBuilder.path("uploads/upload");
    localBuilder.appendEncodedPath(String.valueOf(l));
    localBuilder.appendQueryParameter("path", paramString);
    Cursor localCursor = paramContext.getContentResolver().query(localBuilder.build(), VineUploadsDatabaseSQL.UploadsQuery.PROJECTION, null, null, null);
    VineUpload localVineUpload = null;
    if (localCursor != null)
    {
      boolean bool = localCursor.moveToFirst();
      localVineUpload = null;
      if (bool)
        localVineUpload = VineUpload.fromCursor(paramString, localCursor);
      localCursor.close();
    }
    return localVineUpload;
  }

  @Deprecated
  public static long getUploadTimeSp(String paramString)
  {
    synchronized (SHARED_LOCK)
    {
      long l = mUploadPref.getLong(paramString + "_upload_time.sub", 0L);
      return l;
    }
  }

  @Deprecated
  public static String[] getUrisSp(String paramString)
  {
    synchronized (SHARED_LOCK)
    {
      String[] arrayOfString = new String[2];
      arrayOfString[0] = mUploadPref.getString(paramString + "_video_url.sub", null);
      arrayOfString[1] = mUploadPref.getString(paramString + "_thumbnail_url.sub", null);
      return arrayOfString;
    }
  }

  @Deprecated
  public static void initUploadPref(Context paramContext)
  {
    mUploadPref = paramContext.getSharedPreferences("upload", 0);
  }

  @Deprecated
  public static boolean isEmptySp()
  {
    synchronized (SHARED_LOCK)
    {
      Map localMap = mUploadPref.getAll();
      if ((localMap == null) || (localMap.isEmpty()))
        return true;
      Iterator localIterator = localMap.keySet().iterator();
      while (localIterator.hasNext())
        if (isKey((String)localIterator.next()))
          return false;
    }
    return true;
  }

  @Deprecated
  public static boolean isKey(String paramString)
  {
    return !paramString.endsWith(".sub");
  }

  @Deprecated
  public static boolean isUploadExpiredSp(String paramString)
  {
    return System.currentTimeMillis() - mUploadPref.getLong(paramString + "_upload_time.sub", 0L) > 86400000L;
  }

  public static void removeFromUploadQueue(Context paramContext, String paramString)
  {
    paramContext.startService(VineUploadService.getDiscardIntent(paramContext, paramString));
  }

  public static void setHash(Context paramContext, VineUpload paramVineUpload, String paramString)
  {
    Uri.Builder localBuilder = getBaseUri();
    paramVineUpload.hash = paramString;
    localBuilder.path("uploads/put_hash").appendQueryParameter("path", paramVineUpload.path).appendQueryParameter("hash", paramString);
    paramContext.getContentResolver().update(localBuilder.build(), null, null, null);
  }

  public static void setPostInfo(Context paramContext, VineUpload paramVineUpload, VineUpload.PostInfo paramPostInfo)
  {
    SLog.d("Setting post info for path=" + paramVineUpload.path + " with caption=" + paramPostInfo.caption + ", twitter=" + paramPostInfo.postToTwitter + ", facebook=" + paramPostInfo.postToFacebook);
    paramVineUpload.postInfo = paramPostInfo.toString();
    Uri.Builder localBuilder = getBaseUri();
    localBuilder.path("uploads/put_post_info").appendQueryParameter("path", paramVineUpload.path).appendQueryParameter("post_info", paramPostInfo.toString());
    paramContext.getContentResolver().update(localBuilder.build(), null, null, null);
  }

  public static void setStatus(Context paramContext, VineUpload paramVineUpload, int paramInt)
  {
    setStatus(paramContext, paramVineUpload, paramInt, null);
  }

  public static void setStatus(Context paramContext, VineUpload paramVineUpload, int paramInt, String paramString)
  {
    paramVineUpload.status = paramInt;
    Uri.Builder localBuilder = getBaseUri();
    localBuilder.path("uploads/put_status").appendQueryParameter("path", paramVineUpload.path).appendQueryParameter("status", String.valueOf(paramInt));
    if (!TextUtils.isEmpty(paramString))
      localBuilder.appendQueryParameter("captcha_url", paramString);
    paramContext.getContentResolver().update(localBuilder.build(), null, null, null);
  }

  public static void setUploadTime(Context paramContext, VineUpload paramVineUpload)
  {
    paramVineUpload.uploadTime = System.currentTimeMillis();
    Uri.Builder localBuilder = getBaseUri();
    localBuilder.path("uploads/put_upload_time").appendQueryParameter("path", paramVineUpload.path).appendQueryParameter("upload_time", String.valueOf(System.currentTimeMillis()));
    paramContext.getContentResolver().update(localBuilder.build(), null, null, null);
  }

  public static void setUris(Context paramContext, VineUpload paramVineUpload, String[] paramArrayOfString)
  {
    paramVineUpload.setUris(paramArrayOfString);
    Uri.Builder localBuilder = getBaseUri();
    localBuilder.path("uploads/put_uris").appendQueryParameter("path", paramVineUpload.path).appendQueryParameter("video_url", paramArrayOfString[0]).appendQueryParameter("thumbnail_url", paramArrayOfString[1]);
    paramContext.getContentResolver().update(localBuilder.build(), null, null, null);
  }

  public static boolean uploadListIsEmpty(Context paramContext)
  {
    int i = 1;
    Cursor localCursor = paramContext.getContentResolver().query(VineUploads.Uploads.CONTENT_URI, VineUploadsDatabaseSQL.UploadsQuery.PROJECTION, null, null, null);
    if (localCursor != null)
      if (localCursor.getCount() >= i)
        break label41;
    while (true)
    {
      localCursor.close();
      return i;
      label41: int j = 0;
    }
  }

  // ERROR //
  public PostResult post(Context paramContext, String paramString1, String paramString2, VineUpload.PostInfo paramPostInfo)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: invokestatic 561	co/vine/android/client/VineAPI:getInstance	(Landroid/content/Context;)Lco/vine/android/client/VineAPI;
    //   6: astore 6
    //   8: new 394	java/util/HashMap
    //   11: dup
    //   12: invokespecial 395	java/util/HashMap:<init>	()V
    //   15: astore 7
    //   17: aload_1
    //   18: aload_3
    //   19: invokestatic 563	co/vine/android/util/UploadManager:getUpload	(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/api/VineUpload;
    //   22: astore 8
    //   24: aload 8
    //   26: ifnonnull +18 -> 44
    //   29: new 565	co/vine/android/service/PostResult
    //   32: dup
    //   33: iconst_0
    //   34: invokespecial 568	co/vine/android/service/PostResult:<init>	(Z)V
    //   37: astore 9
    //   39: aload_0
    //   40: monitorexit
    //   41: aload 9
    //   43: areturn
    //   44: aload 8
    //   46: invokevirtual 572	co/vine/android/api/VineUpload:getUris	()[Ljava/lang/String;
    //   49: astore 10
    //   51: aload_1
    //   52: invokestatic 576	co/vine/android/util/MediaUtility:getUploadType	(Landroid/content/Context;)I
    //   55: tableswitch	default:+669 -> 724, 1:+462->517
    //   73: aconst_null
    //   74: sastore
    //   75: dup
    //   76: invokespecial 343	java/lang/StringBuilder:<init>	()V
    //   79: aload 11
    //   81: invokevirtual 347	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   84: aload 10
    //   86: iconst_0
    //   87: aaload
    //   88: invokevirtual 347	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   91: invokevirtual 350	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   94: astore 12
    //   96: new 342	java/lang/StringBuilder
    //   99: dup
    //   100: invokespecial 343	java/lang/StringBuilder:<init>	()V
    //   103: aload 11
    //   105: invokevirtual 347	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   108: aload 10
    //   110: iconst_1
    //   111: aaload
    //   112: invokevirtual 347	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: invokevirtual 350	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   118: astore 13
    //   120: aload 7
    //   122: ldc_w 578
    //   125: aload 12
    //   127: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   130: pop
    //   131: aload 7
    //   133: ldc_w 580
    //   136: aload 13
    //   138: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   141: pop
    //   142: aload 7
    //   144: ldc_w 582
    //   147: getstatic 587	android/os/Build:MODEL	Ljava/lang/String;
    //   150: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   153: pop
    //   154: aload 7
    //   156: ldc_w 589
    //   159: getstatic 592	android/os/Build:DEVICE	Ljava/lang/String;
    //   162: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   165: pop
    //   166: aload 7
    //   168: ldc_w 594
    //   171: aload_1
    //   172: invokevirtual 598	android/content/Context:getPackageManager	()Landroid/content/pm/PackageManager;
    //   175: aload_1
    //   176: invokevirtual 601	android/content/Context:getPackageName	()Ljava/lang/String;
    //   179: iconst_0
    //   180: invokevirtual 607	android/content/pm/PackageManager:getPackageInfo	(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    //   183: getfield 612	android/content/pm/PackageInfo:versionCode	I
    //   186: invokestatic 532	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   189: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   192: pop
    //   193: ldc 38
    //   195: aload_2
    //   196: invokevirtual 615	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   199: ifeq +369 -> 568
    //   202: aload 6
    //   204: invokevirtual 618	co/vine/android/client/VineAPI:getBaseUrl	()Ljava/lang/String;
    //   207: iconst_1
    //   208: anewarray 4	java/lang/Object
    //   211: dup
    //   212: iconst_0
    //   213: ldc_w 620
    //   216: aastore
    //   217: invokestatic 624	co/vine/android/client/VineAPI:buildUponUrl	(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   220: astore 19
    //   222: bipush 12
    //   224: invokestatic 630	co/vine/android/api/VineParserReader:createParserReader	(I)Lco/vine/android/api/VineParserReader;
    //   227: astore 20
    //   229: aload 4
    //   231: ifnull +161 -> 392
    //   234: aload 4
    //   236: getfield 499	co/vine/android/api/VineUpload$PostInfo:caption	Ljava/lang/String;
    //   239: ifnull +320 -> 559
    //   242: aload 4
    //   244: getfield 499	co/vine/android/api/VineUpload$PostInfo:caption	Ljava/lang/String;
    //   247: invokevirtual 631	java/lang/String:isEmpty	()Z
    //   250: ifne +309 -> 559
    //   253: ldc_w 633
    //   256: aload 4
    //   258: getfield 499	co/vine/android/api/VineUpload$PostInfo:caption	Ljava/lang/String;
    //   261: invokestatic 414	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   264: aload 7
    //   266: ldc_w 635
    //   269: aload 4
    //   271: getfield 499	co/vine/android/api/VineUpload$PostInfo:caption	Ljava/lang/String;
    //   274: invokestatic 640	co/vine/android/util/Util:cleanse	(Ljava/lang/String;)Ljava/lang/String;
    //   277: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   280: pop
    //   281: aload 4
    //   283: getfield 644	co/vine/android/api/VineUpload$PostInfo:entities	Ljava/util/ArrayList;
    //   286: ifnull +31 -> 317
    //   289: aload 4
    //   291: getfield 644	co/vine/android/api/VineUpload$PostInfo:entities	Ljava/util/ArrayList;
    //   294: invokevirtual 647	java/util/ArrayList:isEmpty	()Z
    //   297: ifne +20 -> 317
    //   300: aload 7
    //   302: ldc_w 648
    //   305: aload 4
    //   307: getfield 644	co/vine/android/api/VineUpload$PostInfo:entities	Ljava/util/ArrayList;
    //   310: invokestatic 652	co/vine/android/api/VineUpload$PostInfo:entitiesToMaps	(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    //   313: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   316: pop
    //   317: aload 4
    //   319: getfield 655	co/vine/android/api/VineUpload$PostInfo:channelId	J
    //   322: lconst_0
    //   323: lcmp
    //   324: ifle +20 -> 344
    //   327: aload 7
    //   329: ldc_w 656
    //   332: aload 4
    //   334: getfield 655	co/vine/android/api/VineUpload$PostInfo:channelId	J
    //   337: invokestatic 92	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   340: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   343: pop
    //   344: aload 4
    //   346: getfield 505	co/vine/android/api/VineUpload$PostInfo:postToTwitter	Z
    //   349: ifeq +383 -> 732
    //   352: ldc_w 284
    //   355: astore 21
    //   357: aload 7
    //   359: ldc_w 657
    //   362: aload 21
    //   364: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   367: pop
    //   368: aload 4
    //   370: getfield 513	co/vine/android/api/VineUpload$PostInfo:postToFacebook	Z
    //   373: ifeq +367 -> 740
    //   376: ldc_w 284
    //   379: astore 23
    //   381: aload 7
    //   383: ldc_w 658
    //   386: aload 23
    //   388: invokevirtual 424	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   391: pop
    //   392: ldc_w 660
    //   395: aload 11
    //   397: invokestatic 414	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;)V
    //   400: ldc_w 662
    //   403: aload 10
    //   405: iconst_0
    //   406: aaload
    //   407: aload 10
    //   409: iconst_1
    //   410: aaload
    //   411: invokestatic 665	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   414: aload_1
    //   415: invokestatic 670	co/vine/android/network/ThreadedHttpOperationClient:getInstance	(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;
    //   418: aload 19
    //   420: aload 6
    //   422: aload 7
    //   424: aload 20
    //   426: invokestatic 676	co/vine/android/network/HttpOperation:createBasicAuthJsonPostRequest	(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/HashMap;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;
    //   429: invokevirtual 680	co/vine/android/network/HttpOperation:execute	()Lco/vine/android/network/HttpOperation;
    //   432: astore 25
    //   434: aload 25
    //   436: invokevirtual 683	co/vine/android/network/HttpOperation:isOK	()Z
    //   439: istore 26
    //   441: iload 26
    //   443: ifeq +170 -> 613
    //   446: ldc 38
    //   448: aload_2
    //   449: invokevirtual 615	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   452: ifeq +45 -> 497
    //   455: aload 20
    //   457: invokevirtual 686	co/vine/android/api/VineParserReader:getParsedObject	()Ljava/lang/Object;
    //   460: checkcast 688	co/vine/android/api/VinePostResponse
    //   463: astore 29
    //   465: aload 29
    //   467: ifnonnull +114 -> 581
    //   470: new 565	co/vine/android/service/PostResult
    //   473: dup
    //   474: iconst_0
    //   475: invokespecial 568	co/vine/android/service/PostResult:<init>	(Z)V
    //   478: astore 9
    //   480: goto -441 -> 39
    //   483: astore 28
    //   485: aload 28
    //   487: ldc_w 690
    //   490: iconst_0
    //   491: anewarray 4	java/lang/Object
    //   494: invokestatic 696	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    //   497: new 565	co/vine/android/service/PostResult
    //   500: dup
    //   501: iconst_1
    //   502: invokespecial 568	co/vine/android/service/PostResult:<init>	(Z)V
    //   505: astore 9
    //   507: goto -468 -> 39
    //   510: astore 5
    //   512: aload_0
    //   513: monitorexit
    //   514: aload 5
    //   516: athrow
    //   517: new 342	java/lang/StringBuilder
    //   520: dup
    //   521: invokespecial 343	java/lang/StringBuilder:<init>	()V
    //   524: aload 6
    //   526: invokevirtual 699	co/vine/android/client/VineAPI:getAmazonUrl	()Ljava/lang/String;
    //   529: invokevirtual 347	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   532: ldc_w 701
    //   535: invokevirtual 347	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   538: aload_1
    //   539: invokestatic 707	co/vine/android/client/Amazon:getBucket	(Landroid/content/Context;)Ljava/lang/String;
    //   542: invokevirtual 347	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   545: ldc_w 701
    //   548: invokevirtual 347	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   551: invokevirtual 350	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   554: astore 11
    //   556: goto -484 -> 72
    //   559: ldc_w 709
    //   562: invokestatic 431	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;)V
    //   565: goto -248 -> 317
    //   568: new 565	co/vine/android/service/PostResult
    //   571: dup
    //   572: iconst_0
    //   573: invokespecial 568	co/vine/android/service/PostResult:<init>	(Z)V
    //   576: astore 9
    //   578: goto -539 -> 39
    //   581: new 711	android/content/Intent
    //   584: dup
    //   585: ldc_w 713
    //   588: invokespecial 715	android/content/Intent:<init>	(Ljava/lang/String;)V
    //   591: astore 30
    //   593: aload 30
    //   595: ldc_w 716
    //   598: aload 29
    //   600: invokevirtual 720	android/content/Intent:putExtra	(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;
    //   603: pop
    //   604: aload_1
    //   605: aload 30
    //   607: invokevirtual 724	android/content/Context:sendBroadcast	(Landroid/content/Intent;)V
    //   610: goto -113 -> 497
    //   613: aload 20
    //   615: invokevirtual 686	co/vine/android/api/VineParserReader:getParsedObject	()Ljava/lang/Object;
    //   618: checkcast 726	co/vine/android/api/VineError
    //   621: astore 27
    //   623: aload 25
    //   625: ifnull +75 -> 700
    //   628: aload 27
    //   630: ifnull +70 -> 700
    //   633: ldc_w 728
    //   636: aload 25
    //   638: getfield 731	co/vine/android/network/HttpOperation:statusCode	I
    //   641: invokestatic 152	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   644: aload 27
    //   646: getfield 734	co/vine/android/api/VineError:message	Ljava/lang/String;
    //   649: invokestatic 737	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    //   652: aload 27
    //   654: getfield 740	co/vine/android/api/VineError:errorCode	I
    //   657: getstatic 746	co/vine/android/api/VineError$VineKnownErrors:INVALID_SESSION	Lco/vine/android/api/VineError$VineKnownErrors;
    //   660: getfield 749	co/vine/android/api/VineError$VineKnownErrors:code	I
    //   663: if_icmpne +18 -> 681
    //   666: new 565	co/vine/android/service/PostResult
    //   669: dup
    //   670: iconst_0
    //   671: iconst_1
    //   672: aconst_null
    //   673: invokespecial 752	co/vine/android/service/PostResult:<init>	(ZZLjava/lang/String;)V
    //   676: astore 9
    //   678: goto -639 -> 39
    //   681: new 565	co/vine/android/service/PostResult
    //   684: dup
    //   685: iconst_0
    //   686: iconst_0
    //   687: aload 27
    //   689: getfield 755	co/vine/android/api/VineError:data	Ljava/lang/String;
    //   692: invokespecial 752	co/vine/android/service/PostResult:<init>	(ZZLjava/lang/String;)V
    //   695: astore 9
    //   697: goto -658 -> 39
    //   700: ldc_w 757
    //   703: invokestatic 759	com/edisonwang/android/slog/SLog:e	(Ljava/lang/String;)V
    //   706: new 565	co/vine/android/service/PostResult
    //   709: dup
    //   710: iconst_0
    //   711: invokespecial 568	co/vine/android/service/PostResult:<init>	(Z)V
    //   714: astore 9
    //   716: goto -677 -> 39
    //   719: astore 18
    //   721: goto -528 -> 193
    //   724: ldc_w 282
    //   727: astore 11
    //   729: goto -657 -> 72
    //   732: ldc_w 761
    //   735: astore 21
    //   737: goto -380 -> 357
    //   740: ldc_w 761
    //   743: astore 23
    //   745: goto -364 -> 381
    //
    // Exception table:
    //   from	to	target	type
    //   446	465	483	java/lang/Exception
    //   470	480	483	java/lang/Exception
    //   581	610	483	java/lang/Exception
    //   2	24	510	finally
    //   29	39	510	finally
    //   44	72	510	finally
    //   72	166	510	finally
    //   166	193	510	finally
    //   193	229	510	finally
    //   234	317	510	finally
    //   317	344	510	finally
    //   344	352	510	finally
    //   357	376	510	finally
    //   381	392	510	finally
    //   392	441	510	finally
    //   446	465	510	finally
    //   470	480	510	finally
    //   485	497	510	finally
    //   497	507	510	finally
    //   517	556	510	finally
    //   559	565	510	finally
    //   568	578	510	finally
    //   581	610	510	finally
    //   613	623	510	finally
    //   633	678	510	finally
    //   681	697	510	finally
    //   700	716	510	finally
    //   166	193	719	java/lang/Exception
  }

  public PostResult postShare(Context paramContext, String paramString, VineUpload.PostInfo paramPostInfo)
  {
    try
    {
      PostResult localPostResult = post(paramContext, "type_post", paramString, paramPostInfo);
      return localPostResult;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public String[] upload(VineUploadService.ServiceAsyncTask paramServiceAsyncTask, String paramString1, String paramString2, String paramString3)
    throws Exception
  {
    while (true)
    {
      String[] arrayOfString;
      String str3;
      String str4;
      try
      {
        File localFile = new File(paramString1);
        if (!localFile.exists())
        {
          SLog.e("Files does not exist.");
          arrayOfString = null;
          return arrayOfString;
        }
        VineUpload localVineUpload;
        try
        {
          localVineUpload = getUpload(paramServiceAsyncTask.getContext(), paramString3);
          if (localVineUpload != null)
            continue;
          throw new Exception("Upload record was null");
        }
        catch (Exception localException)
        {
          SLog.e("Upload failed: {}", paramString3, localException);
          arrayOfString = null;
        }
        continue;
        String str1 = HashAsyncTask.getMD5Checksum(paramString1);
        String str2 = localVineUpload.hash;
        if (!str1.equals(str2))
        {
          if (TextUtils.isEmpty(str2))
          {
            SLog.e("Invalid hash: actual {}, expected {}.", str1, str2);
            arrayOfString = null;
            continue;
          }
          CrashUtil.logException(new VineException("Expected hash was invalid: " + str2));
        }
        Context localContext = paramServiceAsyncTask.getContext();
        SimpleDateFormat localSimpleDateFormat = new SimpleDateFormat("yyyy/MM/dd/", Locale.US);
        str3 = localSimpleDateFormat.format(new Date()) + UUID.randomUUID() + "_" + localContext.getPackageManager().getPackageInfo(localContext.getPackageName(), 0).versionCode + ".mp4";
        if (paramServiceAsyncTask.isCancelled())
        {
          SLog.d("Task is already cancelled.");
          arrayOfString = null;
          continue;
        }
        str4 = this.mMediaUtility.getVideoUri(paramServiceAsyncTask, localFile, localContext, str3);
        if (str4 == null)
          throw new Exception("Failed to upload video.");
      }
      finally
      {
      }
      if (paramServiceAsyncTask.isCancelled())
      {
        SLog.d("Task is already cancelled.");
        arrayOfString = null;
      }
      else
      {
        String str5 = this.mMediaUtility.getThumbnailUri(paramServiceAsyncTask, str3, new File(paramString2), paramServiceAsyncTask.getContext());
        if (str5 == null)
          throw new Exception("Failed to upload thumbnail.");
        arrayOfString = new String[] { str4, str5 };
      }
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.util.UploadManager
 * JD-Core Version:    0.6.2
 */