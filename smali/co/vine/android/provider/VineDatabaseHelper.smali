.class public Lco/vine/android/provider/VineDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "VineDatabaseHelper.java"


# static fields
.field public static final DATABASE_VERSION:I = 0x12

.field private static final DB_NAME:Ljava/lang/String; = "vine"

#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field private static final MAX_ACTIVITY_TABLE_SIZE:I = 0x1f4

.field private static final MAX_COMMENTS_TABLE_SIZE:I = 0x1388

.field private static final MAX_LIKES_TABLE_SIZE:I = 0x1388

.field private static final MAX_POST_TABLE_SIZE:I = 0x3e8

.field private static final MAX_USERS_TABLE_SIZE:I = 0x2710

.field public static final SCHEMA_VERSION:I = 0x1

.field private static final SEPARATOR:Ljava/lang/String; = "-"

.field public static final SETTINGS_NAME_SELECTION:Ljava/lang/String; = "name=?"

.field private static final TAG:Ljava/lang/String; = "VineDH"

.field private static final sHelperMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lco/vine/android/provider/VineDatabaseHelper;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mAppContext:Landroid/content/Context;

.field private final mContentResolver:Landroid/content/ContentResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 80
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VineDH"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lco/vine/android/provider/VineDatabaseHelper;->sHelperMap:Ljava/util/HashMap;

    return-void

    .line 80
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "name"

    .prologue
    .line 115
    const/4 v0, 0x0

    const/16 v1, 0x12

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 116
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    .line 117
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mAppContext:Landroid/content/Context;

    .line 118
    return-void
.end method

.method private dropTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 154
    const-string v0, "DROP VIEW IF EXISTS  user_groups_view;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 155
    const-string v0, "DROP VIEW IF EXISTS  post_groups_view;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 156
    const-string v0, "DROP VIEW IF EXISTS  post_comments_likes_view;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 157
    const-string v0, "DROP TABLE IF EXISTS users;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 158
    const-string v0, "DROP TABLE IF EXISTS settings;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 159
    const-string v0, "DROP TABLE IF EXISTS user_groups;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 160
    const-string v0, "DROP TABLE IF EXISTS comments;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 161
    const-string v0, "DROP TABLE IF EXISTS activity;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 162
    const-string v0, "DROP TABLE IF EXISTS likes;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 163
    const-string v0, "DROP TABLE IF EXISTS posts;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 164
    const-string v0, "DROP TABLE IF EXISTS post_groups;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 165
    const-string v0, "DROP TABLE IF EXISTS page_cursors;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 166
    const-string v0, "DROP TABLE IF EXISTS tag_search_results;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 167
    const-string v0, "DROP TABLE IF EXISTS tag_search_results;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 168
    const-string v0, "DROP TABLE IF EXISTS channels;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 169
    const-string v0, "DROP TABLE IF EXISTS notifications;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 170
    const-string v0, "DROP TABLE IF EXISTS tag_recently_used;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 171
    const-string v0, "DROP TABLE IF EXISTS editions;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 172
    return-void
.end method

.method private fillActivityValues(Landroid/content/ContentValues;Lco/vine/android/api/VineNotification;J)V
    .locals 3
    .parameter "values"
    .parameter "notif"
    .parameter "lastRefresh"

    .prologue
    .line 2678
    const-string v0, "notification_id"

    iget-wide v1, p2, Lco/vine/android/api/VineNotification;->notificationId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2680
    iget v0, p2, Lco/vine/android/api/VineNotification;->notificationType:I

    packed-switch v0, :pswitch_data_0

    .line 2694
    :pswitch_0
    const-string v0, "notification_type"

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2699
    :goto_0
    iget v0, p2, Lco/vine/android/api/VineNotification;->notificationType:I

    packed-switch v0, :pswitch_data_1

    .line 2705
    const-string v0, "sort_id"

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2710
    :goto_1
    const-string v0, "avatar_url"

    iget-object v1, p2, Lco/vine/android/api/VineNotification;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2711
    const-string v0, "thumbnail_url"

    iget-object v1, p2, Lco/vine/android/api/VineNotification;->thumbnailUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2712
    const-string v0, "post_id"

    iget-wide v1, p2, Lco/vine/android/api/VineNotification;->postId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2713
    const-string v0, "user_id"

    iget-wide v1, p2, Lco/vine/android/api/VineNotification;->userId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2714
    const-string v0, "username"

    iget-object v1, p2, Lco/vine/android/api/VineNotification;->username:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2715
    const-string v0, "comment"

    iget-object v1, p2, Lco/vine/android/api/VineNotification;->comment:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2716
    const-string v0, "timestamp"

    iget-wide v1, p2, Lco/vine/android/api/VineNotification;->createdAt:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2717
    const-string v0, "follow_status"

    iget v1, p2, Lco/vine/android/api/VineNotification;->followStatus:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2718
    const-string v0, "last_refresh"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2720
    iget-object v0, p2, Lco/vine/android/api/VineNotification;->entities:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 2721
    const-string v0, "entities"

    iget-object v1, p2, Lco/vine/android/api/VineNotification;->entities:Ljava/util/ArrayList;

    invoke-static {v1}, Lco/vine/android/util/Util;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2723
    :cond_0
    return-void

    .line 2690
    :pswitch_1
    const-string v0, "notification_type"

    iget v1, p2, Lco/vine/android/api/VineNotification;->notificationType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    .line 2701
    :pswitch_2
    const-string v0, "sort_id"

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_1

    .line 2680
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 2699
    :pswitch_data_1
    .packed-switch 0xd
        :pswitch_2
    .end packed-switch
.end method

.method private fillChannelValues(Landroid/content/ContentValues;Lco/vine/android/api/VineChannel;)V
    .locals 3
    .parameter "values"
    .parameter "channel"

    .prologue
    .line 2726
    const-string v0, "channel_id"

    iget-wide v1, p2, Lco/vine/android/api/VineChannel;->channelId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2727
    const-string v0, "channel"

    iget-object v1, p2, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2728
    const-string v0, "retinaIconUrl"

    iget-object v1, p2, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2729
    const-string v0, "background_color"

    iget-object v1, p2, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2730
    const-string v0, "font_color"

    iget-object v1, p2, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2731
    const-string v0, "timestamp"

    iget-wide v1, p2, Lco/vine/android/api/VineChannel;->created:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2732
    return-void
.end method

.method private fillCommentValues(Landroid/content/ContentValues;Lco/vine/android/api/VineComment;J)V
    .locals 3
    .parameter "values"
    .parameter "comment"
    .parameter "lastRefresh"

    .prologue
    .line 2660
    const-string v0, "comment_id"

    iget-wide v1, p2, Lco/vine/android/api/VineComment;->commentId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2661
    const-string v0, "user_id"

    iget-wide v1, p2, Lco/vine/android/api/VineComment;->userId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2662
    const-string v0, "post_id"

    iget-wide v1, p2, Lco/vine/android/api/VineComment;->postId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2663
    const-string v0, "avatar_url"

    iget-object v1, p2, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2664
    const-string v0, "comment"

    iget-object v1, p2, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2665
    const-string v0, "timestamp"

    iget-wide v1, p2, Lco/vine/android/api/VineComment;->timestamp:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2666
    const-string v0, "location"

    iget-object v1, p2, Lco/vine/android/api/VineComment;->location:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2667
    const-string v0, "username"

    iget-object v1, p2, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2668
    const-string v0, "verified"

    iget-boolean v1, p2, Lco/vine/android/api/VineComment;->verified:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 2669
    iget-object v0, p2, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 2670
    const-string v0, "entities"

    iget-object v1, p2, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    invoke-static {v1}, Lco/vine/android/util/Util;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2672
    :cond_0
    const-string v0, "last_refresh"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2673
    const-string v0, "is_last"

    iget-boolean v1, p2, Lco/vine/android/api/VineComment;->isLast:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 2674
    return-void
.end method

.method private fillLikeValues(Landroid/content/ContentValues;Lco/vine/android/api/VineLike;J)V
    .locals 3
    .parameter "values"
    .parameter "like"
    .parameter "lastRefresh"

    .prologue
    .line 2634
    const-string v0, "like_id"

    iget-wide v1, p2, Lco/vine/android/api/VineLike;->likeId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2635
    const-string v0, "user_id"

    iget-wide v1, p2, Lco/vine/android/api/VineLike;->userId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2636
    const-string v0, "post_id"

    iget-wide v1, p2, Lco/vine/android/api/VineLike;->postId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2637
    const-string v0, "avatar_url"

    iget-object v1, p2, Lco/vine/android/api/VineLike;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2638
    const-string v0, "timestamp"

    iget-wide v1, p2, Lco/vine/android/api/VineLike;->created:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2639
    const-string v0, "location"

    iget-object v1, p2, Lco/vine/android/api/VineLike;->location:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2640
    const-string v0, "username"

    iget-object v1, p2, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2641
    const-string v0, "verified"

    iget v1, p2, Lco/vine/android/api/VineLike;->verified:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2642
    const-string v0, "last_refresh"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2643
    return-void
.end method

