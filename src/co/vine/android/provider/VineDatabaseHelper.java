package co.vine.android.provider;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteDiskIOException;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteFullException;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;
import android.util.Pair;
import co.vine.android.Friendships;
import co.vine.android.VineException;
import co.vine.android.api.VineChannel;
import co.vine.android.api.VineComment;
import co.vine.android.api.VineComparatorFactory;
import co.vine.android.api.VineComparatorFactory.VineComparator;
import co.vine.android.api.VineLike;
import co.vine.android.api.VineNotification;
import co.vine.android.api.VinePagedData;
import co.vine.android.api.VinePost;
import co.vine.android.api.VineRepost;
import co.vine.android.api.VineTag;
import co.vine.android.api.VineUser;
import co.vine.android.client.AppController;
import co.vine.android.service.GCMNotificationService.Notification;
import co.vine.android.util.BuildUtil;
import co.vine.android.util.CrashUtil;
import co.vine.android.util.Util;
import co.vine.android.util.image.ImageUtils;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

public class VineDatabaseHelper extends SQLiteOpenHelper
{
  public static final int DATABASE_VERSION = 18;
  private static final String DB_NAME = "vine";
  private static final boolean LOGGABLE = false;
  private static final int MAX_ACTIVITY_TABLE_SIZE = 500;
  private static final int MAX_COMMENTS_TABLE_SIZE = 5000;
  private static final int MAX_LIKES_TABLE_SIZE = 5000;
  private static final int MAX_POST_TABLE_SIZE = 1000;
  private static final int MAX_USERS_TABLE_SIZE = 10000;
  public static final int SCHEMA_VERSION = 1;
  private static final String SEPARATOR = "-";
  public static final String SETTINGS_NAME_SELECTION = "name=?";
  private static final String TAG = "VineDH";
  private static final HashMap<String, VineDatabaseHelper> sHelperMap;
  private final Context mAppContext;
  private final ContentResolver mContentResolver;

  static
  {
    if ((BuildUtil.isLogsOn()) || (Log.isLoggable("VineDH", 3)));
    for (boolean bool = true; ; bool = false)
    {
      LOGGABLE = bool;
      sHelperMap = new HashMap();
      return;
    }
  }

  private VineDatabaseHelper(Context paramContext, String paramString)
  {
    super(paramContext, paramString, null, 18);
    this.mContentResolver = paramContext.getContentResolver();
    this.mAppContext = paramContext.getApplicationContext();
  }

  private void dropTables(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("DROP VIEW IF EXISTS  user_groups_view;");
    paramSQLiteDatabase.execSQL("DROP VIEW IF EXISTS  post_groups_view;");
    paramSQLiteDatabase.execSQL("DROP VIEW IF EXISTS  post_comments_likes_view;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS users;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS settings;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS user_groups;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS comments;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS activity;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS likes;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS posts;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS post_groups;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS page_cursors;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS tag_search_results;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS tag_search_results;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS channels;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS notifications;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS tag_recently_used;");
    paramSQLiteDatabase.execSQL("DROP TABLE IF EXISTS editions;");
  }

  private void fillActivityValues(ContentValues paramContentValues, VineNotification paramVineNotification, long paramLong)
  {
    paramContentValues.put("notification_id", Long.valueOf(paramVineNotification.notificationId));
    switch (paramVineNotification.notificationType)
    {
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    default:
      paramContentValues.put("notification_type", Integer.valueOf(-1));
      switch (paramVineNotification.notificationType)
      {
      default:
        paramContentValues.put("sort_id", Integer.valueOf(1));
      case 13:
      }
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    }
    while (true)
    {
      paramContentValues.put("avatar_url", paramVineNotification.avatarUrl);
      paramContentValues.put("thumbnail_url", paramVineNotification.thumbnailUrl);
      paramContentValues.put("post_id", Long.valueOf(paramVineNotification.postId));
      paramContentValues.put("user_id", Long.valueOf(paramVineNotification.userId));
      paramContentValues.put("username", paramVineNotification.username);
      paramContentValues.put("comment", paramVineNotification.comment);
      paramContentValues.put("timestamp", Long.valueOf(paramVineNotification.createdAt));
      paramContentValues.put("follow_status", Integer.valueOf(paramVineNotification.followStatus));
      paramContentValues.put("last_refresh", Long.valueOf(paramLong));
      if (paramVineNotification.entities != null)
        paramContentValues.put("entities", Util.toByteArray(paramVineNotification.entities));
      return;
      paramContentValues.put("notification_type", Integer.valueOf(paramVineNotification.notificationType));
      break;
      paramContentValues.put("sort_id", Integer.valueOf(2));
    }
  }

  private void fillChannelValues(ContentValues paramContentValues, VineChannel paramVineChannel)
  {
    paramContentValues.put("channel_id", Long.valueOf(paramVineChannel.channelId));
    paramContentValues.put("channel", paramVineChannel.channel);
    paramContentValues.put("retinaIconUrl", paramVineChannel.retinaIconUrl);
    paramContentValues.put("background_color", paramVineChannel.backgroundColor);
    paramContentValues.put("font_color", paramVineChannel.fontColor);
    paramContentValues.put("timestamp", Long.valueOf(paramVineChannel.created));
  }

  private void fillCommentValues(ContentValues paramContentValues, VineComment paramVineComment, long paramLong)
  {
    paramContentValues.put("comment_id", Long.valueOf(paramVineComment.commentId));
    paramContentValues.put("user_id", Long.valueOf(paramVineComment.userId));
    paramContentValues.put("post_id", Long.valueOf(paramVineComment.postId));
    paramContentValues.put("avatar_url", paramVineComment.avatarUrl);
    paramContentValues.put("comment", paramVineComment.comment);
    paramContentValues.put("timestamp", Long.valueOf(paramVineComment.timestamp));
    paramContentValues.put("location", paramVineComment.location);
    paramContentValues.put("username", paramVineComment.username);
    paramContentValues.put("verified", Boolean.valueOf(paramVineComment.verified));
    if (paramVineComment.entities != null)
      paramContentValues.put("entities", Util.toByteArray(paramVineComment.entities));
    paramContentValues.put("last_refresh", Long.valueOf(paramLong));
    paramContentValues.put("is_last", Boolean.valueOf(paramVineComment.isLast));
  }

  private void fillLikeValues(ContentValues paramContentValues, VineLike paramVineLike, long paramLong)
  {
    paramContentValues.put("like_id", Long.valueOf(paramVineLike.likeId));
    paramContentValues.put("user_id", Long.valueOf(paramVineLike.userId));
    paramContentValues.put("post_id", Long.valueOf(paramVineLike.postId));
    paramContentValues.put("avatar_url", paramVineLike.avatarUrl);
    paramContentValues.put("timestamp", Long.valueOf(paramVineLike.created));
    paramContentValues.put("location", paramVineLike.location);
    paramContentValues.put("username", paramVineLike.username);
    paramContentValues.put("verified", Integer.valueOf(paramVineLike.verified));
    paramContentValues.put("last_refresh", Long.valueOf(paramLong));
  }

  private void fillNotificationValues(ContentValues paramContentValues, VineNotification paramVineNotification, String paramString)
  {
    paramContentValues.put("notification_id", Long.valueOf(paramVineNotification.notificationId));
    paramContentValues.put("notification_type", Integer.valueOf(paramVineNotification.notificationType));
    paramContentValues.put("message", paramString);
    paramContentValues.put("cleared", Integer.valueOf(0));
  }

  private void fillPostValues(ContentValues paramContentValues, VinePost paramVinePost, long paramLong)
    throws IOException
  {
    paramContentValues.put("avatar_url", paramVinePost.avatarUrl);
    paramContentValues.put("description", paramVinePost.description);
    paramContentValues.put("foursquare_venue_id", paramVinePost.foursquareVenueId);
    paramContentValues.put("metadata_flags", Integer.valueOf(paramVinePost.metadataFlags));
    paramContentValues.put("location", paramVinePost.location);
    paramContentValues.put("post_flags", Integer.valueOf(paramVinePost.postFlags));
    paramContentValues.put("post_id", Long.valueOf(paramVinePost.postId));
    paramContentValues.put("my_repost_id", Long.valueOf(paramVinePost.myRepostId));
    paramContentValues.put("share_url", paramVinePost.shareUrl);
    paramContentValues.put("thumbnail_url", paramVinePost.thumbnailUrl);
    paramContentValues.put("video_url", paramVinePost.videoUrl);
    paramContentValues.put("video_low_uRL", paramVinePost.videoLowURL);
    paramContentValues.put("timestamp", Long.valueOf(paramVinePost.created));
    paramContentValues.put("username", paramVinePost.username);
    paramContentValues.put("user_id", Long.valueOf(paramVinePost.userId));
    paramContentValues.put("likes_count", Integer.valueOf(paramVinePost.likesCount));
    paramContentValues.put("reviners_count", Integer.valueOf(paramVinePost.revinersCount));
    paramContentValues.put("comments_count", Integer.valueOf(paramVinePost.commentsCount));
    paramContentValues.put("tags", VinePost.getBytesFromTags(paramVinePost));
    if (paramVinePost.venueData != null)
      paramContentValues.put("venue_data", Util.toByteArray(paramVinePost.venueData));
    if (paramVinePost.entities != null)
      paramContentValues.put("entities", Util.toByteArray(paramVinePost.entities));
    paramContentValues.put("last_refresh", Long.valueOf(paramLong));
  }

  private void fillTagValues(ContentValues paramContentValues, VineTag paramVineTag)
  {
    paramContentValues.put("tag_id", Long.valueOf(paramVineTag.tagId));
    paramContentValues.put("tag_name", paramVineTag.tagName);
    paramContentValues.put("last_used_timestamp", Long.valueOf(System.currentTimeMillis()));
  }

  private void fillUserContentValues(ContentValues paramContentValues, VineUser paramVineUser, long paramLong)
  {
    paramContentValues.put("user_id", Long.valueOf(paramVineUser.userId));
    paramContentValues.put("avatar_url", paramVineUser.avatarUrl);
    paramContentValues.put("username", paramVineUser.username);
    paramContentValues.put("blocked", Integer.valueOf(paramVineUser.blocked));
    paramContentValues.put("blocking", Integer.valueOf(paramVineUser.blocking));
    paramContentValues.put("description", paramVineUser.description);
    paramContentValues.put("location", paramVineUser.location);
    paramContentValues.put("explicit", Integer.valueOf(paramVineUser.explicit));
    paramContentValues.put("follower_count", Integer.valueOf(paramVineUser.followerCount));
    paramContentValues.put("following_count", Integer.valueOf(paramVineUser.followingCount));
    if (paramVineUser.following != -1)
      paramContentValues.put("following_flag", Integer.valueOf(paramVineUser.following));
    paramContentValues.put("like_count", Integer.valueOf(paramVineUser.likeCount));
    paramContentValues.put("post_count", Integer.valueOf(paramVineUser.postCount));
    paramContentValues.put("verified", Integer.valueOf(paramVineUser.verified));
    paramContentValues.put("follow_status", Integer.valueOf(paramVineUser.followStatus));
    paramContentValues.put("last_refresh", Long.valueOf(paramLong));
  }

  public static VineDatabaseHelper getDatabaseHelper(Context paramContext)
  {
    try
    {
      String str = getDatabaseName(1);
      VineDatabaseHelper localVineDatabaseHelper = (VineDatabaseHelper)sHelperMap.get(str);
      if (localVineDatabaseHelper == null)
      {
        localVineDatabaseHelper = new VineDatabaseHelper(paramContext.getApplicationContext(), str);
        sHelperMap.put(str, localVineDatabaseHelper);
      }
      return localVineDatabaseHelper;
    }
    finally
    {
    }
  }

  public static String getDatabaseName(int paramInt)
  {
    return "vine-" + paramInt;
  }

  public static File getDatabasePath(Context paramContext)
  {
    return paramContext.getDatabasePath(getDatabaseName(1));
  }

  private long getLastActivityRowId()
  {
    Cursor localCursor = getReadableDatabase().query("activity", VineDatabaseSQL.ActivityQuery.PROJECTION, null, null, null, null, "sort_id ASC, notification_id ASC", "1");
    if (localCursor != null);
    try
    {
      if (localCursor.moveToFirst())
      {
        long l = localCursor.getLong(0);
        return l;
      }
      return 0L;
    }
    finally
    {
      localCursor.close();
    }
  }

  private long getLastChannelRowId()
  {
    Cursor localCursor = getReadableDatabase().query("channels", VineDatabaseSQL.ChannelsQuery.PROJECTION, null, null, null, null, "channel_id DESC", "1");
    if (localCursor != null);
    try
    {
      if (localCursor.moveToFirst())
      {
        long l = localCursor.getLong(0);
        return l;
      }
      return 0L;
    }
    finally
    {
      localCursor.close();
    }
  }

  private long getLastCommentRowId(long paramLong)
  {
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    String[] arrayOfString1 = VineDatabaseSQL.CommentsQuery.PROJECTION;
    String[] arrayOfString2 = new String[1];
    arrayOfString2[0] = String.valueOf(paramLong);
    Cursor localCursor = localSQLiteDatabase.query("comments", arrayOfString1, "post_id =? ", arrayOfString2, null, null, "comment_id ASC", "1");
    if (localCursor != null);
    try
    {
      if (localCursor.moveToFirst())
      {
        long l = localCursor.getLong(0);
        return l;
      }
      return 0L;
    }
    finally
    {
      localCursor.close();
    }
  }

  private long getLastPostRowId(int paramInt, String paramString)
  {
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    String[] arrayOfString1 = VineDatabaseSQL.PostCommentsLikesQuery.PROJECTION;
    String[] arrayOfString2 = new String[2];
    arrayOfString2[0] = String.valueOf(paramInt);
    arrayOfString2[1] = paramString;
    Cursor localCursor = localSQLiteDatabase.query("post_comments_likes_view", arrayOfString1, "post_type=? AND tag=?", arrayOfString2, null, null, "sort_id ASC", "1");
    if (localCursor != null);
    try
    {
      if (localCursor.moveToFirst())
      {
        long l = localCursor.getLong(0);
        return l;
      }
      return 0L;
    }
    finally
    {
      localCursor.close();
    }
  }

  private long getLastTagRowId()
  {
    Cursor localCursor = getReadableDatabase().query("tag_search_results", VineDatabaseSQL.TagsQuery.PROJECTION, null, null, null, null, "_id DESC", "1");
    if (localCursor != null);
    try
    {
      if (localCursor.moveToFirst())
      {
        long l = localCursor.getLong(0);
        return l;
      }
      return 0L;
    }
    finally
    {
      localCursor.close();
    }
  }

  private long getLastUserRowId(int paramInt, String paramString1, String paramString2)
  {
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    String str;
    String[] arrayOfString;
    if (paramString1 != null)
    {
      str = "type=? AND tag=?";
      arrayOfString = new String[2];
      arrayOfString[0] = String.valueOf(paramInt);
      arrayOfString[1] = paramString1;
    }
    while (true)
    {
      Cursor localCursor = localSQLiteDatabase.query("user_groups_view", VineDatabaseSQL.UsersQuery.PROJECTION, str, arrayOfString, null, null, paramString2, "1");
      if (localCursor != null);
      try
      {
        if (localCursor.moveToFirst())
        {
          long l = localCursor.getLong(0);
          return l;
          str = "type=?";
          arrayOfString = new String[1];
          arrayOfString[0] = String.valueOf(paramInt);
          continue;
        }
        return 0L;
      }
      finally
      {
        localCursor.close();
      }
    }
  }

