.class public Lco/vine/android/provider/VineDatabaseSQL;
.super Ljava/lang/Object;
.source "VineDatabaseSQL.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/provider/VineDatabaseSQL$TableQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$PageCursorsQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$UserGroupsQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$UsersQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$LikesQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$PostGroupsQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$PostsQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$TagsRecentlyUsedQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$NotificationsQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$TagsQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$ChannelsQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$CommentsQuery;,
        Lco/vine/android/provider/VineDatabaseSQL$EditionsQuery;
    }
.end annotation


# static fields
.field public static final ACTIVITY_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  activity (_id INTEGER PRIMARY KEY,notification_id INT UNIQUE NOT NULL,notification_type INT,user_id INT,post_id INT,thumbnail_url TEXT,avatar_url TEXT,timestamp INT,comment TEXT,username TEXT,is_last INT,entities BLOB,last_refresh INT,follow_status INT,sort_id INT);"

.field public static final AS:Ljava/lang/String; = " AS "

.field public static final CHANNELS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  channels (_id INTEGER PRIMARY KEY,channel_id INT UNIQUE NOT NULL,channel TEXT NOT NULL,timestamp INT,retinaIconUrl TEXT,background_color TEXT,font_color TEXT,last_used_timestamp INT,is_last INT);"

.field public static final COMMENTS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  comments (_id INTEGER PRIMARY KEY,comment_id INT UNIQUE NOT NULL,post_id INT NOT NULL,avatar_url TEXT,comment TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,verified INT,entities BLOB,is_last INT,last_refresh INT);"

.field public static final CREATE_TABLE:Ljava/lang/String; = "CREATE TABLE "

.field public static final CREATE_VIEW:Ljava/lang/String; = "CREATE VIEW "

.field public static final EDITIONS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  editions (_id INTEGER PRIMARY KEY,edition_code TEXT,edition_name TEXT);"

.field public static final LIKES_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  likes (_id INTEGER PRIMARY KEY,like_id INT UNIQUE NOT NULL,post_id INT NOT NULL,avatar_url TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,verified INT,last_refresh INT);"

.field public static final NOTIFICATIONS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  notifications (_id INTEGER PRIMARY KEY,notification_id INT UNIQUE NOT NULL,notification_type INT,message TEXT,cleared INT);"

.field public static final PAGE_CURSOR_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  page_cursors (_id INTEGER PRIMARY KEY,type INT,tag TEXT,kind INT,next_page INT,previous_page INT,anchor TEXT,reversed INT);"

.field public static final POSTS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  posts (_id INTEGER PRIMARY KEY,post_id INT NOT NULL,my_repost_id INT,tags BLOB,thumbnail_url TEXT,share_url TEXT,video_low_uRL TEXT,video_url TEXT,description TEXT,foursquare_venue_id TEXT,metadata_flags INT,post_flags INT,avatar_url TEXT,user_id INT,username TEXT,timestamp INT,location TEXT,venue_data BLOB,entities BLOB,likes_count INT,reviners_count INT,comments_count INT,last_refresh INT);"

