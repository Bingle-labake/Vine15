.class public Lco/vine/android/provider/Vine;
.super Ljava/lang/Object;
.source "Vine.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/provider/Vine$PageCursors;,
        Lco/vine/android/provider/Vine$Settings;,
        Lco/vine/android/provider/Vine$PostCommentsLikesView;,
        Lco/vine/android/provider/Vine$PostGroupsView;,
        Lco/vine/android/provider/Vine$UserGroupsView;,
        Lco/vine/android/provider/Vine$ChannelsColumns;,
        Lco/vine/android/provider/Vine$NotificationsColumns;,
        Lco/vine/android/provider/Vine$TagsColumns;,
        Lco/vine/android/provider/Vine$PostGroupColumns;,
        Lco/vine/android/provider/Vine$PostColumns;,
        Lco/vine/android/provider/Vine$BasePostColumns;,
        Lco/vine/android/provider/Vine$LikesColumns;,
        Lco/vine/android/provider/Vine$CommentsColumns;,
        Lco/vine/android/provider/Vine$UserGroupColumns;,
        Lco/vine/android/provider/Vine$UserColumns;,
        Lco/vine/android/provider/Vine$Editions;,
        Lco/vine/android/provider/Vine$Notifications;,
        Lco/vine/android/provider/Vine$Channels;,
        Lco/vine/android/provider/Vine$TagsRecentlyUsed;,
        Lco/vine/android/provider/Vine$TagSearchResults;,
        Lco/vine/android/provider/Vine$Activity;,
        Lco/vine/android/provider/Vine$Likes;,
        Lco/vine/android/provider/Vine$PostGroups;,
        Lco/vine/android/provider/Vine$Posts;,
        Lco/vine/android/provider/Vine$Comments;,
        Lco/vine/android/provider/Vine$UserGroups;,
        Lco/vine/android/provider/Vine$Users;
    }
.end annotation


# static fields
.field public static final AUTHORITY:Ljava/lang/String; = null

.field public static final CONTENT_AUTHORITY:Ljava/lang/String; = null

.field public static final LIMIT_DEFAULT:I = 0x14

.field public static final QUERY_PARAMETER_DB_OWNER_ID:Ljava/lang/String; = "db_owner_id"

.field public static final QUERY_PARAMETER_LIMIT:Ljava/lang/String; = "limit"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 15
    const-string v0, ".provider.VineProvider"

    invoke-static {v0}, Lco/vine/android/util/BuildUtil;->getAuthority(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    .line 17
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "content://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/provider/Vine;->CONTENT_AUTHORITY:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 1042
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1043
    return-void
.end method
