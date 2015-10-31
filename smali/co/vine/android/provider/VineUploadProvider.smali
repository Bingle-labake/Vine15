.class public Lco/vine/android/provider/VineUploadProvider;
.super Landroid/content/ContentProvider;
.source "VineUploadProvider.java"


# static fields
.field private static final ALL_UPLOADS:I = 0x1

.field public static final AUTHORITY:Ljava/lang/String; = null

.field public static final CONTENT_AUTHORITY:Ljava/lang/String; = null

.field private static final DELETE_ALL_UPLOADS:I = 0x5

.field private static final DELETE_UPLOAD:I = 0x4

.field private static final GET_LAST_PATH:I = 0x3

#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field private static final PUT_HASH:I = 0x7

.field private static final PUT_NEW_UPLOAD:I = 0x6

.field private static final PUT_POST_INFO:I = 0xa

.field private static final PUT_STATUS:I = 0x8

.field private static final PUT_UPLOAD_TIME:I = 0xb

.field private static final PUT_URIS:I = 0x9

.field private static final PUT_VALUES:I = 0xc

.field private static final REFERENCE:I = 0xd

.field public static final SCHEME:Ljava/lang/String; = "content"

.field private static final TAG:Ljava/lang/String; = "VineUploadProvider"

.field private static final UPLOAD:I = 0x2