.field public static final POST_COMMENTS_LIKES_VIEW_SQL:Ljava/lang/String; = "CREATE VIEW  post_comments_likes_view AS  SELECT post_groups_view._id AS _id,post_groups_view.post_id AS post_id,post_groups_view.my_repost_id AS my_repost_id,post_groups_view.tags AS tags,post_groups_view.thumbnail_url AS thumbnail_url,post_groups_view.share_url AS share_url,post_groups_view.video_low_uRL AS video_low_uRL,post_groups_view.video_url AS video_url,post_groups_view.description AS description,post_groups_view.foursquare_venue_id AS foursquare_venue_id,post_groups_view.metadata_flags AS metadata_flags,post_groups_view.post_flags AS post_flags,post_groups_view.post_type AS post_type,post_groups_view.tag AS tag,post_groups_view.sort_id AS sort_id,post_groups_view.is_last AS is_last,post_groups_view.avatar_url AS avatar_url,post_groups_view.user_id AS user_id,post_groups_view.timestamp AS timestamp,post_groups_view.location AS location,post_groups_view.username AS username,post_groups_view.venue_data AS venue_data,post_groups_view.entities AS entities,post_groups_view.repost_data AS repost_data,post_groups_view.reposter_id AS reposter_id,post_groups_view.likes_count AS likes_count,post_groups_view.reviners_count AS reviners_count,post_groups_view.comments_count AS comments_count,likes.like_id AS like_id,likes.avatar_url AS like_user_avatar_url,likes.user_id AS like_user_user_id,likes.timestamp AS like_user_timestamp,likes.location AS like_user_location,likes.username AS like_user_username,likes.verified AS like_user_verified,null  AS comment_id,null  AS comment,null  AS comment_user_avatar_url,null  AS comment_user_user_id,null  AS comment_user_timestamp,null  AS comment_user_location,null  AS comment_user_username,null  AS comment_user_verified,null  AS comment_is_last,null  AS comment_entities FROM post_groups_view LEFT JOIN likes ON post_groups_view.post_id = likes.post_id UNION SELECT post_groups_view._id AS _id,post_groups_view.post_id AS post_id,post_groups_view.my_repost_id AS my_repost_id,post_groups_view.tags AS tags,post_groups_view.thumbnail_url AS thumbnail_url,post_groups_view.share_url AS share_url,post_groups_view.video_low_uRL AS video_low_uRL,post_groups_view.video_url AS video_url,post_groups_view.description AS description,post_groups_view.foursquare_venue_id AS foursquare_venue_id,post_groups_view.metadata_flags AS metadata_flags,post_groups_view.post_flags AS post_flags,post_groups_view.post_type AS post_type,post_groups_view.tag AS tag,post_groups_view.sort_id AS sort_id,post_groups_view.is_last AS is_last,post_groups_view.avatar_url AS avatar_url,post_groups_view.user_id AS user_id,post_groups_view.timestamp AS timestamp,post_groups_view.location AS location,post_groups_view.username AS username,post_groups_view.venue_data AS venue_data,post_groups_view.entities AS entities,post_groups_view.repost_data AS repost_data,post_groups_view.reposter_id AS reposter_id,post_groups_view.likes_count AS likes_count,post_groups_view.reviners_count AS reviners_count,post_groups_view.comments_count AS comments_count,null  AS like_id,null  AS like_user_avatar_url,null  AS like_user_user_id,null  AS like_user_timestamp,null  AS like_user_location,null  AS like_user_username,null  AS like_user_verified,comments.comment_id AS comment_id,comments.comment AS comment,comments.avatar_url AS comment_user_avatar_url,comments.user_id AS comment_user_user_id,comments.timestamp AS comment_user_timestamp,comments.location AS comment_user_location,comments.username AS comment_user_username,comments.verified AS comment_user_verified,comments.is_last AS comment_is_last,comments.entities AS comment_entities FROM post_groups_view LEFT JOIN comments ON post_groups_view.post_id = comments.post_id "

.field public static final POST_GROUPS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  post_groups (_id INTEGER PRIMARY KEY,post_type INT,tag TEXT,post_id INT,is_last INT,repost_data BLOB,reposter_id INT,sort_id INT,g_flags INT);"

.field public static final POST_GROUPS_VIEW_SQL:Ljava/lang/String; = "CREATE VIEW  post_groups_view AS SELECT post_groups._id AS _id,post_groups.post_type AS post_type,post_groups.tag AS tag,post_groups.post_id AS post_id,post_groups.is_last AS is_last,post_groups.g_flags AS g_flags,post_groups.sort_id AS sort_id,post_groups.repost_data AS repost_data,post_groups.reposter_id AS reposter_id,posts.username AS username,posts.avatar_url AS avatar_url,posts.thumbnail_url AS thumbnail_url,posts.metadata_flags AS metadata_flags,posts.user_id AS user_id,posts.my_repost_id AS my_repost_id,posts.timestamp AS timestamp,posts.location AS location,posts.tags AS tags,posts.share_url AS share_url,posts.video_low_uRL AS video_low_uRL,posts.video_url AS video_url,posts.video_low_uRL AS video_low_uRL,posts.description AS description,posts.foursquare_venue_id AS foursquare_venue_id,posts.post_flags AS post_flags,posts.venue_data AS venue_data,posts.entities AS entities,posts.likes_count AS likes_count,posts.reviners_count AS reviners_count,posts.comments_count AS comments_count FROM post_groups LEFT JOIN posts AS posts ON post_groups.post_id=posts.post_id;"

