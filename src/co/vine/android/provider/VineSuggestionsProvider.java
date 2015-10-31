package co.vine.android.provider;

import android.content.ContentProvider;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.database.MatrixCursor.RowBuilder;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import co.vine.android.api.VineTag;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.util.BuildUtil;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

public class VineSuggestionsProvider extends ContentProvider
{
  public static final String AUTHORITY;
  public static final String CONTENT_AUTHORITY;
  private static final boolean LOGGABLE = false;
  public static final String PATH_TAGS = "tags";
  public static final String PATH_USERS = "users";
  public static final String SCHEME = "content";
  private static final int SUGGEST_TAGS = 2;
  private static final int SUGGEST_USERS = 1;
  private static final String TAG = "VineSuggestProvider";
  public static final Uri TAGS_URI;
  public static final Uri USERS_URI;
  private static final HashMap<String, ArrayList<VineTag>> sTagsTypeAhead;
  private static final UriMatcher sUriMatcher;
  private static final HashMap<String, ArrayList<VineUser>> sUsersTypeAhead;
  private AppController mAppController;

  static
  {
    if ((BuildUtil.isLogsOn()) || (Log.isLoggable("VineSuggestProvider", 3)));
    for (boolean bool = true; ; bool = false)
    {
      LOGGABLE = bool;
      AUTHORITY = BuildUtil.getAuthority(".provider.VineSuggestionsProvider");
      CONTENT_AUTHORITY = "content://" + AUTHORITY + "/";
      USERS_URI = Uri.parse(CONTENT_AUTHORITY + "users");
      TAGS_URI = Uri.parse(CONTENT_AUTHORITY + "tags");
      sUriMatcher = new UriMatcher(-1);
      sUsersTypeAhead = new HashMap();
      sTagsTypeAhead = new HashMap();
      sUriMatcher.addURI(AUTHORITY, "users/#", 1);
      sUriMatcher.addURI(AUTHORITY, "tags", 2);
      return;
    }
  }

  public static void addRealtimeTagSuggestions(String paramString, ArrayList<VineTag> paramArrayList)
  {
    synchronized (sTagsTypeAhead)
    {
      sTagsTypeAhead.put(paramString, paramArrayList);
      return;
    }
  }

  public static void addRealtimeUserSuggestions(String paramString, ArrayList<VineUser> paramArrayList)
  {
    synchronized (sUsersTypeAhead)
    {
      sUsersTypeAhead.put(paramString, paramArrayList);
      return;
    }
  }

  public static void clearRealtimeTagSuggestions()
  {
    synchronized (sTagsTypeAhead)
    {
      sTagsTypeAhead.clear();
      return;
    }
  }

  public static void clearRealtimeUserSuggestions()
  {
    synchronized (sUsersTypeAhead)
    {
      sUsersTypeAhead.clear();
      return;
    }
  }

