package co.vine.android.provider;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.net.Uri.Builder;
import android.util.Log;
import co.vine.android.util.BuildUtil;

public class VineProvider extends ContentProvider
{
  private static final int ACTIVITY = 33;
  private static final int ACTIVITY_WITH_FOLLOW_REQUESTS = 34;
  private static final int ACTIVITY_WITH_FOLLOW_REQUESTS_ALL = 35;
  private static final int CHANNELS = 8;
  private static final int COMMENTS = 4;
  private static final int EDITIONS = 401;
  private static final int HIDE_PROFILE_REPOSTS = 111;
  private static final int LIKES = 5;
  private static final boolean LOGGABLE = false;
  private static final int NOTIFICATIONS = 108;
  private static final int NOTIFICATIONS_UNCLEARED = 109;
  private static final int POSTS = 6;
  private static final int POST_GROUPS_VIEW_ALL_TIMELINE = 23;
  private static final int POST_GROUPS_VIEW_ALL_TIMELINE_ON_THE_RISE = 26;
  private static final int POST_GROUPS_VIEW_ALL_TIMELINE_POPULAR_NOW = 27;
  private static final int POST_GROUPS_VIEW_ALL_TIMELINE_SINGLE = 29;
  private static final int POST_GROUPS_VIEW_ALL_TIMELINE_TAG = 28;
  private static final int POST_GROUPS_VIEW_ALL_TIMELINE_USER = 24;
  private static final int POST_GROUPS_VIEW_ALL_TIMELINE_USER_LIKES = 25;
  private static final int POST_GROUPS_VIEW_ARBITRARY_TIMELINE = 32;
  private static final int POST_GROUPS_VIEW_TIMELINE = 20;
  private static final int POST_GROUPS_VIEW_TIMELINE_CHANNEL_POPULAR = 30;
  private static final int POST_GROUPS_VIEW_TIMELINE_CHANNEL_RECENT = 31;
  private static final int POST_GROUPS_VIEW_TIMELINE_USER = 21;
  private static final int POST_GROUPS_VIEW_TIMELINE_USER_LIKES = 22;
  private static final int PUT_NOTIFICATION = 302;
  private static final int PUT_RECENT_TAG = 301;
  private static final int RECENT_TAG = 110;
  private static final int SETTINGS = 3;
  private static final String TAG = "VineProvider";
  private static final int TAG_SEARCH_RESULTS = 7;
  private static final int UPDATE_RECENT_TAG = 501;
  private static final int USER = 1;
  private static final int USER_GROUPS_VIEW_FIND_FRIENDS_ADDRESS = 103;
  private static final int USER_GROUPS_VIEW_FIND_FRIENDS_TWITTER = 104;
  private static final int USER_GROUPS_VIEW_FOLLOWERS = 101;
  private static final int USER_GROUPS_VIEW_FOLLOWING = 100;
  private static final int USER_GROUPS_VIEW_FRIENDS = 102;
  private static final int USER_GROUPS_VIEW_LIKERS = 105;
  private static final int USER_GROUPS_VIEW_REVINERS = 107;
  private static final int USER_GROUPS_VIEW_USER_SEARCH_RESULTS = 106;
  private static final int USER_ID = 2;
  private static final UriMatcher sUriMatcher;

  static
  {
    if ((BuildUtil.isLogsOn()) || (Log.isLoggable("VineProvider", 3)));
    for (boolean bool = true; ; bool = false)
    {
      LOGGABLE = bool;
      sUriMatcher = new UriMatcher(-1);
      sUriMatcher.addURI(Vine.AUTHORITY, "users", 1);
      sUriMatcher.addURI(Vine.AUTHORITY, "users/id/#", 2);
      sUriMatcher.addURI(Vine.AUTHORITY, "settings", 3);
      sUriMatcher.addURI(Vine.AUTHORITY, "comments", 4);
      sUriMatcher.addURI(Vine.AUTHORITY, "likes", 5);
      sUriMatcher.addURI(Vine.AUTHORITY, "posts", 6);
      sUriMatcher.addURI(Vine.AUTHORITY, "user_groups_view/following/#", 100);
      sUriMatcher.addURI(Vine.AUTHORITY, "user_groups_view/followers/#", 101);
      sUriMatcher.addURI(Vine.AUTHORITY, "user_groups_view/friends/#", 102);
      sUriMatcher.addURI(Vine.AUTHORITY, "user_groups_view/find_friends_twitter/#", 104);
      sUriMatcher.addURI(Vine.AUTHORITY, "user_groups_view/find_friends_address/#", 103);
      sUriMatcher.addURI(Vine.AUTHORITY, "user_groups_view/likers/#", 105);
      sUriMatcher.addURI(Vine.AUTHORITY, "user_groups_view/reviners/#", 107);
      sUriMatcher.addURI(Vine.AUTHORITY, "user_groups_view/user_search_results", 106);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_groups_view/timeline/#", 20);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_groups_view/user_profile/#", 21);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_groups_view/user_likes/#", 22);
      sUriMatcher.addURI(Vine.AUTHORITY, "tag_search_results", 7);
      sUriMatcher.addURI(Vine.AUTHORITY, "tag_recently_used", 110);
      sUriMatcher.addURI(Vine.AUTHORITY, "users/hide_profile_reposts/#", 111);
      sUriMatcher.addURI(Vine.AUTHORITY, "channels", 8);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/all_timeline/#", 23);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/all_timeline_user/#", 24);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/all_timeline_user_likes/#", 25);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/all_timeline_on_the_rise/#", 26);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/all_timeline_popular/#", 27);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/all_timeline_tag/#", 28);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/post/#", 29);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/timeline_channel_popular/#", 30);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/timeline_channel_recent/#", 31);
      sUriMatcher.addURI(Vine.AUTHORITY, "post_comments_likes_view/timelines/#", 32);
      sUriMatcher.addURI(Vine.AUTHORITY, "activity", 33);
      sUriMatcher.addURI(Vine.AUTHORITY, "activity/with_follow", 34);
      sUriMatcher.addURI(Vine.AUTHORITY, "activity/with_follow_all", 35);
      sUriMatcher.addURI(Vine.AUTHORITY, "notifications", 108);
      sUriMatcher.addURI(Vine.AUTHORITY, "notifications/uncleared", 109);
      sUriMatcher.addURI(Vine.AUTHORITY, "notifications/put_notification", 302);
      sUriMatcher.addURI(Vine.AUTHORITY, "tag_recently_used/put_tag", 301);
      sUriMatcher.addURI(Vine.AUTHORITY, "tag_recently_used/update_tag", 501);
      sUriMatcher.addURI(Vine.AUTHORITY, "editions", 401);
      return;
    }
  }

  public int delete(Uri paramUri, String paramString, String[] paramArrayOfString)
  {
    return 0;
  }

  public String getType(Uri paramUri)
  {
    switch (sUriMatcher.match(paramUri))
    {
    default:
      throw new IllegalArgumentException("Unknown URL " + paramUri);
    case 1:
      return "vnd.android.cursor.dir/vnd.vine.android.users";
    case 2:
      return "vnd.android.cursor.item/vnd.vine.android.users";
    case 3:
      return "vnd.android.cursor.item/vnd.vine.android.settings";
    case 100:
    case 101:
      return "vnd.android.cursor.dir/vnd.vine.android.users.groups";
    case 33:
    }
    return "vnd.android.cursor.dir/vnd.vine.android.activities";
  }