  // ERROR //
  private void mergePostGroups(Collection<VinePost> paramCollection, int paramInt, String paramString, Map<Long, Long> paramMap)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_1
    //   3: ifnull +8 -> 11
    //   6: iload_2
    //   7: iconst_m1
    //   8: if_icmpne +6 -> 14
    //   11: aload_0
    //   12: monitorexit
    //   13: return
    //   14: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   17: ifeq +54 -> 71
    //   20: ldc 34
    //   22: new 476	java/lang/StringBuilder
    //   25: dup
    //   26: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   29: ldc_w 588
    //   32: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   35: aload_1
    //   36: invokeinterface 594 1 0
    //   41: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   44: ldc_w 596
    //   47: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   50: aload_3
    //   51: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: ldc_w 598
    //   57: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: iload_2
    //   61: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   64: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   67: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   70: pop
    //   71: new 604	java/util/LinkedHashMap
    //   74: dup
    //   75: invokespecial 605	java/util/LinkedHashMap:<init>	()V
    //   78: astore 6
    //   80: aload_1
    //   81: invokeinterface 609 1 0
    //   86: astore 7
    //   88: aload 7
    //   90: invokeinterface 614 1 0
    //   95: ifeq +41 -> 136
    //   98: aload 7
    //   100: invokeinterface 618 1 0
    //   105: checkcast 315	co/vine/android/api/VinePost
    //   108: astore 26
    //   110: aload 6
    //   112: aload 26
    //   114: getfield 337	co/vine/android/api/VinePost:postId	J
    //   117: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   120: aload 26
    //   122: invokevirtual 619	java/util/LinkedHashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   125: pop
    //   126: goto -38 -> 88
    //   129: astore 5
    //   131: aload_0
    //   132: monitorexit
    //   133: aload 5
    //   135: athrow
    //   136: aload_0
    //   137: invokevirtual 622	co/vine/android/provider/VineDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   140: astore 8
    //   142: getstatic 625	co/vine/android/provider/VineDatabaseSQL$PostGroupsQuery:PROJECTION	[Ljava/lang/String;
    //   145: astore 9
    //   147: iconst_1
    //   148: anewarray 543	java/lang/String
    //   151: astore 10
    //   153: aload 10
    //   155: iconst_0
    //   156: iload_2
    //   157: invokestatic 559	java/lang/String:valueOf	(I)Ljava/lang/String;
    //   160: aastore
    //   161: aload 8
    //   163: ldc_w 627
    //   166: aload 9
    //   168: ldc_w 629
    //   171: aload 10
    //   173: aconst_null
    //   174: aconst_null
    //   175: aconst_null
    //   176: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   179: astore 11
    //   181: aload 11
    //   183: ifnull +55 -> 238
    //   186: aload 11
    //   188: invokeinterface 521 1 0
    //   193: istore 12
    //   195: iload 12
    //   197: ifeq +41 -> 238
    //   200: aload 6
    //   202: aload 11
    //   204: iconst_0
    //   205: invokeinterface 525 2 0
    //   210: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   213: invokevirtual 635	java/util/LinkedHashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   216: pop
    //   217: aload 11
    //   219: invokeinterface 638 1 0
    //   224: istore 25
    //   226: iload 25
    //   228: ifne -28 -> 200
    //   231: aload 11
    //   233: invokeinterface 528 1 0
    //   238: aload 6
    //   240: invokevirtual 639	java/util/LinkedHashMap:size	()I
    //   243: istore 13
    //   245: iconst_0
    //   246: istore 14
    //   248: iload 13
    //   250: ifle +268 -> 518
    //   253: aload 8
    //   255: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   258: new 142	android/content/ContentValues
    //   261: dup
    //   262: invokespecial 643	android/content/ContentValues:<init>	()V
    //   265: astore 15
    //   267: aload 15
    //   269: ldc_w 645
    //   272: iload_2
    //   273: invokestatic 156	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   276: invokevirtual 159	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   279: aload 15
    //   281: ldc_w 647
    //   284: aload_3
    //   285: invokevirtual 169	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/String;)V
    //   288: aload 6
    //   290: invokevirtual 651	java/util/LinkedHashMap:values	()Ljava/util/Collection;
    //   293: invokeinterface 609 1 0
    //   298: astore 17
    //   300: aload 17
    //   302: invokeinterface 614 1 0
    //   307: ifeq +189 -> 496
    //   310: aload 17
    //   312: invokeinterface 618 1 0
    //   317: checkcast 315	co/vine/android/api/VinePost
    //   320: astore 19
    //   322: aload 15
    //   324: ldc_w 653
    //   327: iconst_0
    //   328: invokestatic 156	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   331: invokevirtual 159	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Integer;)V
    //   334: aload 15
    //   336: ldc 176
    //   338: aload 19
    //   340: getfield 337	co/vine/android/api/VinePost:postId	J
    //   343: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   346: invokevirtual 146	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   349: aload 15
    //   351: ldc_w 655
    //   354: aload 19
    //   356: getfield 659	co/vine/android/api/VinePost:repost	Lco/vine/android/api/VineRepost;
    //   359: invokestatic 215	co/vine/android/util/Util:toByteArray	(Ljava/lang/Object;)[B
    //   362: invokevirtual 218	android/content/ContentValues:put	(Ljava/lang/String;[B)V
    //   365: aload 19
    //   367: getfield 659	co/vine/android/api/VinePost:repost	Lco/vine/android/api/VineRepost;
    //   370: ifnull +98 -> 468
    //   373: aload 15
    //   375: ldc_w 661
    //   378: aload 19
    //   380: getfield 659	co/vine/android/api/VinePost:repost	Lco/vine/android/api/VineRepost;
    //   383: getfield 664	co/vine/android/api/VineRepost:userId	J
    //   386: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   389: invokevirtual 146	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   392: aload 4
    //   394: ifnull +28 -> 422
    //   397: aload 15
    //   399: ldc 161
    //   401: aload 4
    //   403: aload 19
    //   405: getfield 337	co/vine/android/api/VinePost:postId	J
    //   408: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   411: invokeinterface 667 2 0
    //   416: checkcast 136	java/lang/Long
    //   419: invokevirtual 146	android/content/ContentValues:put	(Ljava/lang/String;Ljava/lang/Long;)V
    //   422: aload 8
    //   424: ldc_w 627
    //   427: ldc 176
    //   429: aload 15
    //   431: invokevirtual 671	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   434: lstore 20
    //   436: lload 20
    //   438: lconst_0
    //   439: lcmp
    //   440: ifle +50 -> 490
    //   443: iconst_1
    //   444: istore 22
    //   446: iload 14
    //   448: iload 22
    //   450: iadd
    //   451: istore 14
    //   453: goto -153 -> 300
    //   456: astore 23
    //   458: aload 11
    //   460: invokeinterface 528 1 0
    //   465: aload 23
    //   467: athrow
    //   468: aload 15
    //   470: ldc_w 661
    //   473: invokevirtual 673	android/content/ContentValues:remove	(Ljava/lang/String;)V
    //   476: goto -84 -> 392
    //   479: astore 16
    //   481: aload_0
    //   482: aload 8
    //   484: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   487: aload 16
    //   489: athrow
    //   490: iconst_0
    //   491: istore 22
    //   493: goto -47 -> 446
    //   496: aload 8
    //   498: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   501: aload_0
    //   502: aload 8
    //   504: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   507: aload_0
    //   508: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   511: getstatic 685	co/vine/android/provider/Vine$PostGroupsView:CONTENT_URI	Landroid/net/Uri;
    //   514: aconst_null
    //   515: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   518: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   521: ifeq -510 -> 11
    //   524: ldc 34
    //   526: new 476	java/lang/StringBuilder
    //   529: dup
    //   530: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   533: ldc_w 693
    //   536: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   539: iload 14
    //   541: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   544: ldc_w 695
    //   547: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   550: iload_2
    //   551: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   554: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   557: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   560: pop
    //   561: goto -550 -> 11
    //
    // Exception table:
    //   from	to	target	type
    //   14	71	129	finally
    //   71	88	129	finally
    //   88	126	129	finally
    //   136	181	129	finally
    //   186	195	129	finally
    //   231	238	129	finally
    //   238	245	129	finally
    //   253	258	129	finally
    //   458	468	129	finally
    //   481	490	129	finally
    //   501	518	129	finally
    //   518	561	129	finally
    //   200	226	456	finally
    //   258	300	479	finally
    //   300	392	479	finally
    //   397	422	479	finally
    //   422	436	479	finally
    //   468	476	479	finally
    //   496	501	479	finally
  }

  private void mergeUserGroups(Collection<VineUser> paramCollection, int paramInt, String paramString, Map<Long, Long> paramMap1, Map<Long, Long> paramMap2)
  {
    if ((paramCollection == null) || (paramInt == -1));
    LinkedHashMap localLinkedHashMap;
    SQLiteDatabase localSQLiteDatabase;
    label286: 
    do
    {
      Cursor localCursor2;
      while (true)
      {
        return;
        try
        {
          if (LOGGABLE)
            Log.d("VineDH", "mergeUserGroups: " + paramCollection.size() + ", tagged by: " + paramString + ", of type: " + paramInt);
          localLinkedHashMap = new LinkedHashMap();
          Iterator localIterator1 = paramCollection.iterator();
          while (localIterator1.hasNext())
          {
            VineUser localVineUser2 = (VineUser)localIterator1.next();
            localLinkedHashMap.put(Long.valueOf(localVineUser2.userId), localVineUser2);
          }
        }
        finally
        {
        }
        localSQLiteDatabase = getWritableDatabase();
        Cursor localCursor1;
        if (paramString != null)
        {
          String[] arrayOfString1 = VineDatabaseSQL.UserGroupsQuery.PROJECTION;
          String[] arrayOfString2 = new String[2];
          arrayOfString2[0] = String.valueOf(paramInt);
          arrayOfString2[1] = String.valueOf(paramString);
          localCursor1 = localSQLiteDatabase.query("user_groups", arrayOfString1, "type=? AND tag=?", arrayOfString2, null, null, null);
        }
        String[] arrayOfString3;
        String[] arrayOfString4;
        for (localCursor2 = localCursor1; localCursor2 != null; localCursor2 = localSQLiteDatabase.query("user_groups", arrayOfString3, "type=?", arrayOfString4, null, null, null))
        {
          try
          {
            if (!localCursor2.moveToNext())
              break label286;
            localLinkedHashMap.remove(Long.valueOf(localCursor2.getLong(0)));
          }
          finally
          {
            localCursor2.close();
          }
          arrayOfString4 = new String[1];
          arrayOfString4[0] = String.valueOf(paramInt);
        }
      }
      localCursor2.close();
      if (LOGGABLE)
        Log.d("VineDH", "Inserting new user groups: " + localLinkedHashMap.size());
    }
    while (localLinkedHashMap.size() <= 0);
    localSQLiteDatabase.beginTransaction();
    while (true)
    {
      try
      {
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("type", Integer.valueOf(paramInt));
        if (paramString != null)
        {
          localContentValues.put("tag", paramString);
          break label599;
          label379: Iterator localIterator2 = localLinkedHashMap.values().iterator();
          VineUser localVineUser1;
          int i;
          if (localIterator2.hasNext())
          {
            localVineUser1 = (VineUser)localIterator2.next();
            localContentValues.put("g_flags", Integer.valueOf(0));
            localContentValues.put("user_id", Long.valueOf(localVineUser1.userId));
            if ((i != 0) && (paramMap2.get(Long.valueOf(localVineUser1.userId)) != null))
            {
              localContentValues.put("order_id", (Long)paramMap2.get(Long.valueOf(localVineUser1.userId)));
              label489: localSQLiteDatabase.insert("user_groups", "user_id", localContentValues);
              continue;
            }
          }
        }
      }
      finally
      {
        safeFinishTransaction(localSQLiteDatabase);
      }
      label599: 
      do
      {
        i = 0;
        break label379;
        if ((paramMap1 == null) || (paramMap1.get(Long.valueOf(localVineUser1.userId)) == null))
          break label489;
        localContentValues.put("tag", (Long)paramMap1.get(Long.valueOf(localVineUser1.userId)));
        break label489;
        localSQLiteDatabase.setTransactionSuccessful();
        safeFinishTransaction(localSQLiteDatabase);
        this.mContentResolver.notifyChange(Vine.UserGroupsView.CONTENT_URI, null);
        break;
      }
      while (paramMap2 == null);
      i = 1;
    }
  }

  private void notifyByType(int paramInt)
  {
    switch (paramInt)
    {
    case 7:
    default:
      notifyPostCommentsViewUris();
      return;
    case 8:
      this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_CHANNEL_POPULAR, null);
      return;
    case 9:
      this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_CHANNEL_RECENT, null);
      return;
    case 4:
      this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_ON_THE_RISE, null);
      return;
    case 5:
      this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_POPULAR_NOW, null);
      return;
    case 6:
    }
    this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_TAG, null);
  }

  private void notifyPostCommentsViewUris()
  {
    this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE, null);
    this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_USER, null);
    this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_USER_LIKES, null);
    this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE_SINGLE, null);
  }

  private int removePostsFromGroup(int paramInt)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(paramInt);
        int i = localSQLiteDatabase.delete("post_groups", "post_type=?", arrayOfString);
        localSQLiteDatabase.setTransactionSuccessful();
        if (LOGGABLE)
          Log.d("VineDH", "Clearing group " + paramInt + " deleting " + i + " groups ");
        safeFinishTransaction(localSQLiteDatabase);
        return i;
      }
      finally
      {
        localObject2 = finally;
        safeFinishTransaction(localSQLiteDatabase);
        throw localObject2;
      }
    }
    finally
    {
    }
  }

  private int removePostsFromGroupByPostId(int paramInt, long paramLong)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      String[] arrayOfString = new String[2];
      arrayOfString[0] = String.valueOf(paramInt);
      arrayOfString[1] = String.valueOf(paramLong);
      int i = localSQLiteDatabase.delete("post_groups", "post_type=? AND post_id=?", arrayOfString);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public int addFollow(long paramLong1, long paramLong2, long paramLong3, boolean paramBoolean)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramLong1);
      Cursor localCursor = localSQLiteDatabase.query("users", new String[] { "following_flag" }, "user_id=?", arrayOfString, null, null, null);
      int i;
      if ((localCursor != null) && (localCursor.getCount() > 0))
      {
        localCursor.moveToFirst();
        int j = Friendships.setFriendship(localCursor.getInt(0), 1);
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("following_flag", Integer.valueOf(j));
        i = localSQLiteDatabase.update("users", localContentValues, "user_id=?", arrayOfString);
        localCursor.close();
        VineUser localVineUser = new VineUser();
        localVineUser.userId = paramLong1;
        ArrayList localArrayList = new ArrayList(1);
        localArrayList.add(localVineUser);
        boolean bool = paramLong3 < 0L;
        HashMap localHashMap = null;
        if (bool)
        {
          localHashMap = new HashMap(1);
          localHashMap.put(Long.valueOf(paramLong1), Long.valueOf(paramLong3));
        }
        mergeUserGroups(localArrayList, 1, String.valueOf(paramLong2), null, localHashMap);
        if (paramBoolean)
          this.mContentResolver.notifyChange(Vine.UserGroupsView.CONTENT_URI_FOLLOWING, null);
        if (LOGGABLE)
          Log.d("VineDH", "Followed user " + paramLong1);
      }
      while (true)
      {
        return i;
        i = -1;
      }
    }
    finally
    {
    }
  }

  public int addLike(VineLike paramVineLike, boolean paramBoolean)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramVineLike.postId);
      try
      {
        localSQLiteDatabase.beginTransaction();
        Cursor localCursor = localSQLiteDatabase.query("posts", new String[] { "metadata_flags" }, "post_id=?", arrayOfString, null, null, null);
        int i = 0;
        if (localCursor != null)
        {
          int j = localCursor.getCount();
          i = 0;
          if (j > 0)
          {
            localCursor.moveToFirst();
            ContentValues localContentValues = new ContentValues();
            localContentValues.put("metadata_flags", Integer.valueOf(0x8 | localCursor.getInt(0)));
            localCursor.close();
            if (localSQLiteDatabase.update("posts", localContentValues, "post_id=?", arrayOfString) <= 0)
              break label250;
          }
        }
        label250: for (i = 1; ; i = 0)
        {
          if (LOGGABLE)
            Log.d("VineDH", "Updating like value in post: " + paramVineLike.postId);
          ArrayList localArrayList = new ArrayList(1);
          localArrayList.add(paramVineLike);
          int k = mergeLikes(localArrayList, paramVineLike.postId, 0, 0);
          localSQLiteDatabase.setTransactionSuccessful();
          safeFinishTransaction(localSQLiteDatabase);
          if ((paramBoolean) && ((i > 0) || (k > 0)))
            notifyPostCommentsViewUris();
          return i;
        }
      }
      finally
      {
        safeFinishTransaction(localSQLiteDatabase);
      }
    }
    finally
    {
    }
  }

  public void cleanTagSearchResults()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        int i = localSQLiteDatabase.delete("tag_search_results", null, null);
        if (LOGGABLE)
          Log.d("VineDH", "Deleted " + i + " tag search result rows.");
        localSQLiteDatabase.setTransactionSuccessful();
        safeFinishTransaction(localSQLiteDatabase);
        if (i > 0)
          this.mContentResolver.notifyChange(Vine.TagSearchResults.CONTENT_URI, null);
        return;
      }
      finally
      {
        safeFinishTransaction(localSQLiteDatabase);
      }
    }
    finally
    {
    }
  }

  public int cleanUp(long paramLong)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        String[] arrayOfString1 = new String[1];
        arrayOfString1[0] = String.valueOf(paramLong);
        localSQLiteDatabase.execSQL("DELETE FROM post_groups WHERE post_id IN (SELECT post_id FROM posts WHERE last_refresh < ?);", arrayOfString1);
        String[] arrayOfString2 = new String[1];
        arrayOfString2[0] = String.valueOf(paramLong);
        int i = localSQLiteDatabase.delete("posts", "last_refresh<?", arrayOfString2);
        localSQLiteDatabase.setTransactionSuccessful();
        if (LOGGABLE)
          Log.d("VineDH", "Cleanup performed, deleted " + i + " posts with last_refresh less " + "than anchor: " + paramLong);
        safeFinishTransaction(localSQLiteDatabase);
        if (i > 0)
          notifyPostCommentsViewUris();
        return i;
      }
      finally
      {
        localObject2 = finally;
        safeFinishTransaction(localSQLiteDatabase);
        throw localObject2;
      }
    }
    finally
    {
    }
  }

  public void cleanUserSearchResults()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(8);
        int i = localSQLiteDatabase.delete("user_groups", "type=?", arrayOfString);
        if (LOGGABLE)
          Log.d("VineDH", "Deleted " + i + " user search result rows.");
        localSQLiteDatabase.setTransactionSuccessful();
        safeFinishTransaction(localSQLiteDatabase);
        if (i > 0)
          this.mContentResolver.notifyChange(Vine.UserGroupsView.CONTENT_URI_USER_SEARCH_RESULTS, null);
        return;
      }
      finally
      {
        safeFinishTransaction(localSQLiteDatabase);
      }
    }
    finally
    {
    }
  }

  public void clearAllData()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      localSQLiteDatabase.delete("settings", null, null);
      localSQLiteDatabase.delete("user_groups", null, null);
      localSQLiteDatabase.delete("activity", null, null);
      localSQLiteDatabase.delete("posts", null, null);
      localSQLiteDatabase.delete("likes", null, null);
      localSQLiteDatabase.delete("post_groups", null, null);
      localSQLiteDatabase.delete("comments", null, null);
      localSQLiteDatabase.delete("page_cursors", null, null);
      localSQLiteDatabase.delete("tag_search_results", null, null);
      localSQLiteDatabase.delete("channels", null, null);
      localSQLiteDatabase.delete("notifications", null, null);
      localSQLiteDatabase.delete("tag_recently_used", null, null);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void clearCachedData()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        localSQLiteDatabase.delete("users", null, null);
        localSQLiteDatabase.delete("user_groups", null, null);
        localSQLiteDatabase.delete("activity", null, null);
        localSQLiteDatabase.delete("posts", null, null);
        localSQLiteDatabase.delete("likes", null, null);
        localSQLiteDatabase.delete("post_groups", null, null);
        localSQLiteDatabase.delete("comments", null, null);
        localSQLiteDatabase.delete("page_cursors", null, null);
        localSQLiteDatabase.delete("tag_search_results", null, null);
        localSQLiteDatabase.delete("channels", null, null);
        localSQLiteDatabase.delete("notifications", null, null);
        localSQLiteDatabase.delete("tag_recently_used", null, null);
        localSQLiteDatabase.setTransactionSuccessful();
        safeFinishTransaction(localSQLiteDatabase);
        return;
      }
      finally
      {
        localObject2 = finally;
        safeFinishTransaction(localSQLiteDatabase);
        throw localObject2;
      }
    }
    finally
    {
    }
  }

  public void clearCachedData(boolean paramBoolean)
  {
    try
    {
      clearCachedData();
      if (paramBoolean)
        notifyPostCommentsViewUris();
      return;
    }
    finally
    {
    }
  }

  public void clearFileCache()
  {
    Util.removeCache(this.mAppContext);
    ImageUtils.removeFiles(this.mAppContext);
  }

  protected void createTables(SQLiteDatabase paramSQLiteDatabase)
  {
    paramSQLiteDatabase.execSQL("CREATE TABLE  users (_id INTEGER PRIMARY KEY,user_id INT UNIQUE NOT NULL,avatar_url TEXT,blocked INT,blocking INT,hide_profile_reposts INT,description TEXT,location TEXT,explicit INT,follower_count INT,following_count INT,following_flag INT,like_count INT,post_count INT,username TEXT,verified INT,follow_status INT,last_refresh INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  settings (_id INTEGER PRIMARY KEY,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  user_groups (_id INTEGER PRIMARY KEY,type INT,tag TEXT,user_id INT,is_last INT,g_flags INT,order_id INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  comments (_id INTEGER PRIMARY KEY,comment_id INT UNIQUE NOT NULL,post_id INT NOT NULL,avatar_url TEXT,comment TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,verified INT,entities BLOB,is_last INT,last_refresh INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  activity (_id INTEGER PRIMARY KEY,notification_id INT UNIQUE NOT NULL,notification_type INT,user_id INT,post_id INT,thumbnail_url TEXT,avatar_url TEXT,timestamp INT,comment TEXT,username TEXT,is_last INT,entities BLOB,last_refresh INT,follow_status INT,sort_id INT);");
    paramSQLiteDatabase.execSQL("CREATE VIEW  user_groups_view AS SELECT user_groups._id AS _id,user_groups.type AS type,user_groups.tag AS tag,user_groups.user_id AS user_id,user_groups.is_last AS is_last,user_groups.g_flags AS g_flags,user_groups.order_id AS order_id,user.username AS username,user.user_id AS user_id,user.avatar_url AS avatar_url,user.blocked AS blocked,user.blocking AS blocking,user.description AS description,user.location AS location,user.explicit AS explicit,user.follower_count AS follower_count,user.following_count AS following_count,user.following_flag AS following_flag,user.like_count AS like_count,user.post_count AS post_count,user.follow_status AS follow_status,user.verified AS verified FROM user_groups LEFT JOIN users AS user ON user_groups.user_id=user.user_id;");
    paramSQLiteDatabase.execSQL("CREATE TABLE  likes (_id INTEGER PRIMARY KEY,like_id INT UNIQUE NOT NULL,post_id INT NOT NULL,avatar_url TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,verified INT,last_refresh INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  posts (_id INTEGER PRIMARY KEY,post_id INT NOT NULL,my_repost_id INT,tags BLOB,thumbnail_url TEXT,share_url TEXT,video_low_uRL TEXT,video_url TEXT,description TEXT,foursquare_venue_id TEXT,metadata_flags INT,post_flags INT,avatar_url TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,venue_data BLOB,entities BLOB,likes_count INT,reviners_count INT,comments_count INT,last_refresh INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  post_groups (_id INTEGER PRIMARY KEY,post_type INT,tag TEXT,post_id INT,is_last INT,repost_data BLOB,reposter_id INT,sort_id INT,g_flags INT);");
    paramSQLiteDatabase.execSQL("CREATE VIEW  post_groups_view AS SELECT post_groups._id AS _id,post_groups.post_type AS post_type,post_groups.tag AS tag,post_groups.post_id AS post_id,post_groups.is_last AS is_last,post_groups.g_flags AS g_flags,post_groups.sort_id AS sort_id,post_groups.repost_data AS repost_data,post_groups.reposter_id AS reposter_id,posts.username AS username,posts.avatar_url AS avatar_url,posts.thumbnail_url AS thumbnail_url,posts.metadata_flags AS metadata_flags,posts.user_id AS user_id,posts.my_repost_id AS my_repost_id,posts.timestamp AS timestamp,posts.location AS location,posts.tags AS tags,posts.share_url AS share_url,posts.video_low_uRL AS video_low_uRL,posts.video_url AS video_url,posts.video_low_uRL AS video_low_uRL,posts.description AS description,posts.foursquare_venue_id AS foursquare_venue_id,posts.post_flags AS post_flags,posts.venue_data AS venue_data,posts.entities AS entities,posts.likes_count AS likes_count,posts.reviners_count AS reviners_count,posts.comments_count AS comments_count FROM post_groups LEFT JOIN posts AS posts ON post_groups.post_id=posts.post_id;");
    paramSQLiteDatabase.execSQL("CREATE VIEW  post_comments_likes_view AS  SELECT post_groups_view._id AS _id,post_groups_view.post_id AS post_id,post_groups_view.my_repost_id AS my_repost_id,post_groups_view.tags AS tags,post_groups_view.thumbnail_url AS thumbnail_url,post_groups_view.share_url AS share_url,post_groups_view.video_low_uRL AS video_low_uRL,post_groups_view.video_url AS video_url,post_groups_view.description AS description,post_groups_view.foursquare_venue_id AS foursquare_venue_id,post_groups_view.metadata_flags AS metadata_flags,post_groups_view.post_flags AS post_flags,post_groups_view.post_type AS post_type,post_groups_view.tag AS tag,post_groups_view.sort_id AS sort_id,post_groups_view.is_last AS is_last,post_groups_view.avatar_url AS avatar_url,post_groups_view.user_id AS user_id,post_groups_view.timestamp AS timestamp,post_groups_view.location AS location,post_groups_view.username AS username,post_groups_view.venue_data AS venue_data,post_groups_view.entities AS entities,post_groups_view.repost_data AS repost_data,post_groups_view.reposter_id AS reposter_id,post_groups_view.likes_count AS likes_count,post_groups_view.reviners_count AS reviners_count,post_groups_view.comments_count AS comments_count,likes.like_id AS like_id,likes.avatar_url AS like_user_avatar_url,likes.user_id AS like_user_user_id,likes.timestamp AS like_user_timestamp,likes.location AS like_user_location,likes.username AS like_user_username,likes.verified AS like_user_verified,null  AS comment_id,null  AS comment,null  AS comment_user_avatar_url,null  AS comment_user_user_id,null  AS comment_user_timestamp,null  AS comment_user_location,null  AS comment_user_username,null  AS comment_user_verified,null  AS comment_is_last,null  AS comment_entities FROM post_groups_view LEFT JOIN likes ON post_groups_view.post_id = likes.post_id UNION SELECT post_groups_view._id AS _id,post_groups_view.post_id AS post_id,post_groups_view.my_repost_id AS my_repost_id,post_groups_view.tags AS tags,post_groups_view.thumbnail_url AS thumbnail_url,post_groups_view.share_url AS share_url,post_groups_view.video_low_uRL AS video_low_uRL,post_groups_view.video_url AS video_url,post_groups_view.description AS description,post_groups_view.foursquare_venue_id AS foursquare_venue_id,post_groups_view.metadata_flags AS metadata_flags,post_groups_view.post_flags AS post_flags,post_groups_view.post_type AS post_type,post_groups_view.tag AS tag,post_groups_view.sort_id AS sort_id,post_groups_view.is_last AS is_last,post_groups_view.avatar_url AS avatar_url,post_groups_view.user_id AS user_id,post_groups_view.timestamp AS timestamp,post_groups_view.location AS location,post_groups_view.username AS username,post_groups_view.venue_data AS venue_data,post_groups_view.entities AS entities,post_groups_view.repost_data AS repost_data,post_groups_view.reposter_id AS reposter_id,post_groups_view.likes_count AS likes_count,post_groups_view.reviners_count AS reviners_count,post_groups_view.comments_count AS comments_count,null  AS like_id,null  AS like_user_avatar_url,null  AS like_user_user_id,null  AS like_user_timestamp,null  AS like_user_location,null  AS like_user_username,null  AS like_user_verified,comments.comment_id AS comment_id,comments.comment AS comment,comments.avatar_url AS comment_user_avatar_url,comments.user_id AS comment_user_user_id,comments.timestamp AS comment_user_timestamp,comments.location AS comment_user_location,comments.username AS comment_user_username,comments.verified AS comment_user_verified,comments.is_last AS comment_is_last,comments.entities AS comment_entities FROM post_groups_view LEFT JOIN comments ON post_groups_view.post_id = comments.post_id ");
    paramSQLiteDatabase.execSQL("CREATE TABLE  page_cursors (_id INTEGER PRIMARY KEY,type INT,tag TEXT,kind INT,next_page INT,previous_page INT,anchor TEXT,reversed INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  tag_search_results (_id INTEGER PRIMARY KEY,tag_id INT UNIQUE NOT NULL,tag_name TEXT NOT NULL,last_used_timestamp TEXT,is_last INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  channels (_id INTEGER PRIMARY KEY,channel_id INT UNIQUE NOT NULL,channel TEXT NOT NULL,timestamp INT,retinaIconUrl TEXT,background_color TEXT,font_color TEXT,last_used_timestamp INT,is_last INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  notifications (_id INTEGER PRIMARY KEY,notification_id INT UNIQUE NOT NULL,notification_type INT,message TEXT,cleared INT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  tag_recently_used (_id INTEGER PRIMARY KEY,tag_id INT UNIQUE NOT NULL,tag_name TEXT NOT NULL,last_used_timestamp TEXT);");
    paramSQLiteDatabase.execSQL("CREATE TABLE  editions (_id INTEGER PRIMARY KEY,edition_code TEXT,edition_name TEXT);");
  }

  public int deleteComment(String paramString)
  {
    try
    {
      int i = getWritableDatabase().delete("comments", "comment_id=?", new String[] { paramString });
      if (i > 0)
      {
        this.mContentResolver.notifyChange(Vine.Comments.CONTENT_URI, null);
        notifyPostCommentsViewUris();
      }
      if (LOGGABLE)
      {
        if (i <= 0)
          break label83;
        Log.d("VineDH", "Deleting comment: " + paramString);
      }
      while (true)
      {
        return i;
        label83: Log.e("VineDH", "Couldn't delete comment: " + paramString);
      }
    }
    finally
    {
    }
  }

  public int deletePost(long paramLong)
  {
    while (true)
    {
      int i;
      int j;
      try
      {
        SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
        try
        {
          localSQLiteDatabase.beginTransaction();
          String[] arrayOfString1 = new String[1];
          arrayOfString1[0] = String.valueOf(paramLong);
          i = localSQLiteDatabase.delete("posts", "post_id=?", arrayOfString1);
          j = 0;
          if (i > 0)
          {
            String[] arrayOfString2 = new String[1];
            arrayOfString2[0] = String.valueOf(paramLong);
            j = localSQLiteDatabase.delete("post_groups", "post_id=?", arrayOfString2);
            break label184;
            notifyPostCommentsViewUris();
            if (LOGGABLE)
            {
              if (j > 0)
                Log.d("VineDH", "Removing the post: " + paramLong);
            }
            else
            {
              localSQLiteDatabase.setTransactionSuccessful();
              safeFinishTransaction(localSQLiteDatabase);
              return i;
            }
            Log.e("VineDH", "Couldn't delete post: " + paramLong);
            continue;
          }
        }
        finally
        {
          safeFinishTransaction(localSQLiteDatabase);
        }
      }
      finally
      {
      }
      label184: if (i <= 0)
        if (j <= 0);
    }
  }

  public void expireTimeline(int paramInt)
  {
    try
    {
      removePostsFromGroup(paramInt);
      notifyPostCommentsViewUris();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public int getNextPageCursor(int paramInt1, int paramInt2, String paramString, boolean paramBoolean)
  {
    while (true)
    {
      try
      {
        SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
        String str;
        if (paramBoolean)
        {
          str = "previous_page";
          break label147;
          String[] arrayOfString1 = { str };
          String[] arrayOfString2 = new String[3];
          arrayOfString2[0] = String.valueOf(paramInt1);
          arrayOfString2[1] = String.valueOf(paramInt2);
          arrayOfString2[2] = String.valueOf(paramString);
          Cursor localCursor = localSQLiteDatabase.query("page_cursors", arrayOfString1, "kind=? AND type=? AND tag=?", arrayOfString2, null, null, null);
          if ((localCursor != null) && (localCursor.getCount() > 0) && (localCursor.moveToFirst()))
          {
            int j = localCursor.getInt(0);
            i = j;
            return i;
          }
        }
        else
        {
          str = "next_page";
          break label147;
        }
        int i = -1;
        continue;
      }
      finally
      {
      }
      label147: if (paramString == null)
        paramString = "";
    }
  }

  public Cursor getOldestSortId(int paramInt)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
      String[] arrayOfString1 = { "sort_id" };
      String[] arrayOfString2 = new String[1];
      arrayOfString2[0] = String.valueOf(paramInt);
      Cursor localCursor = localSQLiteDatabase.query("post_groups", arrayOfString1, "post_type=?", arrayOfString2, null, null, "CAST (sort_id AS INTEGER) DESC", "1");
      return localCursor;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public long getPageAnchor(int paramInt1, int paramInt2, String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
      String[] arrayOfString1 = { "anchor" };
      String[] arrayOfString2 = new String[3];
      arrayOfString2[0] = String.valueOf(paramInt1);
      arrayOfString2[1] = String.valueOf(paramInt2);
      arrayOfString2[2] = String.valueOf(paramString);
      Cursor localCursor = localSQLiteDatabase.query("page_cursors", arrayOfString1, "kind=? AND type=? AND tag=?", arrayOfString2, null, null, null);
      long l2;
      if ((localCursor != null) && (localCursor.getCount() > 0) && (localCursor.moveToFirst()))
        l2 = localCursor.getLong(0);
      for (long l1 = l2; ; l1 = -1L)
        return l1;
    }
    finally
    {
    }
  }

  public int getPreviousPageCursor(int paramInt1, int paramInt2, String paramString, boolean paramBoolean)
  {
    while (true)
    {
      try
      {
        SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
        String str;
        if (paramBoolean)
        {
          str = "next_page";
          break label155;
          String[] arrayOfString1 = { str };
          String[] arrayOfString2 = new String[3];
          arrayOfString2[0] = String.valueOf(paramInt1);
          arrayOfString2[1] = String.valueOf(paramInt2);
          arrayOfString2[2] = String.valueOf(paramString);
          Cursor localCursor = localSQLiteDatabase.query("page_cursors", arrayOfString1, "kind=? AND type=? AND tag=?", arrayOfString2, null, null, null);
          if ((localCursor != null) && (localCursor.getCount() > 0) && (localCursor.moveToFirst()))
          {
            int j = localCursor.getInt(localCursor.getColumnIndex(str));
            i = j;
            return i;
          }
        }
        else
        {
          str = "previous_page";
          break label155;
        }
        int i = -1;
        continue;
      }
      finally
      {
      }
      label155: if (paramString == null)
        paramString = "";
    }
  }

  public int getUnclearedNotificationCount()
  {
    int i = -1;
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(0);
      Cursor localCursor = this.mContentResolver.query(Vine.Notifications.CONTENT_URI, VineDatabaseSQL.NotificationsQuery.PROJECTION, "cleared=?", arrayOfString, null);
      if (localCursor != null)
      {
        i = localCursor.getCount();
        localCursor.close();
      }
      return i;
    }
    finally
    {
    }
  }

  public ArrayList<GCMNotificationService.Notification> getUnclearedNotifications()
  {
    try
    {
      ArrayList localArrayList = new ArrayList();
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(0);
      Cursor localCursor = this.mContentResolver.query(Vine.Notifications.CONTENT_URI_UNCLEARED, VineDatabaseSQL.NotificationsQuery.PROJECTION, "cleared=?", arrayOfString, "notification_id DESC");
      if (localCursor != null)
      {
        if (localCursor.moveToFirst())
          do
            localArrayList.add(new GCMNotificationService.Notification(localCursor));
          while (localCursor.moveToNext());
        localCursor.close();
      }
      return localArrayList;
    }
    finally
    {
    }
  }

  public void markChannelLastUsedTimestamp(long paramLong)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      ContentValues localContentValues = new ContentValues();
      localContentValues.put("last_used_timestamp", Long.valueOf(System.currentTimeMillis()));
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramLong);
      localSQLiteDatabase.update("channels", localContentValues, "channel_id=?", arrayOfString);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void markLastActivity()
  {
    try
    {
      long l = getLastActivityRowId();
      if (l == 0L);
      while (true)
      {
        return;
        SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
        if (LOGGABLE)
          Log.d("VineDH", "Tagging the oldest activity with row: " + l);
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("is_last", Integer.valueOf(0));
        localSQLiteDatabase.update("activity", localContentValues, "is_last=1", null);
        localContentValues.put("is_last", Integer.valueOf(1));
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(l);
        localSQLiteDatabase.update("activity", localContentValues, "_id=?", arrayOfString);
      }
    }
    finally
    {
    }
  }

  public void markLastChannel()
  {
    try
    {
      long l = getLastChannelRowId();
      if (l == 0L);
      while (true)
      {
        return;
        if (LOGGABLE)
          Log.d("VineDH", "Tagging the oldest channel with row id: " + l);
        SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("is_last", Integer.valueOf(0));
        localSQLiteDatabase.update("channels", localContentValues, "is_last=1", null);
        localContentValues.put("is_last", Integer.valueOf(1));
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(l);
        localSQLiteDatabase.update("channels", localContentValues, "_id=?", arrayOfString);
        this.mContentResolver.notifyChange(Vine.Channels.CONTENT_URI, null);
      }
    }
    finally
    {
    }
  }

  public void markLastComment(long paramLong)
  {
    try
    {
      long l = getLastCommentRowId(paramLong);
      if (l == 0L);
      while (true)
      {
        return;
        SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("is_last", Integer.valueOf(0));
        String[] arrayOfString1 = new String[1];
        arrayOfString1[0] = String.valueOf(paramLong);
        localSQLiteDatabase.update("comments", localContentValues, "is_last=1 AND post_id=?", arrayOfString1);
        localContentValues.put("is_last", Integer.valueOf(1));
        String[] arrayOfString2 = new String[1];
        arrayOfString2[0] = String.valueOf(l);
        localSQLiteDatabase.update("comments", localContentValues, "_id=?", arrayOfString2);
      }
    }
    finally
    {
    }
  }

  public void markLastPost(int paramInt, String paramString)
  {
    try
    {
      long l = getLastPostRowId(paramInt, paramString);
      if (l == 0L);
      while (true)
      {
        return;
        SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
        if (LOGGABLE)
          Log.d("VineDH", "Tagging the oldest post of type: " + paramInt + " and tag: " + paramString + " row id: " + l);
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("is_last", Integer.valueOf(0));
        localSQLiteDatabase.update("post_groups", localContentValues, "is_last=1", null);
        localContentValues.put("is_last", Integer.valueOf(1));
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(l);
        localSQLiteDatabase.update("post_groups", localContentValues, "_id=?", arrayOfString);
        notifyPostCommentsViewUris();
      }
    }
    finally
    {
    }
  }

  public void markLastTag()
  {
    try
    {
      long l = getLastTagRowId();
      if (l == 0L);
      while (true)
      {
        return;
        if (LOGGABLE)
          Log.d("VineDH", "Tagging the oldest tag with row id: " + l);
        SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("is_last", Integer.valueOf(0));
        localSQLiteDatabase.update("tag_search_results", localContentValues, "is_last=1", null);
        localContentValues.put("is_last", Integer.valueOf(1));
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(l);
        localSQLiteDatabase.update("tag_search_results", localContentValues, "_id=?", arrayOfString);
        this.mContentResolver.notifyChange(Vine.TagSearchResults.CONTENT_URI, null);
      }
    }
    finally
    {
    }
  }

  public void markLastUser(int paramInt, String paramString)
  {
    try
    {
      markLastUser(paramInt, paramString, "order_id DESC");
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void markLastUser(int paramInt, String paramString1, String paramString2)
  {
    try
    {
      long l = getLastUserRowId(paramInt, paramString1, paramString2);
      if (l == 0L);
      while (true)
      {
        return;
        if (LOGGABLE)
          Log.d("VineDH", "Tagging the oldest user of type: " + paramInt + " row id: " + l);
        SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("is_last", Integer.valueOf(0));
        localSQLiteDatabase.update("user_groups", localContentValues, "is_last=1", null);
        localContentValues.put("is_last", Integer.valueOf(1));
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(l);
        localSQLiteDatabase.update("user_groups", localContentValues, "_id=?", arrayOfString);
        this.mContentResolver.notifyChange(Vine.UserGroupsView.CONTENT_URI, null);
      }
    }
    finally
    {
    }
  }

  public int markNotificationsCleared()
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        String[] arrayOfString = new String[1];
        arrayOfString[0] = String.valueOf(0);
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("cleared", Integer.valueOf(1));
        int i = 0 + localSQLiteDatabase.update("notifications", localContentValues, "cleared=?", arrayOfString);
        localSQLiteDatabase.setTransactionSuccessful();
        safeFinishTransaction(localSQLiteDatabase);
        return i;
      }
      finally
      {
        localObject2 = finally;
        safeFinishTransaction(localSQLiteDatabase);
        throw localObject2;
      }
    }
    finally
    {
    }
  }

  // ERROR //
  public int mergeActivity(Collection<VineNotification> paramCollection, int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 622	co/vine/android/provider/VineDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   6: astore 5
    //   8: new 59	java/util/HashMap
    //   11: dup
    //   12: aload_1
    //   13: invokeinterface 594 1 0
    //   18: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   21: astore 6
    //   23: new 59	java/util/HashMap
    //   26: dup
    //   27: aload_1
    //   28: invokeinterface 594 1 0
    //   33: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   36: astore 7
    //   38: aload_1
    //   39: invokeinterface 609 1 0
    //   44: astore 8
    //   46: aload 8
    //   48: invokeinterface 614 1 0
    //   53: ifeq +41 -> 94
    //   56: aload 8
    //   58: invokeinterface 618 1 0
    //   63: checkcast 130	co/vine/android/api/VineNotification
    //   66: astore 45
    //   68: aload 6
    //   70: aload 45
    //   72: getfield 134	co/vine/android/api/VineNotification:notificationId	J
    //   75: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   78: aload 45
    //   80: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   83: pop
    //   84: goto -38 -> 46
    //   87: astore 4
    //   89: aload_0
    //   90: monitorexit
    //   91: aload 4
    //   93: athrow
    //   94: aload 5
    //   96: ldc_w 502
    //   99: iconst_1
    //   100: anewarray 543	java/lang/String
    //   103: dup
    //   104: iconst_0
    //   105: ldc 128
    //   107: aastore
    //   108: aconst_null
    //   109: aconst_null
    //   110: aconst_null
    //   111: aconst_null
    //   112: aconst_null
    //   113: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   116: astore 9
    //   118: aload 9
    //   120: ifnull +73 -> 193
    //   123: aload 9
    //   125: invokeinterface 521 1 0
    //   130: ifeq +63 -> 193
    //   133: aload 9
    //   135: iconst_0
    //   136: invokeinterface 525 2 0
    //   141: lstore 10
    //   143: aload 6
    //   145: lload 10
    //   147: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   150: invokevirtual 1035	java/util/HashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   153: checkcast 130	co/vine/android/api/VineNotification
    //   156: astore 12
    //   158: aload 12
    //   160: ifnull +16 -> 176
    //   163: aload 7
    //   165: lload 10
    //   167: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   170: aload 12
    //   172: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   175: pop
    //   176: aload 9
    //   178: invokeinterface 638 1 0
    //   183: ifne -50 -> 133
    //   186: aload 9
    //   188: invokeinterface 528 1 0
    //   193: invokestatic 411	java/lang/System:currentTimeMillis	()J
    //   196: lstore 14
    //   198: aload 6
    //   200: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   203: istore 16
    //   205: iconst_0
    //   206: istore 17
    //   208: iload 16
    //   210: ifne +100 -> 310
    //   213: aload 5
    //   215: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   218: new 142	android/content/ContentValues
    //   221: dup
    //   222: invokespecial 643	android/content/ContentValues:<init>	()V
    //   225: astore 18
    //   227: aload 6
    //   229: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   232: invokeinterface 609 1 0
    //   237: astore 20
    //   239: aload 20
    //   241: invokeinterface 614 1 0
    //   246: ifeq +53 -> 299
    //   249: aload 20
    //   251: invokeinterface 618 1 0
    //   256: checkcast 130	co/vine/android/api/VineNotification
    //   259: astore 43
    //   261: aload 18
    //   263: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   266: aload_0
    //   267: aload 18
    //   269: aload 43
    //   271: lload 14
    //   273: invokespecial 1044	co/vine/android/provider/VineDatabaseHelper:fillActivityValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineNotification;J)V
    //   276: aload 5
    //   278: ldc_w 502
    //   281: ldc 128
    //   283: aload 18
    //   285: invokevirtual 671	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   288: lconst_0
    //   289: lcmp
    //   290: ifle +562 -> 852
    //   293: iconst_1
    //   294: istore 44
    //   296: goto +546 -> 842
    //   299: aload 5
    //   301: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   304: aload_0
    //   305: aload 5
    //   307: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   310: aload 7
    //   312: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   315: istore 21
    //   317: iconst_0
    //   318: istore 22
    //   320: iload 21
    //   322: ifne +147 -> 469
    //   325: aload 5
    //   327: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   330: new 142	android/content/ContentValues
    //   333: dup
    //   334: invokespecial 643	android/content/ContentValues:<init>	()V
    //   337: astore 23
    //   339: aload 7
    //   341: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   344: invokeinterface 609 1 0
    //   349: astore 25
    //   351: aload 25
    //   353: invokeinterface 614 1 0
    //   358: ifeq +100 -> 458
    //   361: aload 25
    //   363: invokeinterface 618 1 0
    //   368: checkcast 130	co/vine/android/api/VineNotification
    //   371: astore 39
    //   373: aload 23
    //   375: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   378: aload_0
    //   379: aload 23
    //   381: aload 39
    //   383: lload 14
    //   385: invokespecial 1044	co/vine/android/provider/VineDatabaseHelper:fillActivityValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineNotification;J)V
    //   388: iconst_1
    //   389: anewarray 543	java/lang/String
    //   392: astore 40
    //   394: aload 40
    //   396: iconst_0
    //   397: aload 39
    //   399: getfield 134	co/vine/android/api/VineNotification:notificationId	J
    //   402: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   405: aastore
    //   406: aload 5
    //   408: ldc_w 502
    //   411: aload 23
    //   413: ldc_w 1046
    //   416: aload 40
    //   418: invokevirtual 788	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   421: istore 41
    //   423: iload 41
    //   425: ifle +27 -> 452
    //   428: iconst_1
    //   429: istore 42
    //   431: iload 22
    //   433: iload 42
    //   435: iadd
    //   436: istore 22
    //   438: goto -87 -> 351
    //   441: astore 19
    //   443: aload_0
    //   444: aload 5
    //   446: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   449: aload 19
    //   451: athrow
    //   452: iconst_0
    //   453: istore 42
    //   455: goto -24 -> 431
    //   458: aload 5
    //   460: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   463: aload_0
    //   464: aload 5
    //   466: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   469: iconst_0
    //   470: istore 26
    //   472: iload 17
    //   474: ifle +240 -> 714
    //   477: aload 5
    //   479: ldc_w 502
    //   482: getstatic 1049	co/vine/android/provider/VineDatabaseSQL$TableQuery:PROJECTION	[Ljava/lang/String;
    //   485: aconst_null
    //   486: aconst_null
    //   487: aconst_null
    //   488: aconst_null
    //   489: aconst_null
    //   490: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   493: astore 27
    //   495: iconst_0
    //   496: istore 26
    //   498: aload 27
    //   500: ifnull +214 -> 714
    //   503: aload 27
    //   505: invokeinterface 521 1 0
    //   510: istore 28
    //   512: iconst_0
    //   513: istore 26
    //   515: iload 28
    //   517: ifeq +197 -> 714
    //   520: aload 27
    //   522: invokeinterface 775 1 0
    //   527: istore 29
    //   529: iconst_0
    //   530: istore 26
    //   532: iload 29
    //   534: sipush 500
    //   537: if_icmple +170 -> 707
    //   540: aload 5
    //   542: ldc_w 1051
    //   545: aconst_null
    //   546: invokevirtual 1055	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   549: astore 33
    //   551: aload 5
    //   553: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   556: iconst_0
    //   557: istore 26
    //   559: aload 33
    //   561: ifnull +135 -> 696
    //   564: aload 33
    //   566: invokeinterface 521 1 0
    //   571: istore 34
    //   573: iconst_0
    //   574: istore 26
    //   576: iload 34
    //   578: ifeq +118 -> 696
    //   581: aload 33
    //   583: iconst_0
    //   584: invokeinterface 525 2 0
    //   589: lstore 35
    //   591: iconst_1
    //   592: anewarray 543	java/lang/String
    //   595: astore 37
    //   597: aload 37
    //   599: iconst_0
    //   600: lload 35
    //   602: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   605: aastore
    //   606: aload 5
    //   608: ldc_w 502
    //   611: ldc_w 837
    //   614: aload 37
    //   616: invokevirtual 756	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   619: istore 26
    //   621: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   624: ifeq +65 -> 689
    //   627: ldc_w 1057
    //   630: new 476	java/lang/StringBuilder
    //   633: dup
    //   634: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   637: ldc_w 1059
    //   640: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   643: iload 29
    //   645: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   648: ldc_w 1061
    //   651: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   654: sipush 500
    //   657: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   660: ldc_w 1063
    //   663: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   666: iload 26
    //   668: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   671: ldc_w 1065
    //   674: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   677: lload 35
    //   679: invokevirtual 808	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   682: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   685: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   688: pop
    //   689: aload 33
    //   691: invokeinterface 528 1 0
    //   696: aload 5
    //   698: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   701: aload_0
    //   702: aload 5
    //   704: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   707: aload 27
    //   709: invokeinterface 528 1 0
    //   714: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   717: ifeq +141 -> 858
    //   720: ldc 34
    //   722: new 476	java/lang/StringBuilder
    //   725: dup
    //   726: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   729: ldc_w 1067
    //   732: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   735: iload 17
    //   737: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   740: ldc_w 1069
    //   743: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   746: iload 22
    //   748: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   751: ldc_w 1071
    //   754: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   757: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   760: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   763: pop
    //   764: goto +94 -> 858
    //   767: aload_0
    //   768: iconst_3
    //   769: iconst_0
    //   770: aconst_null
    //   771: iload_2
    //   772: iload_3
    //   773: lconst_0
    //   774: iconst_1
    //   775: invokevirtual 1075	co/vine/android/provider/VineDatabaseHelper:savePageCursor	(IILjava/lang/String;IIJZ)I
    //   778: pop
    //   779: goto +90 -> 869
    //   782: aload_0
    //   783: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   786: getstatic 1078	co/vine/android/provider/Vine$Activity:CONTENT_URI	Landroid/net/Uri;
    //   789: aconst_null
    //   790: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   793: aload_0
    //   794: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   797: getstatic 1081	co/vine/android/provider/Vine$Activity:CONTENT_URI_WITH_FOLLOW_REQUESTS	Landroid/net/Uri;
    //   800: aconst_null
    //   801: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   804: aload_0
    //   805: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   808: getstatic 1084	co/vine/android/provider/Vine$Activity:CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL	Landroid/net/Uri;
    //   811: aconst_null
    //   812: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   815: aload_0
    //   816: monitorexit
    //   817: iload 17
    //   819: ireturn
    //   820: astore 24
    //   822: aload_0
    //   823: aload 5
    //   825: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   828: aload 24
    //   830: athrow
    //   831: astore 32
    //   833: aload_0
    //   834: aload 5
    //   836: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   839: aload 32
    //   841: athrow
    //   842: iload 17
    //   844: iload 44
    //   846: iadd
    //   847: istore 17
    //   849: goto -610 -> 239
    //   852: iconst_0
    //   853: istore 44
    //   855: goto -13 -> 842
    //   858: iload_2
    //   859: ifgt -92 -> 767
    //   862: iload_3
    //   863: ifle +6 -> 869
    //   866: goto -99 -> 767
    //   869: iload 17
    //   871: ifgt -89 -> 782
    //   874: iload 22
    //   876: ifgt -94 -> 782
    //   879: iload 26
    //   881: ifle -66 -> 815
    //   884: goto -102 -> 782
    //
    // Exception table:
    //   from	to	target	type
    //   2	46	87	finally
    //   46	84	87	finally
    //   94	118	87	finally
    //   123	133	87	finally
    //   133	158	87	finally
    //   163	176	87	finally
    //   176	193	87	finally
    //   193	205	87	finally
    //   213	218	87	finally
    //   304	310	87	finally
    //   310	317	87	finally
    //   325	330	87	finally
    //   443	452	87	finally
    //   463	469	87	finally
    //   477	495	87	finally
    //   503	512	87	finally
    //   520	529	87	finally
    //   701	707	87	finally
    //   707	714	87	finally
    //   714	764	87	finally
    //   767	779	87	finally
    //   782	815	87	finally
    //   822	831	87	finally
    //   833	842	87	finally
    //   218	239	441	finally
    //   239	293	441	finally
    //   299	304	441	finally
    //   330	351	820	finally
    //   351	423	820	finally
    //   458	463	820	finally
    //   540	556	831	finally
    //   564	573	831	finally
    //   581	689	831	finally
    //   689	696	831	finally
    //   696	701	831	finally
  }

  public int mergeChannels(Collection<VineChannel> paramCollection, int paramInt1, int paramInt2)
  {
    while (true)
    {
      int i;
      int j;
      try
      {
        SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
        boolean bool = paramCollection.isEmpty();
        i = 0;
        if (bool)
          break label234;
        localSQLiteDatabase.beginTransaction();
        try
        {
          localSQLiteDatabase.delete("channels", null, null);
          ContentValues localContentValues = new ContentValues();
          Iterator localIterator = paramCollection.iterator();
          if (localIterator.hasNext())
          {
            VineChannel localVineChannel = (VineChannel)localIterator.next();
            localContentValues.clear();
            fillChannelValues(localContentValues, localVineChannel);
            if (localSQLiteDatabase.insert("channels", null, localContentValues) <= 0L)
              break label228;
            j = 1;
          }
          else
          {
            localSQLiteDatabase.setTransactionSuccessful();
            safeFinishTransaction(localSQLiteDatabase);
            break label234;
            savePageCursor(2, 0, null, paramInt1, paramInt2, 0L, true);
            if (i > 0)
            {
              if (LOGGABLE)
                Log.d("VineDH", "Inserted " + i + " new channels.");
              this.mContentResolver.notifyChange(Vine.Channels.CONTENT_URI, null);
            }
            return i;
          }
        }
        finally
        {
          safeFinishTransaction(localSQLiteDatabase);
        }
      }
      finally
      {
      }
      while (true)
      {
        i += j;
        break;
        label228: j = 0;
      }
      label234: if (paramInt1 <= 0)
        if (paramInt2 <= 0);
    }
  }

  // ERROR //
  public DbResponse mergeComments(Collection<VineComment> paramCollection, long paramLong1, int paramInt1, int paramInt2, long paramLong2, boolean paramBoolean1, boolean paramBoolean2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 622	co/vine/android/provider/VineDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   6: astore 11
    //   8: new 59	java/util/HashMap
    //   11: dup
    //   12: aload_1
    //   13: invokeinterface 594 1 0
    //   18: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   21: astore 12
    //   23: new 59	java/util/HashMap
    //   26: dup
    //   27: aload_1
    //   28: invokeinterface 594 1 0
    //   33: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   36: astore 13
    //   38: ldc2_w 1095
    //   41: lstore 14
    //   43: aload_1
    //   44: invokeinterface 609 1 0
    //   49: astore 16
    //   51: aload 16
    //   53: invokeinterface 614 1 0
    //   58: ifeq +65 -> 123
    //   61: aload 16
    //   63: invokeinterface 618 1 0
    //   68: checkcast 254	co/vine/android/api/VineComment
    //   71: astore 76
    //   73: aload 76
    //   75: lload_2
    //   76: putfield 259	co/vine/android/api/VineComment:postId	J
    //   79: aload 76
    //   81: getfield 257	co/vine/android/api/VineComment:commentId	J
    //   84: lload 14
    //   86: lcmp
    //   87: ifge +10 -> 97
    //   90: aload 76
    //   92: getfield 257	co/vine/android/api/VineComment:commentId	J
    //   95: lstore 14
    //   97: aload 12
    //   99: aload 76
    //   101: getfield 257	co/vine/android/api/VineComment:commentId	J
    //   104: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   107: aload 76
    //   109: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   112: pop
    //   113: goto -62 -> 51
    //   116: astore 10
    //   118: aload_0
    //   119: monitorexit
    //   120: aload 10
    //   122: athrow
    //   123: iload 4
    //   125: ifgt +15 -> 140
    //   128: iload 5
    //   130: ifgt +10 -> 140
    //   133: lload 6
    //   135: lconst_0
    //   136: lcmp
    //   137: ifle +21 -> 158
    //   140: aload_0
    //   141: iconst_5
    //   142: iconst_0
    //   143: lload_2
    //   144: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   147: iload 4
    //   149: iload 5
    //   151: lload 6
    //   153: iconst_0
    //   154: invokevirtual 1075	co/vine/android/provider/VineDatabaseHelper:savePageCursor	(IILjava/lang/String;IIJZ)I
    //   157: pop
    //   158: iconst_1
    //   159: istore 18
    //   161: iconst_1
    //   162: anewarray 543	java/lang/String
    //   165: astore 19
    //   167: aload 19
    //   169: iconst_0
    //   170: lload_2
    //   171: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   174: aastore
    //   175: aload 11
    //   177: ldc_w 548
    //   180: getstatic 541	co/vine/android/provider/VineDatabaseSQL$CommentsQuery:PROJECTION	[Ljava/lang/String;
    //   183: ldc_w 550
    //   186: aload 19
    //   188: aconst_null
    //   189: aconst_null
    //   190: ldc_w 1098
    //   193: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   196: astore 20
    //   198: aload 20
    //   200: ifnull +166 -> 366
    //   203: aload 20
    //   205: invokeinterface 521 1 0
    //   210: ifeq +156 -> 366
    //   213: lload 14
    //   215: aload 20
    //   217: iconst_1
    //   218: invokeinterface 525 2 0
    //   223: lcmp
    //   224: ifgt +1074 -> 1298
    //   227: iconst_1
    //   228: istore 18
    //   230: aload 20
    //   232: iconst_m1
    //   233: invokeinterface 1102 2 0
    //   238: pop
    //   239: aload 20
    //   241: invokeinterface 638 1 0
    //   246: ifeq +113 -> 359
    //   249: aload 20
    //   251: iconst_1
    //   252: invokeinterface 525 2 0
    //   257: lstore 68
    //   259: aload 12
    //   261: lload 68
    //   263: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   266: invokevirtual 1035	java/util/HashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   269: checkcast 254	co/vine/android/api/VineComment
    //   272: astore 70
    //   274: aload 70
    //   276: ifnull -37 -> 239
    //   279: aload 20
    //   281: iconst_3
    //   282: invokeinterface 1105 2 0
    //   287: astore 75
    //   289: aload 75
    //   291: astore 72
    //   293: aload 72
    //   295: ifnonnull +44 -> 339
    //   298: aload 70
    //   300: getfield 260	co/vine/android/api/VineComment:avatarUrl	Ljava/lang/String;
    //   303: ifnull -64 -> 239
    //   306: aload 13
    //   308: lload 68
    //   310: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   313: aload 70
    //   315: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   318: pop
    //   319: goto -80 -> 239
    //   322: astore 71
    //   324: aload 70
    //   326: getfield 260	co/vine/android/api/VineComment:avatarUrl	Ljava/lang/String;
    //   329: astore 72
    //   331: aload 71
    //   333: invokestatic 1111	co/vine/android/util/CrashUtil:logException	(Ljava/lang/Throwable;)V
    //   336: goto -43 -> 293
    //   339: aload 70
    //   341: getfield 260	co/vine/android/api/VineComment:avatarUrl	Ljava/lang/String;
    //   344: astore 73
    //   346: aload 72
    //   348: aload 73
    //   350: invokevirtual 1114	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   353: ifne -114 -> 239
    //   356: goto -50 -> 306
    //   359: aload 20
    //   361: invokeinterface 528 1 0
    //   366: aload 12
    //   368: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   371: ifeq +28 -> 399
    //   374: aload 13
    //   376: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   379: ifeq +20 -> 399
    //   382: new 1116	co/vine/android/provider/DbResponse
    //   385: dup
    //   386: iconst_0
    //   387: iconst_0
    //   388: iconst_2
    //   389: invokespecial 1119	co/vine/android/provider/DbResponse:<init>	(III)V
    //   392: astore 43
    //   394: aload_0
    //   395: monitorexit
    //   396: aload 43
    //   398: areturn
    //   399: aload 12
    //   401: invokevirtual 1120	java/util/HashMap:size	()I
    //   404: aload 13
    //   406: invokevirtual 1120	java/util/HashMap:size	()I
    //   409: iadd
    //   410: istore 21
    //   412: new 791	java/util/ArrayList
    //   415: dup
    //   416: iload 21
    //   418: invokespecial 793	java/util/ArrayList:<init>	(I)V
    //   421: astore 22
    //   423: new 59	java/util/HashMap
    //   426: dup
    //   427: iload 21
    //   429: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   432: astore 23
    //   434: aload 12
    //   436: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   439: invokeinterface 609 1 0
    //   444: astore 24
    //   446: aload 24
    //   448: invokeinterface 614 1 0
    //   453: ifeq +64 -> 517
    //   456: aload 24
    //   458: invokeinterface 618 1 0
    //   463: checkcast 254	co/vine/android/api/VineComment
    //   466: astore 64
    //   468: aload 64
    //   470: getfield 1124	co/vine/android/api/VineComment:user	Lco/vine/android/api/VineUser;
    //   473: ifnull -27 -> 446
    //   476: aload 22
    //   478: aload 64
    //   480: getfield 1124	co/vine/android/api/VineComment:user	Lco/vine/android/api/VineUser;
    //   483: invokevirtual 797	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   486: pop
    //   487: aload 23
    //   489: aload 64
    //   491: getfield 1124	co/vine/android/api/VineComment:user	Lco/vine/android/api/VineUser;
    //   494: getfield 416	co/vine/android/api/VineUser:userId	J
    //   497: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   500: aload 64
    //   502: getfield 257	co/vine/android/api/VineComment:commentId	J
    //   505: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   508: invokeinterface 1125 3 0
    //   513: pop
    //   514: goto -68 -> 446
    //   517: aload 13
    //   519: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   522: invokeinterface 609 1 0
    //   527: astore 25
    //   529: aload 25
    //   531: invokeinterface 614 1 0
    //   536: ifeq +64 -> 600
    //   539: aload 25
    //   541: invokeinterface 618 1 0
    //   546: checkcast 254	co/vine/android/api/VineComment
    //   549: astore 61
    //   551: aload 61
    //   553: getfield 1124	co/vine/android/api/VineComment:user	Lco/vine/android/api/VineUser;
    //   556: ifnull -27 -> 529
    //   559: aload 22
    //   561: aload 61
    //   563: getfield 1124	co/vine/android/api/VineComment:user	Lco/vine/android/api/VineUser;
    //   566: invokevirtual 797	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   569: pop
    //   570: aload 23
    //   572: aload 61
    //   574: getfield 1124	co/vine/android/api/VineComment:user	Lco/vine/android/api/VineUser;
    //   577: getfield 416	co/vine/android/api/VineUser:userId	J
    //   580: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   583: aload 61
    //   585: getfield 257	co/vine/android/api/VineComment:commentId	J
    //   588: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   591: invokeinterface 1125 3 0
    //   596: pop
    //   597: goto -68 -> 529
    //   600: aload 22
    //   602: invokevirtual 1126	java/util/ArrayList:isEmpty	()Z
    //   605: ifne +19 -> 624
    //   608: aload_0
    //   609: aload 22
    //   611: iconst_3
    //   612: lload_2
    //   613: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   616: iconst_0
    //   617: iconst_0
    //   618: aload 23
    //   620: invokevirtual 1130	co/vine/android/provider/VineDatabaseHelper:mergeUsers	(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I
    //   623: pop
    //   624: invokestatic 411	java/lang/System:currentTimeMillis	()J
    //   627: lstore 26
    //   629: aload 12
    //   631: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   634: istore 28
    //   636: iconst_0
    //   637: istore 29
    //   639: iload 28
    //   641: ifne +99 -> 740
    //   644: aload 11
    //   646: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   649: new 142	android/content/ContentValues
    //   652: dup
    //   653: invokespecial 643	android/content/ContentValues:<init>	()V
    //   656: astore 30
    //   658: aload 12
    //   660: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   663: invokeinterface 609 1 0
    //   668: astore 32
    //   670: aload 32
    //   672: invokeinterface 614 1 0
    //   677: ifeq +52 -> 729
    //   680: aload 32
    //   682: invokeinterface 618 1 0
    //   687: checkcast 254	co/vine/android/api/VineComment
    //   690: astore 58
    //   692: aload 30
    //   694: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   697: aload_0
    //   698: aload 30
    //   700: aload 58
    //   702: lload 26
    //   704: invokespecial 1132	co/vine/android/provider/VineDatabaseHelper:fillCommentValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineComment;J)V
    //   707: aload 11
    //   709: ldc_w 548
    //   712: aconst_null
    //   713: aload 30
    //   715: invokevirtual 671	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   718: lconst_0
    //   719: lcmp
    //   720: ifle +594 -> 1314
    //   723: iconst_1
    //   724: istore 59
    //   726: goto +578 -> 1304
    //   729: aload 11
    //   731: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   734: aload_0
    //   735: aload 11
    //   737: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   740: aload 13
    //   742: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   745: istore 33
    //   747: iconst_0
    //   748: istore 34
    //   750: iload 33
    //   752: ifne +568 -> 1320
    //   755: aload 11
    //   757: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   760: new 142	android/content/ContentValues
    //   763: dup
    //   764: invokespecial 643	android/content/ContentValues:<init>	()V
    //   767: astore 35
    //   769: aload 13
    //   771: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   774: invokeinterface 609 1 0
    //   779: astore 37
    //   781: aload 37
    //   783: invokeinterface 614 1 0
    //   788: ifeq +100 -> 888
    //   791: aload 37
    //   793: invokeinterface 618 1 0
    //   798: checkcast 254	co/vine/android/api/VineComment
    //   801: astore 54
    //   803: aload 35
    //   805: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   808: aload_0
    //   809: aload 35
    //   811: aload 54
    //   813: lload 26
    //   815: invokespecial 1132	co/vine/android/provider/VineDatabaseHelper:fillCommentValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineComment;J)V
    //   818: iconst_1
    //   819: anewarray 543	java/lang/String
    //   822: astore 55
    //   824: aload 55
    //   826: iconst_0
    //   827: aload 54
    //   829: getfield 257	co/vine/android/api/VineComment:commentId	J
    //   832: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   835: aastore
    //   836: aload 11
    //   838: ldc_w 548
    //   841: aload 35
    //   843: ldc_w 913
    //   846: aload 55
    //   848: invokevirtual 788	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   851: istore 56
    //   853: iload 56
    //   855: ifle +27 -> 882
    //   858: iconst_1
    //   859: istore 57
    //   861: iload 34
    //   863: iload 57
    //   865: iadd
    //   866: istore 34
    //   868: goto -87 -> 781
    //   871: astore 31
    //   873: aload_0
    //   874: aload 11
    //   876: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   879: aload 31
    //   881: athrow
    //   882: iconst_0
    //   883: istore 57
    //   885: goto -24 -> 861
    //   888: aload 11
    //   890: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   893: aload_0
    //   894: aload 11
    //   896: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   899: goto +421 -> 1320
    //   902: iconst_0
    //   903: istore 39
    //   905: iload 29
    //   907: ifle +429 -> 1336
    //   910: aload 11
    //   912: ldc_w 548
    //   915: getstatic 1049	co/vine/android/provider/VineDatabaseSQL$TableQuery:PROJECTION	[Ljava/lang/String;
    //   918: aconst_null
    //   919: aconst_null
    //   920: aconst_null
    //   921: aconst_null
    //   922: aconst_null
    //   923: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   926: astore 40
    //   928: iconst_0
    //   929: istore 39
    //   931: aload 40
    //   933: ifnull +403 -> 1336
    //   936: aload 40
    //   938: invokeinterface 521 1 0
    //   943: istore 41
    //   945: iconst_0
    //   946: istore 39
    //   948: iload 41
    //   950: ifeq +386 -> 1336
    //   953: aload 40
    //   955: invokeinterface 775 1 0
    //   960: istore 42
    //   962: iconst_0
    //   963: istore 39
    //   965: iload 42
    //   967: sipush 5000
    //   970: if_icmple +176 -> 1146
    //   973: aload 11
    //   975: ldc_w 1134
    //   978: aconst_null
    //   979: invokevirtual 1055	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   982: astore 46
    //   984: aload 11
    //   986: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   989: iconst_0
    //   990: istore 39
    //   992: aload 46
    //   994: ifnull +141 -> 1135
    //   997: aload 46
    //   999: invokeinterface 521 1 0
    //   1004: istore 47
    //   1006: iconst_0
    //   1007: istore 39
    //   1009: iload 47
    //   1011: ifeq +124 -> 1135
    //   1014: aload 46
    //   1016: iconst_0
    //   1017: invokeinterface 525 2 0
    //   1022: lstore 48
    //   1024: iconst_1
    //   1025: anewarray 543	java/lang/String
    //   1028: astore 50
    //   1030: aload 50
    //   1032: iconst_0
    //   1033: lload 48
    //   1035: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   1038: aastore
    //   1039: aload 11
    //   1041: ldc_w 548
    //   1044: ldc_w 837
    //   1047: aload 50
    //   1049: invokevirtual 756	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   1052: istore 39
    //   1054: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   1057: ifeq +71 -> 1128
    //   1060: ldc_w 1057
    //   1063: new 476	java/lang/StringBuilder
    //   1066: dup
    //   1067: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   1070: ldc_w 1059
    //   1073: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1076: iload 42
    //   1078: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1081: ldc_w 1061
    //   1084: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1087: sipush 5000
    //   1090: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1093: ldc_w 1063
    //   1096: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1099: iload 39
    //   1101: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1104: ldc_w 1136
    //   1107: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1110: ldc_w 1138
    //   1113: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1116: lload 48
    //   1118: invokevirtual 808	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1121: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1124: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   1127: pop
    //   1128: aload 46
    //   1130: invokeinterface 528 1 0
    //   1135: aload 11
    //   1137: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   1140: aload_0
    //   1141: aload 11
    //   1143: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   1146: aload 40
    //   1148: invokeinterface 528 1 0
    //   1153: goto +183 -> 1336
    //   1156: aload_0
    //   1157: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   1160: getstatic 916	co/vine/android/provider/Vine$Comments:CONTENT_URI	Landroid/net/Uri;
    //   1163: aconst_null
    //   1164: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   1167: aload_0
    //   1168: invokespecial 721	co/vine/android/provider/VineDatabaseHelper:notifyPostCommentsViewUris	()V
    //   1171: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   1174: ifeq +41 -> 1215
    //   1177: ldc 34
    //   1179: new 476	java/lang/StringBuilder
    //   1182: dup
    //   1183: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   1186: ldc_w 1067
    //   1189: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1192: iload 29
    //   1194: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1197: ldc_w 1140
    //   1200: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1203: iload 34
    //   1205: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1208: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1211: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   1214: pop
    //   1215: new 1116	co/vine/android/provider/DbResponse
    //   1218: dup
    //   1219: iload 29
    //   1221: iload 34
    //   1223: iload 38
    //   1225: invokespecial 1119	co/vine/android/provider/DbResponse:<init>	(III)V
    //   1228: astore 43
    //   1230: goto -836 -> 394
    //   1233: astore 36
    //   1235: aload_0
    //   1236: aload 11
    //   1238: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   1241: aload 36
    //   1243: athrow
    //   1244: iconst_2
    //   1245: anewarray 543	java/lang/String
    //   1248: astore 52
    //   1250: aload 52
    //   1252: iconst_0
    //   1253: lload_2
    //   1254: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   1257: aastore
    //   1258: aload 52
    //   1260: iconst_1
    //   1261: lload 14
    //   1263: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   1266: aastore
    //   1267: aload 11
    //   1269: ldc_w 548
    //   1272: ldc_w 1142
    //   1275: aload 52
    //   1277: invokevirtual 756	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   1280: pop
    //   1281: iconst_4
    //   1282: istore 38
    //   1284: goto -382 -> 902
    //   1287: astore 45
    //   1289: aload_0
    //   1290: aload 11
    //   1292: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   1295: aload 45
    //   1297: athrow
    //   1298: iconst_0
    //   1299: istore 18
    //   1301: goto -1071 -> 230
    //   1304: iload 29
    //   1306: iload 59
    //   1308: iadd
    //   1309: istore 29
    //   1311: goto -641 -> 670
    //   1314: iconst_0
    //   1315: istore 59
    //   1317: goto -13 -> 1304
    //   1320: iload 18
    //   1322: ifne +8 -> 1330
    //   1325: iload 9
    //   1327: ifeq -83 -> 1244
    //   1330: iconst_1
    //   1331: istore 38
    //   1333: goto -431 -> 902
    //   1336: iload 8
    //   1338: ifeq -167 -> 1171
    //   1341: iload 29
    //   1343: ifgt -187 -> 1156
    //   1346: iload 34
    //   1348: ifgt -192 -> 1156
    //   1351: iload 39
    //   1353: ifle -182 -> 1171
    //   1356: goto -200 -> 1156
    //
    // Exception table:
    //   from	to	target	type
    //   2	38	116	finally
    //   43	51	116	finally
    //   51	97	116	finally
    //   97	113	116	finally
    //   140	158	116	finally
    //   161	198	116	finally
    //   203	227	116	finally
    //   230	239	116	finally
    //   239	274	116	finally
    //   279	289	116	finally
    //   298	306	116	finally
    //   306	319	116	finally
    //   324	336	116	finally
    //   339	356	116	finally
    //   359	366	116	finally
    //   366	394	116	finally
    //   399	446	116	finally
    //   446	514	116	finally
    //   517	529	116	finally
    //   529	597	116	finally
    //   600	624	116	finally
    //   624	636	116	finally
    //   644	649	116	finally
    //   734	740	116	finally
    //   740	747	116	finally
    //   755	760	116	finally
    //   873	882	116	finally
    //   893	899	116	finally
    //   910	928	116	finally
    //   936	945	116	finally
    //   953	962	116	finally
    //   1140	1146	116	finally
    //   1146	1153	116	finally
    //   1156	1171	116	finally
    //   1171	1215	116	finally
    //   1215	1230	116	finally
    //   1235	1244	116	finally
    //   1244	1281	116	finally
    //   1289	1298	116	finally
    //   279	289	322	android/database/sqlite/SQLiteException
    //   649	670	871	finally
    //   670	723	871	finally
    //   729	734	871	finally
    //   760	781	1233	finally
    //   781	853	1233	finally
    //   888	893	1233	finally
    //   973	989	1287	finally
    //   997	1006	1287	finally
    //   1014	1128	1287	finally
    //   1128	1135	1287	finally
    //   1135	1140	1287	finally
  }

  public void mergeEditions(ArrayList<Pair<String, String>> paramArrayList)
  {
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    localSQLiteDatabase.delete("editions", null, null);
    boolean bool = paramArrayList.isEmpty();
    int i = 0;
    if (!bool)
      localSQLiteDatabase.beginTransaction();
    try
    {
      ContentValues localContentValues = new ContentValues();
      Iterator localIterator = paramArrayList.iterator();
      while (localIterator.hasNext())
      {
        Pair localPair = (Pair)localIterator.next();
        localContentValues.put("edition_code", (String)localPair.first);
        localContentValues.put("edition_name", (String)localPair.second);
        i = (int)(i + localSQLiteDatabase.insert("editions", null, localContentValues));
      }
      localSQLiteDatabase.setTransactionSuccessful();
      safeFinishTransaction(localSQLiteDatabase);
      if (i > 0)
        this.mContentResolver.notifyChange(Vine.Editions.CONTENT_URI, null);
      return;
    }
    finally
    {
      safeFinishTransaction(localSQLiteDatabase);
    }
  }

  // ERROR //
  public int mergeLikes(Collection<VineLike> paramCollection, long paramLong, int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 622	co/vine/android/provider/VineDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   6: astore 7
    //   8: new 59	java/util/HashMap
    //   11: dup
    //   12: aload_1
    //   13: invokeinterface 594 1 0
    //   18: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   21: astore 8
    //   23: new 59	java/util/HashMap
    //   26: dup
    //   27: aload_1
    //   28: invokeinterface 594 1 0
    //   33: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   36: astore 9
    //   38: aload_1
    //   39: invokeinterface 609 1 0
    //   44: astore 10
    //   46: aload 10
    //   48: invokeinterface 614 1 0
    //   53: ifeq +47 -> 100
    //   56: aload 10
    //   58: invokeinterface 618 1 0
    //   63: checkcast 292	co/vine/android/api/VineLike
    //   66: astore 58
    //   68: aload 58
    //   70: lload_2
    //   71: putfield 297	co/vine/android/api/VineLike:postId	J
    //   74: aload 8
    //   76: aload 58
    //   78: getfield 295	co/vine/android/api/VineLike:likeId	J
    //   81: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   84: aload 58
    //   86: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   89: pop
    //   90: goto -44 -> 46
    //   93: astore 6
    //   95: aload_0
    //   96: monitorexit
    //   97: aload 6
    //   99: athrow
    //   100: aload 7
    //   102: ldc_w 854
    //   105: getstatic 1166	co/vine/android/provider/VineDatabaseSQL$LikesQuery:PROJECTION	[Ljava/lang/String;
    //   108: aconst_null
    //   109: aconst_null
    //   110: aconst_null
    //   111: aconst_null
    //   112: aconst_null
    //   113: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   116: astore 11
    //   118: aload 11
    //   120: ifnull +66 -> 186
    //   123: aload 11
    //   125: invokeinterface 638 1 0
    //   130: ifeq +49 -> 179
    //   133: aload 11
    //   135: iconst_1
    //   136: invokeinterface 525 2 0
    //   141: lstore 54
    //   143: aload 8
    //   145: lload 54
    //   147: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   150: invokevirtual 1035	java/util/HashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   153: checkcast 292	co/vine/android/api/VineLike
    //   156: astore 56
    //   158: aload 56
    //   160: ifnull -37 -> 123
    //   163: aload 9
    //   165: lload 54
    //   167: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   170: aload 56
    //   172: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   175: pop
    //   176: goto -53 -> 123
    //   179: aload 11
    //   181: invokeinterface 528 1 0
    //   186: aload 8
    //   188: invokevirtual 1120	java/util/HashMap:size	()I
    //   191: aload 9
    //   193: invokevirtual 1120	java/util/HashMap:size	()I
    //   196: iadd
    //   197: istore 12
    //   199: new 59	java/util/HashMap
    //   202: dup
    //   203: iload 12
    //   205: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   208: astore 13
    //   210: new 791	java/util/ArrayList
    //   213: dup
    //   214: iload 12
    //   216: invokespecial 793	java/util/ArrayList:<init>	(I)V
    //   219: astore 14
    //   221: aload 8
    //   223: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   226: invokeinterface 609 1 0
    //   231: astore 15
    //   233: aload 15
    //   235: invokeinterface 614 1 0
    //   240: ifeq +62 -> 302
    //   243: aload 15
    //   245: invokeinterface 618 1 0
    //   250: checkcast 292	co/vine/android/api/VineLike
    //   253: astore 51
    //   255: aload 51
    //   257: getfield 1167	co/vine/android/api/VineLike:user	Lco/vine/android/api/VineUser;
    //   260: ifnull -27 -> 233
    //   263: aload 14
    //   265: aload 51
    //   267: getfield 1167	co/vine/android/api/VineLike:user	Lco/vine/android/api/VineUser;
    //   270: invokevirtual 797	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   273: pop
    //   274: aload 13
    //   276: aload 51
    //   278: getfield 1167	co/vine/android/api/VineLike:user	Lco/vine/android/api/VineUser;
    //   281: getfield 416	co/vine/android/api/VineUser:userId	J
    //   284: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   287: aload 51
    //   289: getfield 295	co/vine/android/api/VineLike:likeId	J
    //   292: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   295: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   298: pop
    //   299: goto -66 -> 233
    //   302: aload 9
    //   304: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   307: invokeinterface 609 1 0
    //   312: astore 16
    //   314: aload 16
    //   316: invokeinterface 614 1 0
    //   321: ifeq +62 -> 383
    //   324: aload 16
    //   326: invokeinterface 618 1 0
    //   331: checkcast 292	co/vine/android/api/VineLike
    //   334: astore 48
    //   336: aload 48
    //   338: getfield 1167	co/vine/android/api/VineLike:user	Lco/vine/android/api/VineUser;
    //   341: ifnull -27 -> 314
    //   344: aload 14
    //   346: aload 48
    //   348: getfield 1167	co/vine/android/api/VineLike:user	Lco/vine/android/api/VineUser;
    //   351: invokevirtual 797	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   354: pop
    //   355: aload 13
    //   357: aload 48
    //   359: getfield 1167	co/vine/android/api/VineLike:user	Lco/vine/android/api/VineUser;
    //   362: getfield 416	co/vine/android/api/VineUser:userId	J
    //   365: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   368: aload 48
    //   370: getfield 295	co/vine/android/api/VineLike:likeId	J
    //   373: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   376: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   379: pop
    //   380: goto -66 -> 314
    //   383: aload 14
    //   385: invokevirtual 1126	java/util/ArrayList:isEmpty	()Z
    //   388: ifne +21 -> 409
    //   391: aload_0
    //   392: aload 14
    //   394: iconst_5
    //   395: lload_2
    //   396: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   399: iload 4
    //   401: iload 5
    //   403: aload 13
    //   405: invokevirtual 1130	co/vine/android/provider/VineDatabaseHelper:mergeUsers	(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I
    //   408: pop
    //   409: invokestatic 411	java/lang/System:currentTimeMillis	()J
    //   412: lstore 17
    //   414: aload 8
    //   416: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   419: istore 19
    //   421: iconst_0
    //   422: istore 20
    //   424: iload 19
    //   426: ifne +99 -> 525
    //   429: aload 7
    //   431: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   434: new 142	android/content/ContentValues
    //   437: dup
    //   438: invokespecial 643	android/content/ContentValues:<init>	()V
    //   441: astore 21
    //   443: aload 8
    //   445: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   448: invokeinterface 609 1 0
    //   453: astore 23
    //   455: aload 23
    //   457: invokeinterface 614 1 0
    //   462: ifeq +52 -> 514
    //   465: aload 23
    //   467: invokeinterface 618 1 0
    //   472: checkcast 292	co/vine/android/api/VineLike
    //   475: astore 45
    //   477: aload 21
    //   479: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   482: aload_0
    //   483: aload 21
    //   485: aload 45
    //   487: lload 17
    //   489: invokespecial 1169	co/vine/android/provider/VineDatabaseHelper:fillLikeValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineLike;J)V
    //   492: aload 7
    //   494: ldc_w 854
    //   497: aconst_null
    //   498: aload 21
    //   500: invokevirtual 671	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   503: lconst_0
    //   504: lcmp
    //   505: ifle +525 -> 1030
    //   508: iconst_1
    //   509: istore 46
    //   511: goto +509 -> 1020
    //   514: aload 7
    //   516: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   519: aload_0
    //   520: aload 7
    //   522: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   525: aload 9
    //   527: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   530: istore 24
    //   532: iconst_0
    //   533: istore 25
    //   535: iload 24
    //   537: ifne +147 -> 684
    //   540: aload 7
    //   542: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   545: new 142	android/content/ContentValues
    //   548: dup
    //   549: invokespecial 643	android/content/ContentValues:<init>	()V
    //   552: astore 26
    //   554: aload 9
    //   556: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   559: invokeinterface 609 1 0
    //   564: astore 28
    //   566: aload 28
    //   568: invokeinterface 614 1 0
    //   573: ifeq +100 -> 673
    //   576: aload 28
    //   578: invokeinterface 618 1 0
    //   583: checkcast 292	co/vine/android/api/VineLike
    //   586: astore 41
    //   588: aload 26
    //   590: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   593: aload_0
    //   594: aload 26
    //   596: aload 41
    //   598: lload 17
    //   600: invokespecial 1169	co/vine/android/provider/VineDatabaseHelper:fillLikeValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineLike;J)V
    //   603: iconst_1
    //   604: anewarray 543	java/lang/String
    //   607: astore 42
    //   609: aload 42
    //   611: iconst_0
    //   612: aload 41
    //   614: getfield 295	co/vine/android/api/VineLike:likeId	J
    //   617: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   620: aastore
    //   621: aload 7
    //   623: ldc_w 854
    //   626: aload 26
    //   628: ldc_w 1171
    //   631: aload 42
    //   633: invokevirtual 788	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   636: istore 43
    //   638: iload 43
    //   640: ifle +27 -> 667
    //   643: iconst_1
    //   644: istore 44
    //   646: iload 25
    //   648: iload 44
    //   650: iadd
    //   651: istore 25
    //   653: goto -87 -> 566
    //   656: astore 22
    //   658: aload_0
    //   659: aload 7
    //   661: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   664: aload 22
    //   666: athrow
    //   667: iconst_0
    //   668: istore 44
    //   670: goto -24 -> 646
    //   673: aload 7
    //   675: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   678: aload_0
    //   679: aload 7
    //   681: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   684: iconst_0
    //   685: istore 29
    //   687: iload 20
    //   689: ifle +347 -> 1036
    //   692: aload 7
    //   694: ldc_w 854
    //   697: getstatic 1049	co/vine/android/provider/VineDatabaseSQL$TableQuery:PROJECTION	[Ljava/lang/String;
    //   700: aconst_null
    //   701: aconst_null
    //   702: aconst_null
    //   703: aconst_null
    //   704: aconst_null
    //   705: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   708: astore 30
    //   710: iconst_0
    //   711: istore 29
    //   713: aload 30
    //   715: ifnull +321 -> 1036
    //   718: aload 30
    //   720: invokeinterface 521 1 0
    //   725: istore 31
    //   727: iconst_0
    //   728: istore 29
    //   730: iload 31
    //   732: ifeq +304 -> 1036
    //   735: aload 30
    //   737: invokeinterface 775 1 0
    //   742: istore 32
    //   744: iconst_0
    //   745: istore 29
    //   747: iload 32
    //   749: sipush 5000
    //   752: if_icmple +170 -> 922
    //   755: aload 7
    //   757: ldc_w 1173
    //   760: aconst_null
    //   761: invokevirtual 1055	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   764: astore 35
    //   766: aload 7
    //   768: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   771: iconst_0
    //   772: istore 29
    //   774: aload 35
    //   776: ifnull +135 -> 911
    //   779: aload 35
    //   781: invokeinterface 521 1 0
    //   786: istore 36
    //   788: iconst_0
    //   789: istore 29
    //   791: iload 36
    //   793: ifeq +118 -> 911
    //   796: aload 35
    //   798: iconst_0
    //   799: invokeinterface 525 2 0
    //   804: lstore 37
    //   806: iconst_1
    //   807: anewarray 543	java/lang/String
    //   810: astore 39
    //   812: aload 39
    //   814: iconst_0
    //   815: lload 37
    //   817: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   820: aastore
    //   821: aload 7
    //   823: ldc_w 854
    //   826: ldc_w 837
    //   829: aload 39
    //   831: invokevirtual 756	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   834: istore 29
    //   836: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   839: ifeq +65 -> 904
    //   842: ldc_w 1057
    //   845: new 476	java/lang/StringBuilder
    //   848: dup
    //   849: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   852: ldc_w 1059
    //   855: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   858: iload 32
    //   860: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   863: ldc_w 1061
    //   866: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   869: sipush 5000
    //   872: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   875: ldc_w 1063
    //   878: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   881: iload 29
    //   883: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   886: ldc_w 1175
    //   889: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   892: lload 37
    //   894: invokevirtual 808	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   897: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   900: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   903: pop
    //   904: aload 35
    //   906: invokeinterface 528 1 0
    //   911: aload 7
    //   913: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   916: aload_0
    //   917: aload 7
    //   919: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   922: aload 30
    //   924: invokeinterface 528 1 0
    //   929: goto +107 -> 1036
    //   932: aload_0
    //   933: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   936: getstatic 1178	co/vine/android/provider/Vine$Likes:CONTENT_URI	Landroid/net/Uri;
    //   939: aconst_null
    //   940: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   943: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   946: ifeq +47 -> 993
    //   949: ldc 34
    //   951: new 476	java/lang/StringBuilder
    //   954: dup
    //   955: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   958: ldc_w 1067
    //   961: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   964: iload 20
    //   966: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   969: ldc_w 1180
    //   972: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   975: iload 25
    //   977: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   980: ldc_w 1071
    //   983: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   986: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   989: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   992: pop
    //   993: aload_0
    //   994: monitorexit
    //   995: iload 20
    //   997: ireturn
    //   998: astore 27
    //   1000: aload_0
    //   1001: aload 7
    //   1003: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   1006: aload 27
    //   1008: athrow
    //   1009: astore 34
    //   1011: aload_0
    //   1012: aload 7
    //   1014: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   1017: aload 34
    //   1019: athrow
    //   1020: iload 20
    //   1022: iload 46
    //   1024: iadd
    //   1025: istore 20
    //   1027: goto -572 -> 455
    //   1030: iconst_0
    //   1031: istore 46
    //   1033: goto -13 -> 1020
    //   1036: iload 20
    //   1038: ifgt -106 -> 932
    //   1041: iload 25
    //   1043: ifgt -111 -> 932
    //   1046: iload 29
    //   1048: ifle -105 -> 943
    //   1051: goto -119 -> 932
    //
    // Exception table:
    //   from	to	target	type
    //   2	46	93	finally
    //   46	90	93	finally
    //   100	118	93	finally
    //   123	158	93	finally
    //   163	176	93	finally
    //   179	186	93	finally
    //   186	233	93	finally
    //   233	299	93	finally
    //   302	314	93	finally
    //   314	380	93	finally
    //   383	409	93	finally
    //   409	421	93	finally
    //   429	434	93	finally
    //   519	525	93	finally
    //   525	532	93	finally
    //   540	545	93	finally
    //   658	667	93	finally
    //   678	684	93	finally
    //   692	710	93	finally
    //   718	727	93	finally
    //   735	744	93	finally
    //   916	922	93	finally
    //   922	929	93	finally
    //   932	943	93	finally
    //   943	993	93	finally
    //   1000	1009	93	finally
    //   1011	1020	93	finally
    //   434	455	656	finally
    //   455	508	656	finally
    //   514	519	656	finally
    //   545	566	998	finally
    //   566	638	998	finally
    //   673	678	998	finally
    //   755	771	1009	finally
    //   779	788	1009	finally
    //   796	904	1009	finally
    //   904	911	1009	finally
    //   911	916	1009	finally
  }

  public Uri mergeNotification(VineNotification paramVineNotification, String paramString)
  {
    try
    {
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramVineNotification.notificationId);
      Cursor localCursor = this.mContentResolver.query(Vine.Notifications.CONTENT_URI, VineDatabaseSQL.NotificationsQuery.PROJECTION, "notification_id=?", arrayOfString, "notification_id DESC");
      Uri localUri = null;
      if (localCursor != null)
      {
        int i = localCursor.getCount();
        localUri = null;
        if (i < 1)
        {
          ContentValues localContentValues = new ContentValues();
          fillNotificationValues(localContentValues, paramVineNotification, paramString);
          localUri = this.mContentResolver.insert(Vine.Notifications.CONTENT_URI_PUT_NOTIFICATION, localContentValues);
        }
        localCursor.close();
      }
      return localUri;
    }
    finally
    {
    }
  }

  public DbResponse mergePosts(Collection<VinePost> paramCollection, int paramInt1, String paramString, int paramInt2, int paramInt3, int paramInt4, long paramLong, boolean paramBoolean)
    throws IOException
  {
    SQLiteDatabase localSQLiteDatabase;
    HashMap localHashMap1;
    HashMap localHashMap2;
    try
    {
      localSQLiteDatabase = getWritableDatabase();
      localHashMap1 = new HashMap(paramCollection.size());
      localHashMap2 = new HashMap(paramCollection.size());
      Iterator localIterator1 = paramCollection.iterator();
      while (localIterator1.hasNext())
      {
        VinePost localVinePost6 = (VinePost)localIterator1.next();
        localHashMap1.put(Long.valueOf(localVinePost6.postId), localVinePost6);
      }
    }
    finally
    {
    }
    int i8;
    if (Util.isPopularTimeline(paramInt1))
    {
      int i7 = paramCollection.size();
      localHashMap3 = new HashMap(i7);
      if ((paramInt2 == 1) || (paramInt2 == 2))
      {
        i8 = 1;
        removePostsFromGroup(paramInt1);
      }
      while (true)
      {
        Iterator localIterator6 = paramCollection.iterator();
        while (localIterator6.hasNext())
        {
          Long localLong3 = Long.valueOf(((VinePost)localIterator6.next()).postId);
          Long localLong4 = Long.valueOf(i8);
          localHashMap3.put(localLong3, localLong4);
          i8++;
        }
        Cursor localCursor5 = getOldestSortId(paramInt1);
        if ((localCursor5 == null) || (!localCursor5.moveToFirst()))
          break label1869;
        i8 = 1 + localCursor5.getInt(0);
      }
    }
    int i = paramCollection.size();
    HashMap localHashMap3 = new HashMap(i);
    Iterator localIterator2 = paramCollection.iterator();
    while (localIterator2.hasNext())
    {
      VinePost localVinePost5 = (VinePost)localIterator2.next();
      Long localLong1 = Long.valueOf(localVinePost5.postId);
      Long localLong2 = Long.valueOf(VineComparatorFactory.get(paramInt1).getOrderId(localVinePost5));
      localHashMap3.put(localLong1, localLong2);
    }
    int j = 1;
    String str1;
    String[] arrayOfString1;
    if ((!TextUtils.isEmpty(paramString)) && (!Util.isPopularTimeline(paramInt1)))
    {
      str1 = "post_type=? AND tag=?";
      arrayOfString1 = new String[2];
      arrayOfString1[0] = String.valueOf(paramInt1);
      arrayOfString1[1] = paramString;
    }
    label428: DbResponse localDbResponse;
    while (true)
    {
      Cursor localCursor1 = localSQLiteDatabase.query("post_groups_view", VineDatabaseSQL.PostGroupsQuery.PROJECTION, str1, arrayOfString1, null, null, "sort_id DESC");
      if ((localCursor1 != null) && (localCursor1.moveToFirst()))
      {
        if (paramLong > 0L)
        {
          if (paramLong >= localCursor1.getLong(3))
            break label1875;
          j = 1;
        }
        localCursor1.close();
      }
      Cursor localCursor2 = localSQLiteDatabase.query("posts", new String[] { "post_id" }, null, null, null, null, null);
      if ((localCursor2 != null) && (localCursor2.moveToFirst()))
      {
        do
        {
          long l1 = localCursor2.getLong(0);
          VinePost localVinePost1 = (VinePost)localHashMap1.remove(Long.valueOf(l1));
          if (localVinePost1 != null)
            localHashMap2.put(Long.valueOf(l1), localVinePost1);
        }
        while (localCursor2.moveToNext());
        localCursor2.close();
      }
      if ((!LOGGABLE) || (!localHashMap1.isEmpty()) || (!localHashMap2.isEmpty()))
        break;
      Log.d("VineDH", "No new posts to merge or update");
      localDbResponse = new DbResponse(0, 0, 2);
      label577: return localDbResponse;
      str1 = "post_type=?";
      arrayOfString1 = new String[1];
      arrayOfString1[0] = String.valueOf(paramInt1);
    }
    HashMap localHashMap4 = new HashMap(paramCollection.size());
    ArrayList localArrayList = new ArrayList(paramCollection.size());
    Iterator localIterator3 = localHashMap1.values().iterator();
    while (localIterator3.hasNext())
    {
      VinePost localVinePost4 = (VinePost)localIterator3.next();
      if (localVinePost4.user != null)
      {
        localArrayList.add(localVinePost4.user);
        localHashMap4.put(Long.valueOf(localVinePost4.userId), Long.valueOf(localVinePost4.postId));
      }
    }
    mergeUsers(localArrayList, 4, null, 0, 0, localHashMap4, null);
    long l2 = System.currentTimeMillis();
    boolean bool1 = localHashMap1.isEmpty();
    int k = 0;
    if (!bool1)
    {
      localSQLiteDatabase.beginTransaction();
      while (true)
      {
        try
        {
          ContentValues localContentValues1 = new ContentValues();
          Iterator localIterator4 = localHashMap1.values().iterator();
          if (!localIterator4.hasNext())
            break;
          VinePost localVinePost3 = (VinePost)localIterator4.next();
          localContentValues1.clear();
          localVinePost3.likesCount = localVinePost3.likes.count;
          localVinePost3.commentsCount = localVinePost3.comments.count;
          fillPostValues(localContentValues1, localVinePost3, l2);
          if (localSQLiteDatabase.insert("posts", null, localContentValues1) > 0L)
          {
            i6 = 1;
            k += i6;
            if (!localVinePost3.comments.items.isEmpty())
            {
              mergeComments(localVinePost3.comments.items, localVinePost3.postId, 0, 0, 0L, false, false);
              if (localVinePost3.comments.nextPage <= 0)
                markLastComment(localVinePost3.postId);
            }
            if (localVinePost3.likes.items.isEmpty())
              continue;
            mergeLikes(localVinePost3.likes.items, localVinePost3.postId, -1, -1);
            continue;
          }
        }
        finally
        {
          safeFinishTransaction(localSQLiteDatabase);
        }
        int i6 = 0;
      }
      localSQLiteDatabase.setTransactionSuccessful();
      safeFinishTransaction(localSQLiteDatabase);
    }
    boolean bool2 = localHashMap2.isEmpty();
    int m = 0;
    if (!bool2)
    {
      localSQLiteDatabase.beginTransaction();
      while (true)
      {
        try
        {
          ContentValues localContentValues2 = new ContentValues();
          Iterator localIterator5 = localHashMap2.values().iterator();
          if (!localIterator5.hasNext())
            break;
          VinePost localVinePost2 = (VinePost)localIterator5.next();
          localContentValues2.clear();
          localVinePost2.likesCount = localVinePost2.likes.count;
          localVinePost2.commentsCount = localVinePost2.comments.count;
          fillPostValues(localContentValues2, localVinePost2, l2);
          String[] arrayOfString6 = new String[1];
          arrayOfString6[0] = String.valueOf(localVinePost2.postId);
          if (localSQLiteDatabase.update("posts", localContentValues2, "post_id=?", arrayOfString6) > 0)
          {
            i5 = 1;
            m += i5;
            if (!localVinePost2.comments.items.isEmpty())
            {
              mergeComments(localVinePost2.comments.items, localVinePost2.postId, 0, 0, 0L, false, false);
              if (localVinePost2.comments.nextPage <= 0)
                markLastComment(localVinePost2.postId);
            }
            if (localVinePost2.likes.items.isEmpty())
              continue;
            mergeLikes(localVinePost2.likes.items, localVinePost2.postId, -1, -1);
            continue;
          }
        }
        finally
        {
          safeFinishTransaction(localSQLiteDatabase);
        }
        int i5 = 0;
      }
      localSQLiteDatabase.setTransactionSuccessful();
      safeFinishTransaction(localSQLiteDatabase);
    }
    if (LOGGABLE)
    {
      Log.d("VineDH", "Inserted " + k + " posts, and updated " + m + " with lastRefresh time " + l2);
      break label1881;
      label1315: savePageCursor(2, paramInt1, paramString, paramInt3, paramInt4, paramLong, false);
      break label1901;
    }
    while (true)
    {
      label1333: int i3 = 0;
      Cursor localCursor3;
      int i4;
      if (k > 0)
      {
        i3 = 0;
        if (j != 0)
        {
          localCursor3 = localSQLiteDatabase.query("posts", VineDatabaseSQL.TableQuery.PROJECTION, null, null, null, null, null);
          i3 = 0;
          if (localCursor3 != null)
          {
            boolean bool3 = localCursor3.moveToFirst();
            i3 = 0;
            if (bool3)
            {
              i4 = localCursor3.getCount();
              i3 = 0;
              if (i4 <= 1000);
            }
          }
        }
      }
      while (true)
      {
        try
        {
          Cursor localCursor4 = localSQLiteDatabase.rawQuery("SELECT last_refresh FROM posts ORDER BY last_refresh DESC LIMIT 1 OFFSET 500", null);
          localSQLiteDatabase.beginTransaction();
          i3 = 0;
          if (localCursor4 != null)
          {
            boolean bool4 = localCursor4.moveToFirst();
            i3 = 0;
            if (bool4)
            {
              long l3 = localCursor4.getLong(0);
              String[] arrayOfString4 = new String[1];
              arrayOfString4[0] = String.valueOf(l3);
              localSQLiteDatabase.execSQL("DELETE FROM post_groups WHERE post_id IN (SELECT post_id FROM posts WHERE last_refresh < ?);", arrayOfString4);
              String[] arrayOfString5 = new String[1];
              arrayOfString5[0] = String.valueOf(l3);
              i3 = localSQLiteDatabase.delete("posts", "last_refresh<?", arrayOfString5);
              if (LOGGABLE)
                Log.d("s", "Due to reaching maximum table size (" + i4 + " with a max of " + 1000 + "), deleted " + i3 + " posts groups all less than last refresh id " + l3 + ".");
              localCursor4.close();
            }
          }
          localSQLiteDatabase.setTransactionSuccessful();
          safeFinishTransaction(localSQLiteDatabase);
          localCursor3.close();
          break label1912;
          if (paramInt1 != 0)
          {
            if (paramInt1 != -1)
              mergePostGroups(paramCollection, paramInt1, paramString, localHashMap3);
            if (paramBoolean)
              notifyByType(paramInt1);
          }
          localDbResponse = new DbResponse(k, m, i2);
          break label577;
          if (!TextUtils.isEmpty(paramString))
          {
            str2 = "post_type=? AND tag=? AND post_id<?";
            arrayOfString2 = new String[3];
            arrayOfString2[0] = String.valueOf(paramInt1);
            arrayOfString2[1] = paramString;
            arrayOfString2[2] = String.valueOf(paramLong);
            String[] arrayOfString3 = new String[1];
            arrayOfString3[0] = String.valueOf(paramInt1);
            int n = localSQLiteDatabase.delete("posts", "post_id<?", arrayOfString3);
            int i1 = localSQLiteDatabase.delete("post_groups", str2, arrayOfString2);
            if (!LOGGABLE)
              break label1930;
            Log.d("VineDH", "Non contiguous timeline detected, deleted " + n + " posts and " + i1 + " with id less than anchor: " + paramLong + " of type " + paramInt1 + " and tag " + paramString);
            break label1930;
          }
          String str2 = "post_type=? AND post_id<?";
          String[] arrayOfString2 = new String[2];
          arrayOfString2[0] = String.valueOf(paramInt1);
          arrayOfString2[1] = String.valueOf(paramLong);
          continue;
        }
        finally
        {
          safeFinishTransaction(localSQLiteDatabase);
        }
        label1869: i8 = 1;
        break;
        label1875: j = 0;
        break label428;
        label1881: if ((paramLong > 0L) || (paramInt3 > 0) || (paramInt4 > 0))
          break label1315;
        label1901: if (j != 0)
        {
          i2 = 1;
          break label1333;
          label1912: if ((k <= 0) && (m <= 0))
            if (i3 <= 0);
        }
      }
      label1930: int i2 = 4;
    }
  }

  // ERROR //
  public int mergeSearchedTags(Collection<VineTag> paramCollection, int paramInt1, int paramInt2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 622	co/vine/android/provider/VineDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   6: astore 5
    //   8: new 59	java/util/HashMap
    //   11: dup
    //   12: aload_1
    //   13: invokeinterface 594 1 0
    //   18: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   21: astore 6
    //   23: new 59	java/util/HashMap
    //   26: dup
    //   27: aload_1
    //   28: invokeinterface 594 1 0
    //   33: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   36: astore 7
    //   38: aload_1
    //   39: invokeinterface 609 1 0
    //   44: astore 8
    //   46: aload 8
    //   48: invokeinterface 614 1 0
    //   53: ifeq +41 -> 94
    //   56: aload 8
    //   58: invokeinterface 618 1 0
    //   63: checkcast 395	co/vine/android/api/VineTag
    //   66: astore 32
    //   68: aload 6
    //   70: aload 32
    //   72: getfield 398	co/vine/android/api/VineTag:tagId	J
    //   75: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   78: aload 32
    //   80: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   83: pop
    //   84: goto -38 -> 46
    //   87: astore 4
    //   89: aload_0
    //   90: monitorexit
    //   91: aload 4
    //   93: athrow
    //   94: aload 5
    //   96: ldc_w 568
    //   99: iconst_1
    //   100: anewarray 543	java/lang/String
    //   103: dup
    //   104: iconst_0
    //   105: ldc_w 393
    //   108: aastore
    //   109: aconst_null
    //   110: aconst_null
    //   111: aconst_null
    //   112: aconst_null
    //   113: aconst_null
    //   114: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   117: astore 9
    //   119: aload 9
    //   121: ifnull +75 -> 196
    //   124: aload 9
    //   126: invokeinterface 638 1 0
    //   131: ifeq +58 -> 189
    //   134: aload 9
    //   136: aload 9
    //   138: ldc_w 393
    //   141: invokeinterface 955 2 0
    //   146: invokeinterface 525 2 0
    //   151: lstore 28
    //   153: aload 6
    //   155: lload 28
    //   157: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   160: invokevirtual 1035	java/util/HashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   163: checkcast 395	co/vine/android/api/VineTag
    //   166: astore 30
    //   168: aload 30
    //   170: ifnull -46 -> 124
    //   173: aload 7
    //   175: lload 28
    //   177: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   180: aload 30
    //   182: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   185: pop
    //   186: goto -62 -> 124
    //   189: aload 9
    //   191: invokeinterface 528 1 0
    //   196: aload 6
    //   198: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   201: istore 10
    //   203: iconst_0
    //   204: istore 11
    //   206: iload 10
    //   208: ifne +99 -> 307
    //   211: aload 5
    //   213: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   216: new 142	android/content/ContentValues
    //   219: dup
    //   220: invokespecial 643	android/content/ContentValues:<init>	()V
    //   223: astore 12
    //   225: aload 6
    //   227: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   230: invokeinterface 609 1 0
    //   235: astore 14
    //   237: aload 14
    //   239: invokeinterface 614 1 0
    //   244: ifeq +52 -> 296
    //   247: aload 14
    //   249: invokeinterface 618 1 0
    //   254: checkcast 395	co/vine/android/api/VineTag
    //   257: astore 26
    //   259: aload 12
    //   261: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   264: aload_0
    //   265: aload 12
    //   267: aload 26
    //   269: invokespecial 1274	co/vine/android/provider/VineDatabaseHelper:fillTagValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineTag;)V
    //   272: aload 5
    //   274: ldc_w 568
    //   277: ldc_w 393
    //   280: aload 12
    //   282: invokevirtual 671	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   285: lconst_0
    //   286: lcmp
    //   287: ifle +279 -> 566
    //   290: iconst_1
    //   291: istore 27
    //   293: goto +263 -> 556
    //   296: aload 5
    //   298: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   301: aload_0
    //   302: aload 5
    //   304: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   307: aload 7
    //   309: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   312: istore 15
    //   314: iconst_0
    //   315: istore 16
    //   317: iload 15
    //   319: ifne +253 -> 572
    //   322: aload 5
    //   324: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   327: new 142	android/content/ContentValues
    //   330: dup
    //   331: invokespecial 643	android/content/ContentValues:<init>	()V
    //   334: astore 17
    //   336: aload 7
    //   338: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   341: invokeinterface 609 1 0
    //   346: astore 19
    //   348: aload 19
    //   350: invokeinterface 614 1 0
    //   355: ifeq +98 -> 453
    //   358: aload 19
    //   360: invokeinterface 618 1 0
    //   365: checkcast 395	co/vine/android/api/VineTag
    //   368: astore 22
    //   370: aload 17
    //   372: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   375: aload_0
    //   376: aload 17
    //   378: aload 22
    //   380: invokespecial 1274	co/vine/android/provider/VineDatabaseHelper:fillTagValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineTag;)V
    //   383: iconst_1
    //   384: anewarray 543	java/lang/String
    //   387: astore 23
    //   389: aload 23
    //   391: iconst_0
    //   392: aload 22
    //   394: getfield 398	co/vine/android/api/VineTag:tagId	J
    //   397: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   400: aastore
    //   401: aload 5
    //   403: ldc_w 568
    //   406: aload 17
    //   408: ldc_w 1276
    //   411: aload 23
    //   413: invokevirtual 788	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   416: istore 24
    //   418: iload 24
    //   420: ifle +27 -> 447
    //   423: iconst_1
    //   424: istore 25
    //   426: iload 16
    //   428: iload 25
    //   430: iadd
    //   431: istore 16
    //   433: goto -85 -> 348
    //   436: astore 13
    //   438: aload_0
    //   439: aload 5
    //   441: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   444: aload 13
    //   446: athrow
    //   447: iconst_0
    //   448: istore 25
    //   450: goto -24 -> 426
    //   453: aload 5
    //   455: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   458: aload_0
    //   459: aload 5
    //   461: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   464: goto +108 -> 572
    //   467: aload_0
    //   468: iconst_4
    //   469: iconst_0
    //   470: aconst_null
    //   471: iload_2
    //   472: iload_3
    //   473: lconst_0
    //   474: iconst_1
    //   475: invokevirtual 1075	co/vine/android/provider/VineDatabaseHelper:savePageCursor	(IILjava/lang/String;IIJZ)I
    //   478: pop
    //   479: aload_0
    //   480: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   483: getstatic 828	co/vine/android/provider/Vine$TagSearchResults:CONTENT_URI	Landroid/net/Uri;
    //   486: aconst_null
    //   487: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   490: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   493: ifeq +47 -> 540
    //   496: ldc 34
    //   498: new 476	java/lang/StringBuilder
    //   501: dup
    //   502: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   505: ldc_w 1067
    //   508: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   511: iload 11
    //   513: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   516: ldc_w 1278
    //   519: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   522: iload 16
    //   524: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   527: ldc_w 1280
    //   530: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   533: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   536: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   539: pop
    //   540: aload_0
    //   541: monitorexit
    //   542: iload 11
    //   544: ireturn
    //   545: astore 18
    //   547: aload_0
    //   548: aload 5
    //   550: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   553: aload 18
    //   555: athrow
    //   556: iload 11
    //   558: iload 27
    //   560: iadd
    //   561: istore 11
    //   563: goto -326 -> 237
    //   566: iconst_0
    //   567: istore 27
    //   569: goto -13 -> 556
    //   572: iload 11
    //   574: ifgt +8 -> 582
    //   577: iload 16
    //   579: ifle -89 -> 490
    //   582: iload_2
    //   583: ifgt -116 -> 467
    //   586: iload_3
    //   587: ifle -108 -> 479
    //   590: goto -123 -> 467
    //
    // Exception table:
    //   from	to	target	type
    //   2	46	87	finally
    //   46	84	87	finally
    //   94	119	87	finally
    //   124	168	87	finally
    //   173	186	87	finally
    //   189	196	87	finally
    //   196	203	87	finally
    //   211	216	87	finally
    //   301	307	87	finally
    //   307	314	87	finally
    //   322	327	87	finally
    //   438	447	87	finally
    //   458	464	87	finally
    //   467	479	87	finally
    //   479	490	87	finally
    //   490	540	87	finally
    //   547	556	87	finally
    //   216	237	436	finally
    //   237	290	436	finally
    //   296	301	436	finally
    //   327	348	545	finally
    //   348	418	545	finally
    //   453	458	545	finally
  }

  public Uri mergeSuggestedTag(VineTag paramVineTag)
  {
    try
    {
      String[] arrayOfString1 = new String[1];
      arrayOfString1[0] = String.valueOf(paramVineTag.tagId);
      Cursor localCursor = this.mContentResolver.query(Vine.TagsRecentlyUsed.CONTENT_URI, VineDatabaseSQL.TagsRecentlyUsedQuery.PROJECTION, "tag_id=?", arrayOfString1, "_id DESC");
      Uri localUri = null;
      ContentValues localContentValues;
      if (localCursor != null)
      {
        localContentValues = new ContentValues();
        if (localCursor.getCount() >= 1)
          break label100;
        fillTagValues(localContentValues, paramVineTag);
        localUri = this.mContentResolver.insert(Vine.TagsRecentlyUsed.CONTENT_URI_PUT_TAG, localContentValues);
      }
      while (true)
      {
        localCursor.close();
        return localUri;
        label100: boolean bool = localCursor.moveToFirst();
        localUri = null;
        if (bool)
        {
          String[] arrayOfString2 = new String[1];
          arrayOfString2[0] = String.valueOf(paramVineTag.tagId);
          localContentValues.put("last_used_timestamp", Long.valueOf(System.currentTimeMillis()));
          this.mContentResolver.update(Vine.TagsRecentlyUsed.CONTENT_URI_UPDATE_RECENT_TAG, localContentValues, "tag_id=?", arrayOfString2);
          localUri = null;
        }
      }
    }
    finally
    {
    }
  }

  public int mergeUsers(Collection<VineUser> paramCollection, int paramInt1, String paramString, int paramInt2, int paramInt3, Map<Long, Long> paramMap)
  {
    try
    {
      int i = mergeUsers(paramCollection, paramInt1, paramString, paramInt2, paramInt3, null, paramMap);
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  // ERROR //
  public int mergeUsers(Collection<VineUser> paramCollection, int paramInt1, String paramString, int paramInt2, int paramInt3, Map<Long, Long> paramMap1, Map<Long, Long> paramMap2)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: invokevirtual 622	co/vine/android/provider/VineDatabaseHelper:getWritableDatabase	()Landroid/database/sqlite/SQLiteDatabase;
    //   6: astore 9
    //   8: new 59	java/util/HashMap
    //   11: dup
    //   12: aload_1
    //   13: invokeinterface 594 1 0
    //   18: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   21: astore 10
    //   23: new 59	java/util/HashMap
    //   26: dup
    //   27: aload_1
    //   28: invokeinterface 594 1 0
    //   33: invokespecial 798	java/util/HashMap:<init>	(I)V
    //   36: astore 11
    //   38: aload_1
    //   39: invokeinterface 609 1 0
    //   44: astore 12
    //   46: aload 12
    //   48: invokeinterface 614 1 0
    //   53: ifeq +41 -> 94
    //   56: aload 12
    //   58: invokeinterface 618 1 0
    //   63: checkcast 415	co/vine/android/api/VineUser
    //   66: astore 50
    //   68: aload 10
    //   70: aload 50
    //   72: getfield 416	co/vine/android/api/VineUser:userId	J
    //   75: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   78: aload 50
    //   80: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   83: pop
    //   84: goto -38 -> 46
    //   87: astore 8
    //   89: aload_0
    //   90: monitorexit
    //   91: aload 8
    //   93: athrow
    //   94: aload 9
    //   96: ldc_w 770
    //   99: iconst_1
    //   100: anewarray 543	java/lang/String
    //   103: dup
    //   104: iconst_0
    //   105: ldc 181
    //   107: aastore
    //   108: aconst_null
    //   109: aconst_null
    //   110: aconst_null
    //   111: aconst_null
    //   112: aconst_null
    //   113: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   116: astore 13
    //   118: aload 13
    //   120: ifnull +66 -> 186
    //   123: aload 13
    //   125: invokeinterface 638 1 0
    //   130: ifeq +49 -> 179
    //   133: aload 13
    //   135: iconst_0
    //   136: invokeinterface 525 2 0
    //   141: lstore 46
    //   143: aload 10
    //   145: lload 46
    //   147: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   150: invokevirtual 1035	java/util/HashMap:remove	(Ljava/lang/Object;)Ljava/lang/Object;
    //   153: checkcast 415	co/vine/android/api/VineUser
    //   156: astore 48
    //   158: aload 48
    //   160: ifnull -37 -> 123
    //   163: aload 11
    //   165: lload 46
    //   167: invokestatic 140	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   170: aload 48
    //   172: invokevirtual 474	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   175: pop
    //   176: goto -53 -> 123
    //   179: aload 13
    //   181: invokeinterface 528 1 0
    //   186: invokestatic 411	java/lang/System:currentTimeMillis	()J
    //   189: lstore 14
    //   191: aload 10
    //   193: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   196: istore 16
    //   198: iconst_0
    //   199: istore 17
    //   201: iload 16
    //   203: ifne +100 -> 303
    //   206: aload 9
    //   208: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   211: new 142	android/content/ContentValues
    //   214: dup
    //   215: invokespecial 643	android/content/ContentValues:<init>	()V
    //   218: astore 18
    //   220: aload 10
    //   222: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   225: invokeinterface 609 1 0
    //   230: astore 20
    //   232: aload 20
    //   234: invokeinterface 614 1 0
    //   239: ifeq +53 -> 292
    //   242: aload 20
    //   244: invokeinterface 618 1 0
    //   249: checkcast 415	co/vine/android/api/VineUser
    //   252: astore 44
    //   254: aload 18
    //   256: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   259: aload_0
    //   260: aload 18
    //   262: aload 44
    //   264: lload 14
    //   266: invokespecial 1299	co/vine/android/provider/VineDatabaseHelper:fillUserContentValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineUser;J)V
    //   269: aload 9
    //   271: ldc_w 770
    //   274: ldc 181
    //   276: aload 18
    //   278: invokevirtual 671	android/database/sqlite/SQLiteDatabase:insert	(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    //   281: lconst_0
    //   282: lcmp
    //   283: ifle +666 -> 949
    //   286: iconst_1
    //   287: istore 45
    //   289: goto +650 -> 939
    //   292: aload 9
    //   294: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   297: aload_0
    //   298: aload 9
    //   300: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   303: aload 11
    //   305: invokevirtual 1038	java/util/HashMap:isEmpty	()Z
    //   308: istore 21
    //   310: iconst_0
    //   311: istore 22
    //   313: iload 21
    //   315: ifne +147 -> 462
    //   318: aload 9
    //   320: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   323: new 142	android/content/ContentValues
    //   326: dup
    //   327: invokespecial 643	android/content/ContentValues:<init>	()V
    //   330: astore 23
    //   332: aload 11
    //   334: invokevirtual 1039	java/util/HashMap:values	()Ljava/util/Collection;
    //   337: invokeinterface 609 1 0
    //   342: astore 25
    //   344: aload 25
    //   346: invokeinterface 614 1 0
    //   351: ifeq +100 -> 451
    //   354: aload 25
    //   356: invokeinterface 618 1 0
    //   361: checkcast 415	co/vine/android/api/VineUser
    //   364: astore 40
    //   366: aload 23
    //   368: invokevirtual 1042	android/content/ContentValues:clear	()V
    //   371: aload_0
    //   372: aload 23
    //   374: aload 40
    //   376: lload 14
    //   378: invokespecial 1299	co/vine/android/provider/VineDatabaseHelper:fillUserContentValues	(Landroid/content/ContentValues;Lco/vine/android/api/VineUser;J)V
    //   381: iconst_1
    //   382: anewarray 543	java/lang/String
    //   385: astore 41
    //   387: aload 41
    //   389: iconst_0
    //   390: aload 40
    //   392: getfield 416	co/vine/android/api/VineUser:userId	J
    //   395: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   398: aastore
    //   399: aload 9
    //   401: ldc_w 770
    //   404: aload 23
    //   406: ldc_w 772
    //   409: aload 41
    //   411: invokevirtual 788	android/database/sqlite/SQLiteDatabase:update	(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    //   414: istore 42
    //   416: iload 42
    //   418: ifle +27 -> 445
    //   421: iconst_1
    //   422: istore 43
    //   424: iload 22
    //   426: iload 43
    //   428: iadd
    //   429: istore 22
    //   431: goto -87 -> 344
    //   434: astore 19
    //   436: aload_0
    //   437: aload 9
    //   439: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   442: aload 19
    //   444: athrow
    //   445: iconst_0
    //   446: istore 43
    //   448: goto -24 -> 424
    //   451: aload 9
    //   453: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   456: aload_0
    //   457: aload 9
    //   459: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   462: iconst_0
    //   463: istore 26
    //   465: iload 17
    //   467: ifle +488 -> 955
    //   470: aload 9
    //   472: ldc_w 770
    //   475: getstatic 1049	co/vine/android/provider/VineDatabaseSQL$TableQuery:PROJECTION	[Ljava/lang/String;
    //   478: aconst_null
    //   479: aconst_null
    //   480: aconst_null
    //   481: aconst_null
    //   482: aconst_null
    //   483: invokevirtual 632	android/database/sqlite/SQLiteDatabase:query	(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    //   486: astore 27
    //   488: iconst_0
    //   489: istore 26
    //   491: aload 27
    //   493: ifnull +462 -> 955
    //   496: aload 27
    //   498: invokeinterface 521 1 0
    //   503: istore 28
    //   505: iconst_0
    //   506: istore 26
    //   508: iload 28
    //   510: ifeq +445 -> 955
    //   513: aload 27
    //   515: invokeinterface 775 1 0
    //   520: istore 29
    //   522: iconst_0
    //   523: istore 26
    //   525: iload 29
    //   527: sipush 10000
    //   530: if_icmple +195 -> 725
    //   533: aload 9
    //   535: ldc_w 1301
    //   538: aconst_null
    //   539: invokevirtual 1055	android/database/sqlite/SQLiteDatabase:rawQuery	(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    //   542: astore 33
    //   544: aload 9
    //   546: invokevirtual 642	android/database/sqlite/SQLiteDatabase:beginTransaction	()V
    //   549: iconst_0
    //   550: istore 26
    //   552: aload 33
    //   554: ifnull +160 -> 714
    //   557: aload 33
    //   559: invokeinterface 521 1 0
    //   564: istore 34
    //   566: iconst_0
    //   567: istore 26
    //   569: iload 34
    //   571: ifeq +143 -> 714
    //   574: aload 33
    //   576: iconst_0
    //   577: invokeinterface 525 2 0
    //   582: lstore 35
    //   584: iconst_1
    //   585: anewarray 543	java/lang/String
    //   588: astore 37
    //   590: aload 37
    //   592: iconst_0
    //   593: lload 35
    //   595: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   598: aastore
    //   599: aload 9
    //   601: ldc_w 1303
    //   604: aload 37
    //   606: invokevirtual 835	android/database/sqlite/SQLiteDatabase:execSQL	(Ljava/lang/String;[Ljava/lang/Object;)V
    //   609: iconst_1
    //   610: anewarray 543	java/lang/String
    //   613: astore 38
    //   615: aload 38
    //   617: iconst_0
    //   618: lload 35
    //   620: invokestatic 546	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   623: aastore
    //   624: aload 9
    //   626: ldc_w 770
    //   629: ldc_w 837
    //   632: aload 38
    //   634: invokevirtual 756	android/database/sqlite/SQLiteDatabase:delete	(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    //   637: istore 26
    //   639: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   642: ifeq +65 -> 707
    //   645: ldc_w 1057
    //   648: new 476	java/lang/StringBuilder
    //   651: dup
    //   652: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   655: ldc_w 1059
    //   658: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   661: iload 29
    //   663: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   666: ldc_w 1061
    //   669: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   672: sipush 10000
    //   675: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   678: ldc_w 1063
    //   681: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   684: iload 26
    //   686: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   689: ldc_w 1305
    //   692: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   695: lload 35
    //   697: invokevirtual 808	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   700: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   703: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   706: pop
    //   707: aload 33
    //   709: invokeinterface 528 1 0
    //   714: aload 9
    //   716: invokevirtual 679	android/database/sqlite/SQLiteDatabase:setTransactionSuccessful	()V
    //   719: aload_0
    //   720: aload 9
    //   722: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   725: aload 27
    //   727: invokeinterface 528 1 0
    //   732: goto +223 -> 955
    //   735: iload_2
    //   736: iconst_m1
    //   737: if_icmpeq +38 -> 775
    //   740: aload_0
    //   741: aload_1
    //   742: iload_2
    //   743: aload_3
    //   744: aload 6
    //   746: aload 7
    //   748: invokespecial 800	co/vine/android/provider/VineDatabaseHelper:mergeUserGroups	(Ljava/util/Collection;ILjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    //   751: iload 4
    //   753: ifgt +8 -> 761
    //   756: iload 5
    //   758: ifle +17 -> 775
    //   761: aload_0
    //   762: iconst_1
    //   763: iload_2
    //   764: aload_3
    //   765: iload 4
    //   767: iload 5
    //   769: lconst_0
    //   770: iconst_1
    //   771: invokevirtual 1075	co/vine/android/provider/VineDatabaseHelper:savePageCursor	(IILjava/lang/String;IIJZ)I
    //   774: pop
    //   775: aload_0
    //   776: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   779: getstatic 716	co/vine/android/provider/Vine$UserGroupsView:CONTENT_URI	Landroid/net/Uri;
    //   782: aconst_null
    //   783: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   786: aload_0
    //   787: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   790: getstatic 1308	co/vine/android/provider/Vine$UserGroupsView:CONTENT_URI_FIND_FRIENDS_TWITTER	Landroid/net/Uri;
    //   793: aconst_null
    //   794: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   797: aload_0
    //   798: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   801: getstatic 1311	co/vine/android/provider/Vine$UserGroupsView:CONTENT_URI_FIND_FRIENDS_ADDRESS	Landroid/net/Uri;
    //   804: aconst_null
    //   805: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   808: aload_0
    //   809: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   812: getstatic 1314	co/vine/android/provider/Vine$UserGroupsView:CONTENT_URI_LIKERS	Landroid/net/Uri;
    //   815: aconst_null
    //   816: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   819: aload_0
    //   820: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   823: getstatic 1317	co/vine/android/provider/Vine$UserGroupsView:CONTENT_URI_FOLLOWERS	Landroid/net/Uri;
    //   826: aconst_null
    //   827: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   830: aload_0
    //   831: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   834: getstatic 803	co/vine/android/provider/Vine$UserGroupsView:CONTENT_URI_FOLLOWING	Landroid/net/Uri;
    //   837: aconst_null
    //   838: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   841: aload_0
    //   842: getfield 76	co/vine/android/provider/VineDatabaseHelper:mContentResolver	Landroid/content/ContentResolver;
    //   845: getstatic 849	co/vine/android/provider/Vine$UserGroupsView:CONTENT_URI_USER_SEARCH_RESULTS	Landroid/net/Uri;
    //   848: aconst_null
    //   849: invokevirtual 691	android/content/ContentResolver:notifyChange	(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    //   852: getstatic 57	co/vine/android/provider/VineDatabaseHelper:LOGGABLE	Z
    //   855: ifeq +57 -> 912
    //   858: ldc 34
    //   860: new 476	java/lang/StringBuilder
    //   863: dup
    //   864: invokespecial 477	java/lang/StringBuilder:<init>	()V
    //   867: ldc_w 1067
    //   870: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   873: iload 17
    //   875: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   878: ldc_w 1319
    //   881: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   884: iload 22
    //   886: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   889: ldc_w 695
    //   892: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   895: iload_2
    //   896: invokevirtual 486	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   899: ldc_w 1071
    //   902: invokevirtual 483	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   905: invokevirtual 490	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   908: invokestatic 602	android/util/Log:d	(Ljava/lang/String;Ljava/lang/String;)I
    //   911: pop
    //   912: aload_0
    //   913: monitorexit
    //   914: iload 17
    //   916: ireturn
    //   917: astore 24
    //   919: aload_0
    //   920: aload 9
    //   922: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   925: aload 24
    //   927: athrow
    //   928: astore 32
    //   930: aload_0
    //   931: aload 9
    //   933: invokevirtual 676	co/vine/android/provider/VineDatabaseHelper:safeFinishTransaction	(Landroid/database/sqlite/SQLiteDatabase;)V
    //   936: aload 32
    //   938: athrow
    //   939: iload 17
    //   941: iload 45
    //   943: iadd
    //   944: istore 17
    //   946: goto -714 -> 232
    //   949: iconst_0
    //   950: istore 45
    //   952: goto -13 -> 939
    //   955: iload 17
    //   957: ifgt -222 -> 735
    //   960: iload 22
    //   962: ifgt -227 -> 735
    //   965: iload 26
    //   967: ifle -115 -> 852
    //   970: goto -235 -> 735
    //
    // Exception table:
    //   from	to	target	type
    //   2	46	87	finally
    //   46	84	87	finally
    //   94	118	87	finally
    //   123	158	87	finally
    //   163	176	87	finally
    //   179	186	87	finally
    //   186	198	87	finally
    //   206	211	87	finally
    //   297	303	87	finally
    //   303	310	87	finally
    //   318	323	87	finally
    //   436	445	87	finally
    //   456	462	87	finally
    //   470	488	87	finally
    //   496	505	87	finally
    //   513	522	87	finally
    //   719	725	87	finally
    //   725	732	87	finally
    //   740	751	87	finally
    //   761	775	87	finally
    //   775	852	87	finally
    //   852	912	87	finally
    //   919	928	87	finally
    //   930	939	87	finally
    //   211	232	434	finally
    //   232	286	434	finally
    //   292	297	434	finally
    //   323	344	917	finally
    //   344	416	917	finally
    //   451	456	917	finally
    //   533	549	928	finally
    //   557	566	928	finally
    //   574	707	928	finally
    //   707	714	928	finally
    //   714	719	928	finally
  }

  public void onCreate(SQLiteDatabase paramSQLiteDatabase)
  {
    createTables(paramSQLiteDatabase);
  }

  public void onUpgrade(SQLiteDatabase paramSQLiteDatabase, int paramInt1, int paramInt2)
  {
    if (LOGGABLE)
      Log.d("VineDH", "Upgrading from " + paramInt1 + " to " + paramInt2);
    dropTables(paramSQLiteDatabase);
    createTables(paramSQLiteDatabase);
  }

  public int removeFollow(long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramLong);
      Cursor localCursor = localSQLiteDatabase.query("users", new String[] { "following_flag" }, "user_id=?", arrayOfString, null, null, null);
      int i;
      if ((localCursor != null) && (localCursor.getCount() > 0))
      {
        localCursor.moveToFirst();
        int j = Friendships.unsetFriendship(localCursor.getInt(0), 1);
        ContentValues localContentValues = new ContentValues();
        localContentValues.put("following_flag", Integer.valueOf(j));
        localCursor.close();
        i = localSQLiteDatabase.update("users", localContentValues, "user_id=?", arrayOfString);
        if (paramBoolean1)
          removeUserWithType(paramLong, 1, paramBoolean2, Vine.UserGroupsView.CONTENT_URI_FOLLOWING);
        if (LOGGABLE)
          Log.d("VineDH", "Unfollowed user " + paramLong);
      }
      while (true)
      {
        return i;
        i = -1;
      }
    }
    finally
    {
    }
  }

  public void removeFollowRequest(long paramLong)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        String[] arrayOfString1 = new String[2];
        arrayOfString1[0] = String.valueOf(13);
        arrayOfString1[1] = String.valueOf(paramLong);
        int i = localSQLiteDatabase.delete("activity", "notification_type=? AND user_id=?", arrayOfString1);
        String[] arrayOfString2 = { "follow_status" };
        String[] arrayOfString3 = new String[1];
        arrayOfString3[0] = String.valueOf(paramLong);
        Cursor localCursor = localSQLiteDatabase.query("users", arrayOfString2, "user_id=?", arrayOfString3, null, null, null);
        if (localCursor != null)
        {
          if ((localCursor.moveToFirst()) && (localCursor.getCount() > 0))
          {
            int j = 0xFFFFFFFE & localCursor.getInt(0);
            ContentValues localContentValues = new ContentValues();
            localContentValues.put("follow_status", Integer.valueOf(j));
            String[] arrayOfString4 = new String[1];
            arrayOfString4[0] = String.valueOf(paramLong);
            localSQLiteDatabase.update("users", localContentValues, "user_id=?", arrayOfString4);
          }
          localCursor.close();
        }
        localSQLiteDatabase.setTransactionSuccessful();
        safeFinishTransaction(localSQLiteDatabase);
        if (i > 0)
        {
          this.mContentResolver.notifyChange(Vine.Activity.CONTENT_URI, null);
          this.mContentResolver.notifyChange(Vine.Activity.CONTENT_URI_WITH_FOLLOW_REQUESTS, null);
          this.mContentResolver.notifyChange(Vine.Activity.CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL, null);
        }
        if (LOGGABLE)
          Log.d("VineDH", "Follow request removed, deleted " + i + " row from activity and updated user " + paramLong);
        return;
      }
      finally
      {
        safeFinishTransaction(localSQLiteDatabase);
      }
    }
    finally
    {
    }
  }

  public int removeLike(long paramLong1, long paramLong2, boolean paramBoolean)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        localSQLiteDatabase.beginTransaction();
        String[] arrayOfString1 = new String[1];
        arrayOfString1[0] = String.valueOf(paramLong1);
        Cursor localCursor = localSQLiteDatabase.query("posts", new String[] { "metadata_flags" }, "post_id=?", arrayOfString1, null, null, null);
        int i = 0;
        if (localCursor != null)
        {
          int j = localCursor.getCount();
          i = 0;
          if (j > 0)
          {
            localCursor.moveToFirst();
            ContentValues localContentValues = new ContentValues();
            localContentValues.put("metadata_flags", Integer.valueOf(0xFFFFFFF7 & localCursor.getInt(0)));
            localCursor.close();
            if (LOGGABLE)
              Log.d("VineDH", "Removing like in post: " + paramLong1);
            if (localSQLiteDatabase.update("posts", localContentValues, "post_id=?", arrayOfString1) <= 0)
              break label290;
          }
        }
        label290: for (i = 1; ; i = 0)
        {
          String[] arrayOfString2 = new String[2];
          arrayOfString2[0] = String.valueOf(paramLong1);
          arrayOfString2[1] = String.valueOf(paramLong2);
          int k = localSQLiteDatabase.delete("likes", "post_id=? AND user_id=?", arrayOfString2) + removePostsFromGroupByPostId(3, paramLong1);
          localSQLiteDatabase.setTransactionSuccessful();
          if (LOGGABLE)
            Log.d("VineDH", "Deleted self like for post: " + paramLong1);
          safeFinishTransaction(localSQLiteDatabase);
          if ((paramBoolean) && ((i > 0) || (k > 0)))
            notifyPostCommentsViewUris();
          return i;
        }
      }
      finally
      {
        safeFinishTransaction(localSQLiteDatabase);
      }
    }
    finally
    {
    }
  }

  public void removePostsByReposterId(long paramLong)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      String[] arrayOfString = new String[2];
      arrayOfString[0] = String.valueOf(paramLong);
      arrayOfString[1] = String.valueOf(1);
      int i = localSQLiteDatabase.delete("post_groups", "reposter_id=? AND post_type =?", arrayOfString);
      if (LOGGABLE)
        Log.d("VineDH", "Deleted " + i + " posts with reposterId=" + paramLong);
      if (i > 0)
      {
        this.mContentResolver.notifyChange(Vine.PostGroupsView.CONTENT_URI, null);
        this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI, null);
        this.mContentResolver.notifyChange(Vine.PostCommentsLikesView.CONTENT_URI_ALL_TIMELINE, null);
      }
      return;
    }
    finally
    {
    }
  }

  public int removePostsFromGroupByUser(long paramLong, int paramInt, String paramString)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      String[] arrayOfString1 = VineDatabaseSQL.PostGroupsQuery.PROJECTION;
      String[] arrayOfString2 = new String[3];
      arrayOfString2[0] = String.valueOf(paramLong);
      arrayOfString2[1] = String.valueOf(paramInt);
      arrayOfString2[2] = paramString;
      Cursor localCursor = localSQLiteDatabase.query("post_groups_view", arrayOfString1, "user_id=? AND post_type=? AND tag=?", arrayOfString2, null, null, null);
      ArrayList localArrayList = new ArrayList();
      if ((localCursor != null) && (localCursor.moveToFirst()))
      {
        do
          localArrayList.add(String.valueOf(localCursor.getLong(0)));
        while (localCursor.moveToNext());
        localCursor.close();
      }
      StringBuilder localStringBuilder = new StringBuilder();
      int i = localArrayList.size();
      for (int j = 0; j < i; j++)
      {
        localStringBuilder.append("?");
        if ((j < i - 1) && (i != 1))
          localStringBuilder.append(",");
      }
      try
      {
        localSQLiteDatabase.beginTransaction();
        String[] arrayOfString3 = new String[localArrayList.size()];
        localArrayList.add(String.valueOf(paramInt));
        String str = " IN (" + localStringBuilder.toString() + ") AND " + "post_type" + "=?";
        int k = localSQLiteDatabase.delete("post_groups", "post_id" + str, (String[])localArrayList.toArray(arrayOfString3));
        localSQLiteDatabase.setTransactionSuccessful();
        if (LOGGABLE)
          Log.d("VineDH", "Due to unfollowing " + paramLong + " deleting " + k + " groups " + " , of type " + paramInt + " and tag " + paramString);
        safeFinishTransaction(localSQLiteDatabase);
        if (k > 0)
          notifyPostCommentsViewUris();
        return k;
      }
      finally
      {
        localObject2 = finally;
        safeFinishTransaction(localSQLiteDatabase);
        throw localObject2;
      }
    }
    finally
    {
    }
  }

  public boolean removeUserWithType(long paramLong, int paramInt, boolean paramBoolean, Uri paramUri)
  {
    boolean bool = true;
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      String[] arrayOfString = new String[2];
      arrayOfString[0] = String.valueOf(paramInt);
      arrayOfString[1] = String.valueOf(paramLong);
      if (localSQLiteDatabase.delete("user_groups", "type=? AND user_id=?", arrayOfString) > 0)
      {
        if (paramBoolean)
          this.mContentResolver.notifyChange(paramUri, null);
        if (LOGGABLE)
          Log.d("VineDH", "Deleted user with userId=" + paramLong + " of type=" + paramInt);
      }
      while (true)
      {
        return bool;
        bool = false;
      }
    }
    finally
    {
    }
  }

  public void removeUsersByGroup(int paramInt)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      String[] arrayOfString = new String[1];
      arrayOfString[0] = String.valueOf(paramInt);
      int i = localSQLiteDatabase.delete("user_groups", "type=?", arrayOfString);
      if (LOGGABLE)
        Log.d("VineDH", "Deleted " + i + " users of type " + paramInt);
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public int revine(VineRepost paramVineRepost, long paramLong, boolean paramBoolean)
  {
    while (true)
    {
      SQLiteDatabase localSQLiteDatabase;
      try
      {
        localSQLiteDatabase = getWritableDatabase();
        try
        {
          localSQLiteDatabase.beginTransaction();
          String[] arrayOfString1 = new String[1];
          arrayOfString1[0] = String.valueOf(paramVineRepost.postId);
          Cursor localCursor1 = localSQLiteDatabase.query("posts", new String[] { "metadata_flags" }, "post_id=?", arrayOfString1, null, null, null);
          int i = 0;
          if (localCursor1 != null)
          {
            int j = localCursor1.getCount();
            i = 0;
            if (j > 0)
            {
              boolean bool = localCursor1.moveToFirst();
              i = 0;
              if (bool)
              {
                ContentValues localContentValues1 = new ContentValues();
                localContentValues1.put("metadata_flags", Integer.valueOf(0x10 | localCursor1.getInt(0)));
                localContentValues1.put("my_repost_id", Long.valueOf(paramVineRepost.repostId));
                localCursor1.close();
                if (LOGGABLE)
                  Log.d("VineDH", "Revined post " + paramVineRepost.postId);
                if (localSQLiteDatabase.update("posts", localContentValues1, "post_id=?", arrayOfString1) <= 0)
                  continue;
                i = 1;
              }
            }
            localCursor1.close();
          }
          else
          {
            String[] arrayOfString2 = { "repost_data" };
            String[] arrayOfString3 = new String[3];
            arrayOfString3[0] = String.valueOf(paramVineRepost.postId);
            arrayOfString3[1] = String.valueOf(2);
            arrayOfString3[2] = String.valueOf(paramLong);
            Cursor localCursor2 = localSQLiteDatabase.query("post_groups", arrayOfString2, "post_id=? AND post_type=? AND tag=?", arrayOfString3, null, null, null);
            if (localCursor2 != null)
            {
              if ((localCursor2.getCount() <= 0) || (!localCursor2.moveToFirst()))
                break label580;
              localVineRepost = (VineRepost)Util.fromByteArray(localCursor2.getBlob(0));
              if (localVineRepost == null)
                continue;
              long l1 = paramVineRepost.repostId;
              localVineRepost.repostId = l1;
              ContentValues localContentValues3 = new ContentValues();
              localContentValues3.put("repost_data", Util.toByteArray(localVineRepost));
              localContentValues3.put("sort_id", Long.valueOf(paramVineRepost.repostId));
              String[] arrayOfString4 = new String[3];
              arrayOfString4[0] = String.valueOf(paramVineRepost.postId);
              arrayOfString4[1] = String.valueOf(2);
              arrayOfString4[2] = String.valueOf(paramLong);
              localSQLiteDatabase.update("post_groups", localContentValues3, "post_id=? AND post_type=? AND tag=?", arrayOfString4);
              if (LOGGABLE)
                Log.d("VineDH", "Updated repost data for post " + localVineRepost.postId + " with repost id " + localVineRepost.repostId + " for user timeline.");
              localCursor2.close();
            }
            localSQLiteDatabase.setTransactionSuccessful();
            safeFinishTransaction(localSQLiteDatabase);
            if ((paramBoolean) && (i > 0))
              notifyPostCommentsViewUris();
            return i;
          }
          i = 0;
          continue;
          VineRepost localVineRepost = new VineRepost();
          long l2 = paramVineRepost.repostId;
          localVineRepost.repostId = l2;
          long l3 = paramVineRepost.postId;
          localVineRepost.postId = l3;
          continue;
        }
        finally
        {
          safeFinishTransaction(localSQLiteDatabase);
        }
      }
      finally
      {
      }
      label580: ContentValues localContentValues2 = new ContentValues();
      localContentValues2.put("post_type", Integer.valueOf(2));
      localContentValues2.put("post_id", Long.valueOf(paramVineRepost.postId));
      localContentValues2.put("sort_id", Long.valueOf(paramVineRepost.repostId));
      localContentValues2.put("tag", Long.valueOf(paramLong));
      localContentValues2.put("repost_data", Util.toByteArray(paramVineRepost));
      localSQLiteDatabase.insert("post_groups", "post_id", localContentValues2);
      if (LOGGABLE)
        Log.d("VineDH", "Inserted repost data for post " + paramVineRepost.postId + " with repost id " + paramVineRepost.repostId + " for user timeline.");
    }
  }

  public void safeFinishTransaction(SQLiteDatabase paramSQLiteDatabase)
  {
    if (paramSQLiteDatabase.inTransaction());
    try
    {
      paramSQLiteDatabase.endTransaction();
      return;
    }
    catch (SQLiteDiskIOException localSQLiteDiskIOException)
    {
      throw localSQLiteDiskIOException;
    }
    catch (SQLiteFullException localSQLiteFullException)
    {
      while (true)
      {
        long l1 = -1L;
        try
        {
          long l2 = Util.getCacheSize(this.mAppContext);
          l1 = l2;
          AppController.clearFileCache(this.mAppContext);
        }
        catch (VineException localVineException1)
        {
          try
          {
            VineException localVineException2 = new VineException();
            Object[] arrayOfObject2 = new Object[2];
            arrayOfObject2[0] = Long.valueOf(l1);
            arrayOfObject2[1] = Long.valueOf(Util.getCacheSize(this.mAppContext));
            CrashUtil.logException(localVineException2, "Db full, cleaned cache from {} to {}.", arrayOfObject2);
            if (!paramSQLiteDatabase.inTransaction())
              continue;
            paramSQLiteDatabase.endTransaction();
            return;
            localVineException1 = localVineException1;
            CrashUtil.logException(localSQLiteFullException);
          }
          catch (VineException localVineException3)
          {
            while (true)
            {
              VineException localVineException4 = new VineException();
              Object[] arrayOfObject1 = new Object[1];
              arrayOfObject1[0] = Long.valueOf(l1);
              CrashUtil.logException(localVineException4, "Db full, cleaned cache from {} to unknown.", arrayOfObject1);
            }
          }
        }
      }
    }
    catch (SQLiteException localSQLiteException)
    {
      throw localSQLiteException;
    }
  }

  public int savePageCursor(int paramInt1, int paramInt2, String paramString, int paramInt3, int paramInt4, long paramLong, boolean paramBoolean)
  {
    SQLiteDatabase localSQLiteDatabase;
    ContentValues localContentValues;
    int j;
    try
    {
      localSQLiteDatabase = getWritableDatabase();
      if (paramString == null)
        paramString = "";
      String[] arrayOfString = new String[3];
      arrayOfString[0] = String.valueOf(paramInt1);
      arrayOfString[1] = String.valueOf(paramInt2);
      arrayOfString[2] = paramString;
      Cursor localCursor = localSQLiteDatabase.query("page_cursors", VineDatabaseSQL.PageCursorsQuery.PROJECTION, "kind=? AND type=? AND tag=?", arrayOfString, null, null, null);
      localContentValues = new ContentValues();
      localContentValues.put("kind", Integer.valueOf(paramInt1));
      localContentValues.put("type", Integer.valueOf(paramInt2));
      localContentValues.put("tag", paramString);
      localContentValues.put("next_page", Integer.valueOf(paramInt3));
      localContentValues.put("previous_page", Integer.valueOf(paramInt4));
      localContentValues.put("anchor", Long.valueOf(paramLong));
      localContentValues.put("reversed", Boolean.valueOf(paramBoolean));
      if (localCursor != null)
        try
        {
          if (localCursor.getCount() == 1)
          {
            int m = localSQLiteDatabase.update("page_cursors", localContentValues, "kind=? AND type=? AND tag=?", arrayOfString);
            if (m > 0);
            for (int n = 1; ; n = 0)
            {
              j = 0 + n;
              localCursor.close();
              if ((LOGGABLE) && (j > 0))
                Log.d("VineDH", "Saved pagecursor of kind: " + paramInt1 + " type: " + paramInt2 + " tag: " + paramString + " next:" + paramInt3 + " prev: " + paramInt4 + " anchor: " + paramLong + " reverse: " + paramBoolean);
              return j;
            }
          }
          long l2 = localSQLiteDatabase.insert("page_cursors", "_id", localContentValues);
          if (l2 > 0L);
          for (int k = 1; ; k = 0)
          {
            j = 0 + k;
            break;
          }
        }
        finally
        {
          localCursor.close();
        }
    }
    finally
    {
    }
    long l1 = localSQLiteDatabase.insert("page_cursors", "_id", localContentValues);
    if (l1 > 0L);
    for (int i = 1; ; i = 0)
    {
      j = 0 + i;
      break;
    }
  }

  public int saveUserValue(String paramString, ContentValues paramContentValues)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      int i;
      if (localSQLiteDatabase.update("settings", paramContentValues, "name=?", new String[] { paramString }) == 0)
      {
        paramContentValues.put("name", paramString);
        long l = localSQLiteDatabase.insert("settings", "name", paramContentValues);
        boolean bool = l < 0L;
        i = 0;
        if (bool);
      }
      while (true)
      {
        return i;
        this.mContentResolver.notifyChange(Vine.Settings.CONTENT_URI, null);
        i = 1;
      }
    }
    finally
    {
    }
  }

  public boolean setShouldHideProfileRevines(long paramLong, boolean paramBoolean)
  {
    SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
    String[] arrayOfString = new String[1];
    arrayOfString[0] = String.valueOf(paramLong);
    ContentValues localContentValues = new ContentValues();
    int i;
    if (paramBoolean)
      i = 1;
    while (true)
    {
      localContentValues.put("hide_profile_reposts", Integer.valueOf(i));
      localSQLiteDatabase.beginTransaction();
      try
      {
        int j = localSQLiteDatabase.update("users", localContentValues, "user_id=?", arrayOfString);
        localSQLiteDatabase.setTransactionSuccessful();
        safeFinishTransaction(localSQLiteDatabase);
        return true;
        i = 0;
      }
      finally
      {
        safeFinishTransaction(localSQLiteDatabase);
      }
    }
    return false;
  }

  public boolean shouldHideProfileRevines(long paramLong)
  {
    SQLiteDatabase localSQLiteDatabase = getReadableDatabase();
    String[] arrayOfString = new String[1];
    arrayOfString[0] = String.valueOf(paramLong);
    Cursor localCursor = localSQLiteDatabase.query("users", new String[] { "hide_profile_reposts" }, "user_id=?", arrayOfString, null, null, null);
    boolean bool1 = false;
    if (localCursor != null);
    try
    {
      boolean bool2 = localCursor.moveToFirst();
      bool1 = false;
      if (bool2)
      {
        int i = localCursor.getInt(0);
        if (i <= 0)
          break label99;
      }
      label99: for (bool1 = true; ; bool1 = false)
        return bool1;
    }
    finally
    {
      localCursor.close();
    }
  }

  public int unRevine(long paramLong1, long paramLong2, boolean paramBoolean1, boolean paramBoolean2)
  {
    try
    {
      SQLiteDatabase localSQLiteDatabase = getWritableDatabase();
      try
      {
        String[] arrayOfString1 = new String[1];
        arrayOfString1[0] = String.valueOf(paramLong1);
        Cursor localCursor = localSQLiteDatabase.query("posts", new String[] { "metadata_flags" }, "post_id=?", arrayOfString1, null, null, null);
        int i = 0;
        if (localCursor != null)
        {
          int j = localCursor.getCount();
          i = 0;
          if (j > 0)
          {
            boolean bool = localCursor.moveToFirst();
            i = 0;
            if (bool)
            {
              ContentValues localContentValues1 = new ContentValues();
              localContentValues1.put("metadata_flags", Integer.valueOf(0xFFFFFFEF & localCursor.getInt(0)));
              localContentValues1.put("my_repost_id", Integer.valueOf(0));
              localCursor.close();
              if (LOGGABLE)
                Log.d("VineDH", "Unrevined post " + paramLong1);
              if (localSQLiteDatabase.update("posts", localContentValues1, "post_id=?", arrayOfString1) <= 0)
                break label440;
              i = 1;
            }
          }
          localCursor.close();
        }
        else
        {
          String[] arrayOfString2 = new String[3];
          arrayOfString2[0] = String.valueOf(paramLong1);
          arrayOfString2[1] = String.valueOf(2);
          arrayOfString2[2] = String.valueOf(paramLong2);
          int k = localSQLiteDatabase.delete("post_groups", "post_id=? AND post_type=? AND tag=?", arrayOfString2);
          if (LOGGABLE)
            Log.d("VineDH", "Deleted " + k + " with tag " + paramLong2 + " and type " + 2 + " and post id " + paramLong1 + " due to unrevining.");
          if (paramBoolean1)
            break label446;
          String[] arrayOfString3 = new String[2];
          arrayOfString3[0] = String.valueOf(paramLong1);
          arrayOfString3[1] = String.valueOf(1);
          int m = k + localSQLiteDatabase.delete("post_groups", "post_id=? AND post_type=?", arrayOfString3);
          if (LOGGABLE)
            Log.d("VineDH", "Deleted " + m + " for type " + 1 + " and post id " + paramLong1 + " due to unrevining.");
        }
        while (true)
        {
          safeFinishTransaction(localSQLiteDatabase);
          if (paramBoolean2)
            notifyPostCommentsViewUris();
          return i;
          label440: i = 0;
          break;
          label446: ContentValues localContentValues2 = new ContentValues();
          localContentValues2.putNull("repost_data");
          String[] arrayOfString4 = new String[2];
          arrayOfString4[0] = String.valueOf(paramLong1);
          arrayOfString4[1] = String.valueOf(1);
          int n = localSQLiteDatabase.update("post_groups", localContentValues2, "post_id=? AND post_type=?", arrayOfString4);
          Log.d("VineDH", "Removed   " + n + " repost data for type " + 1 + " and post id " + paramLong1 + " due to unrevining.");
        }
      }
      finally
      {
        safeFinishTransaction(localSQLiteDatabase);
      }
    }
    finally
    {
    }
  }
}

/* Location:           /Users/dantheman/src/android/decompiled/vine-decompiled/dex2jar/classes-dex2jar.jar
 * Qualified Name:     co.vine.android.provider.VineDatabaseHelper
 * JD-Core Version:    0.6.2
 */