.method private fillNotificationValues(Landroid/content/ContentValues;Lco/vine/android/api/VineNotification;Ljava/lang/String;)V
    .locals 3
    .parameter "values"
    .parameter "notification"
    .parameter "message"

    .prologue
    .line 2647
    const-string v0, "notification_id"

    iget-wide v1, p2, Lco/vine/android/api/VineNotification;->notificationId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2648
    const-string v0, "notification_type"

    iget v1, p2, Lco/vine/android/api/VineNotification;->notificationType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2649
    const-string v0, "message"

    invoke-virtual {p1, v0, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2650
    const-string v0, "cleared"

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2651
    return-void
.end method

.method private fillPostValues(Landroid/content/ContentValues;Lco/vine/android/api/VinePost;J)V
    .locals 3
    .parameter "values"
    .parameter "post"
    .parameter "lastRefresh"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2605
    const-string v0, "avatar_url"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2606
    const-string v0, "description"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2607
    const-string v0, "foursquare_venue_id"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2608
    const-string v0, "metadata_flags"

    iget v1, p2, Lco/vine/android/api/VinePost;->metadataFlags:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2609
    const-string v0, "location"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2610
    const-string v0, "post_flags"

    iget v1, p2, Lco/vine/android/api/VinePost;->postFlags:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2611
    const-string v0, "post_id"

    iget-wide v1, p2, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2612
    const-string v0, "my_repost_id"

    iget-wide v1, p2, Lco/vine/android/api/VinePost;->myRepostId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2613
    const-string v0, "share_url"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2614
    const-string v0, "thumbnail_url"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2615
    const-string v0, "video_url"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2616
    const-string v0, "video_low_uRL"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2617
    const-string v0, "timestamp"

    iget-wide v1, p2, Lco/vine/android/api/VinePost;->created:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2618
    const-string v0, "username"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2619
    const-string v0, "user_id"

    iget-wide v1, p2, Lco/vine/android/api/VinePost;->userId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2620
    const-string v0, "likes_count"

    iget v1, p2, Lco/vine/android/api/VinePost;->likesCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2621
    const-string v0, "reviners_count"

    iget v1, p2, Lco/vine/android/api/VinePost;->revinersCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2622
    const-string v0, "comments_count"

    iget v1, p2, Lco/vine/android/api/VinePost;->commentsCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2623
    const-string v0, "tags"

    invoke-static {p2}, Lco/vine/android/api/VinePost;->getBytesFromTags(Lco/vine/android/api/VinePost;)[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2624
    iget-object v0, p2, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    if-eqz v0, :cond_0

    .line 2625
    const-string v0, "venue_data"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    invoke-static {v1}, Lco/vine/android/util/Util;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2627
    :cond_0
    iget-object v0, p2, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    if-eqz v0, :cond_1

    .line 2628
    const-string v0, "entities"

    iget-object v1, p2, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    invoke-static {v1}, Lco/vine/android/util/Util;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 2630
    :cond_1
    const-string v0, "last_refresh"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2631
    return-void
.end method

.method private fillTagValues(Landroid/content/ContentValues;Lco/vine/android/api/VineTag;)V
    .locals 3
    .parameter "values"
    .parameter "tag"

    .prologue
    .line 2654
    const-string v0, "tag_id"

    iget-wide v1, p2, Lco/vine/android/api/VineTag;->tagId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2655
    const-string v0, "tag_name"

    iget-object v1, p2, Lco/vine/android/api/VineTag;->tagName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2656
    const-string v0, "last_used_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2657
    return-void
.end method

.method private fillUserContentValues(Landroid/content/ContentValues;Lco/vine/android/api/VineUser;J)V
    .locals 3
    .parameter "values"
    .parameter "user"
    .parameter "lastRefresh"

    .prologue
    .line 2583
    const-string v0, "user_id"

    iget-wide v1, p2, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2584
    const-string v0, "avatar_url"

    iget-object v1, p2, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2585
    const-string v0, "username"

    iget-object v1, p2, Lco/vine/android/api/VineUser;->username:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2586
    const-string v0, "blocked"

    iget v1, p2, Lco/vine/android/api/VineUser;->blocked:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2587
    const-string v0, "blocking"

    iget v1, p2, Lco/vine/android/api/VineUser;->blocking:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2588
    const-string v0, "description"

    iget-object v1, p2, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2589
    const-string v0, "location"

    iget-object v1, p2, Lco/vine/android/api/VineUser;->location:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2590
    const-string v0, "explicit"

    iget v1, p2, Lco/vine/android/api/VineUser;->explicit:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2591
    const-string v0, "follower_count"

    iget v1, p2, Lco/vine/android/api/VineUser;->followerCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2592
    const-string v0, "following_count"

    iget v1, p2, Lco/vine/android/api/VineUser;->followingCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2593
    iget v0, p2, Lco/vine/android/api/VineUser;->following:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 2594
    const-string v0, "following_flag"

    iget v1, p2, Lco/vine/android/api/VineUser;->following:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2596
    :cond_0
    const-string v0, "like_count"

    iget v1, p2, Lco/vine/android/api/VineUser;->likeCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2597
    const-string v0, "post_count"

    iget v1, p2, Lco/vine/android/api/VineUser;->postCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2598
    const-string v0, "verified"

    iget v1, p2, Lco/vine/android/api/VineUser;->verified:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2599
    const-string v0, "follow_status"

    iget v1, p2, Lco/vine/android/api/VineUser;->followStatus:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2600
    const-string v0, "last_refresh"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2601
    return-void
.end method

.method public static declared-synchronized getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;
    .locals 4
    .parameter "context"

    .prologue
    .line 101
    const-class v3, Lco/vine/android/provider/VineDatabaseHelper;

    monitor-enter v3

    const/4 v2, 0x1

    :try_start_0
    invoke-static {v2}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseName(I)Ljava/lang/String;

    move-result-object v0

    .line 102
    .local v0, databaseName:Ljava/lang/String;
    sget-object v2, Lco/vine/android/provider/VineDatabaseHelper;->sHelperMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/provider/VineDatabaseHelper;

    .line 103
    .local v1, helper:Lco/vine/android/provider/VineDatabaseHelper;
    if-nez v1, :cond_0

    .line 104
    new-instance v1, Lco/vine/android/provider/VineDatabaseHelper;

    .end local v1           #helper:Lco/vine/android/provider/VineDatabaseHelper;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lco/vine/android/provider/VineDatabaseHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 105
    .restart local v1       #helper:Lco/vine/android/provider/VineDatabaseHelper;
    sget-object v2, Lco/vine/android/provider/VineDatabaseHelper;->sHelperMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    :cond_0
    monitor-exit v3

    return-object v1

    .line 101
    .end local v0           #databaseName:Ljava/lang/String;
    .end local v1           #helper:Lco/vine/android/provider/VineDatabaseHelper;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public static getDatabaseName(I)Ljava/lang/String;
    .locals 2
    .parameter "schemaVersion"

    .prologue
    .line 2735
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "vine-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getDatabasePath(Landroid/content/Context;)Ljava/io/File;
    .locals 1
    .parameter "context"

    .prologue
    .line 111
    const/4 v0, 0x1

    invoke-static {v0}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method private getLastActivityRowId()J
    .locals 10

    .prologue
    const/4 v3, 0x0

    .line 2474
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2475
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "activity"

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v7, "sort_id ASC, notification_id ASC"

    const-string v8, "1"

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 2477
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_1

    .line 2479
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2480
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2483
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2486
    :goto_0
    return-wide v1

    .line 2483
    :cond_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2486
    :cond_1
    const-wide/16 v1, 0x0

    goto :goto_0

    .line 2483
    :catchall_0
    move-exception v1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private getLastChannelRowId()J
    .locals 10

    .prologue
    const/4 v3, 0x0

    .line 2524
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2525
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "channels"

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$ChannelsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v7, "channel_id DESC"

    const-string v8, "1"

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 2528
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_1

    .line 2530
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2531
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2534
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2537
    :goto_0
    return-wide v1

    .line 2534
    :cond_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2537
    :cond_1
    const-wide/16 v1, 0x0

    goto :goto_0

    .line 2534
    :catchall_0
    move-exception v1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private getLastCommentRowId(J)J
    .locals 10
    .parameter "postId"

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 2490
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2491
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "comments"

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$CommentsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v3, "post_id =? "

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v7

    const-string v7, "comment_id ASC"

    const-string v8, "1"

    move-object v6, v5

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 2494
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_1

    .line 2496
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2497
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2500
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2503
    :goto_0
    return-wide v1

    .line 2500
    :cond_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2503
    :cond_1
    const-wide/16 v1, 0x0

    goto :goto_0

    .line 2500
    :catchall_0
    move-exception v1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private getLastPostRowId(ILjava/lang/String;)J
    .locals 10
    .parameter "type"
    .parameter "tag"

    .prologue
    const/4 v5, 0x0

    const/4 v7, 0x0

    .line 2455
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2456
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "post_comments_likes_view"

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v3, "post_type=? AND tag=?"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v7

    const/4 v6, 0x1

    aput-object p2, v4, v6

    const-string v7, "sort_id ASC"

    const-string v8, "1"

    move-object v6, v5

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 2461
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_1

    .line 2463
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2464
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2467
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2470
    :goto_0
    return-wide v1

    .line 2467
    :cond_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2470
    :cond_1
    const-wide/16 v1, 0x0

    goto :goto_0

    .line 2467
    :catchall_0
    move-exception v1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private getLastTagRowId()J
    .locals 10

    .prologue
    const/4 v3, 0x0

    .line 2507
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2508
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "tag_search_results"

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$TagsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v7, "_id DESC"

    const-string v8, "1"

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 2511
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_1

    .line 2513
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2514
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2517
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2520
    :goto_0
    return-wide v1

    .line 2517
    :cond_0
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2520
    :cond_1
    const-wide/16 v1, 0x0

    goto :goto_0

    .line 2517
    :catchall_0
    move-exception v1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private getLastUserRowId(ILjava/lang/String;Ljava/lang/String;)J
    .locals 10
    .parameter "type"
    .parameter "tag"
    .parameter "isLastOrdering"

    .prologue
    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v2, 0x0

    .line 2429
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2432
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    if-eqz p2, :cond_0

    .line 2433
    const-string v3, "type=? AND tag=?"

    .line 2434
    .local v3, selection:Ljava/lang/String;
    const/4 v1, 0x2

    new-array v4, v1, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v2

    aput-object p2, v4, v6

    .line 2440
    .local v4, selectionArgs:[Ljava/lang/String;
    :goto_0
    const-string v1, "user_groups_view"

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$UsersQuery;->PROJECTION:[Ljava/lang/String;

    const-string v8, "1"

    move-object v6, v5

    move-object v7, p3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 2442
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_2

    .line 2444
    :try_start_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2445
    const/4 v1, 0x0

    invoke-interface {v9, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2448
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2451
    :goto_1
    return-wide v1

    .line 2436
    .end local v3           #selection:Ljava/lang/String;
    .end local v4           #selectionArgs:[Ljava/lang/String;
    .end local v9           #cursor:Landroid/database/Cursor;
    :cond_0
    const-string v3, "type=?"

    .line 2437
    .restart local v3       #selection:Ljava/lang/String;
    new-array v4, v6, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v2

    .restart local v4       #selectionArgs:[Ljava/lang/String;
    goto :goto_0

    .line 2448
    .restart local v9       #cursor:Landroid/database/Cursor;
    :cond_1
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2451
    :cond_2
    const-wide/16 v1, 0x0

    goto :goto_1

    .line 2448
    :catchall_0
    move-exception v1

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method private declared-synchronized mergePostGroups(Ljava/util/Collection;ILjava/lang/String;Ljava/util/Map;)V
    .locals 16
    .parameter
    .parameter "type"
    .parameter "groupTag"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1889
    .local p1, posts:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VinePost;>;"
    .local p4, orderMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Long;>;"
    monitor-enter p0

    if-eqz p1, :cond_0

    const/4 v2, -0x1

    move/from16 v0, p2

    if-ne v0, v2, :cond_1

    .line 1955
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 1893
    :cond_1
    :try_start_0
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_2

    .line 1894
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mergePostGroups: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", tagged by: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", of type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1899
    :cond_2
    new-instance v11, Ljava/util/LinkedHashMap;

    invoke-direct {v11}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1900
    .local v11, newPostGroups:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/vine/android/api/VinePost;

    .line 1901
    .local v14, post:Lco/vine/android/api/VinePost;
    iget-wide v2, v14, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v11, v2, v14}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 1889
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v11           #newPostGroups:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    .end local v14           #post:Lco/vine/android/api/VinePost;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1905
    .restart local v10       #i$:Ljava/util/Iterator;
    .restart local v11       #newPostGroups:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    :cond_3
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1906
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "post_groups"

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v4, "post_type=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 1910
    .local v9, cursor:Landroid/database/Cursor;
    if-eqz v9, :cond_5

    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-eqz v2, :cond_5

    .line 1914
    :cond_4
    const/4 v2, 0x0

    :try_start_2
    invoke-interface {v9, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1915
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result v2

    if-nez v2, :cond_4

    .line 1917
    :try_start_3
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 1921
    :cond_5
    const/4 v13, 0x0

    .line 1922
    .local v13, numInserted:I
    invoke-virtual {v11}, Ljava/util/LinkedHashMap;->size()I

    move-result v12

    .line 1923
    .local v12, newPostGroupsCount:I
    if-lez v12, :cond_a

    .line 1925
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1927
    :try_start_4
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 1928
    .local v15, values:Landroid/content/ContentValues;
    const-string v2, "post_type"

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1929
    const-string v2, "tag"

    move-object/from16 v0, p3

    invoke-virtual {v15, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1930
    invoke-virtual {v11}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_9

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/vine/android/api/VinePost;

    .line 1931
    .restart local v14       #post:Lco/vine/android/api/VinePost;
    const-string v2, "g_flags"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1932
    const-string v2, "post_id"

    iget-wide v3, v14, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1933
    const-string v2, "repost_data"

    iget-object v3, v14, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    invoke-static {v3}, Lco/vine/android/util/Util;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 1934
    iget-object v2, v14, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    if-eqz v2, :cond_7

    .line 1935
    const-string v2, "reposter_id"

    iget-object v3, v14, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    iget-wide v3, v3, Lco/vine/android/api/VineRepost;->userId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1939
    :goto_3
    if-eqz p4, :cond_6

    .line 1940
    const-string v3, "sort_id"

    iget-wide v4, v14, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v15, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1942
    :cond_6
    const-string v2, "post_groups"

    const-string v3, "post_id"

    invoke-virtual {v1, v2, v3, v15}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_8

    const/4 v2, 0x1

    :goto_4
    add-int/2addr v13, v2

    .line 1944
    goto :goto_2

    .line 1917
    .end local v12           #newPostGroupsCount:I
    .end local v13           #numInserted:I
    .end local v14           #post:Lco/vine/android/api/VinePost;
    .end local v15           #values:Landroid/content/ContentValues;
    :catchall_1
    move-exception v2

    :try_start_5
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1937
    .restart local v12       #newPostGroupsCount:I
    .restart local v13       #numInserted:I
    .restart local v14       #post:Lco/vine/android/api/VinePost;
    .restart local v15       #values:Landroid/content/ContentValues;
    :cond_7
    :try_start_6
    const-string v2, "reposter_id"

    invoke-virtual {v15, v2}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    goto :goto_3

    .line 1947
    .end local v14           #post:Lco/vine/android/api/VinePost;
    .end local v15           #values:Landroid/content/ContentValues;
    :catchall_2
    move-exception v2

    :try_start_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1942
    .restart local v14       #post:Lco/vine/android/api/VinePost;
    .restart local v15       #values:Landroid/content/ContentValues;
    :cond_8
    const/4 v2, 0x0

    goto :goto_4

    .line 1945
    .end local v14           #post:Lco/vine/android/api/VinePost;
    :cond_9
    :try_start_8
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 1947
    :try_start_9
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1949
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v3, Lco/vine/android/provider/Vine$PostGroupsView;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1952
    .end local v15           #values:Landroid/content/ContentValues;
    :cond_a
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 1953
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Inserted new post groups: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_0
.end method

.method private declared-synchronized mergeUserGroups(Ljava/util/Collection;ILjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V
    .locals 16
    .parameter
    .parameter "type"
    .parameter "groupTag"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;I",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 1806
    .local p1, users:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VineUser;>;"
    .local p4, tagMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Long;>;"
    .local p5, orderMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Long;>;"
    monitor-enter p0

    if-eqz p1, :cond_0

    const/4 v2, -0x1

    move/from16 v0, p2

    if-ne v0, v2, :cond_1

    .line 1885
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 1810
    :cond_1
    :try_start_0
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_2

    .line 1811
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mergeUserGroups: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", tagged by: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", of type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, p2

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1816
    :cond_2
    new-instance v12, Ljava/util/LinkedHashMap;

    invoke-direct {v12}, Ljava/util/LinkedHashMap;-><init>()V

    .line 1817
    .local v12, newUserGroupsMap:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, i$:Ljava/util/Iterator;
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/vine/android/api/VineUser;

    .line 1818
    .local v14, user:Lco/vine/android/api/VineUser;
    iget-wide v2, v14, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v12, v2, v14}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 1806
    .end local v10           #i$:Ljava/util/Iterator;
    .end local v12           #newUserGroupsMap:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    .end local v14           #user:Lco/vine/android/api/VineUser;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1822
    .restart local v10       #i$:Ljava/util/Iterator;
    .restart local v12       #newUserGroupsMap:Ljava/util/LinkedHashMap;,"Ljava/util/LinkedHashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    :cond_3
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1825
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    if-eqz p3, :cond_4

    .line 1826
    const-string v2, "user_groups"

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$UserGroupsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v4, "type=? AND tag=?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static/range {p3 .. p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v9

    .line 1838
    .local v9, cursor:Landroid/database/Cursor;
    :goto_2
    if-eqz v9, :cond_0

    .line 1843
    :goto_3
    :try_start_2
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1845
    const/4 v2, 0x0

    invoke-interface {v9, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v12, v2}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_3

    .line 1848
    :catchall_1
    move-exception v2

    :try_start_3
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    throw v2

    .line 1832
    .end local v9           #cursor:Landroid/database/Cursor;
    :cond_4
    const-string v2, "user_groups"

    sget-object v3, Lco/vine/android/provider/VineDatabaseSQL$UserGroupsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v4, "type=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .restart local v9       #cursor:Landroid/database/Cursor;
    goto :goto_2

    .line 1848
    :cond_5
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 1851
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_6

    .line 1852
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Inserting new user groups: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v12}, Ljava/util/LinkedHashMap;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1855
    :cond_6
    invoke-virtual {v12}, Ljava/util/LinkedHashMap;->size()I

    move-result v11

    .line 1856
    .local v11, newUserGroupsCount:I
    if-lez v11, :cond_0

    .line 1858
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1860
    :try_start_4
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 1861
    .local v15, values:Landroid/content/ContentValues;
    const-string v2, "type"

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1863
    if-eqz p3, :cond_7

    .line 1864
    const-string v2, "tag"

    move-object/from16 v0, p3

    invoke-virtual {v15, v2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1866
    :cond_7
    if-eqz p5, :cond_9

    const/4 v13, 0x1

    .line 1867
    .local v13, useOrdering:Z
    :goto_4
    invoke-virtual {v12}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_5
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_b

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lco/vine/android/api/VineUser;

    .line 1869
    .restart local v14       #user:Lco/vine/android/api/VineUser;
    const-string v2, "g_flags"

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1870
    const-string v2, "user_id"

    iget-wide v3, v14, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1871
    if-eqz v13, :cond_a

    iget-wide v2, v14, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 1872
    const-string v3, "order_id"

    iget-wide v4, v14, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, p5

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v15, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1876
    :cond_8
    :goto_6
    const-string v2, "user_groups"

    const-string v3, "user_id"

    invoke-virtual {v1, v2, v3, v15}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_5

    .line 1880
    .end local v13           #useOrdering:Z
    .end local v14           #user:Lco/vine/android/api/VineUser;
    .end local v15           #values:Landroid/content/ContentValues;
    :catchall_2
    move-exception v2

    :try_start_5
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1866
    .restart local v15       #values:Landroid/content/ContentValues;
    :cond_9
    const/4 v13, 0x0

    goto :goto_4

    .line 1873
    .restart local v13       #useOrdering:Z
    .restart local v14       #user:Lco/vine/android/api/VineUser;
    :cond_a
    if-eqz p4, :cond_8

    :try_start_6
    iget-wide v2, v14, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_8

    .line 1874
    const-string v3, "tag"

    iget-wide v4, v14, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    move-object/from16 v0, p4

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v15, v3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_6

    .line 1878
    .end local v14           #user:Lco/vine/android/api/VineUser;
    :cond_b
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1880
    :try_start_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1883
    move-object/from16 v0, p0

    iget-object v2, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v3, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto/16 :goto_0
.end method

.method private notifyByType(I)V
    .locals 3
    .parameter "groupType"

    .prologue
    const/4 v2, 0x0

    .line 2750
    packed-switch p1, :pswitch_data_0

    .line 2772
    :pswitch_0
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V

    .line 2776
    :goto_0
    return-void

    .line 2752
    :pswitch_1
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_CHANNEL_POPULAR:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 2756
    :pswitch_2
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_CHANNEL_RECENT:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 2760
    :pswitch_3
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_ON_THE_RISE:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 2764
    :pswitch_4
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_POPULAR_NOW:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 2768
    :pswitch_5
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_TAG:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    goto :goto_0

    .line 2750
    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private notifyPostCommentsViewUris()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 2739
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2741
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_USER:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2743
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_USER_LIKES:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2745
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE_SINGLE:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2747
    return-void
.end method

.method private declared-synchronized removePostsFromGroup(I)I
    .locals 7
    .parameter "type"

    .prologue
    .line 1477
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 1480
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1481
    const-string v2, "post_groups"

    const-string v3, "post_type=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1483
    .local v1, numGroups:I
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 1484
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 1485
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Clearing group "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " deleting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " groups "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1488
    :cond_0
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1490
    monitor-exit p0

    return v1

    .line 1488
    .end local v1           #numGroups:I
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1477
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method private declared-synchronized removePostsFromGroupByPostId(IJ)I
    .locals 5
    .parameter "type"
    .parameter "postId"

    .prologue
    .line 1470
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1471
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "post_type=? AND post_id=?"

    .line 1472
    .local v2, selection:Ljava/lang/String;
    const/4 v3, 0x2

    new-array v1, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    const/4 v3, 0x1

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 1473
    .local v1, selArgs:[Ljava/lang/String;
    const-string v3, "post_groups"

    const-string v4, "post_type=? AND post_id=?"

    invoke-virtual {v0, v3, v4, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v3

    monitor-exit p0

    return v3

    .line 1470
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #selArgs:[Ljava/lang/String;
    .end local v2           #selection:Ljava/lang/String;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method


# virtual methods
.method public declared-synchronized addFollow(JJJZ)I
    .locals 20
    .parameter "userId"
    .parameter "sessionOwnerId"
    .parameter "followId"
    .parameter "notify"

    .prologue
    .line 961
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 963
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v4, 0x1

    new-array v7, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v7, v4

    .line 965
    .local v7, whereArgs:[Ljava/lang/String;
    const-string v4, "users"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v8, "following_flag"

    aput-object v8, v5, v6

    const-string v6, "user_id=?"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 968
    .local v14, c:Landroid/database/Cursor;
    if-eqz v14, :cond_3

    invoke-interface {v14}, Landroid/database/Cursor;->getCount()I

    move-result v4

    if-lez v4, :cond_3

    .line 969
    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z

    .line 970
    const/4 v4, 0x0

    invoke-interface {v14, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    .line 971
    .local v15, currentFriendship:I
    const/4 v4, 0x1

    invoke-static {v15, v4}, Lco/vine/android/Friendships;->setFriendship(II)I

    move-result v17

    .line 974
    .local v17, newFriendship:I
    new-instance v16, Landroid/content/ContentValues;

    invoke-direct/range {v16 .. v16}, Landroid/content/ContentValues;-><init>()V

    .line 975
    .local v16, cv:Landroid/content/ContentValues;
    const-string v4, "following_flag"

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    move-object/from16 v0, v16

    invoke-virtual {v0, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 977
    const-string v4, "users"

    const-string v5, "user_id=?"

    move-object/from16 v0, v16

    invoke-virtual {v3, v4, v0, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v18

    .line 980
    .local v18, result:I
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 981
    new-instance v19, Lco/vine/android/api/VineUser;

    invoke-direct/range {v19 .. v19}, Lco/vine/android/api/VineUser;-><init>()V

    .line 982
    .local v19, skeletonUser:Lco/vine/android/api/VineUser;
    move-wide/from16 v0, p1

    move-object/from16 v2, v19

    iput-wide v0, v2, Lco/vine/android/api/VineUser;->userId:J

    .line 983
    new-instance v9, Ljava/util/ArrayList;

    const/4 v4, 0x1

    invoke-direct {v9, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 984
    .local v9, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, v19

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 985
    const/4 v13, 0x0

    .line 986
    .local v13, orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    const-wide/16 v4, 0x0

    cmp-long v4, p5, v4

    if-lez v4, :cond_0

    .line 987
    new-instance v13, Ljava/util/HashMap;

    .end local v13           #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    const/4 v4, 0x1

    invoke-direct {v13, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 988
    .restart local v13       #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static/range {p5 .. p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 990
    :cond_0
    const/4 v10, 0x1

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    move-object/from16 v8, p0

    invoke-direct/range {v8 .. v13}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUserGroups(Ljava/util/Collection;ILjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    .line 993
    if-eqz p7, :cond_1

    .line 994
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FOLLOWING:Landroid/net/Uri;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 996
    :cond_1
    sget-boolean v4, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v4, :cond_2

    .line 997
    const-string v4, "VineDH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Followed user "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-wide/from16 v0, p1

    invoke-virtual {v5, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1001
    .end local v9           #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    .end local v13           #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v15           #currentFriendship:I
    .end local v16           #cv:Landroid/content/ContentValues;
    .end local v17           #newFriendship:I
    .end local v18           #result:I
    .end local v19           #skeletonUser:Lco/vine/android/api/VineUser;
    :cond_2
    :goto_0
    monitor-exit p0

    return v18

    :cond_3
    const/16 v18, -0x1

    goto :goto_0

    .line 961
    .end local v3           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v7           #whereArgs:[Ljava/lang/String;
    .end local v14           #c:Landroid/database/Cursor;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized addLike(Lco/vine/android/api/VineLike;Z)I
    .locals 17
    .parameter "like"
    .parameter "notify"

    .prologue
    .line 1051
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    .line 1053
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v2, 0x1

    new-array v5, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    move-object/from16 v0, p1

    iget-wide v3, v0, Lco/vine/android/api/VineLike;->postId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1056
    .local v5, whereArgs:[Ljava/lang/String;
    const/16 v16, 0x0

    .line 1057
    .local v16, result:I
    const/4 v15, 0x0

    .line 1059
    .local v15, mergeResult:I
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1062
    const-string v2, "posts"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v6, "metadata_flags"

    aput-object v6, v3, v4

    const-string v4, "post_id=?"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 1065
    .local v12, c:Landroid/database/Cursor;
    if-eqz v12, :cond_0

    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_0

    .line 1066
    invoke-interface {v12}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1067
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 1068
    .local v13, cv:Landroid/content/ContentValues;
    const/4 v2, 0x0

    invoke-interface {v12, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 1069
    .local v14, flag:I
    or-int/lit8 v14, v14, 0x8

    .line 1070
    const-string v2, "metadata_flags"

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v13, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1071
    invoke-interface {v12}, Landroid/database/Cursor;->close()V

    .line 1072
    const-string v2, "posts"

    const-string v3, "post_id=?"

    invoke-virtual {v1, v2, v13, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_3

    const/16 v16, 0x1

    .line 1074
    :goto_0
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 1075
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Updating like value in post: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget-wide v8, v0, Lco/vine/android/api/VineLike;->postId:J

    invoke-virtual {v3, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1080
    .end local v13           #cv:Landroid/content/ContentValues;
    .end local v14           #flag:I
    :cond_0
    new-instance v7, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v7, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 1081
    .local v7, likes:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineLike;>;"
    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1082
    move-object/from16 v0, p1

    iget-wide v8, v0, Lco/vine/android/api/VineLike;->postId:J

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v6, p0

    invoke-virtual/range {v6 .. v11}, Lco/vine/android/provider/VineDatabaseHelper;->mergeLikes(Ljava/util/Collection;JII)I

    move-result v15

    .line 1083
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1085
    :try_start_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1087
    if-eqz p2, :cond_2

    if-gtz v16, :cond_1

    if-lez v15, :cond_2

    .line 1088
    :cond_1
    invoke-direct/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1090
    :cond_2
    monitor-exit p0

    return v16

    .line 1072
    .end local v7           #likes:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineLike;>;"
    .restart local v13       #cv:Landroid/content/ContentValues;
    .restart local v14       #flag:I
    :cond_3
    const/16 v16, 0x0

    goto :goto_0

    .line 1085
    .end local v12           #c:Landroid/database/Cursor;
    .end local v13           #cv:Landroid/content/ContentValues;
    .end local v14           #flag:I
    :catchall_0
    move-exception v2

    :try_start_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1051
    .end local v1           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v5           #whereArgs:[Ljava/lang/String;
    .end local v15           #mergeResult:I
    .end local v16           #result:I
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized cleanTagSearchResults()V
    .locals 5

    .prologue
    .line 495
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 496
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v1, 0x0

    .line 498
    .local v1, deleted:I
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 500
    const-string v2, "tag_search_results"

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 502
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 503
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Deleted "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " tag search result rows."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 505
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 507
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 510
    if-lez v1, :cond_1

    .line 511
    iget-object v2, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v3, Lco/vine/android/provider/Vine$TagSearchResults;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 513
    :cond_1
    monitor-exit p0

    return-void

    .line 507
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 495
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #deleted:I
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized cleanUp(J)I
    .locals 7
    .parameter "timeAnchor"

    .prologue
    .line 446
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 447
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v1, 0x0

    .line 449
    .local v1, deleted:I
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 450
    const-string v2, "DELETE FROM post_groups WHERE post_id IN (SELECT post_id FROM posts WHERE last_refresh < ?);"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 454
    const-string v2, "posts"

    const-string v3, "last_refresh<?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 457
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 458
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 459
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Cleanup performed, deleted "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " posts with last_refresh less "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "than anchor: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 463
    :cond_0
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 466
    if-lez v1, :cond_1

    .line 467
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 469
    :cond_1
    monitor-exit p0

    return v1

    .line 463
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 446
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #deleted:I
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized cleanUserSearchResults()V
    .locals 7

    .prologue
    .line 473
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 474
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v1, 0x0

    .line 476
    .local v1, deleted:I
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 478
    const-string v2, "user_groups"

    const-string v3, "type=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const/16 v6, 0x8

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 481
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 482
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Deleted "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " user search result rows."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 484
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 486
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 489
    if-lez v1, :cond_1

    .line 490
    iget-object v2, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v3, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_USER_SEARCH_RESULTS:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 492
    :cond_1
    monitor-exit p0

    return-void

    .line 486
    :catchall_0
    move-exception v2

    :try_start_3
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 473
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #deleted:I
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized clearAllData()V
    .locals 4

    .prologue
    .line 2335
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2336
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "settings"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2337
    const-string v1, "user_groups"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2338
    const-string v1, "activity"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2339
    const-string v1, "posts"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2340
    const-string v1, "likes"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2341
    const-string v1, "post_groups"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2342
    const-string v1, "comments"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2343
    const-string v1, "page_cursors"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2344
    const-string v1, "tag_search_results"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2345
    const-string v1, "channels"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2346
    const-string v1, "notifications"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2347
    const-string v1, "tag_recently_used"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2348
    monitor-exit p0

    return-void

    .line 2335
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized clearCachedData()V
    .locals 4

    .prologue
    .line 2354
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 2356
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 2357
    const-string v1, "users"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2358
    const-string v1, "user_groups"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2359
    const-string v1, "activity"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2360
    const-string v1, "posts"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2361
    const-string v1, "likes"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2362
    const-string v1, "post_groups"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2363
    const-string v1, "comments"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2364
    const-string v1, "page_cursors"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2365
    const-string v1, "tag_search_results"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2366
    const-string v1, "channels"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2367
    const-string v1, "notifications"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2368
    const-string v1, "tag_recently_used"

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2369
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2371
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2373
    monitor-exit p0

    return-void

    .line 2371
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2354
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized clearCachedData(Z)V
    .locals 1
    .parameter "notify"

    .prologue
    .line 2376
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->clearCachedData()V

    .line 2377
    if-eqz p1, :cond_0

    .line 2378
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2380
    :cond_0
    monitor-exit p0

    return-void

    .line 2376
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public clearFileCache()V
    .locals 1

    .prologue
    .line 1098
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lco/vine/android/util/Util;->removeCache(Landroid/content/Context;)V

    .line 1099
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mAppContext:Landroid/content/Context;

    invoke-static {v0}, Lco/vine/android/util/image/ImageUtils;->removeFiles(Landroid/content/Context;)V

    .line 1100
    return-void
.end method

.method protected createTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 134
    const-string v0, "CREATE TABLE  users (_id INTEGER PRIMARY KEY,user_id INT UNIQUE NOT NULL,avatar_url TEXT,blocked INT,blocking INT,hide_profile_reposts INT,description TEXT,location TEXT,explicit INT,follower_count INT,following_count INT,following_flag INT,like_count INT,post_count INT,username TEXT,verified INT,follow_status INT,last_refresh INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 135
    const-string v0, "CREATE TABLE  settings (_id INTEGER PRIMARY KEY,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 136
    const-string v0, "CREATE TABLE  user_groups (_id INTEGER PRIMARY KEY,type INT,tag TEXT,user_id INT,is_last INT,g_flags INT,order_id INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 137
    const-string v0, "CREATE TABLE  comments (_id INTEGER PRIMARY KEY,comment_id INT UNIQUE NOT NULL,post_id INT NOT NULL,avatar_url TEXT,comment TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,verified INT,entities BLOB,is_last INT,last_refresh INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 138
    const-string v0, "CREATE TABLE  activity (_id INTEGER PRIMARY KEY,notification_id INT UNIQUE NOT NULL,notification_type INT,user_id INT,post_id INT,thumbnail_url TEXT,avatar_url TEXT,timestamp INT,comment TEXT,username TEXT,is_last INT,entities BLOB,last_refresh INT,follow_status INT,sort_id INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 139
    const-string v0, "CREATE VIEW  user_groups_view AS SELECT user_groups._id AS _id,user_groups.type AS type,user_groups.tag AS tag,user_groups.user_id AS user_id,user_groups.is_last AS is_last,user_groups.g_flags AS g_flags,user_groups.order_id AS order_id,user.username AS username,user.user_id AS user_id,user.avatar_url AS avatar_url,user.blocked AS blocked,user.blocking AS blocking,user.description AS description,user.location AS location,user.explicit AS explicit,user.follower_count AS follower_count,user.following_count AS following_count,user.following_flag AS following_flag,user.like_count AS like_count,user.post_count AS post_count,user.follow_status AS follow_status,user.verified AS verified FROM user_groups LEFT JOIN users AS user ON user_groups.user_id=user.user_id;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 140
    const-string v0, "CREATE TABLE  likes (_id INTEGER PRIMARY KEY,like_id INT UNIQUE NOT NULL,post_id INT NOT NULL,avatar_url TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,verified INT,last_refresh INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 141
    const-string v0, "CREATE TABLE  posts (_id INTEGER PRIMARY KEY,post_id INT NOT NULL,my_repost_id INT,tags BLOB,thumbnail_url TEXT,share_url TEXT,video_low_uRL TEXT,video_url TEXT,description TEXT,foursquare_venue_id TEXT,metadata_flags INT,post_flags INT,avatar_url TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,venue_data BLOB,entities BLOB,likes_count INT,reviners_count INT,comments_count INT,last_refresh INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 142
    const-string v0, "CREATE TABLE  post_groups (_id INTEGER PRIMARY KEY,post_type INT,tag TEXT,post_id INT,is_last INT,repost_data BLOB,reposter_id INT,sort_id INT,g_flags INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 143
    const-string v0, "CREATE VIEW  post_groups_view AS SELECT post_groups._id AS _id,post_groups.post_type AS post_type,post_groups.tag AS tag,post_groups.post_id AS post_id,post_groups.is_last AS is_last,post_groups.g_flags AS g_flags,post_groups.sort_id AS sort_id,post_groups.repost_data AS repost_data,post_groups.reposter_id AS reposter_id,posts.username AS username,posts.avatar_url AS avatar_url,posts.thumbnail_url AS thumbnail_url,posts.metadata_flags AS metadata_flags,posts.user_id AS user_id,posts.my_repost_id AS my_repost_id,posts.timestamp AS timestamp,posts.location AS location,posts.tags AS tags,posts.share_url AS share_url,posts.video_low_uRL AS video_low_uRL,posts.video_url AS video_url,posts.video_low_uRL AS video_low_uRL,posts.description AS description,posts.foursquare_venue_id AS foursquare_venue_id,posts.post_flags AS post_flags,posts.venue_data AS venue_data,posts.entities AS entities,posts.likes_count AS likes_count,posts.reviners_count AS reviners_count,posts.comments_count AS comments_count FROM post_groups LEFT JOIN posts AS posts ON post_groups.post_id=posts.post_id;"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 144
    const-string v0, "CREATE VIEW  post_comments_likes_view AS  SELECT post_groups_view._id AS _id,post_groups_view.post_id AS post_id,post_groups_view.my_repost_id AS my_repost_id,post_groups_view.tags AS tags,post_groups_view.thumbnail_url AS thumbnail_url,post_groups_view.share_url AS share_url,post_groups_view.video_low_uRL AS video_low_uRL,post_groups_view.video_url AS video_url,post_groups_view.description AS description,post_groups_view.foursquare_venue_id AS foursquare_venue_id,post_groups_view.metadata_flags AS metadata_flags,post_groups_view.post_flags AS post_flags,post_groups_view.post_type AS post_type,post_groups_view.tag AS tag,post_groups_view.sort_id AS sort_id,post_groups_view.is_last AS is_last,post_groups_view.avatar_url AS avatar_url,post_groups_view.user_id AS user_id,post_groups_view.timestamp AS timestamp,post_groups_view.location AS location,post_groups_view.username AS username,post_groups_view.venue_data AS venue_data,post_groups_view.entities AS entities,post_groups_view.repost_data AS repost_data,post_groups_view.reposter_id AS reposter_id,post_groups_view.likes_count AS likes_count,post_groups_view.reviners_count AS reviners_count,post_groups_view.comments_count AS comments_count,likes.like_id AS like_id,likes.avatar_url AS like_user_avatar_url,likes.user_id AS like_user_user_id,likes.timestamp AS like_user_timestamp,likes.location AS like_user_location,likes.username AS like_user_username,likes.verified AS like_user_verified,null  AS comment_id,null  AS comment,null  AS comment_user_avatar_url,null  AS comment_user_user_id,null  AS comment_user_timestamp,null  AS comment_user_location,null  AS comment_user_username,null  AS comment_user_verified,null  AS comment_is_last,null  AS comment_entities FROM post_groups_view LEFT JOIN likes ON post_groups_view.post_id = likes.post_id UNION SELECT post_groups_view._id AS _id,post_groups_view.post_id AS post_id,post_groups_view.my_repost_id AS my_repost_id,post_groups_view.tags AS tags,post_groups_view.thumbnail_url AS thumbnail_url,post_groups_view.share_url AS share_url,post_groups_view.video_low_uRL AS video_low_uRL,post_groups_view.video_url AS video_url,post_groups_view.description AS description,post_groups_view.foursquare_venue_id AS foursquare_venue_id,post_groups_view.metadata_flags AS metadata_flags,post_groups_view.post_flags AS post_flags,post_groups_view.post_type AS post_type,post_groups_view.tag AS tag,post_groups_view.sort_id AS sort_id,post_groups_view.is_last AS is_last,post_groups_view.avatar_url AS avatar_url,post_groups_view.user_id AS user_id,post_groups_view.timestamp AS timestamp,post_groups_view.location AS location,post_groups_view.username AS username,post_groups_view.venue_data AS venue_data,post_groups_view.entities AS entities,post_groups_view.repost_data AS repost_data,post_groups_view.reposter_id AS reposter_id,post_groups_view.likes_count AS likes_count,post_groups_view.reviners_count AS reviners_count,post_groups_view.comments_count AS comments_count,null  AS like_id,null  AS like_user_avatar_url,null  AS like_user_user_id,null  AS like_user_timestamp,null  AS like_user_location,null  AS like_user_username,null  AS like_user_verified,comments.comment_id AS comment_id,comments.comment AS comment,comments.avatar_url AS comment_user_avatar_url,comments.user_id AS comment_user_user_id,comments.timestamp AS comment_user_timestamp,comments.location AS comment_user_location,comments.username AS comment_user_username,comments.verified AS comment_user_verified,comments.is_last AS comment_is_last,comments.entities AS comment_entities FROM post_groups_view LEFT JOIN comments ON post_groups_view.post_id = comments.post_id "

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 145
    const-string v0, "CREATE TABLE  page_cursors (_id INTEGER PRIMARY KEY,type INT,tag TEXT,kind INT,next_page INT,previous_page INT,anchor TEXT,reversed INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 146
    const-string v0, "CREATE TABLE  tag_search_results (_id INTEGER PRIMARY KEY,tag_id INT UNIQUE NOT NULL,tag_name TEXT NOT NULL,last_used_timestamp TEXT,is_last INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 147
    const-string v0, "CREATE TABLE  channels (_id INTEGER PRIMARY KEY,channel_id INT UNIQUE NOT NULL,channel TEXT NOT NULL,timestamp INT,retinaIconUrl TEXT,background_color TEXT,font_color TEXT,last_used_timestamp INT,is_last INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 148
    const-string v0, "CREATE TABLE  notifications (_id INTEGER PRIMARY KEY,notification_id INT UNIQUE NOT NULL,notification_type INT,message TEXT,cleared INT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 149
    const-string v0, "CREATE TABLE  tag_recently_used (_id INTEGER PRIMARY KEY,tag_id INT UNIQUE NOT NULL,tag_name TEXT NOT NULL,last_used_timestamp TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 150
    const-string v0, "CREATE TABLE  editions (_id INTEGER PRIMARY KEY,edition_code TEXT,edition_name TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 151
    return-void
.end method

.method public declared-synchronized deleteComment(Ljava/lang/String;)I
    .locals 6
    .parameter "commentId"

    .prologue
    .line 646
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 647
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "comments"

    const-string v3, "comment_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 651
    .local v1, deleted:I
    if-lez v1, :cond_0

    .line 652
    iget-object v2, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v3, Lco/vine/android/provider/Vine$Comments;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 653
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V

    .line 656
    :cond_0
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_1

    .line 657
    if-lez v1, :cond_2

    .line 658
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Deleting comment: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 663
    :cond_1
    :goto_0
    monitor-exit p0

    return v1

    .line 660
    :cond_2
    :try_start_1
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Couldn\'t delete comment: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 646
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #deleted:I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized deletePost(J)I
    .locals 8
    .parameter "postId"

    .prologue
    .line 1435
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 1438
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1439
    const-string v3, "posts"

    const-string v4, "post_id=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v0, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1441
    .local v1, deleted:I
    const/4 v2, 0x0

    .line 1442
    .local v2, deletedGroups:I
    if-lez v1, :cond_0

    .line 1443
    const-string v3, "post_groups"

    const-string v4, "post_id=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-virtual {v0, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 1446
    :cond_0
    if-gtz v1, :cond_1

    if-lez v2, :cond_2

    .line 1447
    :cond_1
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V

    .line 1450
    :cond_2
    sget-boolean v3, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v3, :cond_3

    .line 1451
    if-lez v2, :cond_4

    .line 1452
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Removing the post: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1457
    :cond_3
    :goto_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1459
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1461
    monitor-exit p0

    return v1

    .line 1454
    :cond_4
    :try_start_3
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Couldn\'t delete post: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 1459
    .end local v1           #deleted:I
    .end local v2           #deletedGroups:I
    :catchall_0
    move-exception v3

    :try_start_4
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1435
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized expireTimeline(I)V
    .locals 1
    .parameter "type"

    .prologue
    .line 1465
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lco/vine/android/provider/VineDatabaseHelper;->removePostsFromGroup(I)I

    .line 1466
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1467
    monitor-exit p0

    return-void

    .line 1465
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getNextPageCursor(IILjava/lang/String;Z)I
    .locals 10
    .parameter "kind"
    .parameter "type"
    .parameter "tag"
    .parameter "reversed"

    .prologue
    .line 2251
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2253
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    if-eqz p4, :cond_1

    .line 2254
    const-string v9, "previous_page"

    .line 2259
    .local v9, column:Ljava/lang/String;
    :goto_0
    if-nez p3, :cond_0

    .line 2260
    const-string p3, ""

    .line 2263
    :cond_0
    const-string v1, "page_cursors"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    const-string v3, "kind=? AND type=? AND tag=?"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 2267
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_2

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_2

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2268
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 2270
    :goto_1
    monitor-exit p0

    return v1

    .line 2256
    .end local v8           #c:Landroid/database/Cursor;
    .end local v9           #column:Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v9, "next_page"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v9       #column:Ljava/lang/String;
    goto :goto_0

    .line 2270
    .restart local v8       #c:Landroid/database/Cursor;
    :cond_2
    const/4 v1, -0x1

    goto :goto_1

    .line 2251
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v8           #c:Landroid/database/Cursor;
    .end local v9           #column:Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getOldestSortId(I)Landroid/database/Cursor;
    .locals 9
    .parameter "groupType"

    .prologue
    .line 176
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 177
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "post_groups"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "sort_id"

    aput-object v4, v2, v3

    const-string v3, "post_type=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "CAST (sort_id AS INTEGER) DESC"

    const-string v8, "1"

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    monitor-exit p0

    return-object v1

    .line 176
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getPageAnchor(IILjava/lang/String;)J
    .locals 9
    .parameter "kind"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 2318
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2319
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v1, "page_cursors"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "anchor"

    aput-object v4, v2, v3

    const-string v3, "kind=? AND type=? AND tag=?"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 2324
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2325
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getLong(I)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2327
    :goto_0
    monitor-exit p0

    return-wide v1

    :cond_0
    const-wide/16 v1, -0x1

    goto :goto_0

    .line 2318
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v8           #c:Landroid/database/Cursor;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getPreviousPageCursor(IILjava/lang/String;Z)I
    .locals 11
    .parameter "kind"
    .parameter "type"
    .parameter "tag"
    .parameter "reversed"

    .prologue
    .line 2285
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2287
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    if-eqz p4, :cond_1

    .line 2288
    const-string v9, "next_page"

    .line 2293
    .local v9, column:Ljava/lang/String;
    :goto_0
    if-nez p3, :cond_0

    .line 2294
    const-string p3, ""

    .line 2297
    :cond_0
    const-string v1, "page_cursors"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v9, v2, v3

    const-string v3, "kind=? AND type=? AND tag=?"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-static {p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 2301
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_2

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_2

    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 2302
    invoke-interface {v8, v9}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    .line 2303
    .local v10, index:I
    invoke-interface {v8, v10}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    .line 2305
    .end local v10           #index:I
    :goto_1
    monitor-exit p0

    return v1

    .line 2290
    .end local v8           #c:Landroid/database/Cursor;
    .end local v9           #column:Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v9, "previous_page"
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .restart local v9       #column:Ljava/lang/String;
    goto :goto_0

    .line 2305
    .restart local v8       #c:Landroid/database/Cursor;
    :cond_2
    const/4 v1, -0x1

    goto :goto_1

    .line 2285
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v8           #c:Landroid/database/Cursor;
    .end local v9           #column:Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getUnclearedNotificationCount()I
    .locals 9

    .prologue
    .line 1346
    monitor-enter p0

    const/4 v7, -0x1

    .line 1347
    .local v7, count:I
    :try_start_0
    const-string v8, "cleared=?"

    .line 1348
    .local v8, selection:Ljava/lang/String;
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 1349
    .local v4, whereArgs:[Ljava/lang/String;
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$Notifications;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$NotificationsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v3, "cleared=?"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1352
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_0

    .line 1353
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v7

    .line 1354
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1357
    :cond_0
    monitor-exit p0

    return v7

    .line 1346
    .end local v4           #whereArgs:[Ljava/lang/String;
    .end local v6           #c:Landroid/database/Cursor;
    .end local v8           #selection:Ljava/lang/String;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getUnclearedNotifications()Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/service/GCMNotificationService$Notification;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1327
    monitor-enter p0

    :try_start_0
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 1329
    .local v7, ret:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/service/GCMNotificationService$Notification;>;"
    const-string v8, "cleared=?"

    .line 1330
    .local v8, selection:Ljava/lang/String;
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 1331
    .local v4, whereArgs:[Ljava/lang/String;
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$Notifications;->CONTENT_URI_UNCLEARED:Landroid/net/Uri;

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$NotificationsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v3, "cleared=?"

    const-string v5, "notification_id DESC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1334
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_2

    .line 1335
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1337
    :cond_0
    new-instance v0, Lco/vine/android/service/GCMNotificationService$Notification;

    invoke-direct {v0, v6}, Lco/vine/android/service/GCMNotificationService$Notification;-><init>(Landroid/database/Cursor;)V

    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1338
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1340
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1342
    :cond_2
    monitor-exit p0

    return-object v7

    .line 1327
    .end local v4           #whereArgs:[Ljava/lang/String;
    .end local v6           #c:Landroid/database/Cursor;
    .end local v7           #ret:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/service/GCMNotificationService$Notification;>;"
    .end local v8           #selection:Ljava/lang/String;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized markChannelLastUsedTimestamp(J)V
    .locals 7
    .parameter "channelId"

    .prologue
    .line 2162
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2163
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 2164
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "last_used_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2165
    const-string v2, "channels"

    const-string v3, "channel_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v0, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2167
    monitor-exit p0

    return-void

    .line 2162
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized markLastActivity()V
    .locals 9

    .prologue
    .line 2086
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getLastActivityRowId()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2087
    .local v1, rowId:J
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-nez v4, :cond_0

    .line 2103
    :goto_0
    monitor-exit p0

    return-void

    .line 2091
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2093
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-boolean v4, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v4, :cond_1

    .line 2094
    const-string v4, "VineDH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Tagging the oldest activity with row: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2096
    :cond_1
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 2097
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "is_last"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2098
    const-string v4, "activity"

    const-string v5, "is_last=1"

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2100
    const-string v4, "is_last"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2101
    const-string v4, "activity"

    const-string v5, "_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2086
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #rowId:J
    .end local v3           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized markLastChannel()V
    .locals 9

    .prologue
    .line 2136
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getLastChannelRowId()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2137
    .local v1, rowId:J
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-nez v4, :cond_0

    .line 2156
    :goto_0
    monitor-exit p0

    return-void

    .line 2141
    :cond_0
    :try_start_1
    sget-boolean v4, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v4, :cond_1

    .line 2142
    const-string v4, "VineDH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Tagging the oldest channel with row id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2145
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2148
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 2149
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "is_last"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2150
    const-string v4, "channels"

    const-string v5, "is_last=1"

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2152
    const-string v4, "is_last"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2153
    const-string v4, "channels"

    const-string v5, "_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2155
    iget-object v4, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lco/vine/android/provider/Vine$Channels;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2136
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #rowId:J
    .end local v3           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized markLastComment(J)V
    .locals 9
    .parameter "postId"

    .prologue
    .line 2010
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lco/vine/android/provider/VineDatabaseHelper;->getLastCommentRowId(J)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2011
    .local v1, rowId:J
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-nez v4, :cond_0

    .line 2025
    :goto_0
    monitor-exit p0

    return-void

    .line 2015
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2017
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 2018
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "is_last"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2019
    const-string v4, "comments"

    const-string v5, "is_last=1 AND post_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2022
    const-string v4, "is_last"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2023
    const-string v4, "comments"

    const-string v5, "_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2010
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #rowId:J
    .end local v3           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized markLastPost(ILjava/lang/String;)V
    .locals 9
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 2063
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lco/vine/android/provider/VineDatabaseHelper;->getLastPostRowId(ILjava/lang/String;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2064
    .local v1, rowId:J
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-nez v4, :cond_0

    .line 2082
    :goto_0
    monitor-exit p0

    return-void

    .line 2068
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2070
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-boolean v4, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v4, :cond_1

    .line 2071
    const-string v4, "VineDH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Tagging the oldest post of type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " and tag: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " row id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2074
    :cond_1
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 2075
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "is_last"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2076
    const-string v4, "post_groups"

    const-string v5, "is_last=1"

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2078
    const-string v4, "is_last"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2079
    const-string v4, "post_groups"

    const-string v5, "_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2081
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2063
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #rowId:J
    .end local v3           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized markLastTag()V
    .locals 9

    .prologue
    .line 2110
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getLastTagRowId()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2111
    .local v1, rowId:J
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-nez v4, :cond_0

    .line 2130
    :goto_0
    monitor-exit p0

    return-void

    .line 2115
    :cond_0
    :try_start_1
    sget-boolean v4, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v4, :cond_1

    .line 2116
    const-string v4, "VineDH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Tagging the oldest tag with row id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2119
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2122
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 2123
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "is_last"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2124
    const-string v4, "tag_search_results"

    const-string v5, "is_last=1"

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2126
    const-string v4, "is_last"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2127
    const-string v4, "tag_search_results"

    const-string v5, "_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2129
    iget-object v4, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lco/vine/android/provider/Vine$TagSearchResults;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2110
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #rowId:J
    .end local v3           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized markLastUser(ILjava/lang/String;)V
    .locals 1
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 2028
    monitor-enter p0

    :try_start_0
    const-string v0, "order_id DESC"

    invoke-virtual {p0, p1, p2, v0}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2029
    monitor-exit p0

    return-void

    .line 2028
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized markLastUser(ILjava/lang/String;Ljava/lang/String;)V
    .locals 9
    .parameter "type"
    .parameter "tag"
    .parameter "isLastOrdering"

    .prologue
    .line 2039
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Lco/vine/android/provider/VineDatabaseHelper;->getLastUserRowId(ILjava/lang/String;Ljava/lang/String;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v1

    .line 2040
    .local v1, rowId:J
    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-nez v4, :cond_0

    .line 2059
    :goto_0
    monitor-exit p0

    return-void

    .line 2044
    :cond_0
    :try_start_1
    sget-boolean v4, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v4, :cond_1

    .line 2045
    const-string v4, "VineDH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Tagging the oldest user of type: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " row id: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2048
    :cond_1
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2051
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 2052
    .local v3, values:Landroid/content/ContentValues;
    const-string v4, "is_last"

    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2053
    const-string v4, "user_groups"

    const-string v5, "is_last=1"

    const/4 v6, 0x0

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2055
    const-string v4, "is_last"

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2056
    const-string v4, "user_groups"

    const-string v5, "_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {v0, v4, v3, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2058
    iget-object v4, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2039
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #rowId:J
    .end local v3           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized markNotificationsCleared()I
    .locals 7

    .prologue
    .line 1278
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 1279
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v1, 0x0

    .line 1282
    .local v1, updated:I
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1283
    const-string v4, "cleared=?"

    .line 1284
    .local v4, whereClause:Ljava/lang/String;
    const/4 v5, 0x1

    new-array v3, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    .line 1285
    .local v3, whereArgs:[Ljava/lang/String;
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 1286
    .local v2, values:Landroid/content/ContentValues;
    const-string v5, "cleared"

    const/4 v6, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1287
    const-string v5, "notifications"

    const-string v6, "cleared=?"

    invoke-virtual {v0, v5, v2, v6, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v5

    add-int/2addr v1, v5

    .line 1288
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1290
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1293
    monitor-exit p0

    return v1

    .line 1290
    .end local v2           #values:Landroid/content/ContentValues;
    .end local v3           #whereArgs:[Ljava/lang/String;
    .end local v4           #whereClause:Ljava/lang/String;
    :catchall_0
    move-exception v5

    :try_start_3
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1278
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #updated:I
    :catchall_1
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method public declared-synchronized mergeActivity(Ljava/util/Collection;II)I
    .locals 33
    .parameter
    .parameter "next"
    .parameter "previous"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VineNotification;",
            ">;II)I"
        }
    .end annotation

    .prologue
    .line 839
    .local p1, notifs:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VineNotification;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    .line 840
    .local v5, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v21, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v21

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 843
    .local v21, newNotifs:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineNotification;>;"
    new-instance v31, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v31

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 846
    .local v31, updatedNotifs:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineNotification;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lco/vine/android/api/VineNotification;

    .line 847
    .local v22, notif:Lco/vine/android/api/VineNotification;
    move-object/from16 v0, v22

    iget-wide v6, v0, Lco/vine/android/api/VineNotification;->notificationId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 839
    .end local v5           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v17           #i$:Ljava/util/Iterator;
    .end local v21           #newNotifs:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineNotification;>;"
    .end local v22           #notif:Lco/vine/android/api/VineNotification;
    .end local v31           #updatedNotifs:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineNotification;>;"
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 850
    .restart local v5       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v17       #i$:Ljava/util/Iterator;
    .restart local v21       #newNotifs:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineNotification;>;"
    .restart local v31       #updatedNotifs:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineNotification;>;"
    :cond_0
    :try_start_1
    const-string v6, "activity"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "notification_id"

    aput-object v9, v7, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 852
    .local v15, c:Landroid/database/Cursor;
    if-eqz v15, :cond_3

    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 855
    :cond_1
    const/4 v6, 0x0

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v23

    .line 856
    .local v23, notifId:J
    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v21

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lco/vine/android/api/VineNotification;

    .line 857
    .restart local v22       #notif:Lco/vine/android/api/VineNotification;
    if-eqz v22, :cond_2

    .line 858
    invoke-static/range {v23 .. v24}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v31

    move-object/from16 v1, v22

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 860
    :cond_2
    invoke-interface {v15}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_1

    .line 861
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 864
    .end local v22           #notif:Lco/vine/android/api/VineNotification;
    .end local v23           #notifId:J
    :cond_3
    const/16 v18, 0x0

    .line 865
    .local v18, inserted:I
    const/16 v30, 0x0

    .line 866
    .local v30, updated:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v19

    .line 867
    .local v19, lastRefresh:J
    invoke-virtual/range {v21 .. v21}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6

    .line 868
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 870
    :try_start_2
    new-instance v32, Landroid/content/ContentValues;

    invoke-direct/range {v32 .. v32}, Landroid/content/ContentValues;-><init>()V

    .line 871
    .local v32, values:Landroid/content/ContentValues;
    invoke-virtual/range {v21 .. v21}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lco/vine/android/api/VineNotification;

    .line 872
    .restart local v22       #notif:Lco/vine/android/api/VineNotification;
    invoke-virtual/range {v32 .. v32}, Landroid/content/ContentValues;->clear()V

    .line 873
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v22

    move-wide/from16 v3, v19

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillActivityValues(Landroid/content/ContentValues;Lco/vine/android/api/VineNotification;J)V

    .line 874
    const-string v6, "activity"

    const-string v7, "notification_id"

    move-object/from16 v0, v32

    invoke-virtual {v5, v6, v7, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_4

    const/4 v6, 0x1

    :goto_2
    add-int v18, v18, v6

    .line 876
    goto :goto_1

    .line 874
    :cond_4
    const/4 v6, 0x0

    goto :goto_2

    .line 877
    .end local v22           #notif:Lco/vine/android/api/VineNotification;
    :cond_5
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 879
    :try_start_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 882
    .end local v32           #values:Landroid/content/ContentValues;
    :cond_6
    invoke-virtual/range {v31 .. v31}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_9

    .line 883
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 885
    :try_start_4
    new-instance v32, Landroid/content/ContentValues;

    invoke-direct/range {v32 .. v32}, Landroid/content/ContentValues;-><init>()V

    .line 886
    .restart local v32       #values:Landroid/content/ContentValues;
    invoke-virtual/range {v31 .. v31}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_3
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v22

    check-cast v22, Lco/vine/android/api/VineNotification;

    .line 887
    .restart local v22       #notif:Lco/vine/android/api/VineNotification;
    invoke-virtual/range {v32 .. v32}, Landroid/content/ContentValues;->clear()V

    .line 888
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v22

    move-wide/from16 v3, v19

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillActivityValues(Landroid/content/ContentValues;Lco/vine/android/api/VineNotification;J)V

    .line 889
    const-string v6, "activity"

    const-string v7, "notification_id=?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    move-object/from16 v0, v22

    iget-wide v10, v0, Lco/vine/android/api/VineNotification;->notificationId:J

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    move-object/from16 v0, v32

    invoke-virtual {v5, v6, v0, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result v6

    if-lez v6, :cond_7

    const/4 v6, 0x1

    :goto_4
    add-int v30, v30, v6

    .line 892
    goto :goto_3

    .line 879
    .end local v22           #notif:Lco/vine/android/api/VineNotification;
    .end local v32           #values:Landroid/content/ContentValues;
    :catchall_1
    move-exception v6

    :try_start_5
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 889
    .restart local v22       #notif:Lco/vine/android/api/VineNotification;
    .restart local v32       #values:Landroid/content/ContentValues;
    :cond_7
    const/4 v6, 0x0

    goto :goto_4

    .line 893
    .end local v22           #notif:Lco/vine/android/api/VineNotification;
    :cond_8
    :try_start_6
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 895
    :try_start_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 900
    .end local v32           #values:Landroid/content/ContentValues;
    :cond_9
    const/16 v16, 0x0

    .line 901
    .local v16, deleted:I
    if-lez v18, :cond_d

    .line 902
    const-string v6, "activity"

    sget-object v7, Lco/vine/android/provider/VineDatabaseSQL$TableQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v28

    .line 904
    .local v28, tableCursor:Landroid/database/Cursor;
    if-eqz v28, :cond_d

    invoke-interface/range {v28 .. v28}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 905
    invoke-interface/range {v28 .. v28}, Landroid/database/Cursor;->getCount()I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v29

    .line 906
    .local v29, tableSize:I
    const/16 v6, 0x1f4

    move/from16 v0, v29

    if-le v0, v6, :cond_c

    .line 908
    :try_start_8
    const-string v6, "SELECT last_refresh FROM activity ORDER BY last_refresh DESC LIMIT 1 OFFSET 249"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v27

    .line 913
    .local v27, oldestNthRow:Landroid/database/Cursor;
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 914
    if-eqz v27, :cond_b

    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_b

    .line 915
    const/4 v6, 0x0

    move-object/from16 v0, v27

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v25

    .line 916
    .local v25, oldestNthId:J
    const-string v6, "activity"

    const-string v7, "last_refresh<?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static/range {v25 .. v26}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v5, v6, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v16

    .line 919
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_a

    .line 920
    const-string v6, "s"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Due to reaching maximum table size ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v29

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " with a max of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x1f4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "), deleted "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v16

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " activity, all less than refresh time "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v0, v25

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 925
    :cond_a
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->close()V

    .line 927
    .end local v25           #oldestNthId:J
    :cond_b
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 929
    :try_start_9
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 932
    .end local v27           #oldestNthRow:Landroid/database/Cursor;
    :cond_c
    invoke-interface/range {v28 .. v28}, Landroid/database/Cursor;->close()V

    .line 936
    .end local v28           #tableCursor:Landroid/database/Cursor;
    .end local v29           #tableSize:I
    :cond_d
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_e

    .line 937
    const-string v6, "VineDH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Inserted "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v18

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " new notifications and updated "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v30

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 940
    :cond_e
    if-gtz p2, :cond_f

    if-lez p3, :cond_10

    .line 941
    :cond_f
    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-wide/16 v12, 0x0

    const/4 v14, 0x1

    move-object/from16 v6, p0

    move/from16 v10, p2

    move/from16 v11, p3

    invoke-virtual/range {v6 .. v14}, Lco/vine/android/provider/VineDatabaseHelper;->savePageCursor(IILjava/lang/String;IIJZ)I

    .line 944
    :cond_10
    if-gtz v18, :cond_11

    if-gtz v30, :cond_11

    if-lez v16, :cond_12

    .line 945
    :cond_11
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 946
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 947
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 949
    :cond_12
    monitor-exit p0

    return v18

    .line 895
    .end local v16           #deleted:I
    :catchall_2
    move-exception v6

    :try_start_a
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6

    .line 929
    .restart local v16       #deleted:I
    .restart local v28       #tableCursor:Landroid/database/Cursor;
    .restart local v29       #tableSize:I
    :catchall_3
    move-exception v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
.end method

.method public declared-synchronized mergeChannels(Ljava/util/Collection;II)I
    .locals 14
    .parameter
    .parameter "next"
    .parameter "previous"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VineChannel;",
            ">;II)I"
        }
    .end annotation

    .prologue
    .line 1771
    .local p1, channels:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VineChannel;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v10

    .line 1772
    .local v10, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v12, 0x0

    .line 1773
    .local v12, inserted:I
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 1774
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1776
    :try_start_1
    const-string v0, "channels"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v10, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1777
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 1778
    .local v13, values:Landroid/content/ContentValues;
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lco/vine/android/api/VineChannel;

    .line 1779
    .local v9, channel:Lco/vine/android/api/VineChannel;
    invoke-virtual {v13}, Landroid/content/ContentValues;->clear()V

    .line 1780
    invoke-direct {p0, v13, v9}, Lco/vine/android/provider/VineDatabaseHelper;->fillChannelValues(Landroid/content/ContentValues;Lco/vine/android/api/VineChannel;)V

    .line 1781
    const-string v0, "channels"

    const/4 v1, 0x0

    invoke-virtual {v10, v0, v1, v13}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_1
    add-int/2addr v12, v0

    .line 1783
    goto :goto_0

    .line 1781
    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    .line 1784
    .end local v9           #channel:Lco/vine/android/api/VineChannel;
    :cond_1
    invoke-virtual {v10}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1786
    :try_start_2
    invoke-virtual {p0, v10}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1790
    .end local v11           #i$:Ljava/util/Iterator;
    .end local v13           #values:Landroid/content/ContentValues;
    :cond_2
    if-gtz p2, :cond_3

    if-lez p3, :cond_4

    .line 1791
    :cond_3
    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-wide/16 v6, 0x0

    const/4 v8, 0x1

    move-object v0, p0

    move/from16 v4, p2

    move/from16 v5, p3

    invoke-virtual/range {v0 .. v8}, Lco/vine/android/provider/VineDatabaseHelper;->savePageCursor(IILjava/lang/String;IIJZ)I

    .line 1794
    :cond_4
    if-lez v12, :cond_6

    .line 1795
    sget-boolean v0, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v0, :cond_5

    .line 1796
    const-string v0, "VineDH"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Inserted "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " new channels."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1798
    :cond_5
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$Channels;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1800
    :cond_6
    monitor-exit p0

    return v12

    .line 1786
    :catchall_0
    move-exception v0

    :try_start_3
    invoke-virtual {p0, v10}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1771
    .end local v10           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v12           #inserted:I
    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized mergeComments(Ljava/util/Collection;JIIJZZ)Lco/vine/android/provider/DbResponse;
    .locals 51
    .parameter
    .parameter "postId"
    .parameter "nextPage"
    .parameter "prevPage"
    .parameter "anchor"
    .parameter "notify"
    .parameter "fromPostComment"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VineComment;",
            ">;JIIJZZ)",
            "Lco/vine/android/provider/DbResponse;"
        }
    .end annotation

    .prologue
    .line 668
    .local p1, comments:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VineComment;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v17

    .line 671
    .local v17, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v36, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v5

    move-object/from16 v0, v36

    invoke-direct {v0, v5}, Ljava/util/HashMap;-><init>(I)V

    .line 673
    .local v36, newComments:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineComment;>;"
    new-instance v48, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v5

    move-object/from16 v0, v48

    invoke-direct {v0, v5}, Ljava/util/HashMap;-><init>(I)V

    .line 675
    .local v48, updatedComments:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineComment;>;"
    const-wide v39, 0x7fffffffffffffffL

    .line 676
    .local v39, oldestCommentId:J
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v33

    .local v33, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Lco/vine/android/api/VineComment;

    .line 677
    .local v50, vc:Lco/vine/android/api/VineComment;
    move-wide/from16 v0, p2

    move-object/from16 v2, v50

    iput-wide v0, v2, Lco/vine/android/api/VineComment;->postId:J

    .line 678
    move-object/from16 v0, v50

    iget-wide v5, v0, Lco/vine/android/api/VineComment;->commentId:J

    cmp-long v5, v5, v39

    if-gez v5, :cond_0

    .line 679
    move-object/from16 v0, v50

    iget-wide v0, v0, Lco/vine/android/api/VineComment;->commentId:J

    move-wide/from16 v39, v0

    .line 681
    :cond_0
    move-object/from16 v0, v50

    iget-wide v5, v0, Lco/vine/android/api/VineComment;->commentId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v36

    move-object/from16 v1, v50

    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 668
    .end local v17           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v33           #i$:Ljava/util/Iterator;
    .end local v36           #newComments:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineComment;>;"
    .end local v39           #oldestCommentId:J
    .end local v48           #updatedComments:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineComment;>;"
    .end local v50           #vc:Lco/vine/android/api/VineComment;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5

    .line 684
    .restart local v17       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v33       #i$:Ljava/util/Iterator;
    .restart local v36       #newComments:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineComment;>;"
    .restart local v39       #oldestCommentId:J
    .restart local v48       #updatedComments:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineComment;>;"
    :cond_1
    if-gtz p4, :cond_2

    if-gtz p5, :cond_2

    const-wide/16 v5, 0x0

    cmp-long v5, p6, v5

    if-lez v5, :cond_3

    .line 685
    :cond_2
    const/4 v6, 0x5

    const/4 v7, 0x0

    :try_start_1
    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    const/4 v13, 0x0

    move-object/from16 v5, p0

    move/from16 v9, p4

    move/from16 v10, p5

    move-wide/from16 v11, p6

    invoke-virtual/range {v5 .. v13}, Lco/vine/android/provider/VineDatabaseHelper;->savePageCursor(IILjava/lang/String;IIJZ)I

    .line 688
    :cond_3
    const/16 v30, 0x1

    .line 691
    .local v30, contiguous:Z
    const-string v8, "post_id =? "

    .line 692
    .local v8, selectionString:Ljava/lang/String;
    const/4 v5, 0x1

    new-array v9, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v9, v5

    .line 693
    .local v9, selectionArgs:[Ljava/lang/String;
    const-string v6, "comments"

    sget-object v7, Lco/vine/android/provider/VineDatabaseSQL$CommentsQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v12, "comment_id DESC"

    move-object/from16 v5, v17

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v26

    .line 695
    .local v26, c:Landroid/database/Cursor;
    if-eqz v26, :cond_8

    invoke-interface/range {v26 .. v26}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_8

    .line 696
    const/4 v5, 0x1

    move-object/from16 v0, v26

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    cmp-long v5, v39, v5

    if-gtz v5, :cond_5

    const/16 v30, 0x1

    .line 698
    :goto_1
    const/4 v5, -0x1

    move-object/from16 v0, v26

    invoke-interface {v0, v5}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 699
    :cond_4
    :goto_2
    invoke-interface/range {v26 .. v26}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-eqz v5, :cond_7

    .line 700
    const/4 v5, 0x1

    move-object/from16 v0, v26

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v28

    .line 701
    .local v28, commentId:J
    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v36

    invoke-virtual {v0, v5}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lco/vine/android/api/VineComment;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 702
    .local v27, comment:Lco/vine/android/api/VineComment;
    if-eqz v27, :cond_4

    .line 703
    const/16 v25, 0x0

    .line 705
    .local v25, avatarUrl:Ljava/lang/String;
    const/4 v5, 0x3

    :try_start_2
    move-object/from16 v0, v26

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v25

    .line 710
    :goto_3
    if-nez v25, :cond_6

    :try_start_3
    move-object/from16 v0, v27

    iget-object v5, v0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    if-eqz v5, :cond_4

    .line 712
    :goto_4
    invoke-static/range {v28 .. v29}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v48

    move-object/from16 v1, v27

    invoke-virtual {v0, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 696
    .end local v25           #avatarUrl:Ljava/lang/String;
    .end local v27           #comment:Lco/vine/android/api/VineComment;
    .end local v28           #commentId:J
    :cond_5
    const/16 v30, 0x0

    goto :goto_1

    .line 706
    .restart local v25       #avatarUrl:Ljava/lang/String;
    .restart local v27       #comment:Lco/vine/android/api/VineComment;
    .restart local v28       #commentId:J
    :catch_0
    move-exception v32

    .line 707
    .local v32, e:Landroid/database/sqlite/SQLiteException;
    move-object/from16 v0, v27

    iget-object v0, v0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    move-object/from16 v25, v0

    .line 708
    invoke-static/range {v32 .. v32}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_3

    .line 710
    .end local v32           #e:Landroid/database/sqlite/SQLiteException;
    :cond_6
    move-object/from16 v0, v27

    iget-object v5, v0, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    move-object/from16 v0, v25

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    goto :goto_4

    .line 716
    .end local v25           #avatarUrl:Ljava/lang/String;
    .end local v27           #comment:Lco/vine/android/api/VineComment;
    .end local v28           #commentId:J
    :cond_7
    invoke-interface/range {v26 .. v26}, Landroid/database/Cursor;->close()V

    .line 719
    :cond_8
    invoke-virtual/range {v36 .. v36}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-virtual/range {v48 .. v48}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_9

    .line 720
    new-instance v5, Lco/vine/android/provider/DbResponse;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v10, 0x2

    invoke-direct {v5, v6, v7, v10}, Lco/vine/android/provider/DbResponse;-><init>(III)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 834
    :goto_5
    monitor-exit p0

    return-object v5

    .line 723
    :cond_9
    :try_start_4
    invoke-virtual/range {v36 .. v36}, Ljava/util/HashMap;->size()I

    move-result v5

    invoke-virtual/range {v48 .. v48}, Ljava/util/HashMap;->size()I

    move-result v6

    add-int v45, v5, v6

    .line 724
    .local v45, size:I
    new-instance v11, Ljava/util/ArrayList;

    move/from16 v0, v45

    invoke-direct {v11, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 725
    .local v11, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    new-instance v16, Ljava/util/HashMap;

    move-object/from16 v0, v16

    move/from16 v1, v45

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 726
    .local v16, orderMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Long;>;"
    invoke-virtual/range {v36 .. v36}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v33

    :cond_a
    :goto_6
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_b

    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Lco/vine/android/api/VineComment;

    .line 727
    .restart local v50       #vc:Lco/vine/android/api/VineComment;
    move-object/from16 v0, v50

    iget-object v5, v0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    if-eqz v5, :cond_a

    .line 728
    move-object/from16 v0, v50

    iget-object v5, v0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 729
    move-object/from16 v0, v50

    iget-object v5, v0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    iget-wide v5, v5, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v50

    iget-wide v6, v0, Lco/vine/android/api/VineComment;->commentId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v16

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    .line 732
    .end local v50           #vc:Lco/vine/android/api/VineComment;
    :cond_b
    invoke-virtual/range {v48 .. v48}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v33

    :cond_c
    :goto_7
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_d

    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v50

    check-cast v50, Lco/vine/android/api/VineComment;

    .line 733
    .restart local v50       #vc:Lco/vine/android/api/VineComment;
    move-object/from16 v0, v50

    iget-object v5, v0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    if-eqz v5, :cond_c

    .line 734
    move-object/from16 v0, v50

    iget-object v5, v0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v11, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 735
    move-object/from16 v0, v50

    iget-object v5, v0, Lco/vine/android/api/VineComment;->user:Lco/vine/android/api/VineUser;

    iget-wide v5, v5, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object/from16 v0, v50

    iget-wide v6, v0, Lco/vine/android/api/VineComment;->commentId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v16

    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .line 739
    .end local v50           #vc:Lco/vine/android/api/VineComment;
    :cond_d
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_e

    .line 740
    const/4 v12, 0x3

    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v10, p0

    invoke-virtual/range {v10 .. v16}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 744
    :cond_e
    const/16 v37, 0x0

    .line 745
    .local v37, numInserted:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v34

    .line 746
    .local v34, lastRefresh:J
    invoke-virtual/range {v36 .. v36}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_11

    .line 747
    invoke-virtual/range {v17 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 749
    :try_start_5
    new-instance v49, Landroid/content/ContentValues;

    invoke-direct/range {v49 .. v49}, Landroid/content/ContentValues;-><init>()V

    .line 750
    .local v49, values:Landroid/content/ContentValues;
    invoke-virtual/range {v36 .. v36}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v33

    :goto_8
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_10

    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lco/vine/android/api/VineComment;

    .line 751
    .restart local v27       #comment:Lco/vine/android/api/VineComment;
    invoke-virtual/range {v49 .. v49}, Landroid/content/ContentValues;->clear()V

    .line 752
    move-object/from16 v0, p0

    move-object/from16 v1, v49

    move-object/from16 v2, v27

    move-wide/from16 v3, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillCommentValues(Landroid/content/ContentValues;Lco/vine/android/api/VineComment;J)V

    .line 753
    const-string v5, "comments"

    const/4 v6, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v49

    invoke-virtual {v0, v5, v6, v1}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v5

    const-wide/16 v12, 0x0

    cmp-long v5, v5, v12

    if-lez v5, :cond_f

    const/4 v5, 0x1

    :goto_9
    add-int v37, v37, v5

    .line 754
    goto :goto_8

    .line 753
    :cond_f
    const/4 v5, 0x0

    goto :goto_9

    .line 755
    .end local v27           #comment:Lco/vine/android/api/VineComment;
    :cond_10
    invoke-virtual/range {v17 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 757
    :try_start_6
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 761
    .end local v49           #values:Landroid/content/ContentValues;
    :cond_11
    const/16 v38, 0x0

    .line 762
    .local v38, numUpdated:I
    invoke-virtual/range {v48 .. v48}, Ljava/util/HashMap;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_14

    .line 763
    invoke-virtual/range {v17 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 765
    :try_start_7
    new-instance v49, Landroid/content/ContentValues;

    invoke-direct/range {v49 .. v49}, Landroid/content/ContentValues;-><init>()V

    .line 766
    .restart local v49       #values:Landroid/content/ContentValues;
    invoke-virtual/range {v48 .. v48}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v33

    :goto_a
    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_13

    invoke-interface/range {v33 .. v33}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lco/vine/android/api/VineComment;

    .line 767
    .restart local v27       #comment:Lco/vine/android/api/VineComment;
    invoke-virtual/range {v49 .. v49}, Landroid/content/ContentValues;->clear()V

    .line 768
    move-object/from16 v0, p0

    move-object/from16 v1, v49

    move-object/from16 v2, v27

    move-wide/from16 v3, v34

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillCommentValues(Landroid/content/ContentValues;Lco/vine/android/api/VineComment;J)V

    .line 769
    const-string v5, "comments"

    const-string v6, "comment_id=?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v10, 0x0

    move-object/from16 v0, v27

    iget-wide v12, v0, Lco/vine/android/api/VineComment;->commentId:J

    invoke-static {v12, v13}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v7, v10

    move-object/from16 v0, v17

    move-object/from16 v1, v49

    invoke-virtual {v0, v5, v1, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    move-result v5

    if-lez v5, :cond_12

    const/4 v5, 0x1

    :goto_b
    add-int v38, v38, v5

    .line 772
    goto :goto_a

    .line 757
    .end local v27           #comment:Lco/vine/android/api/VineComment;
    .end local v38           #numUpdated:I
    .end local v49           #values:Landroid/content/ContentValues;
    :catchall_1
    move-exception v5

    :try_start_8
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v5
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 769
    .restart local v27       #comment:Lco/vine/android/api/VineComment;
    .restart local v38       #numUpdated:I
    .restart local v49       #values:Landroid/content/ContentValues;
    :cond_12
    const/4 v5, 0x0

    goto :goto_b

    .line 773
    .end local v27           #comment:Lco/vine/android/api/VineComment;
    :cond_13
    :try_start_9
    invoke-virtual/range {v17 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 775
    :try_start_a
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 781
    .end local v49           #values:Landroid/content/ContentValues;
    :cond_14
    if-nez v30, :cond_15

    if-eqz p9, :cond_1d

    .line 782
    :cond_15
    const/16 v44, 0x1

    .line 789
    .local v44, response:I
    :goto_c
    const/16 v31, 0x0

    .line 790
    .local v31, deleted:I
    if-lez v37, :cond_19

    .line 791
    const-string v18, "comments"

    sget-object v19, Lco/vine/android/provider/VineDatabaseSQL$TableQuery;->PROJECTION:[Ljava/lang/String;

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    invoke-virtual/range {v17 .. v24}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v46

    .line 793
    .local v46, tableCursor:Landroid/database/Cursor;
    if-eqz v46, :cond_19

    invoke-interface/range {v46 .. v46}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_19

    .line 794
    invoke-interface/range {v46 .. v46}, Landroid/database/Cursor;->getCount()I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    move-result v47

    .line 795
    .local v47, tableSize:I
    const/16 v5, 0x1388

    move/from16 v0, v47

    if-le v0, v5, :cond_18

    .line 797
    :try_start_b
    const-string v5, "SELECT last_refresh FROM comments ORDER BY last_refresh DESC LIMIT 1 OFFSET 2500"

    const/4 v6, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v43

    .line 802
    .local v43, oldestNthRow:Landroid/database/Cursor;
    invoke-virtual/range {v17 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 803
    if-eqz v43, :cond_17

    invoke-interface/range {v43 .. v43}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v5

    if-eqz v5, :cond_17

    .line 804
    const/4 v5, 0x0

    move-object/from16 v0, v43

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v41

    .line 805
    .local v41, oldestNthId:J
    const-string v5, "comments"

    const-string v6, "last_refresh<?"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v10, 0x0

    invoke-static/range {v41 .. v42}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v7, v10

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v31

    .line 808
    sget-boolean v5, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v5, :cond_16

    .line 809
    const-string v5, "s"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Due to reaching maximum table size ("

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v47

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " with a max of "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x1388

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "), deleted "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v31

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " comments, all less than"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " refresh time "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-wide/from16 v0, v41

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 814
    :cond_16
    invoke-interface/range {v43 .. v43}, Landroid/database/Cursor;->close()V

    .line 816
    .end local v41           #oldestNthId:J
    :cond_17
    invoke-virtual/range {v17 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 818
    :try_start_c
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 821
    .end local v43           #oldestNthRow:Landroid/database/Cursor;
    :cond_18
    invoke-interface/range {v46 .. v46}, Landroid/database/Cursor;->close()V

    .line 825
    .end local v46           #tableCursor:Landroid/database/Cursor;
    .end local v47           #tableSize:I
    :cond_19
    if-eqz p8, :cond_1b

    if-gtz v37, :cond_1a

    if-gtz v38, :cond_1a

    if-lez v31, :cond_1b

    .line 826
    :cond_1a
    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v6, Lco/vine/android/provider/Vine$Comments;->CONTENT_URI:Landroid/net/Uri;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 827
    invoke-direct/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V

    .line 830
    :cond_1b
    sget-boolean v5, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v5, :cond_1c

    .line 831
    const-string v5, "VineDH"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Inserted "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v37

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " comments and updated "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move/from16 v0, v38

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 834
    :cond_1c
    new-instance v5, Lco/vine/android/provider/DbResponse;

    move/from16 v0, v37

    move/from16 v1, v38

    move/from16 v2, v44

    invoke-direct {v5, v0, v1, v2}, Lco/vine/android/provider/DbResponse;-><init>(III)V

    goto/16 :goto_5

    .line 775
    .end local v31           #deleted:I
    .end local v44           #response:I
    :catchall_2
    move-exception v5

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v5

    .line 784
    :cond_1d
    const-string v5, "comments"

    const-string v6, "post_id =? AND comment_id <? "

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/String;

    const/4 v10, 0x0

    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v7, v10

    const/4 v10, 0x1

    invoke-static/range {v39 .. v40}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v7, v10

    move-object/from16 v0, v17

    invoke-virtual {v0, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 785
    const/16 v44, 0x4

    .restart local v44       #response:I
    goto/16 :goto_c

    .line 818
    .restart local v31       #deleted:I
    .restart local v46       #tableCursor:Landroid/database/Cursor;
    .restart local v47       #tableSize:I
    :catchall_3
    move-exception v5

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v5
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0
.end method

.method public mergeEditions(Ljava/util/ArrayList;)V
    .locals 10
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .local p1, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    const/4 v9, 0x0

    .line 2813
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2815
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v5, "editions"

    invoke-virtual {v0, v5, v9, v9}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2817
    const/4 v3, 0x0

    .line 2818
    .local v3, numInserted:I
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_1

    .line 2819
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 2821
    :try_start_0
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 2822
    .local v4, values:Landroid/content/ContentValues;
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    .line 2823
    .local v1, edition:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v6, "edition_code"

    iget-object v5, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2824
    const-string v6, "edition_name"

    iget-object v5, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v4, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2825
    int-to-long v5, v3

    const-string v7, "editions"

    const/4 v8, 0x0

    invoke-virtual {v0, v7, v8, v4}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v7

    add-long/2addr v5, v7

    long-to-int v3, v5

    .line 2826
    goto :goto_0

    .line 2827
    .end local v1           #edition:Landroid/util/Pair;,"Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2829
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 2833
    .end local v2           #i$:Ljava/util/Iterator;
    .end local v4           #values:Landroid/content/ContentValues;
    :cond_1
    if-lez v3, :cond_2

    .line 2834
    iget-object v5, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v6, Lco/vine/android/provider/Vine$Editions;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v5, v6, v9}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2836
    :cond_2
    return-void

    .line 2829
    :catchall_0
    move-exception v5

    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v5
.end method

.method public declared-synchronized mergeLikes(Ljava/util/Collection;JII)I
    .locals 41
    .parameter
    .parameter "postId"
    .parameter "next"
    .parameter "previous"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VineLike;",
            ">;JII)I"
        }
    .end annotation

    .prologue
    .line 517
    .local p1, items:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VineLike;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    .line 519
    .local v5, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v29, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v29

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 521
    .local v29, newLikes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineLike;>;"
    new-instance v38, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v38

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 523
    .local v38, updatedLikes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineLike;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v23

    .local v23, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lco/vine/android/api/VineLike;

    .line 524
    .local v26, like:Lco/vine/android/api/VineLike;
    move-wide/from16 v0, p2

    move-object/from16 v2, v26

    iput-wide v0, v2, Lco/vine/android/api/VineLike;->postId:J

    .line 525
    move-object/from16 v0, v26

    iget-wide v8, v0, Lco/vine/android/api/VineLike;->likeId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v29

    move-object/from16 v1, v26

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 517
    .end local v5           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v23           #i$:Ljava/util/Iterator;
    .end local v26           #like:Lco/vine/android/api/VineLike;
    .end local v29           #newLikes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineLike;>;"
    .end local v38           #updatedLikes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineLike;>;"
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 528
    .restart local v5       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v23       #i$:Ljava/util/Iterator;
    .restart local v29       #newLikes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineLike;>;"
    .restart local v38       #updatedLikes:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineLike;>;"
    :cond_0
    :try_start_1
    const-string v6, "likes"

    sget-object v7, Lco/vine/android/provider/VineDatabaseSQL$LikesQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v21

    .line 531
    .local v21, c:Landroid/database/Cursor;
    if-eqz v21, :cond_3

    .line 532
    :cond_1
    :goto_1
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 533
    const/4 v6, 0x1

    move-object/from16 v0, v21

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v27

    .line 534
    .local v27, likeId:J
    invoke-static/range {v27 .. v28}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v29

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lco/vine/android/api/VineLike;

    .line 535
    .restart local v26       #like:Lco/vine/android/api/VineLike;
    if-eqz v26, :cond_1

    .line 536
    invoke-static/range {v27 .. v28}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v38

    move-object/from16 v1, v26

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 539
    .end local v26           #like:Lco/vine/android/api/VineLike;
    .end local v27           #likeId:J
    :cond_2
    invoke-interface/range {v21 .. v21}, Landroid/database/Cursor;->close()V

    .line 542
    :cond_3
    invoke-virtual/range {v29 .. v29}, Ljava/util/HashMap;->size()I

    move-result v6

    invoke-virtual/range {v38 .. v38}, Ljava/util/HashMap;->size()I

    move-result v8

    add-int v37, v6, v8

    .line 543
    .local v37, totalSize:I
    new-instance v12, Ljava/util/HashMap;

    move/from16 v0, v37

    invoke-direct {v12, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 544
    .local v12, orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    new-instance v7, Ljava/util/ArrayList;

    move/from16 v0, v37

    invoke-direct {v7, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 546
    .local v7, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    invoke-virtual/range {v29 .. v29}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_4
    :goto_2
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Lco/vine/android/api/VineLike;

    .line 547
    .local v40, vc:Lco/vine/android/api/VineLike;
    move-object/from16 v0, v40

    iget-object v6, v0, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    if-eqz v6, :cond_4

    .line 548
    move-object/from16 v0, v40

    iget-object v6, v0, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 549
    move-object/from16 v0, v40

    iget-object v6, v0, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    iget-wide v8, v6, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v40

    iget-wide v8, v0, Lco/vine/android/api/VineLike;->likeId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v12, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 553
    .end local v40           #vc:Lco/vine/android/api/VineLike;
    :cond_5
    invoke-virtual/range {v38 .. v38}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :cond_6
    :goto_3
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v40

    check-cast v40, Lco/vine/android/api/VineLike;

    .line 554
    .restart local v40       #vc:Lco/vine/android/api/VineLike;
    move-object/from16 v0, v40

    iget-object v6, v0, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    if-eqz v6, :cond_6

    .line 555
    move-object/from16 v0, v40

    iget-object v6, v0, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v7, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 556
    move-object/from16 v0, v40

    iget-object v6, v0, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    iget-wide v8, v6, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v40

    iget-wide v8, v0, Lco/vine/android/api/VineLike;->likeId:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    invoke-virtual {v12, v6, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 560
    .end local v40           #vc:Lco/vine/android/api/VineLike;
    :cond_7
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_8

    .line 561
    const/4 v8, 0x5

    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    move-object/from16 v6, p0

    move/from16 v10, p4

    move/from16 v11, p5

    invoke-virtual/range {v6 .. v12}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 565
    :cond_8
    const/16 v30, 0x0

    .line 566
    .local v30, numInserted:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v24

    .line 567
    .local v24, lastRefresh:J
    invoke-virtual/range {v29 .. v29}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_b

    .line 568
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 570
    :try_start_2
    new-instance v39, Landroid/content/ContentValues;

    invoke-direct/range {v39 .. v39}, Landroid/content/ContentValues;-><init>()V

    .line 571
    .local v39, values:Landroid/content/ContentValues;
    invoke-virtual/range {v29 .. v29}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_4
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lco/vine/android/api/VineLike;

    .line 572
    .restart local v26       #like:Lco/vine/android/api/VineLike;
    invoke-virtual/range {v39 .. v39}, Landroid/content/ContentValues;->clear()V

    .line 573
    move-object/from16 v0, p0

    move-object/from16 v1, v39

    move-object/from16 v2, v26

    move-wide/from16 v3, v24

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillLikeValues(Landroid/content/ContentValues;Lco/vine/android/api/VineLike;J)V

    .line 574
    const-string v6, "likes"

    const/4 v8, 0x0

    move-object/from16 v0, v39

    invoke-virtual {v5, v6, v8, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v6, v8, v10

    if-lez v6, :cond_9

    const/4 v6, 0x1

    :goto_5
    add-int v30, v30, v6

    .line 575
    goto :goto_4

    .line 574
    :cond_9
    const/4 v6, 0x0

    goto :goto_5

    .line 576
    .end local v26           #like:Lco/vine/android/api/VineLike;
    :cond_a
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 578
    :try_start_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 582
    .end local v39           #values:Landroid/content/ContentValues;
    :cond_b
    const/16 v31, 0x0

    .line 583
    .local v31, numUpdated:I
    invoke-virtual/range {v38 .. v38}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_e

    .line 584
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 586
    :try_start_4
    new-instance v39, Landroid/content/ContentValues;

    invoke-direct/range {v39 .. v39}, Landroid/content/ContentValues;-><init>()V

    .line 587
    .restart local v39       #values:Landroid/content/ContentValues;
    invoke-virtual/range {v38 .. v38}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v23

    :goto_6
    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-interface/range {v23 .. v23}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lco/vine/android/api/VineLike;

    .line 588
    .restart local v26       #like:Lco/vine/android/api/VineLike;
    invoke-virtual/range {v39 .. v39}, Landroid/content/ContentValues;->clear()V

    .line 589
    move-object/from16 v0, p0

    move-object/from16 v1, v39

    move-object/from16 v2, v26

    move-wide/from16 v3, v24

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillLikeValues(Landroid/content/ContentValues;Lco/vine/android/api/VineLike;J)V

    .line 590
    const-string v6, "likes"

    const-string v8, "like_id=?"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    move-object/from16 v0, v26

    iget-wide v13, v0, Lco/vine/android/api/VineLike;->likeId:J

    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    move-object/from16 v0, v39

    invoke-virtual {v5, v6, v0, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result v6

    if-lez v6, :cond_c

    const/4 v6, 0x1

    :goto_7
    add-int v31, v31, v6

    .line 592
    goto :goto_6

    .line 578
    .end local v26           #like:Lco/vine/android/api/VineLike;
    .end local v31           #numUpdated:I
    .end local v39           #values:Landroid/content/ContentValues;
    :catchall_1
    move-exception v6

    :try_start_5
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 590
    .restart local v26       #like:Lco/vine/android/api/VineLike;
    .restart local v31       #numUpdated:I
    .restart local v39       #values:Landroid/content/ContentValues;
    :cond_c
    const/4 v6, 0x0

    goto :goto_7

    .line 593
    .end local v26           #like:Lco/vine/android/api/VineLike;
    :cond_d
    :try_start_6
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 595
    :try_start_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 601
    .end local v39           #values:Landroid/content/ContentValues;
    :cond_e
    const/16 v22, 0x0

    .line 602
    .local v22, deleted:I
    if-lez v30, :cond_12

    .line 603
    const-string v14, "likes"

    sget-object v15, Lco/vine/android/provider/VineDatabaseSQL$TableQuery;->PROJECTION:[Ljava/lang/String;

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    move-object v13, v5

    invoke-virtual/range {v13 .. v20}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v36

    .line 605
    .local v36, tableCursor:Landroid/database/Cursor;
    if-eqz v36, :cond_12

    invoke-interface/range {v36 .. v36}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_12

    .line 606
    invoke-interface/range {v36 .. v36}, Landroid/database/Cursor;->getCount()I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v35

    .line 607
    .local v35, size:I
    const/16 v6, 0x1388

    move/from16 v0, v35

    if-le v0, v6, :cond_11

    .line 609
    :try_start_8
    const-string v6, "SELECT last_refresh FROM likes ORDER BY last_refresh DESC LIMIT 1 OFFSET 2500"

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v8}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v34

    .line 614
    .local v34, oldestNthRow:Landroid/database/Cursor;
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 615
    if-eqz v34, :cond_10

    invoke-interface/range {v34 .. v34}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_10

    .line 616
    const/4 v6, 0x0

    move-object/from16 v0, v34

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v32

    .line 617
    .local v32, oldestNthId:J
    const-string v6, "likes"

    const-string v8, "last_refresh<?"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    invoke-static/range {v32 .. v33}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v5, v6, v8, v9}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v22

    .line 619
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_f

    .line 620
    const-string v6, "s"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Due to reaching maximum table size ("

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, v35

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " with a max of "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x1388

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "), deleted "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, v22

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " likes, all less than refresh time "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-wide/from16 v0, v32

    invoke-virtual {v8, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 625
    :cond_f
    invoke-interface/range {v34 .. v34}, Landroid/database/Cursor;->close()V

    .line 627
    .end local v32           #oldestNthId:J
    :cond_10
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 629
    :try_start_9
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 632
    .end local v34           #oldestNthRow:Landroid/database/Cursor;
    :cond_11
    invoke-interface/range {v36 .. v36}, Landroid/database/Cursor;->close()V

    .line 636
    .end local v35           #size:I
    .end local v36           #tableCursor:Landroid/database/Cursor;
    :cond_12
    if-gtz v30, :cond_13

    if-gtz v31, :cond_13

    if-lez v22, :cond_14

    .line 637
    :cond_13
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v8, Lco/vine/android/provider/Vine$Likes;->CONTENT_URI:Landroid/net/Uri;

    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 639
    :cond_14
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_15

    .line 640
    const-string v6, "VineDH"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Inserted "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, v30

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " likes and updated "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move/from16 v0, v31

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 642
    :cond_15
    monitor-exit p0

    return v30

    .line 595
    .end local v22           #deleted:I
    :catchall_2
    move-exception v6

    :try_start_a
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6

    .line 629
    .restart local v22       #deleted:I
    .restart local v35       #size:I
    .restart local v36       #tableCursor:Landroid/database/Cursor;
    :catchall_3
    move-exception v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
.end method

.method public declared-synchronized mergeNotification(Lco/vine/android/api/VineNotification;Ljava/lang/String;)Landroid/net/Uri;
    .locals 11
    .parameter "notification"
    .parameter "message"

    .prologue
    const/4 v10, 0x1

    .line 1252
    monitor-enter p0

    const/4 v7, 0x0

    .line 1255
    .local v7, result:Landroid/net/Uri;
    :try_start_0
    const-string v8, "notification_id=?"

    .line 1256
    .local v8, selection:Ljava/lang/String;
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    iget-wide v1, p1, Lco/vine/android/api/VineNotification;->notificationId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 1257
    .local v4, whereArgs:[Ljava/lang/String;
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$Notifications;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$NotificationsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v3, "notification_id=?"

    const-string v5, "notification_id DESC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1260
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 1261
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge v0, v10, :cond_0

    .line 1262
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1263
    .local v9, values:Landroid/content/ContentValues;
    invoke-direct {p0, v9, p1, p2}, Lco/vine/android/provider/VineDatabaseHelper;->fillNotificationValues(Landroid/content/ContentValues;Lco/vine/android/api/VineNotification;Ljava/lang/String;)V

    .line 1264
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$Notifications;->CONTENT_URI_PUT_NOTIFICATION:Landroid/net/Uri;

    invoke-virtual {v0, v1, v9}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v7

    .line 1266
    .end local v9           #values:Landroid/content/ContentValues;
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1268
    :cond_1
    monitor-exit p0

    return-object v7

    .line 1252
    .end local v4           #whereArgs:[Ljava/lang/String;
    .end local v6           #c:Landroid/database/Cursor;
    .end local v8           #selection:Ljava/lang/String;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized mergePosts(Ljava/util/Collection;ILjava/lang/String;IIIJZ)Lco/vine/android/provider/DbResponse;
    .locals 54
    .parameter
    .parameter "groupType"
    .parameter "tag"
    .parameter "pageType"
    .parameter "nextPage"
    .parameter "previousPage"
    .parameter "anchor"
    .parameter "userInitiated"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;I",
            "Ljava/lang/String;",
            "IIIJZ)",
            "Lco/vine/android/provider/DbResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 197
    .local p1, items:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VinePost;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    .line 198
    .local v5, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v35, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v35

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 199
    .local v35, newPosts:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    new-instance v51, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v51

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 201
    .local v51, updatedPosts:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v31

    .local v31, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lco/vine/android/api/VinePost;

    .line 202
    .local v32, item:Lco/vine/android/api/VinePost;
    move-object/from16 v0, v32

    iget-wide v6, v0, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v35

    move-object/from16 v1, v32

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 197
    .end local v5           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v31           #i$:Ljava/util/Iterator;
    .end local v32           #item:Lco/vine/android/api/VinePost;
    .end local v35           #newPosts:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    .end local v51           #updatedPosts:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 204
    .restart local v5       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v31       #i$:Ljava/util/Iterator;
    .restart local v35       #newPosts:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    .restart local v51       #updatedPosts:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VinePost;>;"
    :cond_0
    :try_start_1
    invoke-static/range {p2 .. p2}, Lco/vine/android/util/Util;->isPopularTimeline(I)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 205
    new-instance v41, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v41

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 207
    .local v41, orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    const/4 v6, 0x1

    move/from16 v0, p4

    if-eq v0, v6, :cond_1

    const/4 v6, 0x2

    move/from16 v0, p4

    if-ne v0, v6, :cond_2

    .line 208
    :cond_1
    const/16 v47, 0x1

    .line 209
    .local v47, sortId:I
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->removePostsFromGroup(I)I

    .line 219
    :goto_1
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v31

    :goto_2
    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lco/vine/android/api/VinePost;

    .line 220
    .restart local v32       #item:Lco/vine/android/api/VinePost;
    move-object/from16 v0, v32

    iget-wide v6, v0, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move/from16 v0, v47

    int-to-long v12, v0

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move-object/from16 v0, v41

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    add-int/lit8 v47, v47, 0x1

    .line 222
    goto :goto_2

    .line 211
    .end local v32           #item:Lco/vine/android/api/VinePost;
    .end local v47           #sortId:I
    :cond_2
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getOldestSortId(I)Landroid/database/Cursor;

    move-result-object v27

    .line 212
    .local v27, c:Landroid/database/Cursor;
    if-eqz v27, :cond_3

    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 213
    const/4 v6, 0x0

    move-object/from16 v0, v27

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v47

    .line 214
    .restart local v47       #sortId:I
    add-int/lit8 v47, v47, 0x1

    goto :goto_1

    .line 216
    .end local v47           #sortId:I
    :cond_3
    const/16 v47, 0x1

    .restart local v47       #sortId:I
    goto :goto_1

    .line 224
    .end local v27           #c:Landroid/database/Cursor;
    .end local v41           #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v47           #sortId:I
    :cond_4
    new-instance v41, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v41

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 225
    .restart local v41       #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v31

    :goto_3
    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lco/vine/android/api/VinePost;

    .line 226
    .restart local v32       #item:Lco/vine/android/api/VinePost;
    move-object/from16 v0, v32

    iget-wide v6, v0, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static/range {p2 .. p2}, Lco/vine/android/api/VineComparatorFactory;->get(I)Lco/vine/android/api/VineComparatorFactory$VineComparator;

    move-result-object v7

    move-object/from16 v0, v32

    invoke-interface {v7, v0}, Lco/vine/android/api/VineComparatorFactory$VineComparator;->getOrderId(Ljava/lang/Object;)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move-object/from16 v0, v41

    invoke-virtual {v0, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 231
    .end local v32           #item:Lco/vine/android/api/VinePost;
    :cond_5
    const/16 v28, 0x1

    .line 235
    .local v28, contiguous:Z
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_b

    invoke-static/range {p2 .. p2}, Lco/vine/android/util/Util;->isPopularTimeline(I)Z

    move-result v6

    if-nez v6, :cond_b

    .line 236
    const-string v8, "post_type=? AND tag=?"

    .line 237
    .local v8, selectionString:Ljava/lang/String;
    const/4 v6, 0x2

    new-array v9, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v9, v6

    const/4 v6, 0x1

    aput-object p3, v9, v6

    .line 242
    .local v9, selectionArgs:[Ljava/lang/String;
    :goto_4
    const-string v6, "post_groups_view"

    sget-object v7, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const-string v12, "sort_id DESC"

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v27

    .line 245
    .restart local v27       #c:Landroid/database/Cursor;
    if-eqz v27, :cond_7

    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 247
    const-wide/16 v6, 0x0

    cmp-long v6, p7, v6

    if-lez v6, :cond_6

    .line 248
    const/4 v6, 0x3

    move-object/from16 v0, v27

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    cmp-long v6, p7, v6

    if-gez v6, :cond_c

    const/16 v28, 0x1

    .line 250
    :cond_6
    :goto_5
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->close()V

    .line 254
    :cond_7
    const-string v11, "posts"

    const/4 v6, 0x1

    new-array v12, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "post_id"

    aput-object v7, v12, v6

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object v10, v5

    invoke-virtual/range {v10 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v27

    .line 256
    if-eqz v27, :cond_a

    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 258
    :cond_8
    const/4 v6, 0x0

    move-object/from16 v0, v27

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v43

    .line 259
    .local v43, postId:J
    invoke-static/range {v43 .. v44}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v35

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Lco/vine/android/api/VinePost;

    .line 260
    .local v42, post:Lco/vine/android/api/VinePost;
    if-eqz v42, :cond_9

    .line 261
    invoke-static/range {v43 .. v44}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v51

    move-object/from16 v1, v42

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    :cond_9
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-nez v6, :cond_8

    .line 264
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->close()V

    .line 267
    .end local v42           #post:Lco/vine/android/api/VinePost;
    .end local v43           #postId:J
    :cond_a
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_d

    invoke-virtual/range {v35 .. v35}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_d

    invoke-virtual/range {v51 .. v51}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 268
    const-string v6, "VineDH"

    const-string v7, "No new posts to merge or update"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    new-instance v6, Lco/vine/android/provider/DbResponse;

    const/4 v7, 0x0

    const/4 v10, 0x0

    const/4 v12, 0x2

    invoke-direct {v6, v7, v10, v12}, Lco/vine/android/provider/DbResponse;-><init>(III)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 442
    :goto_6
    monitor-exit p0

    return-object v6

    .line 239
    .end local v8           #selectionString:Ljava/lang/String;
    .end local v9           #selectionArgs:[Ljava/lang/String;
    .end local v27           #c:Landroid/database/Cursor;
    :cond_b
    :try_start_2
    const-string v8, "post_type=?"

    .line 240
    .restart local v8       #selectionString:Ljava/lang/String;
    const/4 v6, 0x1

    new-array v9, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v9, v6

    .restart local v9       #selectionArgs:[Ljava/lang/String;
    goto/16 :goto_4

    .line 248
    .restart local v27       #c:Landroid/database/Cursor;
    :cond_c
    const/16 v28, 0x0

    goto :goto_5

    .line 272
    :cond_d
    new-instance v16, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v16

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 273
    .local v16, tagMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Long;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    invoke-direct {v11, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 275
    .local v11, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    invoke-virtual/range {v35 .. v35}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v31

    :cond_e
    :goto_7
    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_f

    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v53

    check-cast v53, Lco/vine/android/api/VinePost;

    .line 276
    .local v53, vc:Lco/vine/android/api/VinePost;
    move-object/from16 v0, v53

    iget-object v6, v0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    if-eqz v6, :cond_e

    .line 277
    move-object/from16 v0, v53

    iget-object v6, v0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    invoke-virtual {v11, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 278
    move-object/from16 v0, v53

    iget-wide v6, v0, Lco/vine/android/api/VinePost;->userId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v53

    iget-wide v12, v0, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    move-object/from16 v0, v16

    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .line 281
    .end local v53           #vc:Lco/vine/android/api/VinePost;
    :cond_f
    const/4 v12, 0x4

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v17, 0x0

    move-object/from16 v10, p0

    invoke-virtual/range {v10 .. v17}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;Ljava/util/Map;)I

    .line 283
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v33

    .line 285
    .local v33, lastRefresh:J
    const/16 v36, 0x0

    .line 286
    .local v36, numInserted:I
    invoke-virtual/range {v35 .. v35}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_14

    .line 287
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 289
    :try_start_3
    new-instance v52, Landroid/content/ContentValues;

    invoke-direct/range {v52 .. v52}, Landroid/content/ContentValues;-><init>()V

    .line 290
    .local v52, values:Landroid/content/ContentValues;
    invoke-virtual/range {v35 .. v35}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v31

    :cond_10
    :goto_8
    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_13

    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Lco/vine/android/api/VinePost;

    .line 291
    .restart local v42       #post:Lco/vine/android/api/VinePost;
    invoke-virtual/range {v52 .. v52}, Landroid/content/ContentValues;->clear()V

    .line 294
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget v6, v6, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, v42

    iput v6, v0, Lco/vine/android/api/VinePost;->likesCount:I

    .line 295
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget v6, v6, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, v42

    iput v6, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    .line 297
    move-object/from16 v0, p0

    move-object/from16 v1, v52

    move-object/from16 v2, v42

    move-wide/from16 v3, v33

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillPostValues(Landroid/content/ContentValues;Lco/vine/android/api/VinePost;J)V

    .line 298
    const-string v6, "posts"

    const/4 v7, 0x0

    move-object/from16 v0, v52

    invoke-virtual {v5, v6, v7, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v6

    const-wide/16 v12, 0x0

    cmp-long v6, v6, v12

    if-lez v6, :cond_12

    const/4 v6, 0x1

    :goto_9
    add-int v36, v36, v6

    .line 299
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget-object v6, v6, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_11

    .line 300
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget-object v0, v6, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v42

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v19, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const-wide/16 v23, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object/from16 v17, p0

    invoke-virtual/range {v17 .. v26}, Lco/vine/android/provider/VineDatabaseHelper;->mergeComments(Ljava/util/Collection;JIIJZZ)Lco/vine/android/provider/DbResponse;

    .line 301
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget v6, v6, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_11

    .line 302
    move-object/from16 v0, v42

    iget-wide v6, v0, Lco/vine/android/api/VinePost;->postId:J

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v7}, Lco/vine/android/provider/VineDatabaseHelper;->markLastComment(J)V

    .line 305
    :cond_11
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget-object v6, v6, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_10

    .line 306
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget-object v0, v6, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v42

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v19, v0

    const/16 v21, -0x1

    const/16 v22, -0x1

    move-object/from16 v17, p0

    invoke-virtual/range {v17 .. v22}, Lco/vine/android/provider/VineDatabaseHelper;->mergeLikes(Ljava/util/Collection;JII)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto/16 :goto_8

    .line 311
    .end local v42           #post:Lco/vine/android/api/VinePost;
    .end local v52           #values:Landroid/content/ContentValues;
    :catchall_1
    move-exception v6

    :try_start_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 298
    .restart local v42       #post:Lco/vine/android/api/VinePost;
    .restart local v52       #values:Landroid/content/ContentValues;
    :cond_12
    const/4 v6, 0x0

    goto :goto_9

    .line 309
    .end local v42           #post:Lco/vine/android/api/VinePost;
    :cond_13
    :try_start_5
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 311
    :try_start_6
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 315
    .end local v52           #values:Landroid/content/ContentValues;
    :cond_14
    const/16 v37, 0x0

    .line 317
    .local v37, numUpdated:I
    invoke-virtual/range {v51 .. v51}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_19

    .line 318
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 320
    :try_start_7
    new-instance v52, Landroid/content/ContentValues;

    invoke-direct/range {v52 .. v52}, Landroid/content/ContentValues;-><init>()V

    .line 321
    .restart local v52       #values:Landroid/content/ContentValues;
    invoke-virtual/range {v51 .. v51}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v31

    :cond_15
    :goto_a
    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_18

    invoke-interface/range {v31 .. v31}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v42

    check-cast v42, Lco/vine/android/api/VinePost;

    .line 322
    .restart local v42       #post:Lco/vine/android/api/VinePost;
    invoke-virtual/range {v52 .. v52}, Landroid/content/ContentValues;->clear()V

    .line 324
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget v6, v6, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, v42

    iput v6, v0, Lco/vine/android/api/VinePost;->likesCount:I

    .line 325
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget v6, v6, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, v42

    iput v6, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    .line 327
    move-object/from16 v0, p0

    move-object/from16 v1, v52

    move-object/from16 v2, v42

    move-wide/from16 v3, v33

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillPostValues(Landroid/content/ContentValues;Lco/vine/android/api/VinePost;J)V

    .line 328
    const-string v6, "posts"

    const-string v7, "post_id=?"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v12, 0x0

    move-object/from16 v0, v42

    iget-wide v13, v0, Lco/vine/android/api/VinePost;->postId:J

    invoke-static {v13, v14}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v10, v12

    move-object/from16 v0, v52

    invoke-virtual {v5, v6, v0, v7, v10}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v6

    if-lez v6, :cond_17

    const/4 v6, 0x1

    :goto_b
    add-int v37, v37, v6

    .line 330
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget-object v6, v6, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_16

    .line 331
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget-object v0, v6, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v42

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v19, v0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const-wide/16 v23, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    move-object/from16 v17, p0

    invoke-virtual/range {v17 .. v26}, Lco/vine/android/provider/VineDatabaseHelper;->mergeComments(Ljava/util/Collection;JIIJZZ)Lco/vine/android/provider/DbResponse;

    .line 332
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget v6, v6, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_16

    .line 333
    move-object/from16 v0, v42

    iget-wide v6, v0, Lco/vine/android/api/VinePost;->postId:J

    move-object/from16 v0, p0

    invoke-virtual {v0, v6, v7}, Lco/vine/android/provider/VineDatabaseHelper;->markLastComment(J)V

    .line 336
    :cond_16
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget-object v6, v6, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_15

    .line 337
    move-object/from16 v0, v42

    iget-object v6, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget-object v0, v6, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v18, v0

    move-object/from16 v0, v42

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v19, v0

    const/16 v21, -0x1

    const/16 v22, -0x1

    move-object/from16 v17, p0

    invoke-virtual/range {v17 .. v22}, Lco/vine/android/provider/VineDatabaseHelper;->mergeLikes(Ljava/util/Collection;JII)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto/16 :goto_a

    .line 342
    .end local v42           #post:Lco/vine/android/api/VinePost;
    .end local v52           #values:Landroid/content/ContentValues;
    :catchall_2
    move-exception v6

    :try_start_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 328
    .restart local v42       #post:Lco/vine/android/api/VinePost;
    .restart local v52       #values:Landroid/content/ContentValues;
    :cond_17
    const/4 v6, 0x0

    goto :goto_b

    .line 340
    .end local v42           #post:Lco/vine/android/api/VinePost;
    :cond_18
    :try_start_9
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 342
    :try_start_a
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 346
    .end local v52           #values:Landroid/content/ContentValues;
    :cond_19
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_1a

    .line 347
    const-string v6, "VineDH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Inserted "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v36

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " posts, and updated "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v37

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " with lastRefresh time "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v0, v33

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 351
    :cond_1a
    const-wide/16 v6, 0x0

    cmp-long v6, p7, v6

    if-gtz v6, :cond_1b

    if-gtz p5, :cond_1b

    if-lez p6, :cond_1c

    .line 352
    :cond_1b
    const/16 v18, 0x2

    const/16 v25, 0x0

    move-object/from16 v17, p0

    move/from16 v19, p2

    move-object/from16 v20, p3

    move/from16 v21, p5

    move/from16 v22, p6

    move-wide/from16 v23, p7

    invoke-virtual/range {v17 .. v25}, Lco/vine/android/provider/VineDatabaseHelper;->savePageCursor(IILjava/lang/String;IIJZ)I

    .line 358
    :cond_1c
    if-eqz v28, :cond_24

    .line 359
    const/16 v45, 0x1

    .line 390
    .local v45, response:I
    :goto_c
    const/16 v29, 0x0

    .line 391
    .local v29, deleted:I
    if-lez v36, :cond_20

    if-eqz v28, :cond_20

    .line 392
    const-string v18, "posts"

    sget-object v19, Lco/vine/android/provider/VineDatabaseSQL$TableQuery;->PROJECTION:[Ljava/lang/String;

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    move-object/from16 v17, v5

    invoke-virtual/range {v17 .. v24}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v48

    .line 394
    .local v48, tableCursor:Landroid/database/Cursor;
    if-eqz v48, :cond_20

    invoke-interface/range {v48 .. v48}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 395
    invoke-interface/range {v48 .. v48}, Landroid/database/Cursor;->getCount()I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    move-result v46

    .line 396
    .local v46, size:I
    const/16 v6, 0x3e8

    move/from16 v0, v46

    if-le v0, v6, :cond_1f

    .line 398
    :try_start_b
    const-string v6, "SELECT last_refresh FROM posts ORDER BY last_refresh DESC LIMIT 1 OFFSET 500"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v40

    .line 403
    .local v40, oldestNthRow:Landroid/database/Cursor;
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 404
    if-eqz v40, :cond_1e

    invoke-interface/range {v40 .. v40}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_1e

    .line 405
    const/4 v6, 0x0

    move-object/from16 v0, v40

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v38

    .line 407
    .local v38, oldestNthId:J
    const-string v6, "DELETE FROM post_groups WHERE post_id IN (SELECT post_id FROM posts WHERE last_refresh < ?);"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v10, 0x0

    invoke-static/range {v38 .. v39}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v7, v10

    invoke-virtual {v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 412
    const-string v6, "posts"

    const-string v7, "last_refresh<?"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v12, 0x0

    invoke-static/range {v38 .. v39}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v10, v12

    invoke-virtual {v5, v6, v7, v10}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v29

    .line 415
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_1d

    .line 416
    const-string v6, "s"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Due to reaching maximum table size ("

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v46

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " with a max of "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v10, 0x3e8

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, "), deleted "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v29

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " posts groups all less than last refresh id "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v0, v38

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, "."

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 421
    :cond_1d
    invoke-interface/range {v40 .. v40}, Landroid/database/Cursor;->close()V

    .line 423
    .end local v38           #oldestNthId:J
    :cond_1e
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    .line 425
    :try_start_c
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 428
    .end local v40           #oldestNthRow:Landroid/database/Cursor;
    :cond_1f
    invoke-interface/range {v48 .. v48}, Landroid/database/Cursor;->close()V

    .line 433
    .end local v46           #size:I
    .end local v48           #tableCursor:Landroid/database/Cursor;
    :cond_20
    if-gtz v36, :cond_21

    if-gtz v37, :cond_21

    if-lez v29, :cond_23

    :cond_21
    if-eqz p2, :cond_23

    .line 435
    const/4 v6, -0x1

    move/from16 v0, p2

    if-eq v0, v6, :cond_22

    .line 436
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, v41

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->mergePostGroups(Ljava/util/Collection;ILjava/lang/String;Ljava/util/Map;)V

    .line 438
    :cond_22
    if-eqz p9, :cond_23

    .line 439
    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-direct {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->notifyByType(I)V

    .line 442
    :cond_23
    new-instance v6, Lco/vine/android/provider/DbResponse;

    move/from16 v0, v36

    move/from16 v1, v37

    move/from16 v2, v45

    invoke-direct {v6, v0, v1, v2}, Lco/vine/android/provider/DbResponse;-><init>(III)V

    goto/16 :goto_6

    .line 364
    .end local v29           #deleted:I
    .end local v45           #response:I
    :cond_24
    invoke-static/range {p3 .. p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_26

    .line 365
    const-string v49, "post_type=? AND tag=? AND post_id<?"

    .line 367
    .local v49, timelineSelection:Ljava/lang/String;
    const/4 v6, 0x3

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v50, v0

    const/4 v6, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v50, v6

    const/4 v6, 0x1

    aput-object p3, v50, v6

    const/4 v6, 0x2

    invoke-static/range {p7 .. p8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v50, v6

    .line 375
    .local v50, timelineSelectionArgs:[Ljava/lang/String;
    :goto_d
    const-string v6, "posts"

    const-string v7, "post_id<?"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/String;

    const/4 v12, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    aput-object v13, v10, v12

    invoke-virtual {v5, v6, v7, v10}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v29

    .line 377
    .restart local v29       #deleted:I
    const-string v6, "post_groups"

    move-object/from16 v0, v49

    move-object/from16 v1, v50

    invoke-virtual {v5, v6, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v30

    .line 379
    .local v30, deletedGroups:I
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_25

    .line 380
    const-string v6, "VineDH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Non contiguous timeline detected, deleted "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v29

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " posts and "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v30

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " with id less than anchor: "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v0, p7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " of type "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " and tag "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    :cond_25
    const/16 v45, 0x4

    .restart local v45       #response:I
    goto/16 :goto_c

    .line 370
    .end local v29           #deleted:I
    .end local v30           #deletedGroups:I
    .end local v45           #response:I
    .end local v49           #timelineSelection:Ljava/lang/String;
    .end local v50           #timelineSelectionArgs:[Ljava/lang/String;
    :cond_26
    const-string v49, "post_type=? AND post_id<?"

    .line 371
    .restart local v49       #timelineSelection:Ljava/lang/String;
    const/4 v6, 0x2

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v50, v0

    const/4 v6, 0x0

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v50, v6

    const/4 v6, 0x1

    invoke-static/range {p7 .. p8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v50, v6

    .restart local v50       #timelineSelectionArgs:[Ljava/lang/String;
    goto/16 :goto_d

    .line 425
    .end local v49           #timelineSelection:Ljava/lang/String;
    .end local v50           #timelineSelectionArgs:[Ljava/lang/String;
    .restart local v29       #deleted:I
    .restart local v45       #response:I
    .restart local v46       #size:I
    .restart local v48       #tableCursor:Landroid/database/Cursor;
    :catchall_3
    move-exception v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0
.end method

.method public declared-synchronized mergeSearchedTags(Ljava/util/Collection;II)I
    .locals 23
    .parameter
    .parameter "next"
    .parameter "previous"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VineTag;",
            ">;II)I"
        }
    .end annotation

    .prologue
    .line 1693
    .local p1, tags:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VineTag;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .line 1696
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v15, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v4

    invoke-direct {v15, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 1697
    .local v15, newTags:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineTag;>;"
    new-instance v21, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v4

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Ljava/util/HashMap;-><init>(I)V

    .line 1698
    .local v21, updatedTags:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineTag;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lco/vine/android/api/VineTag;

    .line 1699
    .local v18, tag:Lco/vine/android/api/VineTag;
    move-object/from16 v0, v18

    iget-wide v4, v0, Lco/vine/android/api/VineTag;->tagId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v0, v18

    invoke-virtual {v15, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1693
    .end local v3           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v14           #i$:Ljava/util/Iterator;
    .end local v15           #newTags:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineTag;>;"
    .end local v18           #tag:Lco/vine/android/api/VineTag;
    .end local v21           #updatedTags:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineTag;>;"
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 1703
    .restart local v3       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v14       #i$:Ljava/util/Iterator;
    .restart local v15       #newTags:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineTag;>;"
    .restart local v21       #updatedTags:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineTag;>;"
    :cond_0
    :try_start_1
    const-string v4, "tag_search_results"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    const-string v7, "tag_id"

    aput-object v7, v5, v6

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-virtual/range {v3 .. v10}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 1706
    .local v13, c:Landroid/database/Cursor;
    if-eqz v13, :cond_3

    .line 1709
    :cond_1
    :goto_1
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1710
    const-string v4, "tag_id"

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v13, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v19

    .line 1711
    .local v19, tagId:J
    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v15, v4}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lco/vine/android/api/VineTag;

    .line 1712
    .restart local v18       #tag:Lco/vine/android/api/VineTag;
    if-eqz v18, :cond_1

    .line 1713
    invoke-static/range {v19 .. v20}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1716
    .end local v18           #tag:Lco/vine/android/api/VineTag;
    .end local v19           #tagId:J
    :cond_2
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 1719
    :cond_3
    const/16 v16, 0x0

    .line 1720
    .local v16, numInserted:I
    const/16 v17, 0x0

    .line 1722
    .local v17, numUpdated:I
    invoke-virtual {v15}, Ljava/util/HashMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6

    .line 1723
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1725
    :try_start_2
    new-instance v22, Landroid/content/ContentValues;

    invoke-direct/range {v22 .. v22}, Landroid/content/ContentValues;-><init>()V

    .line 1726
    .local v22, values:Landroid/content/ContentValues;
    invoke-virtual {v15}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lco/vine/android/api/VineTag;

    .line 1727
    .restart local v18       #tag:Lco/vine/android/api/VineTag;
    invoke-virtual/range {v22 .. v22}, Landroid/content/ContentValues;->clear()V

    .line 1728
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lco/vine/android/provider/VineDatabaseHelper;->fillTagValues(Landroid/content/ContentValues;Lco/vine/android/api/VineTag;)V

    .line 1729
    const-string v4, "tag_search_results"

    const-string v5, "tag_id"

    move-object/from16 v0, v22

    invoke-virtual {v3, v4, v5, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_4

    const/4 v4, 0x1

    :goto_3
    add-int v16, v16, v4

    .line 1731
    goto :goto_2

    .line 1729
    :cond_4
    const/4 v4, 0x0

    goto :goto_3

    .line 1732
    .end local v18           #tag:Lco/vine/android/api/VineTag;
    :cond_5
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1734
    :try_start_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1738
    .end local v22           #values:Landroid/content/ContentValues;
    :cond_6
    invoke-virtual/range {v21 .. v21}, Ljava/util/HashMap;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_9

    .line 1739
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1741
    :try_start_4
    new-instance v22, Landroid/content/ContentValues;

    invoke-direct/range {v22 .. v22}, Landroid/content/ContentValues;-><init>()V

    .line 1742
    .restart local v22       #values:Landroid/content/ContentValues;
    invoke-virtual/range {v21 .. v21}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_4
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_8

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lco/vine/android/api/VineTag;

    .line 1743
    .restart local v18       #tag:Lco/vine/android/api/VineTag;
    invoke-virtual/range {v22 .. v22}, Landroid/content/ContentValues;->clear()V

    .line 1744
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lco/vine/android/provider/VineDatabaseHelper;->fillTagValues(Landroid/content/ContentValues;Lco/vine/android/api/VineTag;)V

    .line 1745
    const-string v4, "tag_search_results"

    const-string v5, "tag_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    move-object/from16 v0, v18

    iget-wide v8, v0, Lco/vine/android/api/VineTag;->tagId:J

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    move-object/from16 v0, v22

    invoke-virtual {v3, v4, v0, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result v4

    if-lez v4, :cond_7

    const/4 v4, 0x1

    :goto_5
    add-int v17, v17, v4

    .line 1748
    goto :goto_4

    .line 1734
    .end local v18           #tag:Lco/vine/android/api/VineTag;
    .end local v22           #values:Landroid/content/ContentValues;
    :catchall_1
    move-exception v4

    :try_start_5
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1745
    .restart local v18       #tag:Lco/vine/android/api/VineTag;
    .restart local v22       #values:Landroid/content/ContentValues;
    :cond_7
    const/4 v4, 0x0

    goto :goto_5

    .line 1749
    .end local v18           #tag:Lco/vine/android/api/VineTag;
    :cond_8
    :try_start_6
    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1751
    :try_start_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1755
    .end local v22           #values:Landroid/content/ContentValues;
    :cond_9
    if-gtz v16, :cond_a

    if-lez v17, :cond_d

    .line 1756
    :cond_a
    if-gtz p2, :cond_b

    if-lez p3, :cond_c

    .line 1757
    :cond_b
    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x1

    move-object/from16 v4, p0

    move/from16 v8, p2

    move/from16 v9, p3

    invoke-virtual/range {v4 .. v12}, Lco/vine/android/provider/VineDatabaseHelper;->savePageCursor(IILjava/lang/String;IIJZ)I

    .line 1759
    :cond_c
    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lco/vine/android/provider/Vine$TagSearchResults;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1762
    :cond_d
    sget-boolean v4, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v4, :cond_e

    .line 1763
    const-string v4, "VineDH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Inserted "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v16

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " and updated "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move/from16 v0, v17

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " tags."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 1766
    :cond_e
    monitor-exit p0

    return v16

    .line 1751
    :catchall_2
    move-exception v4

    :try_start_8
    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0
.end method

.method public declared-synchronized mergeSuggestedTag(Lco/vine/android/api/VineTag;)Landroid/net/Uri;
    .locals 10
    .parameter "tag"

    .prologue
    const/4 v9, 0x1

    .line 1297
    monitor-enter p0

    const/4 v7, 0x0

    .line 1300
    .local v7, result:Landroid/net/Uri;
    :try_start_0
    const-string v3, "tag_id=?"

    .line 1301
    .local v3, selection:Ljava/lang/String;
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    iget-wide v1, p1, Lco/vine/android/api/VineTag;->tagId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 1302
    .local v4, selectionArgs:[Ljava/lang/String;
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$TagsRecentlyUsed;->CONTENT_URI:Landroid/net/Uri;

    sget-object v2, Lco/vine/android/provider/VineDatabaseSQL$TagsRecentlyUsedQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "_id DESC"

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1306
    .local v6, c:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 1307
    new-instance v8, Landroid/content/ContentValues;

    invoke-direct {v8}, Landroid/content/ContentValues;-><init>()V

    .line 1308
    .local v8, values:Landroid/content/ContentValues;
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge v0, v9, :cond_2

    .line 1309
    invoke-direct {p0, v8, p1}, Lco/vine/android/provider/VineDatabaseHelper;->fillTagValues(Landroid/content/ContentValues;Lco/vine/android/api/VineTag;)V

    .line 1310
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$TagsRecentlyUsed;->CONTENT_URI_PUT_TAG:Landroid/net/Uri;

    invoke-virtual {v0, v1, v8}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v7

    .line 1318
    :cond_0
    :goto_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1320
    .end local v8           #values:Landroid/content/ContentValues;
    :cond_1
    monitor-exit p0

    return-object v7

    .line 1311
    .restart local v8       #values:Landroid/content/ContentValues;
    :cond_2
    :try_start_1
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1312
    const-string v3, "tag_id=?"

    .line 1313
    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    .end local v4           #selectionArgs:[Ljava/lang/String;
    const/4 v0, 0x0

    iget-wide v1, p1, Lco/vine/android/api/VineTag;->tagId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v0

    .line 1314
    .restart local v4       #selectionArgs:[Ljava/lang/String;
    const-string v0, "last_used_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v8, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1315
    iget-object v0, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v1, Lco/vine/android/provider/Vine$TagsRecentlyUsed;->CONTENT_URI_UPDATE_RECENT_TAG:Landroid/net/Uri;

    invoke-virtual {v0, v1, v8, v3, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1297
    .end local v3           #selection:Ljava/lang/String;
    .end local v4           #selectionArgs:[Ljava/lang/String;
    .end local v6           #c:Landroid/database/Cursor;
    .end local v8           #values:Landroid/content/ContentValues;
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I
    .locals 8
    .parameter
    .parameter "type"
    .parameter "groupTag"
    .parameter "next"
    .parameter "previous"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;I",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 1547
    .local p1, users:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VineUser;>;"
    .local p6, orderMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Long;>;"
    monitor-enter p0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move-object v7, p6

    :try_start_0
    invoke-virtual/range {v0 .. v7}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;Ljava/util/Map;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;Ljava/util/Map;)I
    .locals 33
    .parameter
    .parameter "type"
    .parameter "groupTag"
    .parameter "next"
    .parameter "previous"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;I",
            "Ljava/lang/String;",
            "II",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ">;)I"
        }
    .end annotation

    .prologue
    .line 1562
    .local p1, users:Ljava/util/Collection;,"Ljava/util/Collection<Lco/vine/android/api/VineUser;>;"
    .local p6, tagMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Long;>;"
    .local p7, orderMap:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/Long;Ljava/lang/Long;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v5

    .line 1565
    .local v5, db:Landroid/database/sqlite/SQLiteDatabase;
    new-instance v20, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v20

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 1566
    .local v20, newUsers:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    new-instance v28, Ljava/util/HashMap;

    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->size()I

    move-result v6

    move-object/from16 v0, v28

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 1567
    .local v28, updatedUsers:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lco/vine/android/api/VineUser;

    .line 1568
    .local v29, user:Lco/vine/android/api/VineUser;
    move-object/from16 v0, v29

    iget-wide v6, v0, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v20

    move-object/from16 v1, v29

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 1562
    .end local v5           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v17           #i$:Ljava/util/Iterator;
    .end local v20           #newUsers:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    .end local v28           #updatedUsers:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    .end local v29           #user:Lco/vine/android/api/VineUser;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 1572
    .restart local v5       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v17       #i$:Ljava/util/Iterator;
    .restart local v20       #newUsers:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    .restart local v28       #updatedUsers:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Lco/vine/android/api/VineUser;>;"
    :cond_0
    :try_start_1
    const-string v6, "users"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "user_id"

    aput-object v9, v7, v8

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 1574
    .local v15, c:Landroid/database/Cursor;
    if-eqz v15, :cond_3

    .line 1577
    :cond_1
    :goto_1
    invoke-interface {v15}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 1578
    const/4 v6, 0x0

    invoke-interface {v15, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v30

    .line 1579
    .local v30, userId:J
    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v20

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lco/vine/android/api/VineUser;

    .line 1580
    .restart local v29       #user:Lco/vine/android/api/VineUser;
    if-eqz v29, :cond_1

    .line 1581
    invoke-static/range {v30 .. v31}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v28

    move-object/from16 v1, v29

    invoke-virtual {v0, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 1585
    .end local v29           #user:Lco/vine/android/api/VineUser;
    .end local v30           #userId:J
    :cond_2
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 1588
    :cond_3
    const/16 v21, 0x0

    .line 1589
    .local v21, numInserted:I
    const/16 v22, 0x0

    .line 1591
    .local v22, numUpdated:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v18

    .line 1593
    .local v18, lastRefreshTime:J
    invoke-virtual/range {v20 .. v20}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_6

    .line 1594
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1596
    :try_start_2
    new-instance v32, Landroid/content/ContentValues;

    invoke-direct/range {v32 .. v32}, Landroid/content/ContentValues;-><init>()V

    .line 1597
    .local v32, values:Landroid/content/ContentValues;
    invoke-virtual/range {v20 .. v20}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_2
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lco/vine/android/api/VineUser;

    .line 1598
    .restart local v29       #user:Lco/vine/android/api/VineUser;
    invoke-virtual/range {v32 .. v32}, Landroid/content/ContentValues;->clear()V

    .line 1599
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v29

    move-wide/from16 v3, v18

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillUserContentValues(Landroid/content/ContentValues;Lco/vine/android/api/VineUser;J)V

    .line 1600
    const-string v6, "users"

    const-string v7, "user_id"

    move-object/from16 v0, v32

    invoke-virtual {v5, v6, v7, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v6

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_4

    const/4 v6, 0x1

    :goto_3
    add-int v21, v21, v6

    .line 1601
    goto :goto_2

    .line 1600
    :cond_4
    const/4 v6, 0x0

    goto :goto_3

    .line 1602
    .end local v29           #user:Lco/vine/android/api/VineUser;
    :cond_5
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1604
    :try_start_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1608
    .end local v32           #values:Landroid/content/ContentValues;
    :cond_6
    invoke-virtual/range {v28 .. v28}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_9

    .line 1609
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1611
    :try_start_4
    new-instance v32, Landroid/content/ContentValues;

    invoke-direct/range {v32 .. v32}, Landroid/content/ContentValues;-><init>()V

    .line 1612
    .restart local v32       #values:Landroid/content/ContentValues;
    invoke-virtual/range {v28 .. v28}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_4
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_8

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lco/vine/android/api/VineUser;

    .line 1613
    .restart local v29       #user:Lco/vine/android/api/VineUser;
    invoke-virtual/range {v32 .. v32}, Landroid/content/ContentValues;->clear()V

    .line 1614
    move-object/from16 v0, p0

    move-object/from16 v1, v32

    move-object/from16 v2, v29

    move-wide/from16 v3, v18

    invoke-direct {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->fillUserContentValues(Landroid/content/ContentValues;Lco/vine/android/api/VineUser;J)V

    .line 1615
    const-string v6, "users"

    const-string v7, "user_id=?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    move-object/from16 v0, v29

    iget-wide v10, v0, Lco/vine/android/api/VineUser;->userId:J

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    move-object/from16 v0, v32

    invoke-virtual {v5, v6, v0, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    move-result v6

    if-lez v6, :cond_7

    const/4 v6, 0x1

    :goto_5
    add-int v22, v22, v6

    .line 1617
    goto :goto_4

    .line 1604
    .end local v29           #user:Lco/vine/android/api/VineUser;
    .end local v32           #values:Landroid/content/ContentValues;
    :catchall_1
    move-exception v6

    :try_start_5
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1615
    .restart local v29       #user:Lco/vine/android/api/VineUser;
    .restart local v32       #values:Landroid/content/ContentValues;
    :cond_7
    const/4 v6, 0x0

    goto :goto_5

    .line 1618
    .end local v29           #user:Lco/vine/android/api/VineUser;
    :cond_8
    :try_start_6
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1620
    :try_start_7
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1626
    .end local v32           #values:Landroid/content/ContentValues;
    :cond_9
    const/16 v16, 0x0

    .line 1627
    .local v16, deleted:I
    if-lez v21, :cond_d

    .line 1628
    const-string v6, "users"

    sget-object v7, Lco/vine/android/provider/VineDatabaseSQL$TableQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v27

    .line 1631
    .local v27, tableCursor:Landroid/database/Cursor;
    if-eqz v27, :cond_d

    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_d

    .line 1632
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->getCount()I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-result v26

    .line 1633
    .local v26, size:I
    const/16 v6, 0x2710

    move/from16 v0, v26

    if-le v0, v6, :cond_c

    .line 1635
    :try_start_8
    const-string v6, "SELECT last_refresh FROM users ORDER BY last_refresh DESC LIMIT 1 OFFSET 5000"

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v25

    .line 1640
    .local v25, oldestRefreshId:Landroid/database/Cursor;
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1641
    if-eqz v25, :cond_b

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v6

    if-eqz v6, :cond_b

    .line 1642
    const/4 v6, 0x0

    move-object/from16 v0, v25

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v23

    .line 1644
    .local v23, oldestNthId:J
    const-string v6, "DELETE FROM user_groups WHERE user_id IN (SELECT user_id FROM users WHERE last_refresh < ?);"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static/range {v23 .. v24}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-virtual {v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 1649
    const-string v6, "users"

    const-string v7, "last_refresh<?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    const/4 v9, 0x0

    invoke-static/range {v23 .. v24}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-virtual {v5, v6, v7, v8}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v16

    .line 1651
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_a

    .line 1652
    const-string v6, "s"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Due to reaching maximum table size ("

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v26

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " with a max of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/16 v8, 0x2710

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "), deleted "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v16

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " users, all less than last refresh of "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v0, v23

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1657
    :cond_a
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    .line 1659
    .end local v23           #oldestNthId:J
    :cond_b
    invoke-virtual {v5}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 1661
    :try_start_9
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1664
    .end local v25           #oldestRefreshId:Landroid/database/Cursor;
    :cond_c
    invoke-interface/range {v27 .. v27}, Landroid/database/Cursor;->close()V

    .line 1668
    .end local v26           #size:I
    .end local v27           #tableCursor:Landroid/database/Cursor;
    :cond_d
    if-gtz v21, :cond_e

    if-gtz v22, :cond_e

    if-lez v16, :cond_11

    .line 1669
    :cond_e
    const/4 v6, -0x1

    move/from16 v0, p2

    if-eq v0, v6, :cond_10

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    .line 1670
    invoke-direct/range {v6 .. v11}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUserGroups(Ljava/util/Collection;ILjava/lang/String;Ljava/util/Map;Ljava/util/Map;)V

    .line 1671
    if-gtz p4, :cond_f

    if-lez p5, :cond_10

    .line 1672
    :cond_f
    const/4 v7, 0x1

    const-wide/16 v12, 0x0

    const/4 v14, 0x1

    move-object/from16 v6, p0

    move/from16 v8, p2

    move-object/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p5

    invoke-virtual/range {v6 .. v14}, Lco/vine/android/provider/VineDatabaseHelper;->savePageCursor(IILjava/lang/String;IIJZ)I

    .line 1675
    :cond_10
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1676
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FIND_FRIENDS_TWITTER:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1677
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FIND_FRIENDS_ADDRESS:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1678
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_LIKERS:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1679
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FOLLOWERS:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1680
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FOLLOWING:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1681
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v7, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_USER_SEARCH_RESULTS:Landroid/net/Uri;

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1684
    :cond_11
    sget-boolean v6, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v6, :cond_12

    .line 1685
    const-string v6, "VineDH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Inserted "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v21

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " new users and updating "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " of type "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, p2

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 1689
    :cond_12
    monitor-exit p0

    return v21

    .line 1620
    .end local v16           #deleted:I
    :catchall_2
    move-exception v6

    :try_start_a
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6

    .line 1661
    .restart local v16       #deleted:I
    .restart local v26       #size:I
    .restart local v27       #tableCursor:Landroid/database/Cursor;
    :catchall_3
    move-exception v6

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v6
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .parameter "db"

    .prologue
    .line 121
    invoke-virtual {p0, p1}, Lco/vine/android/provider/VineDatabaseHelper;->createTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 122
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 3
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    .line 126
    sget-boolean v0, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v0, :cond_0

    .line 127
    const-string v0, "VineDH"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Upgrading from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    :cond_0
    invoke-direct {p0, p1}, Lco/vine/android/provider/VineDatabaseHelper;->dropTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 130
    invoke-virtual {p0, p1}, Lco/vine/android/provider/VineDatabaseHelper;->createTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 131
    return-void
.end method

.method public declared-synchronized removeFollow(JZZ)I
    .locals 18
    .parameter "userId"
    .parameter "deleteRow"
    .parameter "notify"

    .prologue
    .line 1011
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 1013
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v3, 0x1

    new-array v6, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v3

    .line 1015
    .local v6, whereArgs:[Ljava/lang/String;
    const-string v3, "users"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v7, "following_flag"

    aput-object v7, v4, v5

    const-string v5, "user_id=?"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 1018
    .local v13, c:Landroid/database/Cursor;
    if-eqz v13, :cond_2

    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_2

    .line 1019
    invoke-interface {v13}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1020
    const/4 v3, 0x0

    invoke-interface {v13, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    .line 1021
    .local v14, currentFriendship:I
    const/4 v3, 0x1

    invoke-static {v14, v3}, Lco/vine/android/Friendships;->unsetFriendship(II)I

    move-result v16

    .line 1023
    .local v16, newFriendship:I
    new-instance v15, Landroid/content/ContentValues;

    invoke-direct {v15}, Landroid/content/ContentValues;-><init>()V

    .line 1024
    .local v15, cv:Landroid/content/ContentValues;
    const-string v3, "following_flag"

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v15, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1026
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 1027
    const-string v3, "users"

    const-string v4, "user_id=?"

    invoke-virtual {v2, v3, v15, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v17

    .line 1030
    .local v17, result:I
    if-eqz p3, :cond_0

    .line 1031
    const/4 v10, 0x1

    sget-object v12, Lco/vine/android/provider/Vine$UserGroupsView;->CONTENT_URI_FOLLOWING:Landroid/net/Uri;

    move-object/from16 v7, p0

    move-wide/from16 v8, p1

    move/from16 v11, p4

    invoke-virtual/range {v7 .. v12}, Lco/vine/android/provider/VineDatabaseHelper;->removeUserWithType(JIZLandroid/net/Uri;)Z

    .line 1035
    :cond_0
    sget-boolean v3, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v3, :cond_1

    .line 1036
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unfollowed user "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p1

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1041
    .end local v14           #currentFriendship:I
    .end local v15           #cv:Landroid/content/ContentValues;
    .end local v16           #newFriendship:I
    .end local v17           #result:I
    :cond_1
    :goto_0
    monitor-exit p0

    return v17

    :cond_2
    const/16 v17, -0x1

    goto :goto_0

    .line 1011
    .end local v2           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v6           #whereArgs:[Ljava/lang/String;
    .end local v13           #c:Landroid/database/Cursor;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized removeFollowRequest(J)V
    .locals 12
    .parameter "userId"

    .prologue
    .line 2383
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 2384
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v10, 0x0

    .line 2386
    .local v10, deleted:I
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 2389
    const-string v1, "activity"

    const-string v2, "notification_type=? AND user_id=?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const/16 v5, 0xd

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v10

    .line 2394
    const-string v1, "users"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "follow_status"

    aput-object v4, v2, v3

    const-string v3, "user_id=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 2397
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_1

    .line 2398
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_0

    .line 2400
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 2401
    .local v11, followStatus:I
    and-int/lit8 v11, v11, -0x2

    .line 2404
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 2405
    .local v9, cv:Landroid/content/ContentValues;
    const-string v1, "follow_status"

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v9, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2406
    const-string v1, "users"

    const-string v2, "user_id=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v0, v1, v9, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2409
    .end local v9           #cv:Landroid/content/ContentValues;
    .end local v11           #followStatus:I
    :cond_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 2411
    :cond_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2413
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 2416
    if-lez v10, :cond_2

    .line 2417
    iget-object v1, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2418
    iget-object v1, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS:Landroid/net/Uri;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2419
    iget-object v1, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v2, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL:Landroid/net/Uri;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2422
    :cond_2
    sget-boolean v1, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v1, :cond_3

    .line 2423
    const-string v1, "VineDH"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Follow request removed, deleted "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " row from activity and updated user "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2426
    :cond_3
    monitor-exit p0

    return-void

    .line 2413
    .end local v8           #c:Landroid/database/Cursor;
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 2383
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v10           #deleted:I
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized removeLike(JJZ)I
    .locals 13
    .parameter "postId"
    .parameter "myUserId"
    .parameter "notify"

    .prologue
    .line 1110
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v0

    .line 1111
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v12, 0x0

    .line 1112
    .local v12, result:I
    const/4 v10, 0x0

    .line 1114
    .local v10, deletes:I
    :try_start_1
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1115
    const/4 v1, 0x1

    new-array v4, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v4, v1

    .line 1116
    .local v4, whereArgs:[Ljava/lang/String;
    const-string v1, "posts"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/String;

    const/4 v3, 0x0

    const-string v5, "metadata_flags"

    aput-object v5, v2, v3

    const-string v3, "post_id=?"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 1119
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_1

    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 1120
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1121
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 1122
    .local v9, cv:Landroid/content/ContentValues;
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    .line 1123
    .local v11, flag:I
    and-int/lit8 v11, v11, -0x9

    .line 1124
    const-string v1, "metadata_flags"

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v9, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1125
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 1127
    sget-boolean v1, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v1, :cond_0

    .line 1128
    const-string v1, "VineDH"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Removing like in post: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1130
    :cond_0
    const-string v1, "posts"

    const-string v2, "post_id=?"

    invoke-virtual {v0, v1, v9, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_5

    const/4 v12, 0x1

    .line 1135
    .end local v9           #cv:Landroid/content/ContentValues;
    .end local v11           #flag:I
    :cond_1
    :goto_0
    const-string v1, "likes"

    const-string v2, "post_id=? AND user_id=?"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    const/4 v5, 0x1

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v3, v5

    invoke-virtual {v0, v1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v10

    .line 1138
    const/4 v1, 0x3

    invoke-direct {p0, v1, p1, p2}, Lco/vine/android/provider/VineDatabaseHelper;->removePostsFromGroupByPostId(IJ)I

    move-result v1

    add-int/2addr v10, v1

    .line 1139
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 1140
    sget-boolean v1, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v1, :cond_2

    .line 1141
    const-string v1, "VineDH"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Deleted self like for post: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1144
    :cond_2
    :try_start_2
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1146
    if-eqz p5, :cond_4

    if-gtz v12, :cond_3

    if-lez v10, :cond_4

    .line 1147
    :cond_3
    invoke-direct {p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1149
    :cond_4
    monitor-exit p0

    return v12

    .line 1130
    .restart local v9       #cv:Landroid/content/ContentValues;
    .restart local v11       #flag:I
    :cond_5
    const/4 v12, 0x0

    goto :goto_0

    .line 1144
    .end local v4           #whereArgs:[Ljava/lang/String;
    .end local v8           #c:Landroid/database/Cursor;
    .end local v9           #cv:Landroid/content/ContentValues;
    .end local v11           #flag:I
    :catchall_0
    move-exception v1

    :try_start_3
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1110
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v10           #deletes:I
    .end local v12           #result:I
    :catchall_1
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized removePostsByReposterId(J)V
    .locals 7
    .parameter "reposterId"

    .prologue
    .line 1991
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1992
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "reposter_id=? AND post_type =?"

    .line 1993
    .local v3, selection:Ljava/lang/String;
    const/4 v4, 0x2

    new-array v2, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    const/4 v4, 0x1

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    .line 1995
    .local v2, selArgs:[Ljava/lang/String;
    const-string v4, "post_groups"

    const-string v5, "reposter_id=? AND post_type =?"

    invoke-virtual {v0, v4, v5, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1997
    .local v1, deleted:I
    sget-boolean v4, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v4, :cond_0

    .line 1998
    const-string v4, "VineDH"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Deleted "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " posts with reposterId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2000
    :cond_0
    if-lez v1, :cond_1

    .line 2001
    iget-object v4, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lco/vine/android/provider/Vine$PostGroupsView;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2002
    iget-object v4, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 2003
    iget-object v4, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v5, Lco/vine/android/provider/Vine$PostCommentsLikesView;->CONTENT_URI_ALL_TIMELINE:Landroid/net/Uri;

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2005
    :cond_1
    monitor-exit p0

    return-void

    .line 1991
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #deleted:I
    .end local v2           #selArgs:[Ljava/lang/String;
    .end local v3           #selection:Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized removePostsFromGroupByUser(JILjava/lang/String;)I
    .locals 18
    .parameter "userId"
    .parameter "type"
    .parameter "tag"

    .prologue
    .line 1494
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 1495
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "post_groups_view"

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "user_id=? AND post_type=? AND tag=?"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static/range {p3 .. p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    aput-object p4, v6, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1499
    .local v10, c:Landroid/database/Cursor;
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 1500
    .local v15, postIdsToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v10, :cond_1

    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1502
    :cond_0
    const/4 v3, 0x0

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1503
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1504
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1507
    :cond_1
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 1508
    .local v14, placeHolderString:Ljava/lang/StringBuilder;
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v16

    .line 1509
    .local v16, size:I
    const/4 v11, 0x0

    .local v11, i:I
    :goto_0
    move/from16 v0, v16

    if-ge v11, v0, :cond_3

    .line 1510
    const-string v3, "?"

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1511
    add-int/lit8 v3, v16, -0x1

    if-ge v11, v3, :cond_2

    const/4 v3, 0x1

    move/from16 v0, v16

    if-eq v0, v3, :cond_2

    .line 1512
    const-string v3, ","

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1509
    :cond_2
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .line 1517
    :cond_3
    :try_start_1
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1519
    invoke-virtual {v15}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v12, v3, [Ljava/lang/String;

    .line 1520
    .local v12, idArray:[Ljava/lang/String;
    invoke-static/range {p3 .. p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1522
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " IN ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ") AND "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "post_type"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "=?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 1525
    .local v17, whereString:Ljava/lang/String;
    const-string v4, "post_groups"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "post_id"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v15, v12}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    invoke-virtual {v2, v4, v5, v3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v13

    .line 1527
    .local v13, numGroups:I
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V

    .line 1529
    sget-boolean v3, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v3, :cond_4

    .line 1530
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Due to unfollowing "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p1

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " deleting "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " groups "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " , of type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " and tag "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1534
    :cond_4
    :try_start_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1537
    if-lez v13, :cond_5

    .line 1538
    invoke-direct/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1541
    :cond_5
    monitor-exit p0

    return v13

    .line 1534
    .end local v12           #idArray:[Ljava/lang/String;
    .end local v13           #numGroups:I
    .end local v17           #whereString:Ljava/lang/String;
    :catchall_0
    move-exception v3

    :try_start_3
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1494
    .end local v2           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v10           #c:Landroid/database/Cursor;
    .end local v11           #i:I
    .end local v14           #placeHolderString:Ljava/lang/StringBuilder;
    .end local v15           #postIdsToRemove:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v16           #size:I
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public declared-synchronized removeUserWithType(JIZLandroid/net/Uri;)Z
    .locals 8
    .parameter "userId"
    .parameter "type"
    .parameter "notify"
    .parameter "uri"

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 1959
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1960
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "type=? AND user_id=?"

    .line 1961
    .local v3, selection:Ljava/lang/String;
    const/4 v6, 0x2

    new-array v2, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    const/4 v6, 0x1

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v6

    .line 1962
    .local v2, selArgs:[Ljava/lang/String;
    const-string v6, "user_groups"

    const-string v7, "type=? AND user_id=?"

    invoke-virtual {v0, v6, v7, v2}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1964
    .local v1, deleted:I
    if-lez v1, :cond_2

    .line 1965
    if-eqz p4, :cond_0

    .line 1966
    iget-object v5, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    const/4 v6, 0x0

    invoke-virtual {v5, p5, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 1968
    :cond_0
    sget-boolean v5, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v5, :cond_1

    .line 1969
    const-string v5, "VineDH"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Deleted user with userId="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " of type="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1973
    :cond_1
    :goto_0
    monitor-exit p0

    return v4

    :cond_2
    move v4, v5

    goto :goto_0

    .line 1959
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #deleted:I
    .end local v2           #selArgs:[Ljava/lang/String;
    .end local v3           #selection:Ljava/lang/String;
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method public declared-synchronized removeUsersByGroup(I)V
    .locals 7
    .parameter "type"

    .prologue
    .line 1978
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 1979
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "user_groups"

    const-string v3, "type=?"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v0, v2, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 1982
    .local v1, deleted:I
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 1983
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Deleted "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " users of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1985
    :cond_0
    monitor-exit p0

    return-void

    .line 1978
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v1           #deleted:I
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized revine(Lco/vine/android/api/VineRepost;JZ)I
    .locals 20
    .parameter "repost"
    .parameter "userId"
    .parameter "notify"

    .prologue
    .line 1159
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v1

    .line 1160
    .local v1, db:Landroid/database/sqlite/SQLiteDatabase;
    const/16 v19, 0x0

    .line 1163
    .local v19, result:I
    :try_start_1
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 1164
    const/4 v2, 0x1

    new-array v5, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    move-object/from16 v0, p1

    iget-wide v3, v0, Lco/vine/android/api/VineRepost;->postId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v5, v2

    .line 1165
    .local v5, whereArgs:[Ljava/lang/String;
    const-string v2, "posts"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v6, "metadata_flags"

    aput-object v6, v3, v4

    const-string v4, "post_id=?"

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v14

    .line 1168
    .local v14, c:Landroid/database/Cursor;
    if-eqz v14, :cond_2

    .line 1169
    invoke-interface {v14}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_1

    invoke-interface {v14}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1170
    new-instance v17, Landroid/content/ContentValues;

    invoke-direct/range {v17 .. v17}, Landroid/content/ContentValues;-><init>()V

    .line 1171
    .local v17, cv:Landroid/content/ContentValues;
    const/4 v2, 0x0

    invoke-interface {v14, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    .line 1172
    .local v18, flag:I
    or-int/lit8 v18, v18, 0x10

    .line 1173
    const-string v2, "metadata_flags"

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1174
    const-string v2, "my_repost_id"

    move-object/from16 v0, p1

    iget-wide v3, v0, Lco/vine/android/api/VineRepost;->repostId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1175
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1176
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 1177
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Revined post "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget-wide v6, v0, Lco/vine/android/api/VineRepost;->postId:J

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1179
    :cond_0
    const-string v2, "posts"

    const-string v3, "post_id=?"

    move-object/from16 v0, v17

    invoke-virtual {v1, v2, v0, v3, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_6

    const/16 v19, 0x1

    .line 1183
    .end local v17           #cv:Landroid/content/ContentValues;
    .end local v18           #flag:I
    :cond_1
    :goto_0
    invoke-interface {v14}, Landroid/database/Cursor;->close()V

    .line 1187
    :cond_2
    const-string v7, "post_groups"

    const/4 v2, 0x1

    new-array v8, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "repost_data"

    aput-object v3, v8, v2

    const-string v9, "post_id=? AND post_type=? AND tag=?"

    const/4 v2, 0x3

    new-array v10, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    move-object/from16 v0, p1

    iget-wide v3, v0, Lco/vine/android/api/VineRepost;->postId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v10, v2

    const/4 v2, 0x1

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v10, v2

    const/4 v2, 0x2

    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v10, v2

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v6, v1

    invoke-virtual/range {v6 .. v13}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    .line 1195
    .local v15, c2:Landroid/database/Cursor;
    if-eqz v15, :cond_4

    .line 1196
    invoke-interface {v15}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-lez v2, :cond_8

    invoke-interface {v15}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 1198
    const/4 v2, 0x0

    invoke-interface {v15, v2}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v2

    invoke-static {v2}, Lco/vine/android/util/Util;->fromByteArray([B)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lco/vine/android/api/VineRepost;

    .line 1199
    .local v16, currentData:Lco/vine/android/api/VineRepost;
    if-eqz v16, :cond_7

    .line 1200
    move-object/from16 v0, p1

    iget-wide v2, v0, Lco/vine/android/api/VineRepost;->repostId:J

    move-object/from16 v0, v16

    iput-wide v2, v0, Lco/vine/android/api/VineRepost;->repostId:J

    .line 1206
    :goto_1
    new-instance v17, Landroid/content/ContentValues;

    invoke-direct/range {v17 .. v17}, Landroid/content/ContentValues;-><init>()V

    .line 1207
    .restart local v17       #cv:Landroid/content/ContentValues;
    const-string v2, "repost_data"

    invoke-static/range {v16 .. v16}, Lco/vine/android/util/Util;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 1208
    const-string v2, "sort_id"

    move-object/from16 v0, p1

    iget-wide v3, v0, Lco/vine/android/api/VineRepost;->repostId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1209
    const-string v2, "post_groups"

    const-string v3, "post_id=? AND post_type=? AND tag=?"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    const/4 v6, 0x0

    move-object/from16 v0, p1

    iget-wide v7, v0, Lco/vine/android/api/VineRepost;->postId:J

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v6

    const/4 v6, 0x1

    const/4 v7, 0x2

    invoke-static {v7}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v6

    const/4 v6, 0x2

    invoke-static/range {p2 .. p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v6

    move-object/from16 v0, v17

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1214
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_3

    .line 1215
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Updated repost data for post "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v16

    iget-wide v6, v0, Lco/vine/android/api/VineRepost;->postId:J

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with repost id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v16

    iget-wide v6, v0, Lco/vine/android/api/VineRepost;->repostId:J

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for user timeline."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1233
    .end local v16           #currentData:Lco/vine/android/api/VineRepost;
    :cond_3
    :goto_2
    invoke-interface {v15}, Landroid/database/Cursor;->close()V

    .line 1235
    .end local v17           #cv:Landroid/content/ContentValues;
    :cond_4
    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1237
    :try_start_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1239
    if-eqz p4, :cond_5

    if-lez v19, :cond_5

    .line 1240
    invoke-direct/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1242
    :cond_5
    monitor-exit p0

    return v19

    .line 1179
    .end local v15           #c2:Landroid/database/Cursor;
    .restart local v17       #cv:Landroid/content/ContentValues;
    .restart local v18       #flag:I
    :cond_6
    const/16 v19, 0x0

    goto/16 :goto_0

    .line 1202
    .end local v17           #cv:Landroid/content/ContentValues;
    .end local v18           #flag:I
    .restart local v15       #c2:Landroid/database/Cursor;
    .restart local v16       #currentData:Lco/vine/android/api/VineRepost;
    :cond_7
    :try_start_3
    new-instance v16, Lco/vine/android/api/VineRepost;

    .end local v16           #currentData:Lco/vine/android/api/VineRepost;
    invoke-direct/range {v16 .. v16}, Lco/vine/android/api/VineRepost;-><init>()V

    .line 1203
    .restart local v16       #currentData:Lco/vine/android/api/VineRepost;
    move-object/from16 v0, p1

    iget-wide v2, v0, Lco/vine/android/api/VineRepost;->repostId:J

    move-object/from16 v0, v16

    iput-wide v2, v0, Lco/vine/android/api/VineRepost;->repostId:J

    .line 1204
    move-object/from16 v0, p1

    iget-wide v2, v0, Lco/vine/android/api/VineRepost;->postId:J

    move-object/from16 v0, v16

    iput-wide v2, v0, Lco/vine/android/api/VineRepost;->postId:J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_1

    .line 1237
    .end local v5           #whereArgs:[Ljava/lang/String;
    .end local v14           #c:Landroid/database/Cursor;
    .end local v15           #c2:Landroid/database/Cursor;
    .end local v16           #currentData:Lco/vine/android/api/VineRepost;
    :catchall_0
    move-exception v2

    :try_start_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1159
    .end local v1           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v19           #result:I
    :catchall_1
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1221
    .restart local v1       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v5       #whereArgs:[Ljava/lang/String;
    .restart local v14       #c:Landroid/database/Cursor;
    .restart local v15       #c2:Landroid/database/Cursor;
    .restart local v19       #result:I
    :cond_8
    :try_start_5
    new-instance v17, Landroid/content/ContentValues;

    invoke-direct/range {v17 .. v17}, Landroid/content/ContentValues;-><init>()V

    .line 1222
    .restart local v17       #cv:Landroid/content/ContentValues;
    const-string v2, "post_type"

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1223
    const-string v2, "post_id"

    move-object/from16 v0, p1

    iget-wide v3, v0, Lco/vine/android/api/VineRepost;->postId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1224
    const-string v2, "sort_id"

    move-object/from16 v0, p1

    iget-wide v3, v0, Lco/vine/android/api/VineRepost;->repostId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1225
    const-string v2, "tag"

    invoke-static/range {p2 .. p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1226
    const-string v2, "repost_data"

    invoke-static/range {p1 .. p1}, Lco/vine/android/util/Util;->toByteArray(Ljava/lang/Object;)[B

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 1227
    const-string v2, "post_groups"

    const-string v3, "post_id"

    move-object/from16 v0, v17

    invoke-virtual {v1, v2, v3, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    .line 1228
    sget-boolean v2, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v2, :cond_3

    .line 1229
    const-string v2, "VineDH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Inserted repost data for post "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget-wide v6, v0, Lco/vine/android/api/VineRepost;->postId:J

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with repost id "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, p1

    iget-wide v6, v0, Lco/vine/android/api/VineRepost;->repostId:J

    invoke-virtual {v3, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " for user timeline."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_2
.end method

.method public safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 12
    .parameter "db"

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 2785
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2787
    :try_start_0
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteDiskIOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/database/sqlite/SQLiteFullException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_4

    .line 2810
    :cond_0
    :goto_0
    return-void

    .line 2788
    :catch_0
    move-exception v2

    .line 2789
    .local v2, e:Landroid/database/sqlite/SQLiteDiskIOException;
    throw v2

    .line 2790
    .end local v2           #e:Landroid/database/sqlite/SQLiteDiskIOException;
    :catch_1
    move-exception v2

    .line 2791
    .local v2, e:Landroid/database/sqlite/SQLiteFullException;
    const-wide/16 v0, -0x1

    .line 2793
    .local v0, currentSize:J
    :try_start_1
    iget-object v4, p0, Lco/vine/android/provider/VineDatabaseHelper;->mAppContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/util/Util;->getCacheSize(Landroid/content/Context;)J
    :try_end_1
    .catch Lco/vine/android/VineException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-wide v0

    .line 2797
    :goto_1
    iget-object v4, p0, Lco/vine/android/provider/VineDatabaseHelper;->mAppContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/client/AppController;->clearFileCache(Landroid/content/Context;)V

    .line 2799
    :try_start_2
    new-instance v4, Lco/vine/android/VineException;

    invoke-direct {v4}, Lco/vine/android/VineException;-><init>()V

    const-string v5, "Db full, cleaned cache from {} to {}."

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    iget-object v8, p0, Lco/vine/android/provider/VineDatabaseHelper;->mAppContext:Landroid/content/Context;

    invoke-static {v8}, Lco/vine/android/util/Util;->getCacheSize(Landroid/content/Context;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catch Lco/vine/android/VineException; {:try_start_2 .. :try_end_2} :catch_3

    .line 2803
    :goto_2
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->inTransaction()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2804
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    goto :goto_0

    .line 2794
    :catch_2
    move-exception v3

    .line 2795
    .local v3, e2:Lco/vine/android/VineException;
    invoke-static {v2}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_1

    .line 2800
    .end local v3           #e2:Lco/vine/android/VineException;
    :catch_3
    move-exception v3

    .line 2801
    .restart local v3       #e2:Lco/vine/android/VineException;
    new-instance v4, Lco/vine/android/VineException;

    invoke-direct {v4}, Lco/vine/android/VineException;-><init>()V

    const-string v5, "Db full, cleaned cache from {} to unknown."

    new-array v6, v11, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v4, v5, v6}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_2

    .line 2806
    .end local v0           #currentSize:J
    .end local v2           #e:Landroid/database/sqlite/SQLiteFullException;
    .end local v3           #e2:Lco/vine/android/VineException;
    :catch_4
    move-exception v2

    .line 2807
    .local v2, e:Landroid/database/sqlite/SQLiteException;
    throw v2
.end method

.method public declared-synchronized savePageCursor(IILjava/lang/String;IIJZ)I
    .locals 14
    .parameter "kind"
    .parameter "type"
    .parameter "tag"
    .parameter "nextPage"
    .parameter "prevPage"
    .parameter "anchor"
    .parameter "reversed"

    .prologue
    .line 2192
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 2194
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    if-nez p3, :cond_0

    .line 2195
    const-string p3, ""

    .line 2198
    :cond_0
    const-string v12, "kind=? AND type=? AND tag=?"

    .line 2199
    .local v12, projection:Ljava/lang/String;
    const/4 v3, 0x3

    new-array v6, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v3

    const/4 v3, 0x1

    invoke-static/range {p2 .. p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v3

    const/4 v3, 0x2

    aput-object p3, v6, v3

    .line 2202
    .local v6, selectionArgs:[Ljava/lang/String;
    const-string v3, "page_cursors"

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PageCursorsQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "kind=? AND type=? AND tag=?"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 2205
    .local v10, c:Landroid/database/Cursor;
    new-instance v13, Landroid/content/ContentValues;

    invoke-direct {v13}, Landroid/content/ContentValues;-><init>()V

    .line 2206
    .local v13, values:Landroid/content/ContentValues;
    const-string v3, "kind"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2207
    const-string v3, "type"

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2208
    const-string v3, "tag"

    move-object/from16 v0, p3

    invoke-virtual {v13, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2209
    const-string v3, "next_page"

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2210
    const-string v3, "previous_page"

    invoke-static/range {p5 .. p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2211
    const-string v3, "anchor"

    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 2212
    const-string v3, "reversed"

    invoke-static/range {p8 .. p8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 2214
    const/4 v11, 0x0

    .line 2215
    .local v11, num:I
    if-eqz v10, :cond_5

    .line 2217
    :try_start_1
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_3

    .line 2218
    const-string v3, "page_cursors"

    const-string v4, "kind=? AND type=? AND tag=?"

    invoke-virtual {v2, v3, v13, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v3

    if-lez v3, :cond_2

    const/4 v3, 0x1

    :goto_0
    add-int/2addr v11, v3

    .line 2225
    :goto_1
    :try_start_2
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 2230
    :goto_2
    sget-boolean v3, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v3, :cond_1

    .line 2231
    if-lez v11, :cond_1

    .line 2232
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Saved pagecursor of kind: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " tag: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " next:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " prev: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p5

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " anchor: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p6

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " reverse: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p8

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 2237
    :cond_1
    monitor-exit p0

    return v11

    .line 2218
    :cond_2
    const/4 v3, 0x0

    goto :goto_0

    .line 2221
    :cond_3
    :try_start_3
    const-string v3, "page_cursors"

    const-string v4, "_id"

    invoke-virtual {v2, v3, v4, v13}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-wide v3

    const-wide/16 v7, 0x0

    cmp-long v3, v3, v7

    if-lez v3, :cond_4

    const/4 v3, 0x1

    :goto_3
    add-int/2addr v11, v3

    goto :goto_1

    :cond_4
    const/4 v3, 0x0

    goto :goto_3

    .line 2225
    :catchall_0
    move-exception v3

    :try_start_4
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 2192
    .end local v2           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v6           #selectionArgs:[Ljava/lang/String;
    .end local v10           #c:Landroid/database/Cursor;
    .end local v11           #num:I
    .end local v12           #projection:Ljava/lang/String;
    .end local v13           #values:Landroid/content/ContentValues;
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3

    .line 2228
    .restart local v2       #db:Landroid/database/sqlite/SQLiteDatabase;
    .restart local v6       #selectionArgs:[Ljava/lang/String;
    .restart local v10       #c:Landroid/database/Cursor;
    .restart local v11       #num:I
    .restart local v12       #projection:Ljava/lang/String;
    .restart local v13       #values:Landroid/content/ContentValues;
    :cond_5
    :try_start_5
    const-string v3, "page_cursors"

    const-string v4, "_id"

    invoke-virtual {v2, v3, v4, v13}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-result-wide v3

    const-wide/16 v7, 0x0

    cmp-long v3, v3, v7

    if-lez v3, :cond_6

    const/4 v3, 0x1

    :goto_4
    add-int/2addr v11, v3

    goto/16 :goto_2

    :cond_6
    const/4 v3, 0x0

    goto :goto_4
.end method

.method public declared-synchronized saveUserValue(Ljava/lang/String;Landroid/content/ContentValues;)I
    .locals 7
    .parameter "propName"
    .parameter "values"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 2177
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2178
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v3, "settings"

    const-string v4, "name=?"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    aput-object p1, v5, v6

    invoke-virtual {v0, v3, p2, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_0

    .line 2181
    const-string v3, "name"

    invoke-virtual {p2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2182
    const-string v3, "settings"

    const-string v4, "name"

    invoke-virtual {v0, v3, v4, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-nez v3, :cond_0

    .line 2187
    :goto_0
    monitor-exit p0

    return v1

    .line 2186
    :cond_0
    :try_start_1
    iget-object v1, p0, Lco/vine/android/provider/VineDatabaseHelper;->mContentResolver:Landroid/content/ContentResolver;

    sget-object v3, Lco/vine/android/provider/Vine$Settings;->CONTENT_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v1, v2

    .line 2187
    goto :goto_0

    .line 2177
    .end local v0           #db:Landroid/database/sqlite/SQLiteDatabase;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public setShouldHideProfileRevines(JZ)Z
    .locals 9
    .parameter "userId"
    .parameter "hide"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 2563
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2565
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const-string v2, "user_id=?"

    .line 2566
    .local v2, selection:Ljava/lang/String;
    new-array v1, v6, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v7

    .line 2567
    .local v1, selArgs:[Ljava/lang/String;
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 2568
    .local v4, values:Landroid/content/ContentValues;
    const-string v8, "hide_profile_reposts"

    if-eqz p3, :cond_0

    move v5, v6

    :goto_0
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v8, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2570
    const/4 v3, 0x0

    .line 2571
    .local v3, updated:I
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 2573
    :try_start_0
    const-string v5, "users"

    const-string v8, "user_id=?"

    invoke-virtual {v0, v5, v4, v8, v1}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    .line 2574
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2576
    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 2579
    if-lez v3, :cond_1

    :goto_1
    return v6

    .end local v3           #updated:I
    :cond_0
    move v5, v7

    .line 2568
    goto :goto_0

    .line 2576
    .restart local v3       #updated:I
    :catchall_0
    move-exception v5

    invoke-virtual {p0, v0}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v5

    :cond_1
    move v6, v7

    .line 2579
    goto :goto_1
.end method

.method public shouldHideProfileRevines(J)Z
    .locals 13
    .parameter "userId"

    .prologue
    const/4 v5, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    .line 2541
    invoke-virtual {p0}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 2542
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v9, 0x0

    .line 2543
    .local v9, ret:Z
    const-string v10, "user_id=?"

    .line 2544
    .local v10, selection:Ljava/lang/String;
    new-array v4, v11, [Ljava/lang/String;

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v12

    .line 2546
    .local v4, selArgs:[Ljava/lang/String;
    const-string v1, "users"

    new-array v2, v11, [Ljava/lang/String;

    const-string v3, "hide_profile_reposts"

    aput-object v3, v2, v12

    const-string v3, "user_id=?"

    move-object v6, v5

    move-object v7, v5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8

    .line 2550
    .local v8, cursor:Landroid/database/Cursor;
    if-eqz v8, :cond_1

    .line 2552
    :try_start_0
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2553
    const/4 v1, 0x0

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getInt(I)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-lez v1, :cond_2

    move v9, v11

    .line 2556
    :cond_0
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 2559
    :cond_1
    return v9

    :cond_2
    move v9, v12

    .line 2553
    goto :goto_0

    .line 2556
    :catchall_0
    move-exception v1

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method public declared-synchronized unRevine(JJZZ)I
    .locals 16
    .parameter "postId"
    .parameter "userId"
    .parameter "following"
    .parameter "notify"

    .prologue
    .line 1366
    monitor-enter p0

    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result-object v2

    .line 1367
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    const/4 v15, 0x0

    .line 1368
    .local v15, result:I
    const/4 v12, 0x0

    .line 1370
    .local v12, deletedGroups:I
    const/4 v3, 0x1

    :try_start_1
    new-array v6, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v6, v3

    .line 1371
    .local v6, whereArgs:[Ljava/lang/String;
    const-string v3, "posts"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v7, "metadata_flags"

    aput-object v7, v4, v5

    const-string v5, "post_id=?"

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1374
    .local v10, c:Landroid/database/Cursor;
    if-eqz v10, :cond_2

    .line 1375
    invoke-interface {v10}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-lez v3, :cond_1

    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 1376
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 1377
    .local v11, cv:Landroid/content/ContentValues;
    const/4 v3, 0x0

    invoke-interface {v10, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v13

    .line 1378
    .local v13, flag:I
    and-int/lit8 v13, v13, -0x11

    .line 1379
    const-string v3, "metadata_flags"

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v11, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1380
    const-string v3, "my_repost_id"

    const/4 v4, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v11, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1381
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1382
    sget-boolean v3, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v3, :cond_0

    .line 1383
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unrevined post "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p1

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1385
    :cond_0
    const-string v3, "posts"

    const-string v4, "post_id=?"

    invoke-virtual {v2, v3, v11, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_6

    const/4 v15, 0x1

    .line 1388
    .end local v11           #cv:Landroid/content/ContentValues;
    .end local v13           #flag:I
    :cond_1
    :goto_0
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1390
    :cond_2
    const-string v3, "post_groups"

    const-string v4, "post_id=? AND post_type=? AND tag=?"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    const/4 v7, 0x1

    const/4 v8, 0x2

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    const/4 v7, 0x2

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v12

    .line 1395
    sget-boolean v3, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v3, :cond_3

    .line 1396
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Deleted "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " with tag "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p3

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " and type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " and post id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p1

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " due to unrevining."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1402
    :cond_3
    if-nez p5, :cond_7

    .line 1403
    const-string v3, "post_groups"

    const-string v4, "post_id=? AND post_type=?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    const/4 v7, 0x1

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-virtual {v2, v3, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v3

    add-int/2addr v12, v3

    .line 1407
    sget-boolean v3, Lco/vine/android/provider/VineDatabaseHelper;->LOGGABLE:Z

    if-eqz v3, :cond_4

    .line 1408
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Deleted "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " for type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " and post id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p1

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " due to unrevining."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1426
    :cond_4
    :goto_1
    :try_start_2
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 1428
    if-eqz p6, :cond_5

    .line 1429
    invoke-direct/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->notifyPostCommentsViewUris()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 1431
    :cond_5
    monitor-exit p0

    return v15

    .line 1385
    .restart local v11       #cv:Landroid/content/ContentValues;
    .restart local v13       #flag:I
    :cond_6
    const/4 v15, 0x0

    goto/16 :goto_0

    .line 1413
    .end local v11           #cv:Landroid/content/ContentValues;
    .end local v13           #flag:I
    :cond_7
    :try_start_3
    new-instance v11, Landroid/content/ContentValues;

    invoke-direct {v11}, Landroid/content/ContentValues;-><init>()V

    .line 1414
    .restart local v11       #cv:Landroid/content/ContentValues;
    const-string v3, "repost_data"

    invoke-virtual {v11, v3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    .line 1415
    const-string v3, "post_groups"

    const-string v4, "post_id=? AND post_type=?"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    const/4 v7, 0x1

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-virtual {v2, v3, v11, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v14

    .line 1418
    .local v14, r:I
    const-string v3, "VineDH"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Removed   "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " repost data for type "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " and post id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-wide/from16 v0, p1

    invoke-virtual {v4, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " due to unrevining."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    .line 1426
    .end local v6           #whereArgs:[Ljava/lang/String;
    .end local v10           #c:Landroid/database/Cursor;
    .end local v11           #cv:Landroid/content/ContentValues;
    .end local v14           #r:I
    :catchall_0
    move-exception v3

    :try_start_4
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lco/vine/android/provider/VineDatabaseHelper;->safeFinishTransaction(Landroid/database/sqlite/SQLiteDatabase;)V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 1366
    .end local v2           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v12           #deletedGroups:I
    .end local v15           #result:I
    :catchall_1
    move-exception v3

    monitor-exit p0

    throw v3
.end method