.field private static final sUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x1

    .line 28
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VineUploadProvider"

    const/4 v2, 0x3

    invoke-static {v0, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move v0, v1

    :goto_0
    sput-boolean v0, Lco/vine/android/provider/VineUploadProvider;->LOGGABLE:Z

    .line 31
    const-string v0, ".provider.VineUploadProvider"

    invoke-static {v0}, Lco/vine/android/util/BuildUtil;->getAuthority(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "content://"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v2, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/VineUploadProvider;->CONTENT_AUTHORITY:Ljava/lang/String;

    .line 49
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v2, -0x1

    invoke-direct {v0, v2}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    .line 53
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v2, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v3, "uploads/#"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 54
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/upload/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 55
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/reference/#"

    const/16 v3, 0xd

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 58
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/delete_upload"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 61
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/put_new_upload"

    const/4 v3, 0x6

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 62
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/put_hash"

    const/4 v3, 0x7

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 63
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/put_status"

    const/16 v3, 0x8

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 64
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/put_uris"

    const/16 v3, 0x9

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 65
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/put_post_info"

    const/16 v3, 0xa

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 66
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/put_upload_time"

    const/16 v3, 0xb

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 67
    sget-object v0, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/VineUploadProvider;->AUTHORITY:Ljava/lang/String;

    const-string v2, "uploads/put_values"

    const/16 v3, 0xc

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 68
    return-void

    .line 28
    :cond_1
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 7
    .parameter "uri"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    const/4 v6, 0x0

    .line 187
    const/4 v2, 0x0

    .line 188
    .local v2, rowsDeleted:I
    invoke-virtual {p0}, Lco/vine/android/provider/VineUploadProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineUploadDatabaseHelper;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 191
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-boolean v3, Lco/vine/android/provider/VineUploadProvider;->LOGGABLE:Z

    if-eqz v3, :cond_0

    .line 192
    const-string v3, "VineUploadProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "QUERY: uri "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " -> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v5, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    :cond_0
    sget-object v3, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    .line 196
    .local v1, match:I
    packed-switch v1, :pswitch_data_0

    .line 210
    :goto_0
    if-lez v2, :cond_1

    .line 211
    invoke-virtual {p0}, Lco/vine/android/provider/VineUploadProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lco/vine/android/provider/VineUploads$Uploads;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4, v6}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 213
    :cond_1
    return v2

    .line 198
    :pswitch_0
    const-string v3, "uploads"

    invoke-virtual {v0, v3, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 199
    goto :goto_0

    .line 202
    :pswitch_1
    const-string v3, "uploads"

    const-string v4, "1"

    invoke-virtual {v0, v3, v4, v6}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v2

    .line 203
    goto :goto_0

    .line 196
    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .parameter "uri"

    .prologue
    .line 152
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 8
    .parameter "uri"
    .parameter "values"

    .prologue
    const/4 v7, 0x0

    .line 157
    const-wide/16 v2, -0x1

    .line 158
    .local v2, rowId:J
    invoke-virtual {p0}, Lco/vine/android/provider/VineUploadProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineUploadDatabaseHelper;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 161
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-boolean v4, Lco/vine/android/provider/VineUploadProvider;->LOGGABLE:Z

    if-eqz v4, :cond_0

    .line 162
    const-string v4, "VineUploadProvider"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "QUERY: uri "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " -> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v6, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 165
    :cond_0
    sget-object v4, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v4, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    .line 166
    .local v1, match:I
    packed-switch v1, :pswitch_data_0

    .line 179
    :cond_1
    :goto_0
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-ltz v4, :cond_2

    .line 180
    invoke-virtual {p0}, Lco/vine/android/provider/VineUploadProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lco/vine/android/provider/VineUploads$Uploads;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V

    .line 182
    :cond_2
    return-object v7

    .line 168
    :pswitch_0
    const-string v4, "uploads"

    invoke-virtual {v0, v4, v7, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v2

    .line 169
    sget-boolean v4, Lco/vine/android/provider/VineUploadProvider;->LOGGABLE:Z

    if-eqz v4, :cond_1

    .line 170
    const-string v4, "VineUploadProvider"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Upload inserted with rowId="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 166
    nop

    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate()Z
    .locals 1

    .prologue
    .line 72
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 16
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selArgs"
    .parameter "sortOrder"

    .prologue
    .line 79
    const/4 v6, 0x0

    .line 83
    .local v6, groupBy:Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineUploadProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineUploadDatabaseHelper;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 91
    .local v2, db:Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    new-instance v1, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v1}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 92
    .local v1, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    sget-boolean v3, Lco/vine/android/provider/VineUploadProvider;->LOGGABLE:Z

    if-eqz v3, :cond_0

    .line 93
    const-string v3, "VineUploadProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "QUERY: uri "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " -> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    :cond_0
    sget-object v3, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v12

    .line 97
    .local v12, match:I
    sparse-switch v12, :sswitch_data_0

    .line 130
    const-string v3, "uploads"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 136
    :goto_1
    const/4 v7, 0x0

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v8, p5

    :try_start_1
    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 139
    .local v10, c:Landroid/database/Cursor;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineUploadProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    move-object/from16 v0, p1

    invoke-interface {v10, v3, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 140
    .end local v6           #groupBy:Ljava/lang/String;
    .end local v10           #c:Landroid/database/Cursor;
    :goto_2
    return-object v10

    .line 85
    .end local v1           #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .end local v2           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v12           #match:I
    .restart local v6       #groupBy:Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 86
    .local v11, e:Landroid/database/sqlite/SQLiteException;
    const-string v3, "Failed to get a readable database on query."

    const/4 v4, 0x0

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v11, v3, v4}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 87
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineUploadProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineUploadDatabaseHelper;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .restart local v2       #db:Landroid/database/sqlite/SQLiteDatabase;
    goto :goto_0

    .line 99
    .end local v11           #e:Landroid/database/sqlite/SQLiteException;
    .restart local v1       #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .restart local v12       #match:I
    :sswitch_0
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v13

    .line 100
    .local v13, ownerId:Ljava/lang/String;
    const-string v3, "uploads"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 101
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "owner_id="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 105
    .end local v13           #ownerId:Ljava/lang/String;
    :sswitch_1
    const-string v3, "uploads"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 106
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v13

    .line 107
    .restart local v13       #ownerId:Ljava/lang/String;
    const-string v3, "path"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 108
    .local v14, path:Ljava/lang/String;
    invoke-static {v14}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 109
    const-string p3, "path=? AND owner_id=?"

    .line 110
    sget-object v3, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v14, v5, v4

    const/4 v4, 0x1

    aput-object v13, v5, v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, "_id ASC"

    .end local v6           #groupBy:Ljava/lang/String;
    const-string v9, "1"

    move-object/from16 v4, p3

    invoke-virtual/range {v1 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    goto :goto_2

    .line 114
    .restart local v6       #groupBy:Ljava/lang/String;
    :cond_1
    const/4 v10, 0x0

    goto :goto_2

    .line 117
    .end local v13           #ownerId:Ljava/lang/String;
    .end local v14           #path:Ljava/lang/String;
    :sswitch_2
    const-string v3, "uploads"

    invoke-virtual {v1, v3}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 118
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v13

    .line 119
    .restart local v13       #ownerId:Ljava/lang/String;
    const-string v3, "reference"

    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 120
    .local v15, reference:Ljava/lang/String;
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 121
    const-string p3, "reference=? AND owner_id=?"

    .line 122
    sget-object v3, Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x2

    new-array v5, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v15, v5, v4

    const/4 v4, 0x1

    aput-object v13, v5, v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, "_id ASC"

    .end local v6           #groupBy:Ljava/lang/String;
    move-object/from16 v4, p3

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 125
    .restart local v10       #c:Landroid/database/Cursor;
    goto/16 :goto_2

    .line 127
    .end local v10           #c:Landroid/database/Cursor;
    .restart local v6       #groupBy:Ljava/lang/String;
    :cond_2
    const/4 v10, 0x0

    goto/16 :goto_2

    .line 141
    .end local v13           #ownerId:Ljava/lang/String;
    .end local v15           #reference:Ljava/lang/String;
    :catch_1
    move-exception v11

    .line 142
    .local v11, e:Ljava/lang/Exception;
    sget-boolean v3, Lco/vine/android/provider/VineUploadProvider;->LOGGABLE:Z

    if-eqz v3, :cond_3

    .line 143
    const-string v3, "Cannot execute {} {}  {} {} {} {}"

    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    const/4 v5, 0x0

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->toString()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    const/4 v5, 0x1

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->getTables()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v4, v5

    const/4 v5, 0x2

    aput-object p3, v4, v5

    const/4 v5, 0x3

    aput-object v6, v4, v5

    const/4 v5, 0x4

    aput-object p5, v4, v5

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 146
    :cond_3
    new-instance v3, Ljava/lang/RuntimeException;

    invoke-direct {v3, v11}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 97
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0xd -> :sswitch_2
    .end sparse-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 20
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 218
    const/4 v10, 0x0

    .line 220
    .local v10, rowsUpdated:I
    if-nez p2, :cond_0

    .line 221
    new-instance p2, Landroid/content/ContentValues;

    .end local p2
    invoke-direct/range {p2 .. p2}, Landroid/content/ContentValues;-><init>()V

    .line 224
    .restart local p2
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineUploadProvider;->getContext()Landroid/content/Context;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineUploadDatabaseHelper;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    .line 227
    .local v4, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-boolean v16, Lco/vine/android/provider/VineUploadProvider;->LOGGABLE:Z

    if-eqz v16, :cond_1

    .line 228
    const-string v16, "VineUploadProvider"

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "QUERY: uri "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " -> "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    sget-object v18, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v16 .. v17}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    :cond_1
    sget-object v16, Lco/vine/android/provider/VineUploadProvider;->sUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v7

    .line 232
    .local v7, match:I
    packed-switch v7, :pswitch_data_0

    .line 293
    const-string v12, "uploads"

    .line 299
    .local v12, tableName:Ljava/lang/String;
    :goto_0
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Landroid/content/ContentValues;->keySet()Ljava/util/Set;

    move-result-object v16

    invoke-interface/range {v16 .. v16}, Ljava/util/Set;->isEmpty()Z

    move-result v16

    if-nez v16, :cond_2

    .line 300
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    invoke-virtual {v4, v12, v0, v1, v2}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v10

    .line 311
    :cond_2
    return v10

    .line 234
    .end local v12           #tableName:Ljava/lang/String;
    :pswitch_0
    const-string v12, "uploads"

    .line 235
    .restart local v12       #tableName:Ljava/lang/String;
    const-string v16, "path"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 236
    .local v8, path:Ljava/lang/String;
    const-string v16, "hash"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 237
    .local v6, hash:Ljava/lang/String;
    const-string v16, "PUT_HASH path={}, hash={}"

    move-object/from16 v0, v16

    invoke-static {v0, v8, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 238
    const-string p3, "path=?"

    .line 239
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 p4, v0

    .end local p4
    const/16 v16, 0x0

    aput-object v8, p4, v16

    .line 240
    .restart local p4
    const-string v16, "hash"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 244
    .end local v6           #hash:Ljava/lang/String;
    .end local v8           #path:Ljava/lang/String;
    .end local v12           #tableName:Ljava/lang/String;
    :pswitch_1
    const-string v12, "uploads"

    .line 245
    .restart local v12       #tableName:Ljava/lang/String;
    const-string v16, "path"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 246
    .restart local v8       #path:Ljava/lang/String;
    const-string v16, "status"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 247
    .local v11, status:Ljava/lang/String;
    const-string v16, "captcha_url"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 248
    .local v3, captcha:Ljava/lang/String;
    const-string v16, "PUT_STATUS path={}, status={}"

    move-object/from16 v0, v16

    invoke-static {v0, v8, v11}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 249
    const-string p3, "path=?"

    .line 250
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 p4, v0

    .end local p4
    const/16 v16, 0x0

    aput-object v8, p4, v16

    .line 251
    .restart local p4
    const-string v16, "status"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    const-string v16, "captcha_url"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 256
    .end local v3           #captcha:Ljava/lang/String;
    .end local v8           #path:Ljava/lang/String;
    .end local v11           #status:Ljava/lang/String;
    .end local v12           #tableName:Ljava/lang/String;
    :pswitch_2
    const-string v12, "uploads"

    .line 257
    .restart local v12       #tableName:Ljava/lang/String;
    const-string v16, "path"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 258
    .restart local v8       #path:Ljava/lang/String;
    const-string v16, "video_url"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 259
    .local v15, videoUrl:Ljava/lang/String;
    const-string v16, "thumbnail_url"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 260
    .local v13, thumbnailUrl:Ljava/lang/String;
    const-string v16, "PUT_URIS path={}, videoUrl={}, thumbnailUrl={}"

    move-object/from16 v0, v16

    invoke-static {v0, v8, v15, v13}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 261
    const-string p3, "path=?"

    .line 262
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 p4, v0

    .end local p4
    const/16 v16, 0x0

    aput-object v8, p4, v16

    .line 263
    .restart local p4
    const-string v16, "video_url"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v15}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    const-string v16, "thumbnail_url"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 268
    .end local v8           #path:Ljava/lang/String;
    .end local v12           #tableName:Ljava/lang/String;
    .end local v13           #thumbnailUrl:Ljava/lang/String;
    .end local v15           #videoUrl:Ljava/lang/String;
    :pswitch_3
    const-string v12, "uploads"

    .line 269
    .restart local v12       #tableName:Ljava/lang/String;
    const-string v16, "path"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 270
    .restart local v8       #path:Ljava/lang/String;
    const-string v16, "post_info"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 271
    .local v9, postInfo:Ljava/lang/String;
    const-string v16, "PUT_POST_INFO path={}, postInfo={}"

    move-object/from16 v0, v16

    invoke-static {v0, v8, v9}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 272
    const-string p3, "path=?"

    .line 273
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 p4, v0

    .end local p4
    const/16 v16, 0x0

    aput-object v8, p4, v16

    .line 274
    .restart local p4
    const-string v16, "post_info"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 278
    .end local v8           #path:Ljava/lang/String;
    .end local v9           #postInfo:Ljava/lang/String;
    .end local v12           #tableName:Ljava/lang/String;
    :pswitch_4
    const-string v12, "uploads"

    .line 279
    .restart local v12       #tableName:Ljava/lang/String;
    const-string v16, "path"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 280
    .restart local v8       #path:Ljava/lang/String;
    const-string v16, "upload_time"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 281
    .local v14, uploadTime:Ljava/lang/String;
    const-string v16, "PUT_UPLOAD_TIME path={}, uploadTime={}"

    move-object/from16 v0, v16

    invoke-static {v0, v8, v14}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 282
    const-string p3, "path=?"

    .line 283
    const/16 v16, 0x1

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 p4, v0

    .end local p4
    const/16 v16, 0x0

    aput-object v8, p4, v16

    .line 284
    .restart local p4
    const-string v16, "upload_time"

    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1, v14}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 288
    .end local v8           #path:Ljava/lang/String;
    .end local v12           #tableName:Ljava/lang/String;
    .end local v14           #uploadTime:Ljava/lang/String;
    :pswitch_5
    const-string v16, "PUT_VALUES selectionArgs={}, values={}"

    invoke-virtual/range {p2 .. p2}, Landroid/content/ContentValues;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v16

    move-object/from16 v1, p4

    move-object/from16 v2, v17

    invoke-static {v0, v1, v2}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 289
    const-string v12, "uploads"

    .line 290
    .restart local v12       #tableName:Ljava/lang/String;
    goto/16 :goto_0

    .line 302
    :catch_0
    move-exception v5

    .line 303
    .local v5, e:Landroid/database/sqlite/SQLiteException;
    sget-boolean v16, Lco/vine/android/provider/VineUploadProvider;->LOGGABLE:Z

    if-eqz v16, :cond_3

    .line 304
    const-string v16, "Cannot execute update with db={}, tablename={}, selection={}, selectionArgs={}"

    const/16 v17, 0x4

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/String;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual {v4}, Landroid/database/sqlite/SQLiteDatabase;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    aput-object v12, v17, v18

    const/16 v18, 0x2

    aput-object p3, v17, v18

    const/16 v18, 0x3

    invoke-virtual/range {p4 .. p4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v16 .. v17}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 307
    :cond_3
    new-instance v16, Ljava/lang/RuntimeException;

    move-object/from16 v0, v16

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v16

    .line 232
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch
.end method