  public Uri insert(Uri paramUri, ContentValues paramContentValues)
  {
    SQLiteDatabase localSQLiteDatabase = VineDatabaseHelper.getDatabaseHelper(getContext()).getWritableDatabase();
    if (LOGGABLE)
      Log.d("VineProvider", "INSERT: uri " + paramUri + " -> " + sUriMatcher.match(paramUri));
    long l = -1L;
    String str = new String();
    switch (sUriMatcher.match(paramUri))
    {
    default:
    case 302:
    case 301:
    }
    while (true)
    {
      boolean bool = l < 0L;
      Uri localUri = null;
      if (!bool)
        localUri = paramUri.buildUpon().appendPath(str).build();
      return localUri;
      str = paramContentValues.getAsString("notification_id");
      l = localSQLiteDatabase.insert("notifications", null, paramContentValues);
      if (LOGGABLE)
      {
        Log.d("VineProvider", "Notification inserted with rowId=" + l);
        continue;
        str = paramContentValues.getAsString("tag_id");
        l = localSQLiteDatabase.insert("tag_recently_used", null, paramContentValues);
        if (LOGGABLE)
          Log.d("VineProvider", "Tag inserted to recently-used with rowId=" + l);
      }
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
    //   0: aload_1
    //   1: ldc_w 327
    //   4: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   7: astore 6
    //   9: aload_0
    //   10: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   13: invokestatic 260	co/vine/android/provider/VineDatabaseHelper:getDatabaseHelper	(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;
    //   16: invokevirtual 333	co/vine/android/provider/VineDatabaseHelper:getReadableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   19: astore 140
    //   21: aload 140
    //   23: astore 8
    //   25: new 335	android/database/sqlite/SQLiteQueryBuilder
    //   28: dup
    //   29: invokespecial 336	android/database/sqlite/SQLiteQueryBuilder:<init>	()V
    //   32: astore 9
    //   34: getstatic 110	co/vine/android/provider/VineProvider:LOGGABLE	Z
    //   37: ifeq +45 -> 82
    //   40: ldc 68
    //   42: new 221	java/lang/StringBuilder
    //   45: dup
    //   46: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   49: ldc_w 338
    //   52: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   55: aload_1
    //   56: invokevirtual 231	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   59: ldc_w 268
    //   62: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: getstatic 118	co/vine/android/provider/VineProvider:sUriMatcher	Landroid/content/UriMatcher;
    //   68: aload_1
    //   69: invokevirtual 217	android/content/UriMatcher:match	(Landroid/net/Uri;)I
    //   72: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   75: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   78: invokestatic 275	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   81: pop
    //   82: getstatic 118	co/vine/android/provider/VineProvider:sUriMatcher	Landroid/content/UriMatcher;
    //   85: aload_1
    //   86: invokevirtual 217	android/content/UriMatcher:match	(Landroid/net/Uri;)I
    //   89: lookupswitch	default:+307->396, 1:+398->487, 2:+416->505, 3:+462->551, 4:+526->615, 5:+510->599, 6:+478->567, 7:+3233->3322, 8:+3251->3340, 20:+1471->1560, 21:+1539->1628, 22:+1607->1696, 23:+1675->1764, 24:+1901->1990, 25:+2141->2230, 26:+2367->2456, 27:+2593->2682, 28:+2803->2892, 29:+3045->3134, 30:+3267->3356, 31:+3384->3473, 32:+3748->3837, 33:+544->633, 34:+580->669, 35:+769->858, 100:+914->1003, 101:+982->1071, 102:+1050->1139, 103:+1238->1327, 104:+1169->1258, 105:+1307->1396, 106:+1444->1533, 107:+1375->1464, 108:+3865->3954, 109:+3994->4083, 110:+4020->4109, 111:+4043->4132, 401:+494->583
    //   397: astore 11
    //   399: aconst_null
    //   400: astore 12
    //   402: aload 5
    //   404: invokestatic 344	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   407: ifne +7 -> 414
    //   410: aload 5
    //   412: astore 12
    //   414: aload_3
    //   415: astore 13
    //   417: aload 4
    //   419: astore 14
    //   421: aload 9
    //   423: aload 8
    //   425: aload_2
    //   426: aload 13
    //   428: aload 14
    //   430: aload 11
    //   432: aconst_null
    //   433: aload 12
    //   435: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   438: astore 17
    //   440: aload 17
    //   442: aload_0
    //   443: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   446: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   449: aload_1
    //   450: invokeinterface 359 3 0
    //   455: aload 17
    //   457: areturn
    //   458: astore 7
    //   460: aload 7
    //   462: ldc_w 361
    //   465: iconst_0
    //   466: anewarray 363	java/lang/Object
    //   469: invokestatic 369	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    //   472: aload_0
    //   473: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   476: invokestatic 260	co/vine/android/provider/VineDatabaseHelper:getDatabaseHelper	(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;
    //   479: invokevirtual 264	co/vine/android/provider/VineDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   482: astore 8
    //   484: goto -459 -> 25
    //   487: aload 9
    //   489: ldc 125
    //   491: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   494: ldc_w 374
    //   497: astore 12
    //   499: aconst_null
    //   500: astore 11
    //   502: goto -100 -> 402
    //   505: aload 9
    //   507: ldc 125
    //   509: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   512: aload 9
    //   514: new 221	java/lang/StringBuilder
    //   517: dup
    //   518: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   521: ldc_w 376
    //   524: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   527: aload_1
    //   528: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   531: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   534: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   537: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   540: ldc_w 374
    //   543: astore 12
    //   545: aconst_null
    //   546: astore 11
    //   548: goto -146 -> 402
    //   551: aload 9
    //   553: ldc 133
    //   555: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   558: aconst_null
    //   559: astore 11
    //   561: aconst_null
    //   562: astore 12
    //   564: goto -162 -> 402
    //   567: aload 9
    //   569: ldc 139
    //   571: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   574: aconst_null
    //   575: astore 11
    //   577: aconst_null
    //   578: astore 12
    //   580: goto -178 -> 402
    //   583: aload 9
    //   585: ldc 207
    //   587: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   590: aconst_null
    //   591: astore 11
    //   593: aconst_null
    //   594: astore 12
    //   596: goto -194 -> 402
    //   599: aload 9
    //   601: ldc 137
    //   603: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   606: aconst_null
    //   607: astore 11
    //   609: aconst_null
    //   610: astore 12
    //   612: goto -210 -> 402
    //   615: aload 9
    //   617: ldc 135
    //   619: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   622: ldc_w 385
    //   625: astore 12
    //   627: aconst_null
    //   628: astore 11
    //   630: goto -228 -> 402
    //   633: aload 9
    //   635: ldc 191
    //   637: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   640: ldc_w 387
    //   643: astore_3
    //   644: iconst_1
    //   645: anewarray 279	java/lang/String
    //   648: astore 4
    //   650: aload 4
    //   652: iconst_0
    //   653: iconst_2
    //   654: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   657: aastore
    //   658: ldc_w 393
    //   661: astore 12
    //   663: aconst_null
    //   664: astore 11
    //   666: goto -264 -> 402
    //   669: aload 9
    //   671: ldc 191
    //   673: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   676: getstatic 399	co/vine/android/provider/VineDatabaseSQL$ActivityQuery:PROJECTION	[Ljava/lang/String;
    //   679: astore 129
    //   681: iconst_1
    //   682: anewarray 279	java/lang/String
    //   685: astore 130
    //   687: aload 130
    //   689: iconst_0
    //   690: iconst_2
    //   691: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   694: aastore
    //   695: aload 9
    //   697: aload 8
    //   699: aload 129
    //   701: ldc_w 387
    //   704: aload 130
    //   706: aconst_null
    //   707: aconst_null
    //   708: ldc_w 393
    //   711: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   714: astore 131
    //   716: getstatic 399	co/vine/android/provider/VineDatabaseSQL$ActivityQuery:PROJECTION	[Ljava/lang/String;
    //   719: astore 132
    //   721: iconst_1
    //   722: anewarray 279	java/lang/String
    //   725: astore 133
    //   727: aload 133
    //   729: iconst_0
    //   730: iconst_2
    //   731: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   734: aastore
    //   735: aload 9
    //   737: aload 8
    //   739: aload 132
    //   741: ldc_w 401
    //   744: aload 133
    //   746: aconst_null
    //   747: aconst_null
    //   748: ldc_w 393
    //   751: iconst_5
    //   752: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   755: invokevirtual 404	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   758: astore 134
    //   760: getstatic 399	co/vine/android/provider/VineDatabaseSQL$ActivityQuery:PROJECTION	[Ljava/lang/String;
    //   763: astore 135
    //   765: iconst_1
    //   766: anewarray 279	java/lang/String
    //   769: astore 136
    //   771: aload 136
    //   773: iconst_0
    //   774: iconst_2
    //   775: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   778: aastore
    //   779: aload 9
    //   781: aload 8
    //   783: aload 135
    //   785: ldc_w 401
    //   788: aload 136
    //   790: aconst_null
    //   791: aconst_null
    //   792: ldc_w 393
    //   795: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   798: astore 137
    //   800: aload_0
    //   801: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   804: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   807: astore 138
    //   809: aload 131
    //   811: aload 138
    //   813: aload_1
    //   814: invokeinterface 359 3 0
    //   819: aload 134
    //   821: aload 138
    //   823: aload_1
    //   824: invokeinterface 359 3 0
    //   829: new 406	co/vine/android/provider/ActivityCursor
    //   832: dup
    //   833: iconst_2
    //   834: anewarray 355	android/database/Cursor
    //   837: dup
    //   838: iconst_0
    //   839: aload 134
    //   841: aastore
    //   842: dup
    //   843: iconst_1
    //   844: aload 131
    //   846: aastore
    //   847: aload 137
    //   849: invokeinterface 410 1 0
    //   854: invokespecial 413	co/vine/android/provider/ActivityCursor:<init>	([Landroid/database/Cursor;I)V
    //   857: areturn
    //   858: aload 9
    //   860: ldc 191
    //   862: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   865: getstatic 399	co/vine/android/provider/VineDatabaseSQL$ActivityQuery:PROJECTION	[Ljava/lang/String;
    //   868: astore 122
    //   870: iconst_1
    //   871: anewarray 279	java/lang/String
    //   874: astore 123
    //   876: aload 123
    //   878: iconst_0
    //   879: iconst_2
    //   880: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   883: aastore
    //   884: aload 9
    //   886: aload 8
    //   888: aload 122
    //   890: ldc_w 387
    //   893: aload 123
    //   895: aconst_null
    //   896: aconst_null
    //   897: ldc_w 393
    //   900: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   903: astore 124
    //   905: getstatic 399	co/vine/android/provider/VineDatabaseSQL$ActivityQuery:PROJECTION	[Ljava/lang/String;
    //   908: astore 125
    //   910: iconst_1
    //   911: anewarray 279	java/lang/String
    //   914: astore 126
    //   916: aload 126
    //   918: iconst_0
    //   919: iconst_2
    //   920: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   923: aastore
    //   924: aload 9
    //   926: aload 8
    //   928: aload 125
    //   930: ldc_w 401
    //   933: aload 126
    //   935: aconst_null
    //   936: aconst_null
    //   937: ldc_w 393
    //   940: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   943: astore 127
    //   945: aload_0
    //   946: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   949: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   952: astore 128
    //   954: aload 124
    //   956: aload 128
    //   958: aload_1
    //   959: invokeinterface 359 3 0
    //   964: aload 127
    //   966: aload 128
    //   968: aload_1
    //   969: invokeinterface 359 3 0
    //   974: new 406	co/vine/android/provider/ActivityCursor
    //   977: dup
    //   978: iconst_2
    //   979: anewarray 355	android/database/Cursor
    //   982: dup
    //   983: iconst_0
    //   984: aload 127
    //   986: aastore
    //   987: dup
    //   988: iconst_1
    //   989: aload 124
    //   991: aastore
    //   992: aload 127
    //   994: invokeinterface 410 1 0
    //   999: invokespecial 413	co/vine/android/provider/ActivityCursor:<init>	([Landroid/database/Cursor;I)V
    //   1002: areturn
    //   1003: aload 9
    //   1005: ldc_w 415
    //   1008: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1011: aload 9
    //   1013: new 221	java/lang/StringBuilder
    //   1016: dup
    //   1017: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1020: ldc_w 417
    //   1023: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1026: aload_1
    //   1027: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1030: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1033: ldc_w 419
    //   1036: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1039: ldc_w 421
    //   1042: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1045: bipush 61
    //   1047: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1050: iconst_1
    //   1051: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1054: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1057: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1060: ldc_w 426
    //   1063: astore 12
    //   1065: aconst_null
    //   1066: astore 11
    //   1068: goto -666 -> 402
    //   1071: aload 9
    //   1073: ldc_w 415
    //   1076: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1079: aload 9
    //   1081: new 221	java/lang/StringBuilder
    //   1084: dup
    //   1085: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1088: ldc_w 417
    //   1091: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1094: aload_1
    //   1095: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1098: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1101: ldc_w 419
    //   1104: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1107: ldc_w 421
    //   1110: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1113: bipush 61
    //   1115: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1118: iconst_2
    //   1119: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1122: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1125: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1128: ldc_w 426
    //   1131: astore 12
    //   1133: aconst_null
    //   1134: astore 11
    //   1136: goto -734 -> 402
    //   1139: aload 9
    //   1141: ldc_w 415
    //   1144: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1147: aload 9
    //   1149: new 221	java/lang/StringBuilder
    //   1152: dup
    //   1153: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1156: ldc_w 417
    //   1159: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1162: aload_1
    //   1163: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1166: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1169: ldc_w 428
    //   1172: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1175: ldc_w 421
    //   1178: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1181: bipush 61
    //   1183: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1186: iconst_1
    //   1187: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1190: ldc_w 430
    //   1193: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1196: ldc_w 421
    //   1199: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1202: bipush 61
    //   1204: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1207: iconst_2
    //   1208: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1211: ldc_w 430
    //   1214: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1217: ldc_w 421
    //   1220: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1223: bipush 61
    //   1225: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1228: bipush 10
    //   1230: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1233: ldc_w 432
    //   1236: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1239: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1242: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1245: ldc_w 434
    //   1248: astore 11
    //   1250: ldc_w 426
    //   1253: astore 12
    //   1255: goto -853 -> 402
    //   1258: aload 9
    //   1260: ldc_w 415
    //   1263: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1266: aload 9
    //   1268: new 221	java/lang/StringBuilder
    //   1271: dup
    //   1272: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1275: ldc_w 417
    //   1278: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1281: aload_1
    //   1282: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1285: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1288: ldc_w 419
    //   1291: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1294: ldc_w 421
    //   1297: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1300: bipush 61
    //   1302: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1305: bipush 6
    //   1307: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1310: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1313: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1316: ldc_w 426
    //   1319: astore 12
    //   1321: aconst_null
    //   1322: astore 11
    //   1324: goto -922 -> 402
    //   1327: aload 9
    //   1329: ldc_w 415
    //   1332: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1335: aload 9
    //   1337: new 221	java/lang/StringBuilder
    //   1340: dup
    //   1341: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1344: ldc_w 417
    //   1347: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1350: aload_1
    //   1351: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1354: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1357: ldc_w 419
    //   1360: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1363: ldc_w 421
    //   1366: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1369: bipush 61
    //   1371: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1374: bipush 7
    //   1376: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1379: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1382: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1385: ldc_w 426
    //   1388: astore 12
    //   1390: aconst_null
    //   1391: astore 11
    //   1393: goto -991 -> 402
    //   1396: aload 9
    //   1398: ldc_w 415
    //   1401: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1404: aload 9
    //   1406: new 221	java/lang/StringBuilder
    //   1409: dup
    //   1410: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1413: ldc_w 417
    //   1416: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1419: aload_1
    //   1420: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1423: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1426: ldc_w 419
    //   1429: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1432: ldc_w 421
    //   1435: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1438: bipush 61
    //   1440: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1443: iconst_5
    //   1444: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1447: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1450: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1453: ldc_w 436
    //   1456: astore 12
    //   1458: aconst_null
    //   1459: astore 11
    //   1461: goto -1059 -> 402
    //   1464: aload 9
    //   1466: ldc_w 415
    //   1469: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1472: aload 9
    //   1474: new 221	java/lang/StringBuilder
    //   1477: dup
    //   1478: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1481: ldc_w 417
    //   1484: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1487: aload_1
    //   1488: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1491: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1494: ldc_w 419
    //   1497: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1500: ldc_w 421
    //   1503: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1506: bipush 61
    //   1508: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1511: bipush 9
    //   1513: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1516: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1519: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1522: ldc_w 436
    //   1525: astore 12
    //   1527: aconst_null
    //   1528: astore 11
    //   1530: goto -1128 -> 402
    //   1533: aload 9
    //   1535: ldc_w 415
    //   1538: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1541: aload 9
    //   1543: ldc_w 438
    //   1546: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1549: ldc_w 426
    //   1552: astore 12
    //   1554: aconst_null
    //   1555: astore 11
    //   1557: goto -1155 -> 402
    //   1560: aload 9
    //   1562: ldc_w 440
    //   1565: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1568: aload 9
    //   1570: new 221	java/lang/StringBuilder
    //   1573: dup
    //   1574: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1577: ldc_w 417
    //   1580: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1583: aload_1
    //   1584: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1587: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1590: ldc_w 419
    //   1593: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1596: ldc_w 442
    //   1599: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1602: bipush 61
    //   1604: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1607: iconst_1
    //   1608: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1611: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1614: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1617: ldc_w 444
    //   1620: astore 12
    //   1622: aconst_null
    //   1623: astore 11
    //   1625: goto -1223 -> 402
    //   1628: aload 9
    //   1630: ldc_w 440
    //   1633: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1636: aload 9
    //   1638: new 221	java/lang/StringBuilder
    //   1641: dup
    //   1642: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1645: ldc_w 417
    //   1648: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1651: aload_1
    //   1652: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1655: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1658: ldc_w 419
    //   1661: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1664: ldc_w 442
    //   1667: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1670: bipush 61
    //   1672: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1675: iconst_2
    //   1676: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1679: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1682: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1685: ldc_w 444
    //   1688: astore 12
    //   1690: aconst_null
    //   1691: astore 11
    //   1693: goto -1291 -> 402
    //   1696: aload 9
    //   1698: ldc_w 440
    //   1701: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1704: aload 9
    //   1706: new 221	java/lang/StringBuilder
    //   1709: dup
    //   1710: invokespecial 222	java/lang/StringBuilder:<init>	()V
    //   1713: ldc_w 417
    //   1716: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1719: aload_1
    //   1720: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1723: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1726: ldc_w 419
    //   1729: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1732: ldc_w 442
    //   1735: invokevirtual 228	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1738: bipush 61
    //   1740: invokevirtual 424	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   1743: iconst_3
    //   1744: invokevirtual 271	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1747: invokevirtual 235	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1750: invokevirtual 383	android/database/sqlite/SQLiteQueryBuilder:appendWhere	(Ljava/lang/CharSequence;)V
    //   1753: ldc_w 444
    //   1756: astore 12
    //   1758: aconst_null
    //   1759: astore 11
    //   1761: goto -1359 -> 402
    //   1764: aload_0
    //   1765: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   1768: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   1771: ifeq +111 -> 1882
    //   1774: aload 9
    //   1776: ldc_w 440
    //   1779: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1782: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   1785: astore 117
    //   1787: iconst_2
    //   1788: anewarray 279	java/lang/String
    //   1791: astore 118
    //   1793: aload 118
    //   1795: iconst_0
    //   1796: aload_1
    //   1797: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1800: aastore
    //   1801: aload 118
    //   1803: iconst_1
    //   1804: iconst_1
    //   1805: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   1808: aastore
    //   1809: aload 9
    //   1811: aload 8
    //   1813: aload 117
    //   1815: ldc_w 453
    //   1818: aload 118
    //   1820: aconst_null
    //   1821: aconst_null
    //   1822: ldc_w 444
    //   1825: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   1828: astore 119
    //   1830: aload 6
    //   1832: ifnull +44 -> 1876
    //   1835: aload 6
    //   1837: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   1840: istore 120
    //   1842: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   1845: dup
    //   1846: aload 119
    //   1848: iload 120
    //   1850: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   1853: astore 121
    //   1855: aload 121
    //   1857: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   1860: aload 121
    //   1862: aload_0
    //   1863: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   1866: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   1869: aload_1
    //   1870: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   1873: aload 121
    //   1875: areturn
    //   1876: iconst_0
    //   1877: istore 120
    //   1879: goto -37 -> 1842
    //   1882: aload 9
    //   1884: ldc_w 470
    //   1887: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   1890: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   1893: astore 112
    //   1895: iconst_2
    //   1896: anewarray 279	java/lang/String
    //   1899: astore 113
    //   1901: aload 113
    //   1903: iconst_0
    //   1904: aload_1
    //   1905: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   1908: aastore
    //   1909: aload 113
    //   1911: iconst_1
    //   1912: iconst_1
    //   1913: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   1916: aastore
    //   1917: aload 9
    //   1919: aload 8
    //   1921: aload 112
    //   1923: ldc_w 453
    //   1926: aload 113
    //   1928: aconst_null
    //   1929: aconst_null
    //   1930: ldc_w 475
    //   1933: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   1936: astore 114
    //   1938: aload 6
    //   1940: ifnull +44 -> 1984
    //   1943: aload 6
    //   1945: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   1948: istore 115
    //   1950: new 477	co/vine/android/provider/HybridPostCursor
    //   1953: dup
    //   1954: aload 114
    //   1956: iload 115
    //   1958: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   1961: astore 116
    //   1963: aload 116
    //   1965: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   1968: aload 116
    //   1970: aload_0
    //   1971: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   1974: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   1977: aload_1
    //   1978: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   1981: aload 116
    //   1983: areturn
    //   1984: iconst_0
    //   1985: istore 115
    //   1987: goto -37 -> 1950
    //   1990: aload_1
    //   1991: ldc_w 482
    //   1994: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   1997: astore 103
    //   1999: aload_1
    //   2000: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   2003: astore 104
    //   2005: ldc_w 484
    //   2008: aload 103
    //   2010: invokevirtual 488	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   2013: ifeq +107 -> 2120
    //   2016: iconst_2
    //   2017: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2020: astore 105
    //   2022: aload_0
    //   2023: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2026: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   2029: ifeq +107 -> 2136
    //   2032: aload 9
    //   2034: ldc_w 440
    //   2037: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2040: aload 9
    //   2042: aload 8
    //   2044: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   2047: ldc_w 490
    //   2050: iconst_2
    //   2051: anewarray 279	java/lang/String
    //   2054: dup
    //   2055: iconst_0
    //   2056: aload 104
    //   2058: aastore
    //   2059: dup
    //   2060: iconst_1
    //   2061: aload 105
    //   2063: aastore
    //   2064: aconst_null
    //   2065: aconst_null
    //   2066: ldc_w 444
    //   2069: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2072: astore 109
    //   2074: aload 6
    //   2076: ifnull +54 -> 2130
    //   2079: aload 6
    //   2081: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2084: istore 110
    //   2086: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   2089: dup
    //   2090: aload 109
    //   2092: iload 110
    //   2094: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   2097: astore 111
    //   2099: aload 111
    //   2101: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   2104: aload 111
    //   2106: aload_0
    //   2107: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2110: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   2113: aload_1
    //   2114: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   2117: aload 111
    //   2119: areturn
    //   2120: bipush 10
    //   2122: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2125: astore 105
    //   2127: goto -105 -> 2022
    //   2130: iconst_0
    //   2131: istore 110
    //   2133: goto -47 -> 2086
    //   2136: aload 9
    //   2138: ldc_w 470
    //   2141: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2144: aload 9
    //   2146: aload 8
    //   2148: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   2151: ldc_w 490
    //   2154: iconst_2
    //   2155: anewarray 279	java/lang/String
    //   2158: dup
    //   2159: iconst_0
    //   2160: aload 104
    //   2162: aastore
    //   2163: dup
    //   2164: iconst_1
    //   2165: aload 105
    //   2167: aastore
    //   2168: aconst_null
    //   2169: aconst_null
    //   2170: ldc_w 475
    //   2173: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2176: astore 106
    //   2178: aload 6
    //   2180: ifnull +44 -> 2224
    //   2183: aload 6
    //   2185: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2188: istore 107
    //   2190: new 477	co/vine/android/provider/HybridPostCursor
    //   2193: dup
    //   2194: aload 106
    //   2196: iload 107
    //   2198: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   2201: astore 108
    //   2203: aload 108
    //   2205: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   2208: aload 108
    //   2210: aload_0
    //   2211: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2214: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   2217: aload_1
    //   2218: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   2221: aload 108
    //   2223: areturn
    //   2224: iconst_0
    //   2225: istore 107
    //   2227: goto -37 -> 2190
    //   2230: aload_0
    //   2231: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2234: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   2237: ifeq +111 -> 2348
    //   2240: aload 9
    //   2242: ldc_w 440
    //   2245: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2248: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   2251: astore 98
    //   2253: iconst_2
    //   2254: anewarray 279	java/lang/String
    //   2257: astore 99
    //   2259: aload 99
    //   2261: iconst_0
    //   2262: aload_1
    //   2263: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   2266: aastore
    //   2267: aload 99
    //   2269: iconst_1
    //   2270: iconst_3
    //   2271: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2274: aastore
    //   2275: aload 9
    //   2277: aload 8
    //   2279: aload 98
    //   2281: ldc_w 453
    //   2284: aload 99
    //   2286: aconst_null
    //   2287: aconst_null
    //   2288: ldc_w 444
    //   2291: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2294: astore 100
    //   2296: aload 6
    //   2298: ifnull +44 -> 2342
    //   2301: aload 6
    //   2303: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2306: istore 101
    //   2308: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   2311: dup
    //   2312: aload 100
    //   2314: iload 101
    //   2316: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   2319: astore 102
    //   2321: aload 102
    //   2323: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   2326: aload 102
    //   2328: aload_0
    //   2329: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2332: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   2335: aload_1
    //   2336: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   2339: aload 102
    //   2341: areturn
    //   2342: iconst_0
    //   2343: istore 101
    //   2345: goto -37 -> 2308
    //   2348: aload 9
    //   2350: ldc_w 470
    //   2353: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2356: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   2359: astore 93
    //   2361: iconst_2
    //   2362: anewarray 279	java/lang/String
    //   2365: astore 94
    //   2367: aload 94
    //   2369: iconst_0
    //   2370: aload_1
    //   2371: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   2374: aastore
    //   2375: aload 94
    //   2377: iconst_1
    //   2378: iconst_3
    //   2379: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2382: aastore
    //   2383: aload 9
    //   2385: aload 8
    //   2387: aload 93
    //   2389: ldc_w 453
    //   2392: aload 94
    //   2394: aconst_null
    //   2395: aconst_null
    //   2396: ldc_w 475
    //   2399: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2402: astore 95
    //   2404: aload 6
    //   2406: ifnull +44 -> 2450
    //   2409: aload 6
    //   2411: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2414: istore 96
    //   2416: new 477	co/vine/android/provider/HybridPostCursor
    //   2419: dup
    //   2420: aload 95
    //   2422: iload 96
    //   2424: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   2427: astore 97
    //   2429: aload 97
    //   2431: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   2434: aload 97
    //   2436: aload_0
    //   2437: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2440: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   2443: aload_1
    //   2444: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   2447: aload 97
    //   2449: areturn
    //   2450: iconst_0
    //   2451: istore 96
    //   2453: goto -37 -> 2416
    //   2456: aload_0
    //   2457: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2460: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   2463: ifeq +111 -> 2574
    //   2466: aload 9
    //   2468: ldc_w 440
    //   2471: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2474: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   2477: astore 88
    //   2479: iconst_2
    //   2480: anewarray 279	java/lang/String
    //   2483: astore 89
    //   2485: aload 89
    //   2487: iconst_0
    //   2488: aload_1
    //   2489: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   2492: aastore
    //   2493: aload 89
    //   2495: iconst_1
    //   2496: iconst_4
    //   2497: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2500: aastore
    //   2501: aload 9
    //   2503: aload 8
    //   2505: aload 88
    //   2507: ldc_w 453
    //   2510: aload 89
    //   2512: aconst_null
    //   2513: aconst_null
    //   2514: ldc_w 444
    //   2517: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2520: astore 90
    //   2522: aload 6
    //   2524: ifnull +44 -> 2568
    //   2527: aload 6
    //   2529: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2532: istore 91
    //   2534: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   2537: dup
    //   2538: aload 90
    //   2540: iload 91
    //   2542: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   2545: astore 92
    //   2547: aload 92
    //   2549: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   2552: aload 92
    //   2554: aload_0
    //   2555: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2558: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   2561: aload_1
    //   2562: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   2565: aload 92
    //   2567: areturn
    //   2568: iconst_0
    //   2569: istore 91
    //   2571: goto -37 -> 2534
    //   2574: aload 9
    //   2576: ldc_w 470
    //   2579: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2582: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   2585: astore 83
    //   2587: iconst_2
    //   2588: anewarray 279	java/lang/String
    //   2591: astore 84
    //   2593: aload 84
    //   2595: iconst_0
    //   2596: aload_1
    //   2597: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   2600: aastore
    //   2601: aload 84
    //   2603: iconst_1
    //   2604: iconst_4
    //   2605: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2608: aastore
    //   2609: aload 9
    //   2611: aload 8
    //   2613: aload 83
    //   2615: ldc_w 453
    //   2618: aload 84
    //   2620: aconst_null
    //   2621: aconst_null
    //   2622: ldc_w 492
    //   2625: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2628: astore 85
    //   2630: aload 6
    //   2632: ifnull +44 -> 2676
    //   2635: aload 6
    //   2637: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2640: istore 86
    //   2642: new 477	co/vine/android/provider/HybridPostCursor
    //   2645: dup
    //   2646: aload 85
    //   2648: iload 86
    //   2650: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   2653: astore 87
    //   2655: aload 87
    //   2657: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   2660: aload 87
    //   2662: aload_0
    //   2663: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2666: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   2669: aload_1
    //   2670: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   2673: aload 87
    //   2675: areturn
    //   2676: iconst_0
    //   2677: istore 86
    //   2679: goto -37 -> 2642
    //   2682: aload_0
    //   2683: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2686: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   2689: ifeq +103 -> 2792
    //   2692: aload 9
    //   2694: ldc_w 440
    //   2697: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2700: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   2703: astore 78
    //   2705: iconst_1
    //   2706: anewarray 279	java/lang/String
    //   2709: astore 79
    //   2711: aload 79
    //   2713: iconst_0
    //   2714: iconst_5
    //   2715: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2718: aastore
    //   2719: aload 9
    //   2721: aload 8
    //   2723: aload 78
    //   2725: ldc_w 494
    //   2728: aload 79
    //   2730: aconst_null
    //   2731: aconst_null
    //   2732: ldc_w 444
    //   2735: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2738: astore 80
    //   2740: aload 6
    //   2742: ifnull +44 -> 2786
    //   2745: aload 6
    //   2747: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2750: istore 81
    //   2752: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   2755: dup
    //   2756: aload 80
    //   2758: iload 81
    //   2760: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   2763: astore 82
    //   2765: aload 82
    //   2767: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   2770: aload 82
    //   2772: aload_0
    //   2773: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2776: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   2779: aload_1
    //   2780: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   2783: aload 82
    //   2785: areturn
    //   2786: iconst_0
    //   2787: istore 81
    //   2789: goto -37 -> 2752
    //   2792: aload 9
    //   2794: ldc_w 470
    //   2797: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2800: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   2803: astore 73
    //   2805: iconst_1
    //   2806: anewarray 279	java/lang/String
    //   2809: astore 74
    //   2811: aload 74
    //   2813: iconst_0
    //   2814: iconst_5
    //   2815: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2818: aastore
    //   2819: aload 9
    //   2821: aload 8
    //   2823: aload 73
    //   2825: ldc_w 494
    //   2828: aload 74
    //   2830: aconst_null
    //   2831: aconst_null
    //   2832: ldc_w 492
    //   2835: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2838: astore 75
    //   2840: aload 6
    //   2842: ifnull +44 -> 2886
    //   2845: aload 6
    //   2847: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2850: istore 76
    //   2852: new 477	co/vine/android/provider/HybridPostCursor
    //   2855: dup
    //   2856: aload 75
    //   2858: iload 76
    //   2860: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   2863: astore 77
    //   2865: aload 77
    //   2867: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   2870: aload 77
    //   2872: aload_0
    //   2873: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2876: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   2879: aload_1
    //   2880: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   2883: aload 77
    //   2885: areturn
    //   2886: iconst_0
    //   2887: istore 76
    //   2889: goto -37 -> 2852
    //   2892: aload_0
    //   2893: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   2896: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   2899: ifeq +119 -> 3018
    //   2902: aload 9
    //   2904: ldc_w 440
    //   2907: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   2910: aload_1
    //   2911: ldc_w 496
    //   2914: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   2917: astore 67
    //   2919: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   2922: astore 68
    //   2924: iconst_2
    //   2925: anewarray 279	java/lang/String
    //   2928: astore 69
    //   2930: aload 69
    //   2932: iconst_0
    //   2933: aload 67
    //   2935: aastore
    //   2936: aload 69
    //   2938: iconst_1
    //   2939: bipush 6
    //   2941: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   2944: aastore
    //   2945: aload 9
    //   2947: aload 8
    //   2949: aload 68
    //   2951: ldc_w 453
    //   2954: aload 69
    //   2956: aconst_null
    //   2957: aconst_null
    //   2958: ldc_w 444
    //   2961: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   2964: astore 70
    //   2966: aload 6
    //   2968: ifnull +44 -> 3012
    //   2971: aload 6
    //   2973: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   2976: istore 71
    //   2978: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   2981: dup
    //   2982: aload 70
    //   2984: iload 71
    //   2986: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   2989: astore 72
    //   2991: aload 72
    //   2993: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   2996: aload 72
    //   2998: aload_0
    //   2999: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3002: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3005: aload_1
    //   3006: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3009: aload 72
    //   3011: areturn
    //   3012: iconst_0
    //   3013: istore 71
    //   3015: goto -37 -> 2978
    //   3018: aload 9
    //   3020: ldc_w 470
    //   3023: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3026: aload_1
    //   3027: ldc_w 496
    //   3030: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   3033: astore 61
    //   3035: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   3038: astore 62
    //   3040: iconst_2
    //   3041: anewarray 279	java/lang/String
    //   3044: astore 63
    //   3046: aload 63
    //   3048: iconst_0
    //   3049: aload 61
    //   3051: aastore
    //   3052: aload 63
    //   3054: iconst_1
    //   3055: bipush 6
    //   3057: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   3060: aastore
    //   3061: aload 9
    //   3063: aload 8
    //   3065: aload 62
    //   3067: ldc_w 453
    //   3070: aload 63
    //   3072: aconst_null
    //   3073: aconst_null
    //   3074: ldc_w 475
    //   3077: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   3080: astore 64
    //   3082: aload 6
    //   3084: ifnull +44 -> 3128
    //   3087: aload 6
    //   3089: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   3092: istore 65
    //   3094: new 477	co/vine/android/provider/HybridPostCursor
    //   3097: dup
    //   3098: aload 64
    //   3100: iload 65
    //   3102: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   3105: astore 66
    //   3107: aload 66
    //   3109: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   3112: aload 66
    //   3114: aload_0
    //   3115: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3118: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3121: aload_1
    //   3122: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3125: aload 66
    //   3127: areturn
    //   3128: iconst_0
    //   3129: istore 65
    //   3131: goto -37 -> 3094
    //   3134: aload_0
    //   3135: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3138: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   3141: ifeq +92 -> 3233
    //   3144: aload 9
    //   3146: ldc_w 440
    //   3149: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3152: aload_1
    //   3153: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   3156: astore 57
    //   3158: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   3161: astore 58
    //   3163: iconst_2
    //   3164: anewarray 279	java/lang/String
    //   3167: astore 59
    //   3169: aload 59
    //   3171: iconst_0
    //   3172: aload 57
    //   3174: aastore
    //   3175: aload 59
    //   3177: iconst_1
    //   3178: bipush 7
    //   3180: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   3183: aastore
    //   3184: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   3187: dup
    //   3188: aload 9
    //   3190: aload 8
    //   3192: aload 58
    //   3194: ldc_w 498
    //   3197: aload 59
    //   3199: aconst_null
    //   3200: aconst_null
    //   3201: ldc_w 444
    //   3204: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   3207: invokespecial 501	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;)V
    //   3210: astore 60
    //   3212: aload 60
    //   3214: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   3217: aload 60
    //   3219: aload_0
    //   3220: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3223: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3226: aload_1
    //   3227: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3230: aload 60
    //   3232: areturn
    //   3233: aload 9
    //   3235: ldc_w 470
    //   3238: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3241: aload_1
    //   3242: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   3245: astore 53
    //   3247: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   3250: astore 54
    //   3252: iconst_2
    //   3253: anewarray 279	java/lang/String
    //   3256: astore 55
    //   3258: aload 55
    //   3260: iconst_0
    //   3261: aload 53
    //   3263: aastore
    //   3264: aload 55
    //   3266: iconst_1
    //   3267: bipush 7
    //   3269: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   3272: aastore
    //   3273: new 477	co/vine/android/provider/HybridPostCursor
    //   3276: dup
    //   3277: aload 9
    //   3279: aload 8
    //   3281: aload 54
    //   3283: ldc_w 498
    //   3286: aload 55
    //   3288: aconst_null
    //   3289: aconst_null
    //   3290: ldc_w 475
    //   3293: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   3296: invokespecial 502	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;)V
    //   3299: astore 56
    //   3301: aload 56
    //   3303: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   3306: aload 56
    //   3308: aload_0
    //   3309: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3312: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3315: aload_1
    //   3316: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3319: aload 56
    //   3321: areturn
    //   3322: aload 9
    //   3324: ldc 163
    //   3326: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3329: ldc_w 426
    //   3332: astore 12
    //   3334: aconst_null
    //   3335: astore 11
    //   3337: goto -2935 -> 402
    //   3340: aload 9
    //   3342: ldc 169
    //   3344: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3347: aconst_null
    //   3348: astore 11
    //   3350: aconst_null
    //   3351: astore 12
    //   3353: goto -2951 -> 402
    //   3356: aload_0
    //   3357: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3360: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   3363: ifeq +236 -> 3599
    //   3366: aload 9
    //   3368: ldc_w 440
    //   3371: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3374: aload_1
    //   3375: ldc_w 504
    //   3378: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   3381: astore 47
    //   3383: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   3386: astore 48
    //   3388: iconst_2
    //   3389: anewarray 279	java/lang/String
    //   3392: astore 49
    //   3394: aload 49
    //   3396: iconst_0
    //   3397: bipush 8
    //   3399: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   3402: aastore
    //   3403: aload 49
    //   3405: iconst_1
    //   3406: aload 47
    //   3408: aastore
    //   3409: aload 9
    //   3411: aload 8
    //   3413: aload 48
    //   3415: ldc_w 506
    //   3418: aload 49
    //   3420: aconst_null
    //   3421: aconst_null
    //   3422: ldc_w 444
    //   3425: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   3428: astore 50
    //   3430: aload 6
    //   3432: ifnull +161 -> 3593
    //   3435: aload 6
    //   3437: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   3440: istore 51
    //   3442: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   3445: dup
    //   3446: aload 50
    //   3448: iload 51
    //   3450: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   3453: astore 52
    //   3455: aload 52
    //   3457: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   3460: aload 52
    //   3462: aload_0
    //   3463: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3466: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3469: aload_1
    //   3470: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3473: aload_0
    //   3474: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3477: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   3480: ifeq +241 -> 3721
    //   3483: aload 9
    //   3485: ldc_w 440
    //   3488: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3491: aload_1
    //   3492: ldc_w 504
    //   3495: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   3498: astore 35
    //   3500: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   3503: astore 36
    //   3505: iconst_2
    //   3506: anewarray 279	java/lang/String
    //   3509: astore 37
    //   3511: aload 37
    //   3513: iconst_0
    //   3514: bipush 9
    //   3516: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   3519: aastore
    //   3520: aload 37
    //   3522: iconst_1
    //   3523: aload 35
    //   3525: aastore
    //   3526: aload 9
    //   3528: aload 8
    //   3530: aload 36
    //   3532: ldc_w 506
    //   3535: aload 37
    //   3537: aconst_null
    //   3538: aconst_null
    //   3539: ldc_w 444
    //   3542: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   3545: astore 38
    //   3547: aload 6
    //   3549: ifnull +166 -> 3715
    //   3552: aload 6
    //   3554: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   3557: istore 39
    //   3559: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   3562: dup
    //   3563: aload 38
    //   3565: iload 39
    //   3567: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   3570: astore 40
    //   3572: aload 40
    //   3574: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   3577: aload 40
    //   3579: aload_0
    //   3580: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3583: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3586: aload_1
    //   3587: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3590: aload 40
    //   3592: areturn
    //   3593: iconst_0
    //   3594: istore 51
    //   3596: goto -154 -> 3442
    //   3599: aload 9
    //   3601: ldc_w 470
    //   3604: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3607: aload_1
    //   3608: ldc_w 504
    //   3611: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   3614: astore 41
    //   3616: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   3619: astore 42
    //   3621: iconst_2
    //   3622: anewarray 279	java/lang/String
    //   3625: astore 43
    //   3627: aload 43
    //   3629: iconst_0
    //   3630: bipush 8
    //   3632: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   3635: aastore
    //   3636: aload 43
    //   3638: iconst_1
    //   3639: aload 41
    //   3641: aastore
    //   3642: aload 9
    //   3644: aload 8
    //   3646: aload 42
    //   3648: ldc_w 506
    //   3651: aload 43
    //   3653: aconst_null
    //   3654: aconst_null
    //   3655: ldc_w 492
    //   3658: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   3661: astore 44
    //   3663: aload 6
    //   3665: ifnull +44 -> 3709
    //   3668: aload 6
    //   3670: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   3673: istore 45
    //   3675: new 477	co/vine/android/provider/HybridPostCursor
    //   3678: dup
    //   3679: aload 44
    //   3681: iload 45
    //   3683: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   3686: astore 46
    //   3688: aload 46
    //   3690: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   3693: aload 46
    //   3695: aload_0
    //   3696: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3699: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3702: aload_1
    //   3703: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3706: aload 46
    //   3708: areturn
    //   3709: iconst_0
    //   3710: istore 45
    //   3712: goto -37 -> 3675
    //   3715: iconst_0
    //   3716: istore 39
    //   3718: goto -159 -> 3559
    //   3721: aload 9
    //   3723: ldc_w 470
    //   3726: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3729: aload_1
    //   3730: ldc_w 504
    //   3733: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   3736: astore 29
    //   3738: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   3741: astore 30
    //   3743: iconst_2
    //   3744: anewarray 279	java/lang/String
    //   3747: astore 31
    //   3749: aload 31
    //   3751: iconst_0
    //   3752: bipush 9
    //   3754: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   3757: aastore
    //   3758: aload 31
    //   3760: iconst_1
    //   3761: aload 29
    //   3763: aastore
    //   3764: aload 9
    //   3766: aload 8
    //   3768: aload 30
    //   3770: ldc_w 506
    //   3773: aload 31
    //   3775: aconst_null
    //   3776: aconst_null
    //   3777: ldc_w 475
    //   3780: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   3783: astore 32
    //   3785: aload 6
    //   3787: ifnull +44 -> 3831
    //   3790: aload 6
    //   3792: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   3795: istore 33
    //   3797: new 477	co/vine/android/provider/HybridPostCursor
    //   3800: dup
    //   3801: aload 32
    //   3803: iload 33
    //   3805: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   3808: astore 34
    //   3810: aload 34
    //   3812: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   3815: aload 34
    //   3817: aload_0
    //   3818: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3821: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3824: aload_1
    //   3825: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3828: aload 34
    //   3830: areturn
    //   3831: iconst_0
    //   3832: istore 33
    //   3834: goto -37 -> 3797
    //   3837: aload_1
    //   3838: ldc_w 496
    //   3841: invokevirtual 330	android/net/Uri:getQueryParameter	(Ljava/lang/String;)Ljava/lang/String;
    //   3844: astore 18
    //   3846: aload_0
    //   3847: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3850: invokestatic 448	co/vine/android/util/BuildUtil:isOldDeviceOrLowEndDevice	(Landroid/content/Context;)Z
    //   3853: ifeq +123 -> 3976
    //   3856: aload 9
    //   3858: ldc_w 440
    //   3861: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3864: getstatic 451	co/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery:PROJECTION	[Ljava/lang/String;
    //   3867: astore 24
    //   3869: iconst_2
    //   3870: anewarray 279	java/lang/String
    //   3873: astore 25
    //   3875: aload 25
    //   3877: iconst_0
    //   3878: bipush 11
    //   3880: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   3883: aastore
    //   3884: aload 25
    //   3886: iconst_1
    //   3887: aload 18
    //   3889: aastore
    //   3890: aload 9
    //   3892: aload 8
    //   3894: aload 24
    //   3896: ldc_w 506
    //   3899: aload 25
    //   3901: aconst_null
    //   3902: aconst_null
    //   3903: ldc_w 444
    //   3906: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   3909: astore 26
    //   3911: aload 6
    //   3913: ifnull +57 -> 3970
    //   3916: aload 6
    //   3918: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   3921: istore 27
    //   3923: new 461	co/vine/android/provider/HybridPostCursorExplore
    //   3926: dup
    //   3927: aload 26
    //   3929: iload 27
    //   3931: invokespecial 464	co/vine/android/provider/HybridPostCursorExplore:<init>	(Landroid/database/Cursor;I)V
    //   3934: astore 28
    //   3936: aload 28
    //   3938: invokevirtual 467	co/vine/android/provider/HybridPostCursorExplore:prepare	()V
    //   3941: aload 28
    //   3943: aload_0
    //   3944: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   3947: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   3950: aload_1
    //   3951: invokevirtual 468	co/vine/android/provider/HybridPostCursorExplore:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   3954: aload 9
    //   3956: ldc 197
    //   3958: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3961: aconst_null
    //   3962: astore 11
    //   3964: aconst_null
    //   3965: astore 12
    //   3967: goto -3565 -> 402
    //   3970: iconst_0
    //   3971: istore 27
    //   3973: goto -50 -> 3923
    //   3976: aload 9
    //   3978: ldc_w 470
    //   3981: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   3984: getstatic 473	co/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery:PROJECTION	[Ljava/lang/String;
    //   3987: astore 19
    //   3989: iconst_2
    //   3990: anewarray 279	java/lang/String
    //   3993: astore 20
    //   3995: aload 20
    //   3997: iconst_0
    //   3998: bipush 11
    //   4000: invokestatic 391	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   4003: aastore
    //   4004: aload 20
    //   4006: iconst_1
    //   4007: aload 18
    //   4009: aastore
    //   4010: aload 9
    //   4012: aload 8
    //   4014: aload 19
    //   4016: ldc_w 506
    //   4019: aload 20
    //   4021: aconst_null
    //   4022: aconst_null
    //   4023: ldc_w 492
    //   4026: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   4029: astore 21
    //   4031: aload 6
    //   4033: ifnull +44 -> 4077
    //   4036: aload 6
    //   4038: invokestatic 459	java/lang/Integer:parseInt	(Ljava/lang/String;)I
    //   4041: istore 22
    //   4043: new 477	co/vine/android/provider/HybridPostCursor
    //   4046: dup
    //   4047: aload 21
    //   4049: iload 22
    //   4051: invokespecial 478	co/vine/android/provider/HybridPostCursor:<init>	(Landroid/database/Cursor;I)V
    //   4054: astore 23
    //   4056: aload 23
    //   4058: invokevirtual 479	co/vine/android/provider/HybridPostCursor:prepare	()V
    //   4061: aload 23
    //   4063: aload_0
    //   4064: invokevirtual 254	co/vine/android/provider/VineProvider:getContext	()Landroid/content/Context;
    //   4067: invokevirtual 353	android/content/Context:getContentResolver	()Landroid/content/ContentResolver;
    //   4070: aload_1
    //   4071: invokevirtual 480	co/vine/android/provider/HybridPostCursor:setNotificationUri	(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    //   4074: aload 23
    //   4076: areturn
    //   4077: iconst_0
    //   4078: istore 22
    //   4080: goto -37 -> 4043
    //   4083: aload 9
    //   4085: ldc 197
    //   4087: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   4090: aload 9
    //   4092: aload 8
    //   4094: aload_2
    //   4095: aload_3
    //   4096: aload 4
    //   4098: aconst_null
    //   4099: aconst_null
    //   4100: aload 5
    //   4102: ldc_w 508
    //   4105: invokevirtual 404	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   4108: areturn
    //   4109: aload 9
    //   4111: ldc 165
    //   4113: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   4116: aload 9
    //   4118: aload 8
    //   4120: aload_2
    //   4121: aload_3
    //   4122: aload 4
    //   4124: aconst_null
    //   4125: aconst_null
    //   4126: aload 5
    //   4128: invokevirtual 347	android/database/sqlite/SQLiteQueryBuilder:query	(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   4131: areturn
    //   4132: aload_1
    //   4133: invokevirtual 379	android/net/Uri:getLastPathSegment	()Ljava/lang/String;
    //   4136: astore 10
    //   4138: ldc_w 510
    //   4141: astore_3
    //   4142: iconst_1
    //   4143: anewarray 279	java/lang/String
    //   4146: astore 4
    //   4148: aload 4
    //   4150: iconst_0
    //   4151: aload 10
    //   4153: invokestatic 513	java/lang/String:valueOf	(Ljava/lang/Object;)Ljava/lang/String;
    //   4156: aastore
    //   4157: aload 9
    //   4159: ldc 125
    //   4161: invokevirtual 372	android/database/sqlite/SQLiteQueryBuilder:setTables	(Ljava/lang/String;)V
    //   4164: aconst_null
    //   4165: astore 11
    //   4167: aconst_null
    //   4168: astore 12
    //   4170: goto -3768 -> 402
    //   4173: astore 15
    //   4175: getstatic 110	co/vine/android/provider/VineProvider:LOGGABLE	Z
    //   4178: ifeq +52 -> 4230
    //   4181: iconst_5
    //   4182: anewarray 279	java/lang/String
    //   4185: astore 16
    //   4187: aload 16
    //   4189: iconst_0
    //   4190: aload 8
    //   4192: invokevirtual 514	android/database/sqlite/SQLiteDatabase:toString	()Ljava/lang/String;
    //   4195: aastore
    //   4196: aload 16
    //   4198: iconst_1
    //   4199: aload 9
    //   4201: invokevirtual 517	android/database/sqlite/SQLiteQueryBuilder:getTables	()Ljava/lang/String;
    //   4204: aastore
    //   4205: aload 16
    //   4207: iconst_2
    //   4208: aload_3
    //   4209: aastore
    //   4210: aload 16
    //   4212: iconst_3
    //   4213: aload 11
    //   4215: aastore
    //   4216: aload 16
    //   4218: iconst_4
    //   4219: aload 12
    //   4221: aastore
    //   4222: ldc_w 519
    //   4225: aload 16
    //   4227: invokestatic 524	com/edisonwang/android/slog/SLog:d	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   4230: new 526	java/lang/RuntimeException
    //   4233: dup
    //   4234: aload 15
    //   4236: invokespecial 529	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   4239: athrow
    //
    // Exception table:
    //   from	to	target	type
    //   9	21	458	android/database/sqlite/SQLiteException
    //   421	455	4173	java/lang/Exception
  }

  public int update(Uri paramUri, ContentValues paramContentValues, String paramString, String[] paramArrayOfString)
  {
    SQLiteDatabase localSQLiteDatabase = VineDatabaseHelper.getDatabaseHelper(getContext()).getWritableDatabase();
    if (LOGGABLE)
      Log.d("VineProvider", "UPDATE: uri " + paramUri + " -> " + sUriMatcher.match(paramUri));
    switch (sUriMatcher.match(paramUri))
    {
    default:
      return 0;
    case 501:
    }
    localSQLiteDatabase.update("tag_recently_used", paramContentValues, paramString, paramArrayOfString);
    return 0;
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.VineProvider
 * JD-Core Version:    0.6.2
 */