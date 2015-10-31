.class public Lco/vine/android/provider/VineProvider;
.super Landroid/content/ContentProvider;
.source "VineProvider.java"


# static fields
.field private static final ACTIVITY:I = 0x21

.field private static final ACTIVITY_WITH_FOLLOW_REQUESTS:I = 0x22

.field private static final ACTIVITY_WITH_FOLLOW_REQUESTS_ALL:I = 0x23

.field private static final CHANNELS:I = 0x8

.field private static final COMMENTS:I = 0x4

.field private static final EDITIONS:I = 0x191

.field private static final HIDE_PROFILE_REPOSTS:I = 0x6f

.field private static final LIKES:I = 0x5

#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field private static final NOTIFICATIONS:I = 0x6c

.field private static final NOTIFICATIONS_UNCLEARED:I = 0x6d

.field private static final POSTS:I = 0x6

.field private static final POST_GROUPS_VIEW_ALL_TIMELINE:I = 0x17

.field private static final POST_GROUPS_VIEW_ALL_TIMELINE_ON_THE_RISE:I = 0x1a

.field private static final POST_GROUPS_VIEW_ALL_TIMELINE_POPULAR_NOW:I = 0x1b

.field private static final POST_GROUPS_VIEW_ALL_TIMELINE_SINGLE:I = 0x1d

.field private static final POST_GROUPS_VIEW_ALL_TIMELINE_TAG:I = 0x1c

.field private static final POST_GROUPS_VIEW_ALL_TIMELINE_USER:I = 0x18

.field private static final POST_GROUPS_VIEW_ALL_TIMELINE_USER_LIKES:I = 0x19

.field private static final POST_GROUPS_VIEW_ARBITRARY_TIMELINE:I = 0x20

.field private static final POST_GROUPS_VIEW_TIMELINE:I = 0x14

.field private static final POST_GROUPS_VIEW_TIMELINE_CHANNEL_POPULAR:I = 0x1e

.field private static final POST_GROUPS_VIEW_TIMELINE_CHANNEL_RECENT:I = 0x1f

.field private static final POST_GROUPS_VIEW_TIMELINE_USER:I = 0x15

.field private static final POST_GROUPS_VIEW_TIMELINE_USER_LIKES:I = 0x16

.field private static final PUT_NOTIFICATION:I = 0x12e

.field private static final PUT_RECENT_TAG:I = 0x12d

.field private static final RECENT_TAG:I = 0x6e

.field private static final SETTINGS:I = 0x3

.field private static final TAG:Ljava/lang/String; = "VineProvider"

.field private static final TAG_SEARCH_RESULTS:I = 0x7

.field private static final UPDATE_RECENT_TAG:I = 0x1f5

.field private static final USER:I = 0x1

.field private static final USER_GROUPS_VIEW_FIND_FRIENDS_ADDRESS:I = 0x67

.field private static final USER_GROUPS_VIEW_FIND_FRIENDS_TWITTER:I = 0x68

.field private static final USER_GROUPS_VIEW_FOLLOWERS:I = 0x65

.field private static final USER_GROUPS_VIEW_FOLLOWING:I = 0x64

.field private static final USER_GROUPS_VIEW_FRIENDS:I = 0x66

.field private static final USER_GROUPS_VIEW_LIKERS:I = 0x69

.field private static final USER_GROUPS_VIEW_REVINERS:I = 0x6b

.field private static final USER_GROUPS_VIEW_USER_SEARCH_RESULTS:I = 0x6a

.field private static final USER_ID:I = 0x2