  private Cursor getComposeTagSuggestions(String paramString, MatrixCursor paramMatrixCursor)
  {
    int i = this.mAppController.getTypeaheadMaxCompose();
    int j;
    String str;
    String[] arrayOfString;
    label70: Cursor localCursor;
    HashSet localHashSet;
    int k;
    label105: Iterator localIterator;
    if (!TextUtils.isEmpty(paramString))
    {
      j = 1;
      ContentResolver localContentResolver = getContext().getContentResolver();
      Uri localUri = Vine.TagsRecentlyUsed.CONTENT_URI;
      if (j == 0)
        break label228;
      str = "tag_name LIKE ?";
      arrayOfString = new String[1];
      arrayOfString[0] = (paramString + "%");
      localCursor = localContentResolver.query(localUri, VineDatabaseSQL.TagsRecentlyUsedQuery.PROJECTION, str, arrayOfString, "last_used_timestamp DESC");
      localHashSet = new HashSet();
      k = 0;
      if (localCursor != null)
      {
        while (localCursor.moveToNext())
          if (!localHashSet.contains(Long.valueOf(localCursor.getLong(1))))
            if (k <= i)
              break label237;
        localCursor.close();
      }
      if ((j != 0) && (k <= i))
      {
        ArrayList localArrayList = getRealtimeTagSuggestions(paramString);
        if (localArrayList != null)
          localIterator = localArrayList.iterator();
      }
    }
    while (true)
    {
      VineTag localVineTag;
      if (localIterator.hasNext())
      {
        localVineTag = (VineTag)localIterator.next();
        if (!localHashSet.contains(Long.valueOf(localVineTag.tagId)))
          if (k <= i);
      }
      else
      {
        return paramMatrixCursor;
        j = 0;
        break;
        label228: str = null;
        arrayOfString = null;
        break label70;
        label237: MatrixCursor.RowBuilder localRowBuilder2 = paramMatrixCursor.newRow();
        int n = k + 1;
        localRowBuilder2.add(Integer.valueOf(k));
        localRowBuilder2.add(Long.valueOf(localCursor.getLong(1)));
        localRowBuilder2.add(localCursor.getString(2));
        localHashSet.add(Long.valueOf(localCursor.getLong(1)));
        k = n;
        break label105;
        MatrixCursor.RowBuilder localRowBuilder1 = paramMatrixCursor.newRow();
        int m = k + 1;
        localRowBuilder1.add(Integer.valueOf(k));
        localRowBuilder1.add(Long.valueOf(localVineTag.tagId));
        localRowBuilder1.add(localVineTag.tagName);
        k = m;
      }
    }
  }

  private Cursor getComposeUserSuggestions(String paramString, MatrixCursor paramMatrixCursor, long paramLong)
  {
    int i = this.mAppController.getTypeaheadMaxCompose();
    int j;
    String str;
    String[] arrayOfString;
    label76: Cursor localCursor;
    HashSet localHashSet;
    int k;
    label112: Iterator localIterator;
    if (!TextUtils.isEmpty(paramString))
    {
      j = 1;
      ContentResolver localContentResolver = getContext().getContentResolver();
      Uri localUri = ContentUris.withAppendedId(Vine.UserGroupsView.CONTENT_URI_FRIENDS, paramLong);
      if (j == 0)
        break label238;
      str = "username LIKE ?";
      arrayOfString = new String[1];
      arrayOfString[0] = (paramString + "%");
      localCursor = localContentResolver.query(localUri, UsersQuery.PROJECTION, str, arrayOfString, "order_id DESC");
      localHashSet = new HashSet();
      k = 0;
      if (localCursor != null)
      {
        while (localCursor.moveToNext())
          if (!localHashSet.contains(Long.valueOf(localCursor.getLong(1))))
            if (k <= i)
              break label247;
        localCursor.close();
      }
      if ((j != 0) && (k <= i))
      {
        ArrayList localArrayList = getRealtimeUserSuggestions(paramString);
        if (localArrayList != null)
          localIterator = localArrayList.iterator();
      }
    }
    while (true)
    {
      VineUser localVineUser;
      if (localIterator.hasNext())
      {
        localVineUser = (VineUser)localIterator.next();
        if (!localHashSet.contains(Long.valueOf(localVineUser.userId)))
          if (k <= i);
      }
      else
      {
        return paramMatrixCursor;
        j = 0;
        break;
        label238: str = null;
        arrayOfString = null;
        break label76;
        label247: MatrixCursor.RowBuilder localRowBuilder2 = paramMatrixCursor.newRow();
        int n = k + 1;
        localRowBuilder2.add(Integer.valueOf(k));
        localRowBuilder2.add(Long.valueOf(localCursor.getLong(1)));
        localRowBuilder2.add(localCursor.getString(2));
        localRowBuilder2.add(localCursor.getString(3));
        localHashSet.add(Long.valueOf(localCursor.getLong(1)));
        k = n;
        break label112;
        MatrixCursor.RowBuilder localRowBuilder1 = paramMatrixCursor.newRow();
        int m = k + 1;
        localRowBuilder1.add(Integer.valueOf(k));
        localRowBuilder1.add(Long.valueOf(localVineUser.userId));
        localRowBuilder1.add(localVineUser.username);
        localRowBuilder1.add(localVineUser.avatarUrl);
        k = m;
      }
    }
  }

