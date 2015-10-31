.class public Lco/vine/android/provider/VineUploadsDatabaseSQL;
.super Ljava/lang/Object;
.source "VineUploadsDatabaseSQL.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/provider/VineUploadsDatabaseSQL$UploadsQuery;
    }
.end annotation


# static fields
.field public static final ADD_COLUMN:Ljava/lang/String; = " ADD COLUMN "

.field public static final ALTER_TABLE:Ljava/lang/String; = "ALTER TABLE "

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE "

.field public static final UPLOADS_ADD_CAPTCHA_URL_COLUMN:Ljava/lang/String; = "ALTER TABLE uploads ADD COLUMN captcha_url TEXT"

.field public static final UPLOADS_ADD_OWNER_ID_COLUMN:Ljava/lang/String; = "ALTER TABLE uploads ADD COLUMN owner_id INT"

.field public static final UPLOADS_ADD_REFERENCE_COLUMN:Ljava/lang/String; = "ALTER TABLE uploads ADD COLUMN reference TEXT;"

.field public static final UPLOADS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  IF NOT EXISTS uploads (_id INTEGER PRIMARY KEY,path TEXT,hash TEXT,status INT,post_info TEXT,video_url TEXT,thumbnail_path TEXT,thumbnail_url TEXT,upload_time TEXT,reference TEXT,owner_id INT,captcha_url TEXT);"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    return-void
.end method