.field public static final SELECTION_COMMENTS_BY_POST_ID:Ljava/lang/String; = "post_id=?"

.field public static final SELECTION_PAGE_CURSOR_KIND_TYPE_TAG:Ljava/lang/String; = "kind=? AND type=? AND tag=?"

.field public static final SELECTION_POST_GROUP_TYPE:Ljava/lang/String; = "post_type=?"

.field public static final SELECTION_POST_GROUP_TYPE_AND_TAG:Ljava/lang/String; = "post_type=? AND tag=?"

.field public static final SELECTION_POST_ID:Ljava/lang/String; = "post_id=?"

.field public static final SELECTION_POST_ID_AND_TYPE_AND_TAG:Ljava/lang/String; = "post_id=? AND post_type=? AND tag=?"

.field public static final SELECTION_ROW_ID:Ljava/lang/String; = "_id=?"

.field public static final SELECTION_USER_GROUP_TYPE:Ljava/lang/String; = "type=?"

.field public static final SELECTION_USER_GROUP_TYPE_AND_TAG:Ljava/lang/String; = "type=? AND tag=?"

.field public static final SELECTION_USER_ID:Ljava/lang/String; = "user_id=?"

.field public static final SETTINGS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  settings (_id INTEGER PRIMARY KEY,name TEXT UNIQUE ON CONFLICT REPLACE,value TEXT);"

.field public static final TAGS_RECENTLY_USED_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  tag_recently_used (_id INTEGER PRIMARY KEY,tag_id INT UNIQUE NOT NULL,tag_name TEXT NOT NULL,last_used_timestamp TEXT);"

.field public static final TAGS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  tag_search_results (_id INTEGER PRIMARY KEY,tag_id INT UNIQUE NOT NULL,tag_name TEXT NOT NULL,last_used_timestamp TEXT,is_last INT);"

.field public static final USERS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  users (_id INTEGER PRIMARY KEY,user_id INT UNIQUE NOT NULL,avatar_url TEXT,blocked INT,blocking INT,hide_profile_reposts INT,description TEXT,location TEXT,explicit INT,follower_count INT,following_count INT,following_flag INT,like_count INT,post_count INT,username TEXT,verified INT,follow_status INT,last_refresh INT);"

.field public static final USER_GROUPS_TABLE_SQL:Ljava/lang/String; = "CREATE TABLE  user_groups (_id INTEGER PRIMARY KEY,type INT,tag TEXT,user_id INT,is_last INT,g_flags INT,order_id INT);"

.field public static final USER_GROUPS_VIEW_SQL:Ljava/lang/String; = "CREATE VIEW  user_groups_view AS SELECT user_groups._id AS _id,user_groups.type AS type,user_groups.tag AS tag,user_groups.user_id AS user_id,user_groups.is_last AS is_last,user_groups.g_flags AS g_flags,user_groups.order_id AS order_id,user.username AS username,user.user_id AS user_id,user.avatar_url AS avatar_url,user.blocked AS blocked,user.blocking AS blocking,user.description AS description,user.location AS location,user.explicit AS explicit,user.follower_count AS follower_count,user.following_count AS following_count,user.following_flag AS following_flag,user.like_count AS like_count,user.post_count AS post_count,user.follow_status AS follow_status,user.verified AS verified FROM user_groups LEFT JOIN users AS user ON user_groups.user_id=user.user_id;"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 901
    return-void
.end method
