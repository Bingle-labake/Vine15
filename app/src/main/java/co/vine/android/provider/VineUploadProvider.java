package co.vine.android.provider;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.net.Uri;
import android.util.Log;
import co.vine.android.util.BuildUtil;
import com.edisonwang.android.slog.SLog;
import java.util.Set;

public class VineUploadProvider extends ContentProvider
{
  private static final int ALL_UPLOADS = 1;
  public static final String AUTHORITY;
  public static final String CONTENT_AUTHORITY;
  private static final int DELETE_ALL_UPLOADS = 5;
  private static final int DELETE_UPLOAD = 4;
  private static final int GET_LAST_PATH = 3;
  private static final boolean LOGGABLE = false;
  private static final int PUT_HASH = 7;
  private static final int PUT_NEW_UPLOAD = 6;
  private static final int PUT_POST_INFO = 10;
  private static final int PUT_STATUS = 8;
  private static final int PUT_UPLOAD_TIME = 11;
  private static final int PUT_URIS = 9;
  private static final int PUT_VALUES = 12;
  private static final int REFERENCE = 13;
  public static final String SCHEME = "content";
  private static final String TAG = "VineUploadProvider";
  private static final int UPLOAD = 2;
  private static final UriMatcher sUriMatcher;

  static
  {
    if ((BuildUtil.isLogsOn()) || (Log.isLoggable("VineUploadProvider", 3)));
    for (boolean bool = true; ; bool = false)
    {
      LOGGABLE = bool;
      AUTHORITY = BuildUtil.getAuthority(".provider.VineUploadProvider");
      CONTENT_AUTHORITY = "content://" + AUTHORITY + "/";
      sUriMatcher = new UriMatcher(-1);
      sUriMatcher.addURI(AUTHORITY, "uploads/#", 1);
      sUriMatcher.addURI(AUTHORITY, "uploads/upload/#", 2);
      sUriMatcher.addURI(AUTHORITY, "uploads/reference/#", 13);
      sUriMatcher.addURI(AUTHORITY, "uploads/delete_upload", 4);
      sUriMatcher.addURI(AUTHORITY, "uploads/put_new_upload", 6);
      sUriMatcher.addURI(AUTHORITY, "uploads/put_hash", 7);
      sUriMatcher.addURI(AUTHORITY, "uploads/put_status", 8);
      sUriMatcher.addURI(AUTHORITY, "uploads/put_uris", 9);
      sUriMatcher.addURI(AUTHORITY, "uploads/put_post_info", 10);
      sUriMatcher.addURI(AUTHORITY, "uploads/put_upload_time", 11);
      sUriMatcher.addURI(AUTHORITY, "uploads/put_values", 12);
      return;
    }
  }

  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    SQLiteDatabase localSQLiteDatabase = VineUploadDatabaseHelper.getDatabaseHelper(getContext()).getWritableDatabase();
    if (LOGGABLE)
      Log.d("VineUploadProvider", "QUERY: uri " + paramUri + " -> " + sUriMatcher.match(paramUri));
    int i = sUriMatcher.match(paramUri);
    int j = 0;
    switch (i)
    {
    default:
    case 4:
    case 5:
    }
    while (true)
    {
      if (j > 0)
        getContext().getContentResolver().notifyChange(VineUploads.Uploads.CONTENT_URI, null);
      return j;
      j = localSQLiteDatabase.delete("uploads", paramString, paramArrayOfString);
      continue;
      j = localSQLiteDatabase.delete("uploads", "1", null);
    }
  }

  public String getType(Uri paramUri)
  {
    return null;
  }

  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    long l = -1L;
    SQLiteDatabase localSQLiteDatabase = VineUploadDatabaseHelper.getDatabaseHelper(getContext()).getWritableDatabase();
    if (LOGGABLE)
      Log.d("VineUploadProvider", "QUERY: uri " + paramUri + " -> " + sUriMatcher.match(paramUri));
    switch (sUriMatcher.match(paramUri))
    {
    default:
    case 6:
    }
    while (true)
    {
      if (l >= 0L)
        getContext().getContentResolver().notifyChange(VineUploads.Uploads.CONTENT_URI, null);
      return null;
      l = localSQLiteDatabase.insert("uploads", null, paramContentValues);
      if (LOGGABLE)
        Log.d("VineUploadProvider", "Upload inserted with rowId=" + l);
    }
  }

  public boolean onCreate()
  {
    return true;
  }

  // ERROR //
  public android.database.Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 128	co/vine/android/provider/VineUploadProvider:getContext	()Landroid/content/Context;
    //   4: invokestatic 134	co/vine/android/provider/VineUploadDatabaseHelper:getDatabaseHelper	(Landroid/content/Context;)Lco/vine/android/provider/VineUploadDatabaseHelper;
    //   7: invokevirtual 207	co/vine/android/provider/VineUploadDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   10: astore 18
    //   12: aload 18
    //   14: astore 7
    //   16: new 209	android/database/sqlite/SQLiteQueryBuilder
    //   19: dup
    //   20: invokespecial 210	android/database/sqlite/SQLiteQueryBuilder:<init>	()V
    //   23: astore 8
    //   25: getstatic 61	co/vine/android/provider/VineUploadProvider:LOGGABLE	Z
    //   28: ifeq +43 -> 71
    //   31: ldc 41
    //   33: new 71	java/lang/StringBuilder
    //   36: dup
    //   37: invokespecial 74	java/lang/StringBuilder:<init>	()V
    //   40: ldc 140
    //   42: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   45: aload_1
    //   46: invokevirtual 143	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   49: ldc 145
    //   51: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: getstatic 95	co/vine/android/provider/VineUploadProvider:sUriMatcher	Landroid/content/UriMatcher;
    //   57: aload_1
    //   58: invokevirtual 149	android/content/UriMatcher:match	(Landroid/net/Uri;)I
    //   61: invokevirtual 152	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   64: invokevirtual 86	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   67: invokestatic 156	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   70: pop
    //   71: getstatic 95	co/vine/android/provider/VineUploadProvider:sUriMatcher	Landroid/content/UriMatcher;
    //   74: aload_1
    //   75: invokevirtual 149	android/content/UriMatcher:match	(Landroid/net/Uri;)I
    //   78: lookupswitch	default:+34->112, 1:+104->182, 2:+145->223, 13:+211->289
    //   113: iconst_5
    //   114: ldc 176
    //   116: invokevirtual 214	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   119: aload 8
    //   121: aload 7
    //   123: aload_2
    //   124: aload_3
    //   125: aload 4
    //   127: aconst_null
    //   128: aconst_null
    //   129: aload 5
    //   131: invokevirtual 217	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   134: astore 16
    //   136: aload 16
    //   138: aload_0
    //   139: invokevirtual 128	co/vine/android/provider/VineUploadProvider:getContext	()Landroid/content/Context;
    //   142: invokevirtual 162	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   145: aload_1
    //   146: invokeinterface 223 3 0
    //   151: aload 16
    //   153: areturn
    //   154: astore 6
    //   156: aload 6
    //   158: ldc 225
    //   160: iconst_0
    //   161: anewarray 227	java/lang/Object
    //   164: invokestatic 233	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    //   167: aload_0
    //   168: invokevirtual 128	co/vine/android/provider/VineUploadProvider:getContext	()Landroid/content/Context;
    //   171: invokestatic 134	co/vine/android/provider/VineUploadDatabaseHelper:getDatabaseHelper	(Landroid/content/Context;)Lco/vine/android/provider/VineUploadDatabaseHelper;
    //   174: invokevirtual 138	co/vine/android/provider/VineUploadDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   177: astore 7
    //   179: goto -163 -> 16
    //   182: aload_1
    //   183: invokevirtual 238	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   186: astore 13
    //   188: aload 8
    //   190: ldc 176
    //   192: invokevirtual 214	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   195: aload 8
    //   197: new 71	java/lang/StringBuilder
    //   200: dup
    //   201: invokespecial 74	java/lang/StringBuilder:<init>	()V
    //   204: ldc 240
    //   206: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   209: aload 13
    //   211: invokevirtual 80	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   214: invokevirtual 86	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   217: invokevirtual 244	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   220: goto -101 -> 119
    //   223: aload 8
    //   225: ldc 176
    //   227: invokevirtual 214	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   230: aload_1
    //   231: invokevirtual 238	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   234: astore 11
    //   236: aload_1
    //   237: ldc 246
    //   239: invokevirtual 249	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   242: astore 12
    //   244: aload 12
    //   246: invokestatic 255	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   249: ifne +38 -> 287
    //   252: aload 8
    //   254: aload 7
    //   256: getstatic 261	co/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery:PROJECTION	[Ljava/lang/String;
    //   259: ldc_w 263
    //   262: iconst_2
    //   263: anewarray 265	java/lang/String
    //   266: dup
    //   267: iconst_0
    //   268: aload 12
    //   270: aastore
    //   271: dup
    //   272: iconst_1
    //   273: aload 11
    //   275: aastore
    //   276: aconst_null
    //   277: aconst_null
    //   278: ldc_w 267
    //   281: ldc 183
    //   283: invokevirtual 270	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   286: areturn
    //   287: aconst_null
    //   288: areturn
    //   289: aload 8
    //   291: ldc 176
    //   293: invokevirtual 214	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   296: aload_1
    //   297: invokevirtual 238	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   300: astore 9
    //   302: aload_1
    //   303: ldc_w 272
    //   306: invokevirtual 249	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   309: astore 10
    //   311: aload 10
    //   313: invokestatic 255	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   316: ifne +36 -> 352
    //   319: aload 8
    //   321: aload 7
    //   323: getstatic 261	co/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery:PROJECTION	[Ljava/lang/String;
    //   326: ldc_w 274
    //   329: iconst_2
    //   330: anewarray 265	java/lang/String
    //   333: dup
    //   334: iconst_0
    //   335: aload 10
    //   337: aastore
    //   338: dup
    //   339: iconst_1
    //   340: aload 9
    //   342: aastore
    //   343: aconst_null
    //   344: aconst_null
    //   345: ldc_w 267
    //   348: invokevirtual 217	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   351: areturn
    //   352: aconst_null
    //   353: areturn
    //   354: astore 14
    //   356: getstatic 61	co/vine/android/provider/VineUploadProvider:LOGGABLE	Z
    //   359: ifeq +51 -> 410
    //   362: iconst_5
    //   363: anewarray 265	java/lang/String
    //   366: astore 15
    //   368: aload 15
    //   370: iconst_0
    //   371: aload 7
    //   373: invokevirtual 275	android/database/sqlite/SQLiteDatabase:toString	()Ljava/lang/String;
    //   376: aastore
    //   377: aload 15
    //   379: iconst_1
    //   380: aload 8
    //   382: invokevirtual 278	android/database/sqlite/SQLiteQueryBuilder:getTables	()Ljava/lang/String;
    //   385: aastore
    //   386: aload 15
    //   388: iconst_2
    //   389: aload_3
    //   390: aastore
    //   391: aload 15
    //   393: iconst_3
    //   394: aconst_null
    //   395: aastore
    //   396: aload 15
    //   398: iconst_4
    //   399: aload 5
    //   401: aastore
    //   402: ldc_w 280
    //   405: aload 15
    //   407: invokestatic 285	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   410: new 287	java/lang/RuntimeException
    //   413: dup
    //   414: aload 14
    //   416: invokespecial 290	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   419: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   0	12	154	android/database/sqlite/SQLiteException
    //   119	151	354	java/lang/Exception
  }

  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    if (paramContentValues == null)
      paramContentValues = new ContentValues();
    SQLiteDatabase localSQLiteDatabase = VineUploadDatabaseHelper.getDatabaseHelper(getContext()).getWritableDatabase();
    if (LOGGABLE)
      Log.d("VineUploadProvider", "QUERY: uri " + paramUri + " -> " + sUriMatcher.match(paramUri));
    String str2;
    switch (sUriMatcher.match(paramUri))
    {
    default:
      str2 = "uploads";
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    }
    try
    {
      while (true)
      {
        boolean bool = paramContentValues.keySet().isEmpty();
        int i = 0;
        if (!bool)
        {
          int j = localSQLiteDatabase.update(str2, paramContentValues, paramString, paramArrayOfString);
          i = j;
        }
        return i;
        str2 = "uploads";
        String str13 = paramUri.getQueryParameter("path");
        String str14 = paramUri.getQueryParameter("hash");
        SLog.d("PUT_HASH path={}, hash={}", str13, str14);
        paramString = "path=?";
        paramArrayOfString = new String[1];
        paramArrayOfString[0] = str13;
        paramContentValues.put("hash", str14);
        continue;
        str2 = "uploads";
        String str10 = paramUri.getQueryParameter("path");
        String str11 = paramUri.getQueryParameter("status");
        String str12 = paramUri.getQueryParameter("captcha_url");
        SLog.d("PUT_STATUS path={}, status={}", str10, str11);
        paramString = "path=?";
        paramArrayOfString = new String[1];
        paramArrayOfString[0] = str10;
        paramContentValues.put("status", str11);
        paramContentValues.put("captcha_url", str12);
        continue;
        str2 = "uploads";
        String str7 = paramUri.getQueryParameter("path");
        String str8 = paramUri.getQueryParameter("video_url");
        String str9 = paramUri.getQueryParameter("thumbnail_url");
        SLog.d("PUT_URIS path={}, videoUrl={}, thumbnailUrl={}", str7, str8, str9);
        paramString = "path=?";
        paramArrayOfString = new String[1];
        paramArrayOfString[0] = str7;
        paramContentValues.put("video_url", str8);
        paramContentValues.put("thumbnail_url", str9);
        continue;
        str2 = "uploads";
        String str5 = paramUri.getQueryParameter("path");
        String str6 = paramUri.getQueryParameter("post_info");
        SLog.d("PUT_POST_INFO path={}, postInfo={}", str5, str6);
        paramString = "path=?";
        paramArrayOfString = new String[1];
        paramArrayOfString[0] = str5;
        paramContentValues.put("post_info", str6);
        continue;
        str2 = "uploads";
        String str3 = paramUri.getQueryParameter("path");
        String str4 = paramUri.getQueryParameter("upload_time");
        SLog.d("PUT_UPLOAD_TIME path={}, uploadTime={}", str3, str4);
        paramString = "path=?";
        paramArrayOfString = new String[1];
        paramArrayOfString[0] = str3;
        paramContentValues.put("upload_time", str4);
        continue;
        String str1 = paramContentValues.toString();
        SLog.d("PUT_VALUES selectionArgs={}, values={}", paramArrayOfString, str1);
        str2 = "uploads";
      }
    }
    catch (SQLiteException localSQLiteException)
    {
      if (LOGGABLE)
      {
        String[] arrayOfString = new String[4];
        arrayOfString[0] = localSQLiteDatabase.toString();
        arrayOfString[1] = str2;
        arrayOfString[2] = paramString;
        arrayOfString[3] = paramArrayOfString.toString();
        SLog.d("Cannot execute update with db={}, tablename={}, selection={}, selectionArgs={}", arrayOfString);
      }
      RuntimeException localRuntimeException = new RuntimeException(localSQLiteException);
      throw localRuntimeException;
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.VineUploadProvider
 * JD-Core Version:    0.6.2
 */