  public static ArrayList<VineTag> getRealtimeTagSuggestions(String paramString)
  {
    synchronized (sTagsTypeAhead)
    {
      ArrayList localArrayList = (ArrayList)sTagsTypeAhead.get(paramString);
      return localArrayList;
    }
  }

  public static ArrayList<VineUser> getRealtimeUserSuggestions(String paramString)
  {
    synchronized (sUsersTypeAhead)
    {
      ArrayList localArrayList = (ArrayList)sUsersTypeAhead.get(paramString);
      return localArrayList;
    }
  }

  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    return 0;
  }

  public String getType(Uri paramUri)
  {
    return null;
  }

  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    return null;
  }

  public boolean onCreate()
  {
    this.mAppController = AppController.getInstance(getContext());
    return true;
  }

  // ERROR //
  public Cursor query(Uri paramUri, String[] paramArrayOfString1, String paramString1, String[] paramArrayOfString2, String paramString2)
  {
    // Byte code:
    //   0: aload_0
    //   1: invokevirtual 145	co/vine/android/provider/VineSuggestionsProvider:getContext	()Landroid/content/Context;
    //   4: invokestatic 311	co/vine/android/provider/VineDatabaseHelper:getDatabaseHelper	(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;
    //   7: invokevirtual 315	co/vine/android/provider/VineDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   10: astore 15
    //   12: aload 15
    //   14: astore 7
    //   16: new 317	android/database/sqlite/SQLiteQueryBuilder
    //   19: dup
    //   20: invokespecial 318	android/database/sqlite/SQLiteQueryBuilder:<init>	()V
    //   23: astore 8
    //   25: getstatic 55	co/vine/android/provider/VineSuggestionsProvider:LOGGABLE	Z
    //   28: ifeq +45 -> 73
    //   31: ldc 27
    //   33: new 65	java/lang/StringBuilder
    //   36: dup
    //   37: invokespecial 68	java/lang/StringBuilder:<init>	()V
    //   40: ldc_w 320
    //   43: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   46: aload_1
    //   47: invokevirtual 323	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   50: ldc_w 325
    //   53: invokevirtual 74	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   56: getstatic 99	co/vine/android/provider/VineSuggestionsProvider:sUriMatcher	Landroid/content/UriMatcher;
    //   59: aload_1
    //   60: invokevirtual 329	android/content/UriMatcher:match	(Landroid/net/Uri;)I
    //   63: invokevirtual 332	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   66: invokevirtual 80	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   69: invokestatic 336	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   72: pop
    //   73: getstatic 99	co/vine/android/provider/VineSuggestionsProvider:sUriMatcher	Landroid/content/UriMatcher;
    //   76: aload_1
    //   77: invokevirtual 329	android/content/UriMatcher:match	(Landroid/net/Uri;)I
    //   80: tableswitch	default:+24 -> 104, 1:+96->176, 2:+123->203
    //   105: iconst_5
    //   106: ldc_w 338
    //   109: invokevirtual 342	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   112: aload 8
    //   114: aload 7
    //   116: aload_2
    //   117: aload_3
    //   118: aload 4
    //   120: aconst_null
    //   121: aconst_null
    //   122: aload 5
    //   124: invokevirtual 345	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   127: astore 13
    //   129: aload 13
    //   131: aload_0
    //   132: invokevirtual 145	co/vine/android/provider/VineSuggestionsProvider:getContext	()Landroid/content/Context;
    //   135: invokevirtual 151	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   138: aload_1
    //   139: invokeinterface 349 3 0
    //   144: aload 13
    //   146: areturn
    //   147: astore 6
    //   149: aload 6
    //   151: ldc_w 351
    //   154: iconst_0
    //   155: anewarray 353	java/lang/Object
    //   158: invokestatic 359	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    //   161: aload_0
    //   162: invokevirtual 145	co/vine/android/provider/VineSuggestionsProvider:getContext	()Landroid/content/Context;
    //   165: invokestatic 311	co/vine/android/provider/VineDatabaseHelper:getDatabaseHelper	(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;
    //   168: invokevirtual 362	co/vine/android/provider/VineDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   171: astore 7
    //   173: goto -157 -> 16
    //   176: aload_1
    //   177: invokevirtual 365	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   180: invokestatic 369	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   183: lstore 9
    //   185: aload_0
    //   186: aload_3
    //   187: new 228	android/database/MatrixCursor
    //   190: dup
    //   191: getstatic 270	co/vine/android/provider/VineSuggestionsProvider$UsersQuery:PROJECTION	[Ljava/lang/String;
    //   194: invokespecial 372	android/database/MatrixCursor:<init>	([Ljava/lang/String;)V
    //   197: lload 9
    //   199: invokespecial 374	co/vine/android/provider/VineSuggestionsProvider:getComposeUserSuggestions	(Ljava/lang/String;Landroid/database/MatrixCursor;J)Landroid/database/Cursor;
    //   202: areturn
    //   203: aload_0
    //   204: aload_3
    //   205: new 228	android/database/MatrixCursor
    //   208: dup
    //   209: getstatic 377	co/vine/android/provider/VineSuggestionsProvider$TagsQuery:PROJECTION	[Ljava/lang/String;
    //   212: invokespecial 372	android/database/MatrixCursor:<init>	([Ljava/lang/String;)V
    //   215: invokespecial 379	co/vine/android/provider/VineSuggestionsProvider:getComposeTagSuggestions	(Ljava/lang/String;Landroid/database/MatrixCursor;)Landroid/database/Cursor;
    //   218: areturn
    //   219: astore 11
    //   221: getstatic 55	co/vine/android/provider/VineSuggestionsProvider:LOGGABLE	Z
    //   224: ifeq +51 -> 275
    //   227: iconst_5
    //   228: anewarray 160	java/lang/String
    //   231: astore 12
    //   233: aload 12
    //   235: iconst_0
    //   236: aload 7
    //   238: invokevirtual 382	android/database/sqlite/SQLiteDatabase:toString	()Ljava/lang/String;
    //   241: aastore
    //   242: aload 12
    //   244: iconst_1
    //   245: aload 8
    //   247: invokevirtual 385	android/database/sqlite/SQLiteQueryBuilder:getTables	()Ljava/lang/String;
    //   250: aastore
    //   251: aload 12
    //   253: iconst_2
    //   254: aload_3
    //   255: aastore
    //   256: aload 12
    //   258: iconst_3
    //   259: aconst_null
    //   260: aastore
    //   261: aload 12
    //   263: iconst_4
    //   264: aload 5
    //   266: aastore
    //   267: ldc_w 387
    //   270: aload 12
    //   272: invokestatic 392	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   275: new 394	java/lang/RuntimeException
    //   278: dup
    //   279: aload 11
    //   281: invokespecial 397	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   284: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   0	12	147	android/database/sqlite/SQLiteException
    //   112	144	219	java/lang/Exception
  }

  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    return 0;
  }

  public static abstract interface TagsQuery
  {
    public static final int INDEX_TAG_ID = 1;
    public static final int INDEX_TAG_NAME = 2;
    public static final String[] PROJECTION = { "_id", "tag_id", "tag_name" };
  }

  public static abstract interface UsersQuery
  {
    public static final int INDEX_AVATAR_URL = 3;
    public static final int INDEX_USERNAME = 2;
    public static final int INDEX_USER_ID = 1;
    public static final String[] PROJECTION = { "_id", "user_id", "username", "avatar_url" };
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.VineSuggestionsProvider
 * JD-Core Version:    0.6.2
 */