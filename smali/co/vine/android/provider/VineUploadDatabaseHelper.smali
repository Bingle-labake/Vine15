.class public Lco/vine/android/provider/VineUploadDatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "VineUploadDatabaseHelper.java"


# static fields
.field public static final DATABASE_VERSION:I = 0x3

.field private static final DB_NAME:Ljava/lang/String; = "upload"

.field public static final SCHEMA_VERSION:I = 0x1

.field private static final SEPARATOR:Ljava/lang/String; = "-"

.field private static final sHelperMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lco/vine/android/provider/VineUploadDatabaseHelper;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mAppContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lco/vine/android/provider/VineUploadDatabaseHelper;->sHelperMap:Ljava/util/HashMap;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2
    .parameter "context"
    .parameter "name"

    .prologue
    .line 45
    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-direct {p0, p1, p2, v0, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 46
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/provider/VineUploadDatabaseHelper;->mAppContext:Landroid/content/Context;

    .line 47
    return-void
.end method

.method public static declared-synchronized getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineUploadDatabaseHelper;
    .locals 4
    .parameter "context"

    .prologue
    .line 35
    const-class v3, Lco/vine/android/provider/VineUploadDatabaseHelper;

    monitor-enter v3

    const/4 v2, 0x1

    :try_start_0
    invoke-static {v2}, Lco/vine/android/provider/VineUploadDatabaseHelper;->getDatabaseName(I)Ljava/lang/String;

    move-result-object v0

    .line 36
    .local v0, databaseName:Ljava/lang/String;
    sget-object v2, Lco/vine/android/provider/VineUploadDatabaseHelper;->sHelperMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lco/vine/android/provider/VineUploadDatabaseHelper;

    .line 37
    .local v1, helper:Lco/vine/android/provider/VineUploadDatabaseHelper;
    if-nez v1, :cond_0

    .line 38
    new-instance v1, Lco/vine/android/provider/VineUploadDatabaseHelper;

    .end local v1           #helper:Lco/vine/android/provider/VineUploadDatabaseHelper;
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lco/vine/android/provider/VineUploadDatabaseHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 39
    .restart local v1       #helper:Lco/vine/android/provider/VineUploadDatabaseHelper;
    sget-object v2, Lco/vine/android/provider/VineUploadDatabaseHelper;->sHelperMap:Ljava/util/HashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :cond_0
    monitor-exit v3

    return-object v1

    .line 35
    .end local v0           #databaseName:Ljava/lang/String;
    .end local v1           #helper:Lco/vine/android/provider/VineUploadDatabaseHelper;
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2
.end method

.method public static getDatabaseName(I)Ljava/lang/String;
    .locals 2
    .parameter "schemaVersion"

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "upload-"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected createTables(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1
    .parameter "db"

    .prologue
    .line 88
    const-string v0, "CREATE TABLE  IF NOT EXISTS uploads (_id INTEGER PRIMARY KEY,path TEXT,hash TEXT,status INT,post_info TEXT,video_url TEXT,thumbnail_path TEXT,thumbnail_url TEXT,upload_time TEXT,reference TEXT,owner_id INT,captcha_url TEXT);"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 89
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0
    .parameter "db"

    .prologue
    .line 51
    invoke-virtual {p0, p1}, Lco/vine/android/provider/VineUploadDatabaseHelper;->createTables(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 52
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 6
    .parameter "db"
    .parameter "oldVersion"
    .parameter "newVersion"

    .prologue
    .line 56
    move v3, p2

    .line 57
    .local v3, version:I
    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    .line 59
    :try_start_0
    const-string v4, "ALTER TABLE uploads ADD COLUMN reference TEXT;"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 60
    const-string v4, "ALTER TABLE uploads ADD COLUMN owner_id INT"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 61
    const-string v4, "UPDATE uploads SET status=2 WHERE (status=0 OR status=1);"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 63
    iget-object v4, p0, Lco/vine/android/provider/VineUploadDatabaseHelper;->mAppContext:Landroid/content/Context;

    invoke-static {v4}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/client/AppController;->getActiveSessionReadOnly()Lco/vine/android/client/Session;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v1

    .line 65
    .local v1, userId:J
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "UPDATE uploads SET owner_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 72
    .end local v1           #userId:J
    :goto_0
    const-string v4, "Upgraded uploads database to version={}"

    const/4 v5, 0x3

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;)V

    .line 73
    const/4 v3, 0x2

    .line 75
    :cond_0
    const/4 v4, 0x2

    if-ne v3, v4, :cond_1

    .line 77
    :try_start_1
    const-string v4, "ALTER TABLE uploads ADD COLUMN captcha_url TEXT"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_1

    .line 83
    :goto_1
    const/4 v3, 0x3

    .line 85
    :cond_1
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, e:Landroid/database/sqlite/SQLiteException;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 69
    const-string v4, "DROP TABLE IF EXISTS uploads;"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 70
    const-string v4, "CREATE TABLE  IF NOT EXISTS uploads (_id INTEGER PRIMARY KEY,path TEXT,hash TEXT,status INT,post_info TEXT,video_url TEXT,thumbnail_path TEXT,thumbnail_url TEXT,upload_time TEXT,reference TEXT,owner_id INT,captcha_url TEXT);"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_0

    .line 78
    .end local v0           #e:Landroid/database/sqlite/SQLiteException;
    :catch_1
    move-exception v0

    .line 79
    .restart local v0       #e:Landroid/database/sqlite/SQLiteException;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    .line 80
    const-string v4, "DROP TABLE IF EXISTS uploads;"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 81
    const-string v4, "CREATE TABLE  IF NOT EXISTS uploads (_id INTEGER PRIMARY KEY,path TEXT,hash TEXT,status INT,post_info TEXT,video_url TEXT,thumbnail_path TEXT,thumbnail_url TEXT,upload_time TEXT,reference TEXT,owner_id INT,captcha_url TEXT);"

    invoke-virtual {p1, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    goto :goto_1
.end method