.field private static final sUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    const/4 v1, 0x1

    .line 41
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VineProvider"

    invoke-static {v0, v4}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move v0, v1

    :goto_0
    sput-boolean v0, Lco/vine/android/provider/VineProvider;->LOGGABLE:Z

    .line 92
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v2, -0x1

    invoke-direct {v0, v2}, Landroid/content/UriMatcher;-><init>(I)V

    sput-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    .line 95
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v2, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v3, "users"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 96
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "users/id/#"

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 97
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "settings"

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 99
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "comments"

    const/4 v3, 0x4

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 100
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "likes"

    const/4 v3, 0x5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 102
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "posts"

    const/4 v3, 0x6

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 104
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "user_groups_view/following/#"

    const/16 v3, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 106
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "user_groups_view/followers/#"

    const/16 v3, 0x65

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 109
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "user_groups_view/friends/#"

    const/16 v3, 0x66

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 111
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "user_groups_view/find_friends_twitter/#"

    const/16 v3, 0x68

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 113
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "user_groups_view/find_friends_address/#"

    const/16 v3, 0x67

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 115
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "user_groups_view/likers/#"

    const/16 v3, 0x69

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 117
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "user_groups_view/reviners/#"

    const/16 v3, 0x6b

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 119
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "user_groups_view/user_search_results"

    const/16 v3, 0x6a

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 122
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_groups_view/timeline/#"

    const/16 v3, 0x14

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 124
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_groups_view/user_profile/#"

    const/16 v3, 0x15

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 126
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_groups_view/user_likes/#"

    const/16 v3, 0x16

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 129
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "tag_search_results"

    const/4 v3, 0x7

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 130
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "tag_recently_used"

    const/16 v3, 0x6e

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 131
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "users/hide_profile_reposts/#"

    const/16 v3, 0x6f

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 134
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "channels"

    const/16 v3, 0x8

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 136
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/all_timeline/#"

    const/16 v3, 0x17

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 138
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/all_timeline_user/#"

    const/16 v3, 0x18

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 140
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/all_timeline_user_likes/#"

    const/16 v3, 0x19

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 142
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/all_timeline_on_the_rise/#"

    const/16 v3, 0x1a

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 144
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/all_timeline_popular/#"

    const/16 v3, 0x1b

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 146
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/all_timeline_tag/#"

    const/16 v3, 0x1c

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 148
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/post/#"

    const/16 v3, 0x1d

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 150
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/timeline_channel_popular/#"

    const/16 v3, 0x1e

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 152
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/timeline_channel_recent/#"

    const/16 v3, 0x1f

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 154
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "post_comments_likes_view/timelines/#"

    const/16 v3, 0x20

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 157
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "activity"

    const/16 v3, 0x21

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 158
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "activity/with_follow"

    const/16 v3, 0x22

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 160
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "activity/with_follow_all"

    const/16 v3, 0x23

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 163
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "notifications"

    const/16 v3, 0x6c

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 164
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "notifications/uncleared"

    const/16 v3, 0x6d

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 167
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "notifications/put_notification"

    const/16 v3, 0x12e

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 168
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "tag_recently_used/put_tag"

    const/16 v3, 0x12d

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 169
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "tag_recently_used/update_tag"

    const/16 v3, 0x1f5

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 170
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    sget-object v1, Lco/vine/android/provider/Vine;->AUTHORITY:Ljava/lang/String;

    const-string v2, "editions"

    const/16 v3, 0x191

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 171
    return-void

    .line 41
    :cond_1
    const/4 v0, 0x0

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 1
    .parameter "uri"
    .parameter "s"
    .parameter "strings"

    .prologue
    .line 825
    const/4 v0, 0x0

    return v0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 3
    .parameter "uri"

    .prologue
    .line 760
    sget-object v0, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v0, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 778
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown URL "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 762
    :sswitch_0
    const-string v0, "vnd.android.cursor.dir/vnd.vine.android.users"

    .line 775
    :goto_0
    return-object v0

    .line 765
    :sswitch_1
    const-string v0, "vnd.android.cursor.item/vnd.vine.android.users"

    goto :goto_0

    .line 768
    :sswitch_2
    const-string v0, "vnd.android.cursor.item/vnd.vine.android.settings"

    goto :goto_0

    .line 772
    :sswitch_3
    const-string v0, "vnd.android.cursor.dir/vnd.vine.android.users.groups"

    goto :goto_0

    .line 775
    :sswitch_4
    const-string v0, "vnd.android.cursor.dir/vnd.vine.android.activities"

    goto :goto_0

    .line 760
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x21 -> :sswitch_4
        0x64 -> :sswitch_3
        0x65 -> :sswitch_3
    .end sparse-switch
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 9
    .parameter "uri"
    .parameter "values"

    .prologue
    const/4 v5, 0x0

    .line 785
    invoke-virtual {p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 788
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-boolean v6, Lco/vine/android/provider/VineProvider;->LOGGABLE:Z

    if-eqz v6, :cond_0

    .line 789
    const-string v6, "VineProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "INSERT: uri "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " -> "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    sget-object v8, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v8, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 792
    :cond_0
    const-wide/16 v3, -0x1

    .line 793
    .local v3, rowId:J
    new-instance v1, Ljava/lang/String;

    invoke-direct {v1}, Ljava/lang/String;-><init>()V

    .line 794
    .local v1, id:Ljava/lang/String;
    sget-object v6, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v6, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v2

    .line 795
    .local v2, match:I
    packed-switch v2, :pswitch_data_0

    .line 817
    :cond_1
    :goto_0
    const-wide/16 v6, 0x0

    cmp-long v6, v3, v6

    if-ltz v6, :cond_2

    .line 818
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    .line 820
    :cond_2
    return-object v5

    .line 797
    :pswitch_0
    const-string v6, "notification_id"

    invoke-virtual {p2, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 798
    const-string v6, "notifications"

    invoke-virtual {v0, v6, v5, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    .line 799
    sget-boolean v6, Lco/vine/android/provider/VineProvider;->LOGGABLE:Z

    if-eqz v6, :cond_1

    .line 800
    const-string v6, "VineProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Notification inserted with rowId="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 805
    :pswitch_1
    const-string v6, "tag_id"

    invoke-virtual {p2, v6}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 806
    const-string v6, "tag_recently_used"

    invoke-virtual {v0, v6, v5, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v3

    .line 807
    sget-boolean v6, Lco/vine/android/provider/VineProvider;->LOGGABLE:Z

    if-eqz v6, :cond_1

    .line 808
    const-string v6, "VineProvider"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Tag inserted to recently-used with rowId="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 795
    :pswitch_data_0
    .packed-switch 0x12d
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate()Z
    .locals 1

    .prologue
    .line 175
    const/4 v0, 0x1

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 27
    .parameter "uri"
    .parameter "projection"
    .parameter "selection"
    .parameter "selArgs"
    .parameter "sortOrder"

    .prologue
    .line 182
    const-string v4, "limit"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    .line 183
    .local v19, limit:Ljava/lang/String;
    const/16 v21, 0x0

    .line 184
    .local v21, orderBy:Ljava/lang/String;
    const/16 v17, 0x0

    .line 188
    .local v17, groupBy:Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/provider/VineDatabaseHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 196
    .local v3, db:Landroid/database/sqlite/SQLiteDatabase;
    :goto_0
    new-instance v2, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v2}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 197
    .local v2, qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    sget-boolean v4, Lco/vine/android/provider/VineProvider;->LOGGABLE:Z

    if-eqz v4, :cond_0

    .line 198
    const-string v4, "VineProvider"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "QUERY: uri "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " -> "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    sget-object v6, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v6, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    :cond_0
    sget-object v4, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v20

    .line 203
    .local v20, match:I
    sparse-switch v20, :sswitch_data_0

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .local v7, groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 740
    .end local v21           #orderBy:Ljava/lang/String;
    .local v9, orderBy:Ljava/lang/String;
    :goto_1
    invoke-static/range {p5 .. p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 741
    move-object/from16 v9, p5

    .line 744
    :cond_1
    const/4 v8, 0x0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    :try_start_1
    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 747
    .local v11, c:Landroid/database/Cursor;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-interface {v11, v4, v0}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v15, v11

    .line 748
    .end local v11           #c:Landroid/database/Cursor;
    :goto_2
    return-object v15

    .line 190
    .end local v2           #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .end local v3           #db:Landroid/database/sqlite/SQLiteDatabase;
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v20           #match:I
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :catch_0
    move-exception v16

    .line 191
    .local v16, e:Landroid/database/sqlite/SQLiteException;
    const-string v4, "Failed to get a readable database on query."

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    move-object/from16 v0, v16

    invoke-static {v0, v4, v5}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 192
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v3

    .restart local v3       #db:Landroid/database/sqlite/SQLiteDatabase;
    goto :goto_0

    .line 205
    .end local v16           #e:Landroid/database/sqlite/SQLiteException;
    .restart local v2       #qb:Landroid/database/sqlite/SQLiteQueryBuilder;
    .restart local v20       #match:I
    :sswitch_0
    const-string v4, "users"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 206
    const-string v9, "username ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 207
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto :goto_1

    .line 210
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_1
    const-string v4, "users"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 211
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "user_id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 212
    const-string v9, "username ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 213
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto :goto_1

    .line 216
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_2
    const-string v4, "settings"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 217
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto :goto_1

    .line 220
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_3
    const-string v4, "posts"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 221
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto :goto_1

    .line 224
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_4
    const-string v4, "editions"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 225
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 228
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_5
    const-string v4, "likes"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 229
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 232
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_6
    const-string v4, "comments"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 233
    const-string v9, "comment_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 234
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 237
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_7
    const-string v4, "activity"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 238
    const-string p3, "sort_id<>?"

    .line 239
    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 p4, v0

    .end local p4
    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, p4, v4

    .line 240
    .restart local p4
    const-string v9, "sort_id DESC, notification_id DESC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 241
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 244
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_8
    const-string v4, "activity"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 246
    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "sort_id<>?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, notification_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 251
    .restart local v11       #c:Landroid/database/Cursor;
    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "sort_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, notification_id DESC"

    const/4 v10, 0x5

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 258
    .local v12, c2:Landroid/database/Cursor;
    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "sort_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, notification_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 263
    .local v13, c3:Landroid/database/Cursor;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v23

    .line 264
    .local v23, resolver:Landroid/content/ContentResolver;
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v11, v0, v1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 265
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v12, v0, v1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 267
    new-instance v15, Lco/vine/android/provider/ActivityCursor;

    const/4 v4, 0x2

    new-array v4, v4, [Landroid/database/Cursor;

    const/4 v5, 0x0

    aput-object v12, v4, v5

    const/4 v5, 0x1

    aput-object v11, v4, v5

    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v15, v4, v5}, Lco/vine/android/provider/ActivityCursor;-><init>([Landroid/database/Cursor;I)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 270
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v11           #c:Landroid/database/Cursor;
    .end local v12           #c2:Landroid/database/Cursor;
    .end local v13           #c3:Landroid/database/Cursor;
    .end local v23           #resolver:Landroid/content/ContentResolver;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_9
    const-string v4, "activity"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 272
    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "sort_id<>?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, notification_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .line 277
    .restart local v11       #c:Landroid/database/Cursor;
    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$ActivityQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "sort_id=?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v10, 0x2

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, notification_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v12

    .line 282
    .restart local v12       #c2:Landroid/database/Cursor;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v23

    .line 283
    .restart local v23       #resolver:Landroid/content/ContentResolver;
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v11, v0, v1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 284
    move-object/from16 v0, v23

    move-object/from16 v1, p1

    invoke-interface {v12, v0, v1}, Landroid/database/Cursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 286
    new-instance v15, Lco/vine/android/provider/ActivityCursor;

    const/4 v4, 0x2

    new-array v4, v4, [Landroid/database/Cursor;

    const/4 v5, 0x0

    aput-object v12, v4, v5

    const/4 v5, 0x1

    aput-object v11, v4, v5

    invoke-interface {v12}, Landroid/database/Cursor;->getCount()I

    move-result v5

    invoke-direct {v15, v4, v5}, Lco/vine/android/provider/ActivityCursor;-><init>([Landroid/database/Cursor;I)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 289
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v11           #c:Landroid/database/Cursor;
    .end local v12           #c2:Landroid/database/Cursor;
    .end local v23           #resolver:Landroid/content/ContentResolver;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_a
    const-string v4, "user_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 290
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 294
    const-string v9, "_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 295
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 298
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_b
    const-string v4, "user_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 299
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 303
    const-string v9, "_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 304
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 307
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_c
    const-string v4, "user_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 308
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " OR "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " OR "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0xa

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 317
    const-string v7, "user_id"

    .line 318
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    const-string v9, "_id ASC"

    .line 319
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 322
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_d
    const-string v4, "user_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 323
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 327
    const-string v9, "_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 328
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 331
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_e
    const-string v4, "user_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 332
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x7

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 336
    const-string v9, "_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 337
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 340
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_f
    const-string v4, "user_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 341
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 345
    const-string v9, "order_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 346
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 349
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_10
    const-string v4, "user_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 350
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x9

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 354
    const-string v9, "order_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 355
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 358
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_11
    const-string v4, "user_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 359
    const-string v4, "type=8"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 360
    const-string v9, "_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 361
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 364
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_12
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 365
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "post_type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 369
    const-string v9, "sort_id DESC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 370
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 373
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_13
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 374
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "post_type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 378
    const-string v9, "sort_id DESC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 379
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 382
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_14
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 383
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "tag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " AND "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "post_type"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x3d

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->appendWhere(Ljava/lang/CharSequence;)V

    .line 387
    const-string v9, "sort_id DESC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 388
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 391
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_15
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 392
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 393
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "tag=? AND post_type = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_2

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_3
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 403
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 404
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 405
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 393
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_2
    const/4 v4, 0x0

    goto :goto_3

    .line 407
    :cond_3
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 408
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "tag=? AND post_type = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x1

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_4

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_4
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 418
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 419
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 420
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 408
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_4
    const/4 v4, 0x0

    goto :goto_4

    .line 424
    :sswitch_16
    const-string v4, "hide_profile_reposts"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 426
    .local v18, hideProfileReposts:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v26

    .line 429
    .local v26, userId:Ljava/lang/String;
    const-string v4, "0"

    move-object/from16 v0, v18

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 430
    const/4 v4, 0x2

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v25

    .line 435
    .local v25, type:Ljava/lang/String;
    :goto_5
    const-string p3, "tag=? AND post_type=?"

    .line 436
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 437
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 438
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v26, v6, v5

    const/4 v5, 0x1

    aput-object v25, v6, v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    move-object/from16 v5, p3

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_6

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_6
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 445
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 446
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 447
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 432
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .end local v25           #type:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_5
    const/16 v4, 0xa

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v25

    .restart local v25       #type:Ljava/lang/String;
    goto :goto_5

    .line 438
    :cond_6
    const/4 v4, 0x0

    goto :goto_6

    .line 449
    :cond_7
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 450
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x2

    new-array v6, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v26, v6, v5

    const/4 v5, 0x1

    aput-object v25, v6, v5

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, comment_id ASC, like_id"

    move-object/from16 v5, p3

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_8

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_7
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 457
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 458
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 459
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 450
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_8
    const/4 v4, 0x0

    goto :goto_7

    .line 463
    .end local v18           #hideProfileReposts:Ljava/lang/String;
    .end local v25           #type:Ljava/lang/String;
    .end local v26           #userId:Ljava/lang/String;
    :sswitch_17
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 464
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 465
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "tag=? AND post_type = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x3

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_9

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_8
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 475
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 476
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 477
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 465
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_9
    const/4 v4, 0x0

    goto :goto_8

    .line 479
    :cond_a
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 480
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "tag=? AND post_type = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x3

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_b

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_9
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 490
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 491
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 492
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 480
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_b
    const/4 v4, 0x0

    goto :goto_9

    .line 496
    :sswitch_18
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 497
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 498
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "tag=? AND post_type = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x4

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_c

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_a
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 508
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 509
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 510
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 498
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_c
    const/4 v4, 0x0

    goto :goto_a

    .line 512
    :cond_d
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 513
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "tag=? AND post_type = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x4

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id ASC, post_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_e

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_b
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 523
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 524
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 525
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 513
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_e
    const/4 v4, 0x0

    goto :goto_b

    .line 529
    :sswitch_19
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 530
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 531
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_type = ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v10, 0x5

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_f

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_c
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 539
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 540
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 541
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 531
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_f
    const/4 v4, 0x0

    goto :goto_c

    .line 543
    :cond_10
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 544
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_type = ?"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v10, 0x5

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id ASC, post_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_11

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_d
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 552
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 553
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 554
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 544
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_11
    const/4 v4, 0x0

    goto :goto_d

    .line 558
    :sswitch_1a
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 559
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 560
    const-string v4, "tag_name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 561
    .local v24, tag:Ljava/lang/String;
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "tag=? AND post_type = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v24, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x6

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_12

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_e
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 571
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 572
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 573
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 561
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_12
    const/4 v4, 0x0

    goto :goto_e

    .line 575
    .end local v24           #tag:Ljava/lang/String;
    :cond_13
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 576
    const-string v4, "tag_name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 577
    .restart local v24       #tag:Ljava/lang/String;
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "tag=? AND post_type = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v24, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x6

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_14

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_f
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 587
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 588
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 589
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 577
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_14
    const/4 v4, 0x0

    goto :goto_f

    .line 593
    .end local v24           #tag:Ljava/lang/String;
    :sswitch_1b
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 594
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 595
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v22

    .line 596
    .local v22, postId:Ljava/lang/String;
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_id=? AND post_type=?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v22, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x7

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    invoke-direct {v15, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;)V

    .line 604
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 605
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 606
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 608
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .end local v22           #postId:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_15
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 609
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v22

    .line 610
    .restart local v22       #postId:Ljava/lang/String;
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_id=? AND post_type=?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    aput-object v22, v6, v8

    const/4 v8, 0x1

    const/4 v10, 0x7

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    invoke-direct {v15, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;)V

    .line 618
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 619
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 620
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 624
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .end local v22           #postId:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_1c
    const-string v4, "tag_search_results"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 625
    const-string v9, "_id ASC"

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    move-object/from16 v7, v17

    .line 626
    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 629
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_1d
    const-string v4, "channels"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 630
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 633
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_1e
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 634
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 635
    const-string v4, "channel_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 636
    .local v14, channelId:Ljava/lang/String;
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_type = ? AND tag = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/16 v10, 0x8

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    aput-object v14, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_16

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_10
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 644
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 645
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 663
    .end local v14           #channelId:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    :sswitch_1f
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1a

    .line 664
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 665
    const-string v4, "channel_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 666
    .restart local v14       #channelId:Ljava/lang/String;
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_type = ? AND tag = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/16 v10, 0x9

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    aput-object v14, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_11
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 674
    .restart local v15       #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 675
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 676
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 636
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_16
    const/4 v4, 0x0

    goto :goto_10

    .line 647
    .end local v14           #channelId:Ljava/lang/String;
    :cond_17
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 648
    const-string v4, "channel_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 649
    .restart local v14       #channelId:Ljava/lang/String;
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_type = ? AND tag = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/16 v10, 0x8

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    aput-object v14, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id ASC, post_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_18

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_12
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 657
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 658
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 659
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 649
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_18
    const/4 v4, 0x0

    goto :goto_12

    .line 666
    :cond_19
    const/4 v4, 0x0

    goto :goto_11

    .line 678
    .end local v14           #channelId:Ljava/lang/String;
    :cond_1a
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 679
    const-string v4, "channel_id"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 680
    .restart local v14       #channelId:Ljava/lang/String;
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_type = ? AND tag = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/16 v10, 0x9

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    aput-object v14, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_1b

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_13
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 688
    .restart local v15       #cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 689
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 690
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 680
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_1b
    const/4 v4, 0x0

    goto :goto_13

    .line 694
    .end local v14           #channelId:Ljava/lang/String;
    :sswitch_20
    const-string v4, "tag_name"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v24

    .line 695
    .restart local v24       #tag:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 696
    const-string v4, "post_groups_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 697
    new-instance v15, Lco/vine/android/provider/HybridPostCursorExplore;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostGroupsViewQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_type = ? AND tag = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/16 v10, 0xb

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    aput-object v24, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id DESC"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_1c

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_14
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursorExplore;-><init>(Landroid/database/Cursor;I)V

    .line 703
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursorExplore;->prepare()V

    .line 704
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursorExplore;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    .line 719
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursorExplore;
    .end local v24           #tag:Ljava/lang/String;
    :sswitch_21
    const-string v4, "notifications"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 720
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 697
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    .restart local v24       #tag:Ljava/lang/String;
    :cond_1c
    const/4 v4, 0x0

    goto :goto_14

    .line 706
    :cond_1d
    const-string v4, "post_comments_likes_view"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 707
    new-instance v15, Lco/vine/android/provider/HybridPostCursor;

    sget-object v4, Lco/vine/android/provider/VineDatabaseSQL$PostCommentsLikesQuery;->PROJECTION:[Ljava/lang/String;

    const-string v5, "post_type = ? AND tag = ?"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/String;

    const/4 v8, 0x0

    const/16 v10, 0xb

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v6, v8

    const/4 v8, 0x1

    aput-object v24, v6, v8

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "sort_id ASC, post_id DESC, comment_id ASC, like_id"

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    if-eqz v19, :cond_1e

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    :goto_15
    invoke-direct {v15, v5, v4}, Lco/vine/android/provider/HybridPostCursor;-><init>(Landroid/database/Cursor;I)V

    .line 713
    .local v15, cursor:Lco/vine/android/provider/HybridPostCursor;
    invoke-virtual {v15}, Lco/vine/android/provider/HybridPostCursor;->prepare()V

    .line 714
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v15, v4, v0}, Lco/vine/android/provider/HybridPostCursor;->setNotificationUri(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 715
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 707
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .end local v15           #cursor:Lco/vine/android/provider/HybridPostCursor;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :cond_1e
    const/4 v4, 0x0

    goto :goto_15

    .line 723
    .end local v24           #tag:Ljava/lang/String;
    :sswitch_22
    const-string v4, "notifications"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 724
    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v10, "10"

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v10}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 727
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_23
    const-string v4, "tag_recently_used"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 728
    const/4 v8, 0x0

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, v17

    move-object/from16 v9, p5

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v15

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_2

    .line 731
    .end local v7           #groupBy:Ljava/lang/String;
    .end local v9           #orderBy:Ljava/lang/String;
    .restart local v17       #groupBy:Ljava/lang/String;
    .restart local v21       #orderBy:Ljava/lang/String;
    :sswitch_24
    invoke-virtual/range {p1 .. p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v26

    .line 732
    .restart local v26       #userId:Ljava/lang/String;
    const-string p3, "user_id=?"

    .line 733
    const/4 v4, 0x1

    new-array v0, v4, [Ljava/lang/String;

    move-object/from16 p4, v0

    .end local p4
    const/4 v4, 0x0

    invoke-static/range {v26 .. v26}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, p4, v4

    .line 734
    .restart local p4
    const-string v4, "users"

    invoke-virtual {v2, v4}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    move-object/from16 v7, v17

    .end local v17           #groupBy:Ljava/lang/String;
    .restart local v7       #groupBy:Ljava/lang/String;
    move-object/from16 v9, v21

    .line 735
    .end local v21           #orderBy:Ljava/lang/String;
    .restart local v9       #orderBy:Ljava/lang/String;
    goto/16 :goto_1

    .line 749
    .end local v26           #userId:Ljava/lang/String;
    :catch_1
    move-exception v16

    .line 750
    .local v16, e:Ljava/lang/Exception;
    sget-boolean v4, Lco/vine/android/provider/VineProvider;->LOGGABLE:Z

    if-eqz v4, :cond_1f

    .line 751
    const-string v4, "Cannot execute {} {}  {} {} {} {}"

    const/4 v5, 0x5

    new-array v5, v5, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-virtual {v3}, Landroid/database/sqlite/SQLiteDatabase;->toString()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v6

    const/4 v6, 0x1

    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteQueryBuilder;->getTables()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v6

    const/4 v6, 0x2

    aput-object p3, v5, v6

    const/4 v6, 0x3

    aput-object v7, v5, v6

    const/4 v6, 0x4

    aput-object v9, v5, v6

    invoke-static {v4, v5}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 754
    :cond_1f
    new-instance v4, Ljava/lang/RuntimeException;

    move-object/from16 v0, v16

    invoke-direct {v4, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 203
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_6
        0x5 -> :sswitch_5
        0x6 -> :sswitch_3
        0x7 -> :sswitch_1c
        0x8 -> :sswitch_1d
        0x14 -> :sswitch_12
        0x15 -> :sswitch_13
        0x16 -> :sswitch_14
        0x17 -> :sswitch_15
        0x18 -> :sswitch_16
        0x19 -> :sswitch_17
        0x1a -> :sswitch_18
        0x1b -> :sswitch_19
        0x1c -> :sswitch_1a
        0x1d -> :sswitch_1b
        0x1e -> :sswitch_1e
        0x1f -> :sswitch_1f
        0x20 -> :sswitch_20
        0x21 -> :sswitch_7
        0x22 -> :sswitch_8
        0x23 -> :sswitch_9
        0x64 -> :sswitch_a
        0x65 -> :sswitch_b
        0x66 -> :sswitch_c
        0x67 -> :sswitch_e
        0x68 -> :sswitch_d
        0x69 -> :sswitch_f
        0x6a -> :sswitch_11
        0x6b -> :sswitch_10
        0x6c -> :sswitch_21
        0x6d -> :sswitch_22
        0x6e -> :sswitch_23
        0x6f -> :sswitch_24
        0x191 -> :sswitch_4
    .end sparse-switch
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 6
    .parameter "uri"
    .parameter "values"
    .parameter "selection"
    .parameter "selectionArgs"

    .prologue
    .line 830
    invoke-virtual {p0}, Lco/vine/android/provider/VineProvider;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/provider/VineDatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 833
    .local v0, db:Landroid/database/sqlite/SQLiteDatabase;
    sget-boolean v3, Lco/vine/android/provider/VineProvider;->LOGGABLE:Z

    if-eqz v3, :cond_0

    .line 834
    const-string v3, "VineProvider"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "UPDATE: uri "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " -> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v5, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v5, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 837
    :cond_0
    const/4 v2, 0x0

    .line 838
    .local v2, updated:I
    sget-object v3, Lco/vine/android/provider/VineProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v3, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    .line 839
    .local v1, match:I
    packed-switch v1, :pswitch_data_0

    .line 849
    :goto_0
    return v2

    .line 841
    :pswitch_0
    const-string v3, "tag_recently_used"

    invoke-virtual {v0, v3, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    .line 839
    nop

    :pswitch_data_0
    .packed-switch 0x1f5
        :pswitch_0
    .end packed-switch
.end method
