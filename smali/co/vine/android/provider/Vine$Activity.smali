.class public final Lco/vine/android/provider/Vine$Activity;
.super Ljava/lang/Object;
.source "Vine.java"

# interfaces
.implements Landroid/provider/BaseColumns;
.implements Lco/vine/android/provider/Vine$BasePostColumns;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/provider/Vine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Activity"
.end annotation


# static fields
.field public static final COMMENT:Ljava/lang/String; = "comment"

.field public static final CONTENT_ITEM_TYPE:Ljava/lang/String; = "vnd.android.cursor.item/vnd.vine.android.activity"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "vnd.android.cursor.dir/vnd.vine.android.activities"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final CONTENT_URI_WITH_FOLLOW_REQUESTS:Landroid/net/Uri; = null

.field public static final CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL:Landroid/net/Uri; = null

.field public static final FOLLOW_STATUS:Ljava/lang/String; = "follow_status"

.field public static final LAST_REFRESH:Ljava/lang/String; = "last_refresh"

.field public static final NOTIFICATION_ID:Ljava/lang/String; = "notification_id"

.field public static final NOTIFICATION_TYPE:Ljava/lang/String; = "notification_type"

.field public static final SORT_ID:Ljava/lang/String; = "sort_id"

.field public static final SORT_ORDER_DEFAULT:Ljava/lang/String; = "sort_id DESC, notification_id DESC"

.field public static final SORT_ORDER_HIGH:I = 0x2

.field public static final SORT_ORDER_LAST:Ljava/lang/String; = "sort_id ASC, notification_id ASC"

.field public static final SORT_ORDER_LAST_REFRESH:Ljava/lang/String; = "last_refresh DESC"

.field public static final SORT_ORDER_NORMAL:I = 0x1

.field public static final TABLE_NAME:Ljava/lang/String; = "activity"

.field public static final THUMBNAIL_URL:Ljava/lang/String; = "thumbnail_url"

.field public static final TYPE_COMMENT:I = 0x3

.field public static final TYPE_COMMENT_MENTION:I = 0xb

.field public static final TYPE_FOLLOW:I = 0x1

.field public static final TYPE_FOLLOW_APPROVAL:I = 0xe

.field public static final TYPE_FOLLOW_REQUEST:I = 0xd

.field public static final TYPE_LIKE:I = 0x2

.field public static final TYPE_OP_COMMENT_MENTION:I = 0xc

.field public static final TYPE_POST_MENTION:I = 0xa

.field public static final TYPE_REVINE:I = 0x4

.field public static final TYPE_UNDEFINED:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 193
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lco/vine/android/provider/Vine;->CONTENT_AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI:Landroid/net/Uri;

    .line 194
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lco/vine/android/provider/Vine;->CONTENT_AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/with_follow"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS:Landroid/net/Uri;

    .line 197
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lco/vine/android/provider/Vine;->CONTENT_AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/with_follow_all"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/Vine$Activity;->CONTENT_URI_WITH_FOLLOW_REQUESTS_ALL:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 189
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
