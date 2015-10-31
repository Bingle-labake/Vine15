.class public Lco/vine/android/service/VineService;
.super Landroid/app/Service;
.source "VineService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/service/VineService$ExecutionRunnable;,
        Lco/vine/android/service/VineService$ResponderRunnable;,
        Lco/vine/android/service/VineService$VineServiceBinder;
    }
.end annotation


# static fields
.field public static final ACTION_CODE_BLOCK_USER:I = 0x2f

.field public static final ACTION_CODE_CHECK_LOGIN_TWITTER:I = 0x6

.field public static final ACTION_CODE_CLEANUP:I = 0x1d

.field public static final ACTION_CODE_CLEAR_DB_ALL:I = 0x3b

.field public static final ACTION_CODE_CLEAR_DB_CACHE:I = 0x3a

.field public static final ACTION_CODE_CLEAR_GCM_REG_ID:I = 0x3d

.field public static final ACTION_CODE_CLEAR_PUSH_NOTIFICATIONS:I = 0x3e

.field public static final ACTION_CODE_CLIENT_PROFILE:I = 0x23

.field public static final ACTION_CODE_CONNECT_TWITTER:I = 0x20

.field public static final ACTION_CODE_DEACTIVATE_ACCOUNT:I = 0x43

.field public static final ACTION_CODE_DELETE_COMMENT:I = 0x1e

.field public static final ACTION_CODE_DELETE_POST:I = 0x1f

.field public static final ACTION_CODE_DELETE_SESSION:I = 0x40

.field public static final ACTION_CODE_DISABLE_USER_REPOSTS:I = 0x45

.field public static final ACTION_CODE_DISCONNECT_TWITTER:I = 0x21

.field public static final ACTION_CODE_ENABLE_USER_REPOSTS:I = 0x44

.field public static final ACTION_CODE_EXPIRE_TIMELINE:I = 0x2d

.field public static final ACTION_CODE_FETCH_SERVER_STATUS:I = 0x26

.field public static final ACTION_CODE_FOLLOW:I = 0x12

.field public static final ACTION_CODE_FOLLOW_EDITORS_PICKS:I = 0x2c

.field public static final ACTION_CODE_GET_ACTIVITY:I = 0x14

.field public static final ACTION_CODE_GET_ADDRESS_FRIENDS:I = 0x10

.field public static final ACTION_CODE_GET_BLOCKED_USERS:I = 0x2e

.field public static final ACTION_CODE_GET_CHANNELS:I = 0x35

.field public static final ACTION_CODE_GET_COMMENTS:I = 0xc

.field public static final ACTION_CODE_GET_EDITIONS:I = 0x46

.field public static final ACTION_CODE_GET_FOLLOWERS:I = 0x16

.field public static final ACTION_CODE_GET_FOLLOWING:I = 0x17

.field public static final ACTION_CODE_GET_FRIENDS:I = 0x48

.field public static final ACTION_CODE_GET_NOTIF_COUNT:I = 0x41

.field public static final ACTION_CODE_GET_POSTS:I = 0xd

.field public static final ACTION_CODE_GET_POST_ID:I = 0x24

.field public static final ACTION_CODE_GET_POST_LIKERS:I = 0xb

.field public static final ACTION_CODE_GET_POST_SINGLE:I = 0x1c

.field public static final ACTION_CODE_GET_REVINERS:I = 0x38

.field public static final ACTION_CODE_GET_TAGS_TYPEAHEAD:I = 0x28

.field public static final ACTION_CODE_GET_TWITTER_AUTH:I = 0x5

.field public static final ACTION_CODE_GET_TWITTER_FRIENDS:I = 0xf

.field public static final ACTION_CODE_GET_TWITTER_USER:I = 0x7

.field public static final ACTION_CODE_GET_USER:I = 0x15

.field public static final ACTION_CODE_GET_USERS_ME:I = 0xa

.field public static final ACTION_CODE_GET_USERS_TYPEAHEAD:I = 0x27

.field public static final ACTION_CODE_GET_USER_ID:I = 0x4b

.field public static final ACTION_CODE_LIKE_POST:I = 0x18

.field public static final ACTION_CODE_LOGIN:I = 0x2

.field public static final ACTION_CODE_LOGOUT:I = 0x3

.field public static final ACTION_CODE_MERGE_SINGLE_POST:I = 0x39

.field public static final ACTION_CODE_POST_COMMENT:I = 0xe

.field public static final ACTION_CODE_REFRESH_SESSION_KEY:I = 0x3e8

.field public static final ACTION_CODE_REMOVE_FOLLOW_POSTS:I = 0x22

.field public static final ACTION_CODE_REMOVE_USERS_BY_GROUP:I = 0x11

.field public static final ACTION_CODE_REPORT_POST:I = 0x1b

.field public static final ACTION_CODE_REPORT_USER:I = 0x31

.field public static final ACTION_CODE_RESET_PASSWORD:I = 0x9

.field public static final ACTION_CODE_RESPOND_FOLLOW_REQUEST:I = 0x32

.field public static final ACTION_CODE_RESTART_CONNECTION_MANAGER:I = 0x1

.field public static final ACTION_CODE_REVINE:I = 0x36

.field public static final ACTION_CODE_SAVE_POSTS:I = 0x2b

.field public static final ACTION_CODE_SEARCH_TAGS:I = 0x2a

.field public static final ACTION_CODE_SEARCH_USERS:I = 0x29

.field public static final ACTION_CODE_SEND_FACEBOOK_TOKEN:I = 0x25

.field public static final ACTION_CODE_SEND_GCM_REG_ID:I = 0x3c

.field public static final ACTION_CODE_SEND_LOOP_COUNTS:I = 0x42

.field public static final ACTION_CODE_SET_BLOCK_PROFILE_REPOSTS:I = 0x49

.field public static final ACTION_CODE_SHARE_POST:I = 0x3f

.field public static final ACTION_CODE_SIGNUP:I = 0x4

.field public static final ACTION_CODE_TWITTER_XAUTH:I = 0x8

.field public static final ACTION_CODE_UNBLOCK_USER:I = 0x30

.field public static final ACTION_CODE_UNFOLLOW:I = 0x13

.field public static final ACTION_CODE_UNLIKE_POST:I = 0x19

.field public static final ACTION_CODE_UNREVINE:I = 0x37

.field public static final ACTION_CODE_UPDATE_EDITION:I = 0x47

.field public static final ACTION_CODE_UPDATE_EXPLICIT:I = 0x33

.field public static final ACTION_CODE_UPDATE_LOCAL_POST_COUNT:I = 0x4a

.field public static final ACTION_CODE_UPDATE_PRIVATE:I = 0x34

.field public static final ACTION_CODE_UPDATE_PROFILE:I = 0x1a

.field public static final ACTION_LOGIN:Ljava/lang/String; = "LOGIN"

.field public static final ACTION_RESTART_CONNECTION_MANAGER:Ljava/lang/String; = "RESTART_CM"

.field public static final ACTION_SESSION_LOGIN:Ljava/lang/String; = "co.vine.android.session.login"

.field public static final ACTION_SESSION_LOGOUT:Ljava/lang/String; = "co.vine.android.session.logout"

.field public static final AMAZON_ERROR_CODE:I = 0x384

.field public static final BC_ACTION_MERGE_POST:Ljava/lang/String; = "co.vine.android.service.mergePost"

.field private static final EXECUTION_CAPTCHA_REQUIRED:I = 0x4

.field private static final EXECUTION_CODE:Ljava/lang/String; = "executionCode"

.field private static final EXECUTION_COMPLETE:I = 0x1

.field private static final EXECUTION_LOGGED_OUT:I = 0x3

.field private static final EXECUTION_SESSION_KEY_INVALID:I = 0x2

.field public static final EXTRA_ACCEPT:Ljava/lang/String; = "accept"

.field public static final EXTRA_ACCOUNT_EXISTS:Ljava/lang/String; = "a_exists"

.field public static final EXTRA_ACCOUNT_NAME:Ljava/lang/String; = "a_name"

.field public static final EXTRA_ACTION_CODE:Ljava/lang/String; = "action_code"

.field public static final EXTRA_ALSO_FETCH_POSTS:Ljava/lang/String; = "also_fetch_posts"

.field public static final EXTRA_ANCHOR:Ljava/lang/String; = "time"

.field public static final EXTRA_AVATAR_URL:Ljava/lang/String; = "avatar_url"

.field public static final EXTRA_BLOCKED_USERS:Ljava/lang/String; = "blocked_users"

.field public static final EXTRA_BLOCK_USER_ID:Ljava/lang/String; = "block_user_id"

.field public static final EXTRA_CALLBACK:Ljava/lang/String; = "ibinder"

.field public static final EXTRA_CAPTCHA_URL:Ljava/lang/String; = "captcha_url"

.field public static final EXTRA_CLEAR:Ljava/lang/String; = "clear"

.field public static final EXTRA_COMMENT:Ljava/lang/String; = "comment"

.field public static final EXTRA_COMMENT_ID:Ljava/lang/String; = "comment_id"

.field public static final EXTRA_COUNT:Ljava/lang/String; = "count"

.field public static final EXTRA_DATA:Ljava/lang/String; = "data"

.field public static final EXTRA_DESCRIPTION:Ljava/lang/String; = "desc"

.field public static final EXTRA_EDITIONS_LIST:Ljava/lang/String; = "editions"

.field public static final EXTRA_EDITION_CODE:Ljava/lang/String; = "edition"

.field public static final EXTRA_EMAIL:Ljava/lang/String; = "email"

.field public static final EXTRA_ENTITIES:Ljava/lang/String; = "entities"

.field public static final EXTRA_ERROR_CODE:Ljava/lang/String; = "error_code"

.field public static final EXTRA_EXPLICIT:Ljava/lang/String; = "explicit"

.field public static final EXTRA_FACEBOOK_TOKEN:Ljava/lang/String; = "facebook_token"

.field public static final EXTRA_FOLLOWING:Ljava/lang/String; = "following"

.field public static final EXTRA_FOLLOW_ID:Ljava/lang/String; = "follow_id"

.field public static final EXTRA_FOLLOW_REQUEST_COUNT:Ljava/lang/String; = "follow_reqs_c"

.field public static final EXTRA_GCM_REG_ID:Ljava/lang/String; = "gcmRegId"

.field public static final EXTRA_GET_FOLLOW_REQUESTS:Ljava/lang/String; = "follow_reqs"

.field public static final EXTRA_HIDE_PROFILE_REPOSTS:Ljava/lang/String; = "block_profile_reposts"

.field public static final EXTRA_HIDE_REPOSTS:Ljava/lang/String; = "hide_reposts"

.field public static final EXTRA_IN_MEMORY:Ljava/lang/String; = "in_memory"

.field public static final EXTRA_KEY:Ljava/lang/String; = "key"

.field public static final EXTRA_LOAD_URL:Ljava/lang/String; = "load_url"

.field public static final EXTRA_LOCATION:Ljava/lang/String; = "location"

.field public static final EXTRA_LOGGED_OUT:Ljava/lang/String; = "logged_out"

.field public static final EXTRA_LOGIN:Ljava/lang/String; = "login"

.field public static final EXTRA_MESSAGE:Ljava/lang/String; = "message"

.field public static final EXTRA_NETWORK:Ljava/lang/String; = "network"

.field public static final EXTRA_NEXT_PAGE:Ljava/lang/String; = "next_page"

.field public static final EXTRA_NOTIFY:Ljava/lang/String; = "notify"

.field public static final EXTRA_PAGE:Ljava/lang/String; = "page"

.field public static final EXTRA_PAGE_TYPE:Ljava/lang/String; = "page_type"

.field public static final EXTRA_PASSWORD:Ljava/lang/String; = "pass"

.field public static final EXTRA_PHONE:Ljava/lang/String; = "phone"

.field public static final EXTRA_POST:Ljava/lang/String; = "post"

.field public static final EXTRA_POSTS:Ljava/lang/String; = "posts"

.field public static final EXTRA_POST_ID:Ljava/lang/String; = "post_id"

.field public static final EXTRA_POST_SHARE_ID:Ljava/lang/String; = "post_share_id"

.field public static final EXTRA_PREVIOUS_PAGE:Ljava/lang/String; = "previous_page"

.field public static final EXTRA_PRIVATE:Ljava/lang/String; = "priv"

.field public static final EXTRA_PROFILE_ID:Ljava/lang/String; = "profile_id"

.field public static final EXTRA_QUERY:Ljava/lang/String; = "q"

.field public static final EXTRA_REACTIVATE:Ljava/lang/String; = "reactivate"

.field public static final EXTRA_REASON_PHRASE:Ljava/lang/String; = "reason_phrase"

.field public static final EXTRA_REFRESH_SESSION:Ljava/lang/String; = "refresh_session"

.field public static final EXTRA_REPOST:Ljava/lang/String; = "repost"

.field public static final EXTRA_REPOST_ID:Ljava/lang/String; = "repost_id"

.field public static final EXTRA_REQUEST_ID:Ljava/lang/String; = "rid"

.field public static final EXTRA_RESPONSE_CODE:Ljava/lang/String; = "resp_code"

.field public static final EXTRA_RESPONSE_SUCCESS:Ljava/lang/String; = "response_success"

.field public static final EXTRA_SECRET:Ljava/lang/String; = "secret"

.field public static final EXTRA_SERVER_STATUS:Ljava/lang/String; = "server_status"

.field public static final EXTRA_SESSION_KEY:Ljava/lang/String; = "s_key"

.field public static final EXTRA_SESSION_OWNER_ID:Ljava/lang/String; = "s_owner_id"

.field public static final EXTRA_SHOULD_FOLLOW_EDITORS_PICKS:Ljava/lang/String; = "should_follow_editors_picks"

.field public static final EXTRA_SIZE:Ljava/lang/String; = "size"

.field public static final EXTRA_SORT:Ljava/lang/String; = "sort"

.field public static final EXTRA_TAGS:Ljava/lang/String; = "tags"

.field public static final EXTRA_TAG_NAME:Ljava/lang/String; = "tag_name"

.field public static final EXTRA_TITLE:Ljava/lang/String; = "title"

.field public static final EXTRA_TWITTER_ID:Ljava/lang/String; = "t_id"

.field public static final EXTRA_TWITTER_USER:Ljava/lang/String; = "t_user"

.field public static final EXTRA_TYPE:Ljava/lang/String; = "type"

.field public static final EXTRA_URI:Ljava/lang/String; = "uri"

.field public static final EXTRA_USER:Ljava/lang/String; = "user"

.field public static final EXTRA_USERNAME:Ljava/lang/String; = "username"

.field public static final EXTRA_USERS:Ljava/lang/String; = "users"

.field public static final EXTRA_USER_ID:Ljava/lang/String; = "user_id"

.field public static final EXTRA_USER_INITIATED:Ljava/lang/String; = "user_init"

.field public static final EXTRA_VANITY_URL:Ljava/lang/String; = "vanity_url"

#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field private static final PAGE_SIZE_SEARCH:I = 0x32

.field private static final PARAM_ADDRESS_BOOK:Ljava/lang/String; = "addressBook"

.field private static final PARAM_ANCHOR:Ljava/lang/String; = "anchor"

.field private static final PARAM_AUTHENTICATE:Ljava/lang/String; = "authenticate"

.field private static final PARAM_AVATAR:Ljava/lang/String; = "avatarUrl"

.field private static final PARAM_COMMENT_MAX:Ljava/lang/String; = "c_max"

.field private static final PARAM_DESCRIPTION:Ljava/lang/String; = "description"

.field private static final PARAM_DEVICE_TOKEN:Ljava/lang/String; = "deviceToken"

.field private static final PARAM_EDITION:Ljava/lang/String; = "edition"

.field private static final PARAM_EMAIL:Ljava/lang/String; = "email"

.field private static final PARAM_FACEBOOK_AUTH_TOKEN:Ljava/lang/String; = "facebookOauthToken"

.field private static final PARAM_INCLUDE_PROMOTED:Ljava/lang/String; = "includePromoted"

.field private static final PARAM_LIKE_MAX:Ljava/lang/String; = "l_max"

.field private static final PARAM_LOCALE:Ljava/lang/String; = "locale"

.field private static final PARAM_LOCATION:Ljava/lang/String; = "location"

.field private static final PARAM_MESSAGE:Ljava/lang/String; = "message"

.field private static final PARAM_NAME:Ljava/lang/String; = "username"

.field private static final PARAM_PAGE:Ljava/lang/String; = "page"

.field private static final PARAM_PASSWORD:Ljava/lang/String; = "password"

.field private static final PARAM_PHONE:Ljava/lang/String; = "phoneNumber"

.field private static final PARAM_REPOSTS:Ljava/lang/String; = "reposts"

.field private static final PARAM_SEARCH_TERM:Ljava/lang/String; = "st"

.field private static final PARAM_SIZE:Ljava/lang/String; = "size"

.field private static final PARAM_TWITTER_ID:Ljava/lang/String; = "twitterId"

.field private static final PARAM_TWITTER_SECRET:Ljava/lang/String; = "twitterOauthSecret"

.field private static final PARAM_TWITTER_TOKEN:Ljava/lang/String; = "twitterOauthToken"

.field private static final PARAM_USERNAME:Ljava/lang/String; = "username"

.field private static final REASON_PHRASE:Ljava/lang/String; = "reasonPhrase"

.field private static final SERVICE_INTENT_FILTER:Landroid/content/IntentFilter; = null

.field private static final STATUS_CODE:Ljava/lang/String; = "statusCode"

.field private static final TAG:Ljava/lang/String; = "VineService"

.field private static final sActionMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mApi:Lco/vine/android/client/VineAPI;

.field private final mBinder:Landroid/os/IBinder;

.field private mExecutor:Ljava/util/concurrent/ExecutorService;

.field private final mMainHandler:Landroid/os/Handler;

.field private mMediaUtility:Lco/vine/android/util/MediaUtility;

.field private final mServiceBroadCastReceiver:Landroid/content/BroadcastReceiver;

.field private mStartIds:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    const/4 v1, 0x1

    .line 108
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    sput-object v0, Lco/vine/android/service/VineService;->SERVICE_INTENT_FILTER:Landroid/content/IntentFilter;

    .line 111
    sget-object v0, Lco/vine/android/service/VineService;->SERVICE_INTENT_FILTER:Landroid/content/IntentFilter;

    const-string v2, "co.vine.android.service.mergePost"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 313
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "VineService"

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    move v0, v1

    :goto_0
    sput-boolean v0, Lco/vine/android/service/VineService;->LOGGABLE:Z

    .line 322
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, v3}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Lco/vine/android/service/VineService;->sActionMap:Ljava/util/HashMap;

    .line 336
    sget-object v0, Lco/vine/android/service/VineService;->sActionMap:Ljava/util/HashMap;

    const-string v2, "RESTART_CM"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    sget-object v0, Lco/vine/android/service/VineService;->sActionMap:Ljava/util/HashMap;

    const-string v1, "co.vine.android.session.login"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 339
    return-void

    .line 313
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 102
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 325
    new-instance v0, Lco/vine/android/service/VineService$VineServiceBinder;

    invoke-direct {v0, p0}, Lco/vine/android/service/VineService$VineServiceBinder;-><init>(Lco/vine/android/service/VineService;)V

    iput-object v0, p0, Lco/vine/android/service/VineService;->mBinder:Landroid/os/IBinder;

    .line 327
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lco/vine/android/service/VineService;->mMainHandler:Landroid/os/Handler;

    .line 341
    new-instance v0, Lco/vine/android/service/VineService$1;

    invoke-direct {v0, p0}, Lco/vine/android/service/VineService$1;-><init>(Lco/vine/android/service/VineService;)V

    iput-object v0, p0, Lco/vine/android/service/VineService;->mServiceBroadCastReceiver:Landroid/content/BroadcastReceiver;

    .line 2739
    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .prologue
    .line 102
    sget-boolean v0, Lco/vine/android/service/VineService;->LOGGABLE:Z

    return v0
.end method

.method static synthetic access$100(Lco/vine/android/service/VineService;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    .line 102
    iget-object v0, p0, Lco/vine/android/service/VineService;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private deleteComment(JLjava/lang/String;Lco/vine/android/provider/VineDatabaseHelper;)Lco/vine/android/network/HttpOperation;
    .locals 7
    .parameter "postId"
    .parameter "commentId"
    .parameter "dbHelper"

    .prologue
    .line 2577
    iget-object v3, p0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v3}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "posts"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "comments"

    aput-object v6, v4, v5

    const/4 v5, 0x3

    aput-object p3, v4, v5

    invoke-static {v3, v4}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 2579
    .local v1, url:Ljava/lang/StringBuilder;
    const/4 v3, 0x7

    invoke-static {v3}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v2

    .line 2581
    .local v2, vp:Lco/vine/android/api/VineParserReader;
    invoke-virtual {p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v3

    iget-object v4, p0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-static {v3, v1, v4, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v0

    .line 2585
    .local v0, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {v0}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2586
    invoke-virtual {p4, p3}, Lco/vine/android/provider/VineDatabaseHelper;->deleteComment(Ljava/lang/String;)I

    .line 2588
    :cond_0
    return-object v0
.end method

.method private getClientProfile()Lco/vine/android/network/HttpOperation;
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v5, 0x0

    .line 2592
    iget-object v4, p0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v4}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v4

    new-array v6, v8, [Ljava/lang/Object;

    const-string v7, "clientprofiles"

    aput-object v7, v6, v5

    invoke-static {v4, v6}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    .line 2594
    .local v2, url:Ljava/lang/StringBuilder;
    const-string v4, "Updating device profile for {} {} {}."

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    sget-object v7, Landroid/os/Build;->MODEL:Ljava/lang/String;

    aput-object v7, v6, v5

    sget-object v7, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    aput-object v7, v6, v8

    const/4 v7, 0x2

    sget v8, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v6}, Lcom/edisonwang/android/slog/SLog;->w(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 2595
    const-string v4, "model"

    sget-object v6, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-static {v2, v4, v6}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 2596
    const-string v4, "device"

    sget-object v6, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-static {v2, v4, v6}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 2597
    const-string v4, "sdkVersion"

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v2, v4, v6}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 2598
    const-string v6, "memory"

    const-string v4, "activity"

    invoke-virtual {p0, v4}, Lco/vine/android/service/VineService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager;

    invoke-virtual {v4}, Landroid/app/ActivityManager;->getLargeMemoryClass()I

    move-result v4

    invoke-static {v2, v6, v4}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 2600
    const/16 v4, 0xd

    invoke-static {v4}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v3

    .line 2602
    .local v3, vp:Lco/vine/android/api/VineParserReader;
    invoke-virtual {p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v4

    iget-object v6, p0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-static {v4, v2, v3, v6}, Lco/vine/android/network/HttpOperation;->createGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v1

    .line 2604
    .local v1, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {v1}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2605
    invoke-virtual {v3}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 2606
    .local v0, object:Lorg/json/JSONObject;
    if-eqz v0, :cond_0

    .line 2607
    const-string v4, "Got client profile {}."

    invoke-static {v4, v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 2608
    invoke-static {}, Lco/vine/android/AppImpl;->getInstance()Lco/vine/android/AppImpl;

    move-result-object v4

    invoke-virtual {p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Lco/vine/android/AppImpl;->updateRecordConfigs(Landroid/content/Context;Lorg/json/JSONObject;)V

    .line 2615
    .end local v0           #object:Lorg/json/JSONObject;
    :goto_0
    return-object v1

    .line 2610
    .restart local v0       #object:Lorg/json/JSONObject;
    :cond_0
    const-string v4, "Error getting client profile."

    invoke-static {v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 2613
    .end local v0           #object:Lorg/json/JSONObject;
    :cond_1
    const-string v6, "Failed to update client profile: {}."

    if-eqz v1, :cond_2

    iget v4, v1, Lco/vine/android/network/HttpOperation;->statusCode:I

    :goto_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v6, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    move v4, v5

    goto :goto_1
.end method

.method private getComments(JIILjava/lang/String;Landroid/os/Bundle;Lco/vine/android/provider/VineDatabaseHelper;)Lco/vine/android/network/HttpOperation;
    .locals 21
    .parameter "postId"
    .parameter "pageType"
    .parameter "size"
    .parameter "key"
    .parameter "b"
    .parameter "dbHelper"

    .prologue
    .line 2620
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v3}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "posts"

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const-string v6, "comments"

    aput-object v6, v4, v5

    invoke-static {v3, v4}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v19

    .line 2623
    .local v19, url:Ljava/lang/StringBuilder;
    const/16 v18, 0x1

    .line 2624
    .local v18, page:I
    packed-switch p3, :pswitch_data_0

    .line 2640
    :cond_0
    :goto_0
    :pswitch_0
    const-string v3, "page"

    move-object/from16 v0, v19

    move/from16 v1, v18

    invoke-static {v0, v3, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 2641
    const-string v3, "size"

    move-object/from16 v0, v19

    move/from16 v1, p4

    invoke-static {v0, v3, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 2643
    const/4 v3, 0x6

    invoke-static {v3}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2645
    .local v20, vp:Lco/vine/android/api/VineParserReader;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v3, v0, v4, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v17

    .line 2648
    .local v17, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual/range {v17 .. v17}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 2649
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/vine/android/api/VinePagedData;

    .line 2650
    .local v13, comments:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineComment;>;"
    const-string v3, "next_page"

    iget v4, v13, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, p6

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2651
    const-string v3, "previous_page"

    iget v4, v13, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, p6

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2652
    iget-object v4, v13, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    iget v7, v13, Lco/vine/android/api/VinePagedData;->nextPage:I

    iget v8, v13, Lco/vine/android/api/VinePagedData;->previousPage:I

    iget-wide v9, v13, Lco/vine/android/api/VinePagedData;->anchor:J

    const/4 v11, 0x1

    const/4 v12, 0x0

    move-object/from16 v3, p7

    move-wide/from16 v5, p1

    invoke-virtual/range {v3 .. v12}, Lco/vine/android/provider/VineDatabaseHelper;->mergeComments(Ljava/util/Collection;JIIJZZ)Lco/vine/android/provider/DbResponse;

    move-result-object v14

    .line 2654
    .local v14, dbResponse:Lco/vine/android/provider/DbResponse;
    const-string v3, "resp_code"

    iget v4, v14, Lco/vine/android/provider/DbResponse;->code:I

    move-object/from16 v0, p6

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2655
    iget v3, v13, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v3, :cond_1

    .line 2656
    iget-object v3, v13, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 2657
    move-object/from16 v0, p7

    move-wide/from16 v1, p1

    invoke-virtual {v0, v1, v2}, Lco/vine/android/provider/VineDatabaseHelper;->markLastComment(J)V

    .line 2661
    .end local v13           #comments:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineComment;>;"
    .end local v14           #dbResponse:Lco/vine/android/provider/DbResponse;
    :cond_1
    return-object v17

    .line 2628
    .end local v17           #op:Lco/vine/android/network/HttpOperation;
    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    :pswitch_1
    const/4 v3, 0x5

    const/4 v4, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p7

    invoke-virtual {v0, v3, v4, v5, v6}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v15

    .line 2629
    .local v15, newer:I
    if-lez v15, :cond_0

    .line 2630
    move/from16 v18, v15

    goto/16 :goto_0

    .line 2634
    .end local v15           #newer:I
    :pswitch_2
    const/4 v3, 0x5

    const/4 v4, 0x0

    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    move-object/from16 v0, p7

    invoke-virtual {v0, v3, v4, v5, v6}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v16

    .line 2635
    .local v16, older:I
    if-lez v16, :cond_0

    .line 2636
    move/from16 v18, v16

    goto/16 :goto_0

    .line 2624
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private getPosts(JIILco/vine/android/provider/VineDatabaseHelper;JILandroid/os/Bundle;)Lco/vine/android/network/HttpOperation;
    .locals 27
    .parameter "sessionOwnerId"
    .parameter "type"
    .parameter "size"
    .parameter "dbHelper"
    .parameter "userId"
    .parameter "pageType"
    .parameter "b"

    .prologue
    .line 2376
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v7

    .line 2378
    .local v7, base:Ljava/lang/String;
    const-string v24, "tag_name"

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 2380
    .local v21, tag:Ljava/lang/String;
    if-nez v21, :cond_0

    const/16 v24, 0x6

    move/from16 v0, p3

    move/from16 v1, v24

    if-eq v0, v1, :cond_0

    .line 2381
    invoke-static/range {p1 .. p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v21

    .line 2382
    const-string v24, "tag_name"

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2384
    :cond_0
    packed-switch p3, :pswitch_data_0

    .line 2450
    :pswitch_0
    new-instance v24, Ljava/lang/IllegalArgumentException;

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Tried to fetch timeline with unsupported type "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-direct/range {v24 .. v25}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v24

    .line 2386
    :pswitch_1
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "graph"

    aput-object v26, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2388
    .local v22, url:Ljava/lang/StringBuilder;
    const/16 v17, 0x2

    .line 2455
    .local v17, pageCursorKind:I
    :goto_0
    packed-switch p8, :pswitch_data_1

    .line 2480
    :cond_1
    :goto_1
    const-string v24, "size"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move/from16 v2, p4

    invoke-static {v0, v1, v2}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 2482
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/service/VineService;->limitCommentAndLikesIfNeeded(Ljava/lang/StringBuilder;)V

    .line 2484
    const/16 v24, 0x8

    invoke-static/range {v24 .. v24}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v23

    .line 2486
    .local v23, vp:Lco/vine/android/api/VineParserReader;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v24

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v25, v0

    move-object/from16 v0, v24

    move-object/from16 v1, v22

    move-object/from16 v2, v25

    move-object/from16 v3, v23

    invoke-static {v0, v1, v2, v3}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v16

    .line 2490
    .local v16, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual/range {v16 .. v16}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v24

    if-eqz v24, :cond_7

    .line 2491
    invoke-virtual/range {v23 .. v23}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/vine/android/api/VinePagedData;

    .line 2493
    .local v13, feedItems:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    invoke-static/range {p3 .. p3}, Lco/vine/android/util/Util;->isPopularTimeline(I)Z

    move-result v24

    if-eqz v24, :cond_6

    .line 2494
    const/4 v10, 0x1

    .line 2495
    .local v10, count:I
    move-object/from16 v0, p5

    move/from16 v1, p3

    invoke-virtual {v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getOldestSortId(I)Landroid/database/Cursor;

    move-result-object v8

    .line 2496
    .local v8, c:Landroid/database/Cursor;
    if-eqz v8, :cond_3

    .line 2497
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v24

    if-eqz v24, :cond_2

    .line 2498
    const/16 v24, 0x0

    move/from16 v0, v24

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v24

    add-int/lit8 v10, v24, 0x1

    .line 2500
    :cond_2
    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    .line 2502
    :cond_3
    iget-object v0, v13, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, i$:Ljava/util/Iterator;
    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_6

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lco/vine/android/api/VinePost;

    .line 2503
    .local v19, post:Lco/vine/android/api/VinePost;
    add-int/lit8 v11, v10, 0x1

    .end local v10           #count:I
    .local v11, count:I
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    move-object/from16 v1, v19

    iput-object v0, v1, Lco/vine/android/api/VinePost;->orderId:Ljava/lang/String;

    move v10, v11

    .line 2504
    .end local v11           #count:I
    .restart local v10       #count:I
    goto :goto_2

    .line 2392
    .end local v8           #c:Landroid/database/Cursor;
    .end local v10           #count:I
    .end local v13           #feedItems:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    .end local v14           #i$:Ljava/util/Iterator;
    .end local v16           #op:Lco/vine/android/network/HttpOperation;
    .end local v17           #pageCursorKind:I
    .end local v19           #post:Lco/vine/android/api/VinePost;
    .end local v22           #url:Ljava/lang/StringBuilder;
    .end local v23           #vp:Lco/vine/android/api/VineParserReader;
    :pswitch_2
    const/16 v24, 0x3

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "users"

    aput-object v26, v24, v25

    const/16 v25, 0x2

    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v26

    aput-object v26, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2394
    .restart local v22       #url:Ljava/lang/StringBuilder;
    const/16 v17, 0x2

    .line 2395
    .restart local v17       #pageCursorKind:I
    const-string v24, "reposts"

    const/16 v25, 0x1

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 2399
    .end local v17           #pageCursorKind:I
    .end local v22           #url:Ljava/lang/StringBuilder;
    :pswitch_3
    const/16 v24, 0x3

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "users"

    aput-object v26, v24, v25

    const/16 v25, 0x2

    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v26

    aput-object v26, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2401
    .restart local v22       #url:Ljava/lang/StringBuilder;
    const/16 v17, 0x2

    .line 2402
    .restart local v17       #pageCursorKind:I
    const-string v24, "reposts"

    const/16 v25, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 2406
    .end local v17           #pageCursorKind:I
    .end local v22           #url:Ljava/lang/StringBuilder;
    :pswitch_4
    const/16 v24, 0x4

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "users"

    aput-object v26, v24, v25

    const/16 v25, 0x2

    invoke-static/range {p6 .. p7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v26

    aput-object v26, v24, v25

    const/16 v25, 0x3

    const-string v26, "likes"

    aput-object v26, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2408
    .restart local v22       #url:Ljava/lang/StringBuilder;
    const/16 v17, 0x1

    .line 2409
    .restart local v17       #pageCursorKind:I
    goto/16 :goto_0

    .line 2412
    .end local v17           #pageCursorKind:I
    .end local v22           #url:Ljava/lang/StringBuilder;
    :pswitch_5
    const/16 v24, 0x3

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "users"

    aput-object v26, v24, v25

    const/16 v25, 0x2

    const-string v26, "trending"

    aput-object v26, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2414
    .restart local v22       #url:Ljava/lang/StringBuilder;
    const/16 v17, 0x2

    .line 2416
    .restart local v17       #pageCursorKind:I
    goto/16 :goto_0

    .line 2419
    .end local v17           #pageCursorKind:I
    .end local v22           #url:Ljava/lang/StringBuilder;
    :pswitch_6
    const/16 v24, 0x2

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "popular"

    aput-object v26, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2421
    .restart local v22       #url:Ljava/lang/StringBuilder;
    const/16 v17, 0x2

    .line 2422
    .restart local v17       #pageCursorKind:I
    goto/16 :goto_0

    .line 2425
    .end local v17           #pageCursorKind:I
    .end local v22           #url:Ljava/lang/StringBuilder;
    :pswitch_7
    const/16 v24, 0x3

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "tags"

    aput-object v26, v24, v25

    const/16 v25, 0x2

    aput-object v21, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2427
    .restart local v22       #url:Ljava/lang/StringBuilder;
    const/16 v17, 0x2

    .line 2428
    .restart local v17       #pageCursorKind:I
    goto/16 :goto_0

    .line 2432
    .end local v17           #pageCursorKind:I
    .end local v22           #url:Ljava/lang/StringBuilder;
    :pswitch_8
    const-string v24, "tag_name"

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 2433
    .local v9, channelId:Ljava/lang/String;
    const-string v24, "sort"

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 2434
    .local v20, sort:Ljava/lang/String;
    const/16 v24, 0x4

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    const/16 v25, 0x1

    const-string v26, "channels"

    aput-object v26, v24, v25

    const/16 v25, 0x2

    aput-object v9, v24, v25

    const/16 v25, 0x3

    aput-object v20, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2436
    .restart local v22       #url:Ljava/lang/StringBuilder;
    const/16 v17, 0x2

    .line 2437
    .restart local v17       #pageCursorKind:I
    goto/16 :goto_0

    .line 2440
    .end local v9           #channelId:Ljava/lang/String;
    .end local v17           #pageCursorKind:I
    .end local v20           #sort:Ljava/lang/String;
    .end local v22           #url:Ljava/lang/StringBuilder;
    :pswitch_9
    const/16 v24, 0x1

    move/from16 v0, v24

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v24, v0

    const/16 v25, 0x0

    const-string v26, "timelines"

    aput-object v26, v24, v25

    move-object/from16 v0, v24

    invoke-static {v7, v0}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2441
    .restart local v22       #url:Ljava/lang/StringBuilder;
    const-string v24, "data"

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v12

    check-cast v12, Landroid/net/Uri;

    .line 2442
    .local v12, data:Landroid/net/Uri;
    invoke-virtual {v12}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v24

    invoke-interface/range {v24 .. v24}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .restart local v14       #i$:Ljava/util/Iterator;
    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v24

    if-eqz v24, :cond_4

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    .line 2443
    .local v18, pathSegment:Ljava/lang/String;
    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v24

    const/16 v25, 0x1

    move/from16 v0, v25

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    aput-object v18, v25, v26

    invoke-static/range {v24 .. v25}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v22

    .line 2444
    goto :goto_3

    .line 2445
    .end local v18           #pathSegment:Ljava/lang/String;
    :cond_4
    invoke-virtual {v12}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 2446
    const/16 v17, 0x2

    .line 2447
    .restart local v17       #pageCursorKind:I
    goto/16 :goto_0

    .line 2457
    .end local v12           #data:Landroid/net/Uri;
    .end local v14           #i$:Ljava/util/Iterator;
    :pswitch_a
    const-string v24, "page"

    const/16 v25, 0x1

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 2463
    :pswitch_b
    const-string v24, "page"

    const/16 v25, 0x1

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-static {v0, v1, v2}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 2467
    :pswitch_c
    const/16 v24, 0x2

    move-object/from16 v0, p5

    move/from16 v1, v24

    move/from16 v2, p3

    move-object/from16 v3, v21

    invoke-virtual {v0, v1, v2, v3}, Lco/vine/android/provider/VineDatabaseHelper;->getPageAnchor(IILjava/lang/String;)J

    move-result-wide v5

    .line 2469
    .local v5, anchor:J
    const-wide/16 v24, 0x0

    cmp-long v24, v5, v24

    if-lez v24, :cond_5

    .line 2470
    const-string v24, "anchor"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-static {v0, v1, v5, v6}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;J)V

    .line 2472
    :cond_5
    const/16 v24, 0x0

    move-object/from16 v0, p5

    move/from16 v1, v17

    move/from16 v2, p3

    move-object/from16 v3, v21

    move/from16 v4, v24

    invoke-virtual {v0, v1, v2, v3, v4}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v15

    .line 2473
    .local v15, nextPage:I
    if-lez v15, :cond_1

    .line 2474
    const-string v24, "page"

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-static {v0, v1, v15}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 2507
    .end local v5           #anchor:J
    .end local v15           #nextPage:I
    .restart local v13       #feedItems:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    .restart local v16       #op:Lco/vine/android/network/HttpOperation;
    .restart local v23       #vp:Lco/vine/android/api/VineParserReader;
    :cond_6
    const-string v24, "count"

    iget-object v0, v13, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    invoke-virtual/range {v25 .. v25}, Ljava/util/ArrayList;->size()I

    move-result v25

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2508
    const-string v24, "size"

    iget v0, v13, Lco/vine/android/api/VinePagedData;->count:I

    move/from16 v25, v0

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2509
    const-string v24, "posts"

    iget-object v0, v13, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v25, v0

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 2510
    const-string v24, "in_memory"

    const/16 v25, 0x1

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 2511
    const-string v24, "next_page"

    iget v0, v13, Lco/vine/android/api/VinePagedData;->nextPage:I

    move/from16 v25, v0

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2512
    const-string v24, "previous_page"

    iget v0, v13, Lco/vine/android/api/VinePagedData;->previousPage:I

    move/from16 v25, v0

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2513
    const-string v24, "time"

    iget-wide v0, v13, Lco/vine/android/api/VinePagedData;->anchor:J

    move-wide/from16 v25, v0

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move-wide/from16 v2, v25

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 2514
    const-string v24, "title"

    iget-object v0, v13, Lco/vine/android/api/VinePagedData;->title:Ljava/lang/String;

    move-object/from16 v25, v0

    move-object/from16 v0, p9

    move-object/from16 v1, v24

    move-object/from16 v2, v25

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2516
    .end local v13           #feedItems:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    :cond_7
    return-object v16

    .line 2384
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_0
        :pswitch_8
        :pswitch_8
        :pswitch_3
        :pswitch_9
    .end packed-switch

    .line 2455
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_a
        :pswitch_b
        :pswitch_c
    .end packed-switch
.end method

.method private getUsersMe(Ljava/lang/String;Landroid/os/Bundle;)Lco/vine/android/network/HttpOperation;
    .locals 9
    .parameter "key"
    .parameter "b"

    .prologue
    const/4 v8, 0x2

    .line 2665
    iget-object v4, p0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v4}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v4

    new-array v5, v8, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "users"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-string v7, "me"

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 2668
    .local v1, url:Ljava/lang/StringBuilder;
    invoke-static {v8}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v3

    .line 2670
    .local v3, vp:Lco/vine/android/api/VineParserReader;
    invoke-virtual {p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v4

    iget-object v5, p0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-static {v4, v1, v5, v3}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v4

    invoke-virtual {v4}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v0

    .line 2673
    .local v0, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {v0}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2674
    invoke-virtual {v3}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lco/vine/android/api/VineUser;

    .line 2675
    .local v2, user:Lco/vine/android/api/VineUser;
    const-string v4, "user"

    invoke-virtual {p2, v4, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 2677
    .end local v2           #user:Lco/vine/android/api/VineUser;
    :cond_0
    return-object v0
.end method

.method private postComment(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Lco/vine/android/provider/VineDatabaseHelper;)Lco/vine/android/network/HttpOperation;
    .locals 23
    .parameter "postId"
    .parameter "userId"
    .parameter "username"
    .parameter "comment"
    .parameter "avatarUrl"
    .parameter
    .parameter "dbHelper"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;",
            "Lco/vine/android/provider/VineDatabaseHelper;",
            ")",
            "Lco/vine/android/network/HttpOperation;"
        }
    .end annotation

    .prologue
    .line 2524
    .local p8, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v3}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    const-string v7, "posts"

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static/range {p1 .. p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x2

    const-string v7, "comments"

    aput-object v7, v5, v6

    invoke-static {v3, v5}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    .line 2526
    .local v20, url:Ljava/lang/StringBuilder;
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 2527
    .local v15, jsonEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual/range {p8 .. p8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/vine/android/api/VineEntity;

    .line 2528
    .local v13, entity:Lco/vine/android/api/VineEntity;
    invoke-virtual {v13}, Lco/vine/android/api/VineEntity;->toMap()Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2531
    .end local v13           #entity:Lco/vine/android/api/VineEntity;
    :cond_0
    new-instance v19, Ljava/util/HashMap;

    invoke-direct/range {v19 .. v19}, Ljava/util/HashMap;-><init>()V

    .line 2532
    .local v19, postBody:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "comment"

    move-object/from16 v0, v19

    move-object/from16 v1, p6

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2533
    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    .line 2534
    const-string v3, "entities"

    move-object/from16 v0, v19

    invoke-virtual {v0, v3, v15}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2537
    :cond_1
    const/4 v3, 0x7

    invoke-static {v3}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v22

    .line 2538
    .local v22, vp:Lco/vine/android/api/VineParserReader;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v5, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    move-object/from16 v2, v22

    invoke-static {v3, v0, v5, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthJsonPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/HashMap;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v3

    invoke-virtual {v3}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v17

    .line 2543
    .local v17, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual/range {v17 .. v17}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 2544
    invoke-virtual/range {v22 .. v22}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lco/vine/android/api/VineComment;

    .line 2545
    .local v21, vc:Lco/vine/android/api/VineComment;
    move-wide/from16 v0, p1

    move-object/from16 v2, v21

    iput-wide v0, v2, Lco/vine/android/api/VineComment;->postId:J

    .line 2546
    move-wide/from16 v0, p3

    move-object/from16 v2, v21

    iput-wide v0, v2, Lco/vine/android/api/VineComment;->userId:J

    .line 2547
    move-object/from16 v0, p5

    move-object/from16 v1, v21

    iput-object v0, v1, Lco/vine/android/api/VineComment;->username:Ljava/lang/String;

    .line 2548
    move-object/from16 v0, p7

    move-object/from16 v1, v21

    iput-object v0, v1, Lco/vine/android/api/VineComment;->avatarUrl:Ljava/lang/String;

    .line 2550
    const/16 v16, 0x0

    .line 2551
    .local v16, offsetCount:I
    invoke-virtual/range {p8 .. p8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lco/vine/android/api/VineEntity;

    .line 2552
    .restart local v13       #entity:Lco/vine/android/api/VineEntity;
    iget v3, v13, Lco/vine/android/api/VineEntity;->start:I

    sub-int v3, v3, v16

    iput v3, v13, Lco/vine/android/api/VineEntity;->start:I

    .line 2555
    const-string v3, "tag"

    iget-object v5, v13, Lco/vine/android/api/VineEntity;->type:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 2556
    add-int/lit8 v16, v16, 0x1

    .line 2557
    iget-object v3, v13, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    invoke-static {v3}, Lco/vine/android/api/VineTypeAhead;->getPlainTag(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 2558
    .local v18, plainTitle:Ljava/lang/String;
    iget-object v3, v13, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    move-object/from16 v0, p6

    move-object/from16 v1, v18

    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p6

    .line 2559
    move-object/from16 v0, v18

    iput-object v0, v13, Lco/vine/android/api/VineEntity;->title:Ljava/lang/String;

    .line 2560
    new-instance v3, Lco/vine/android/api/VineTag;

    iget-wide v5, v13, Lco/vine/android/api/VineEntity;->id:J

    move-object/from16 v0, v18

    invoke-direct {v3, v0, v5, v6}, Lco/vine/android/api/VineTag;-><init>(Ljava/lang/String;J)V

    move-object/from16 v0, p9

    invoke-virtual {v0, v3}, Lco/vine/android/provider/VineDatabaseHelper;->mergeSuggestedTag(Lco/vine/android/api/VineTag;)Landroid/net/Uri;

    .line 2562
    .end local v18           #plainTitle:Ljava/lang/String;
    :cond_2
    iget v3, v13, Lco/vine/android/api/VineEntity;->end:I

    sub-int v3, v3, v16

    iput v3, v13, Lco/vine/android/api/VineEntity;->end:I

    goto :goto_1

    .line 2564
    .end local v13           #entity:Lco/vine/android/api/VineEntity;
    :cond_3
    move-object/from16 v0, p6

    move-object/from16 v1, v21

    iput-object v0, v1, Lco/vine/android/api/VineComment;->comment:Ljava/lang/String;

    .line 2565
    move-object/from16 v0, p8

    move-object/from16 v1, v21

    iput-object v0, v1, Lco/vine/android/api/VineComment;->entities:Ljava/util/ArrayList;

    .line 2567
    new-instance v4, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v4, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 2568
    .local v4, comments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineComment;>;"
    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2569
    const/4 v7, 0x0

    const/4 v8, 0x0

    const-wide/16 v9, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x1

    move-object/from16 v3, p9

    move-wide/from16 v5, p1

    invoke-virtual/range {v3 .. v12}, Lco/vine/android/provider/VineDatabaseHelper;->mergeComments(Ljava/util/Collection;JIIJZZ)Lco/vine/android/provider/DbResponse;

    .line 2572
    .end local v4           #comments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineComment;>;"
    .end local v16           #offsetCount:I
    .end local v21           #vc:Lco/vine/android/api/VineComment;
    :cond_4
    return-object v17
.end method


# virtual methods
.method attemptStop(I)V
    .locals 6
    .parameter "startId"

    .prologue
    .line 2688
    iget-object v3, p0, Lco/vine/android/service/VineService;->mStartIds:Ljava/util/LinkedHashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2691
    iget-object v3, p0, Lco/vine/android/service/VineService;->mStartIds:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 2692
    .local v0, entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Boolean;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-nez v3, :cond_0

    .line 2702
    .end local v0           #entry:Ljava/util/Map$Entry;,"Ljava/util/Map$Entry<Ljava/lang/Integer;Ljava/lang/Boolean;>;"
    :goto_0
    return-void

    .line 2698
    :cond_1
    iget-object v3, p0, Lco/vine/android/service/VineService;->mStartIds:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 2699
    .local v2, key:Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-virtual {p0, v3}, Lco/vine/android/service/VineService;->stopSelf(I)V

    goto :goto_1

    .line 2701
    .end local v2           #key:Ljava/lang/Integer;
    :cond_2
    iget-object v3, p0, Lco/vine/android/service/VineService;->mStartIds:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->clear()V

    goto :goto_0
.end method

.method executeAction(IILandroid/os/Bundle;Lco/vine/android/service/VineServiceResponder;)Landroid/os/Bundle;
    .locals 192
    .parameter "startId"
    .parameter "actionCode"
    .parameter "b"
    .parameter "responder"

    .prologue
    .line 414
    sget-boolean v6, Lco/vine/android/service/VineService;->LOGGABLE:Z

    if-eqz v6, :cond_0

    .line 415
    const-string v6, "VineService"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Running VineService action: "

    move-object/from16 v0, v16

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p2

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v6, v13}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 418
    :cond_0
    const-string v6, "s_key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v31

    .line 419
    .local v31, key:Ljava/lang/String;
    const-string v6, "a_name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v70

    .line 420
    .local v70, accountName:Ljava/lang/String;
    const-string v6, "s_owner_id"

    const-wide/16 v26, 0x0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v6, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v24

    .line 421
    .local v24, sessionOwnerId:J
    invoke-static/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v12

    .line 423
    .local v12, dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v86

    .line 425
    .local v86, context:Landroid/content/Context;
    const/16 v159, 0x0

    .line 426
    .local v159, statusCode:I
    const/16 v143, 0x0

    .line 427
    .local v143, reasonPhrase:Ljava/lang/String;
    const/16 v132, 0x0

    .line 428
    .local v132, op:Lco/vine/android/network/HttpOperation;
    const/16 v97, 0x0

    .line 429
    .local v97, error:Lco/vine/android/api/VineError;
    const/16 v20, 0x0

    .line 431
    .local v20, vp:Lco/vine/android/api/VineParserReader;
    sparse-switch p2, :sswitch_data_0

    .line 2322
    .end local v12           #dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    .end local v24           #sessionOwnerId:J
    .end local v31           #key:Ljava/lang/String;
    :cond_1
    :goto_0
    new-instance v154, Landroid/os/Bundle;

    invoke-direct/range {v154 .. v154}, Landroid/os/Bundle;-><init>()V

    .line 2323
    .local v154, ret:Landroid/os/Bundle;
    if-eqz v132, :cond_48

    .line 2324
    move-object/from16 v0, v132

    iget v0, v0, Lco/vine/android/network/HttpOperation;->statusCode:I

    move/from16 v159, v0

    .line 2325
    const-string v6, "statusCode"

    move-object/from16 v0, v154

    move/from16 v1, v159

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2326
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-nez v6, :cond_49

    if-eqz v20, :cond_49

    if-nez v97, :cond_49

    .line 2327
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v97

    .end local v97           #error:Lco/vine/android/api/VineError;
    check-cast v97, Lco/vine/android/api/VineError;

    .line 2328
    .restart local v97       #error:Lco/vine/android/api/VineError;
    if-eqz v97, :cond_49

    .line 2329
    move-object/from16 v0, v97

    iget-object v0, v0, Lco/vine/android/api/VineError;->message:Ljava/lang/String;

    move-object/from16 v143, v0

    .line 2330
    const-string v6, "reasonPhrase"

    move-object/from16 v0, v154

    move-object/from16 v1, v143

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2333
    move-object/from16 v0, v97

    iget v0, v0, Lco/vine/android/api/VineError;->errorCode:I

    move/from16 v98, v0

    .line 2334
    .local v98, errorCode:I
    sget-object v6, Lco/vine/android/api/VineError$VineKnownErrors;->BAD_CREDENTIALS:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v6, v6, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v0, v98

    if-eq v0, v6, :cond_2

    sget-object v6, Lco/vine/android/api/VineError$VineKnownErrors;->REQUIRES_LOGIN:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v6, v6, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v0, v98

    if-ne v0, v6, :cond_45

    .line 2336
    :cond_2
    const-string v6, "executionCode"

    const/4 v13, 0x3

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2363
    .end local v98           #errorCode:I
    :goto_1
    return-object v154

    .line 433
    .end local v154           #ret:Landroid/os/Bundle;
    .restart local v12       #dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    .restart local v24       #sessionOwnerId:J
    .restart local v31       #key:Ljava/lang/String;
    :sswitch_0
    const-string v6, "login"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lco/vine/android/api/VineLogin;

    .line 434
    .local v5, login:Lco/vine/android/api/VineLogin;
    const-string v6, "pass"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v135

    .line 435
    .local v135, password:Ljava/lang/String;
    invoke-static {}, Lco/vine/android/api/VineParserReader;->createLoginReader()Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 436
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 437
    .local v19, params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    iget-object v6, v5, Lco/vine/android/api/VineLogin;->username:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-static/range {v135 .. v135}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 438
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "username"

    iget-object v0, v5, Lco/vine/android/api/VineLogin;->username:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 439
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "password"

    move-object/from16 v0, v135

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 441
    :cond_3
    iget-object v6, v5, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5

    iget-object v6, v5, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_5

    iget-wide v0, v5, Lco/vine/android/api/VineLogin;->twitterUserId:J

    move-wide/from16 v26, v0

    const-wide/16 v28, 0x0

    cmp-long v6, v26, v28

    if-lez v6, :cond_5

    const/16 v113, 0x1

    .line 444
    .local v113, isTwitter:Z
    :goto_2
    if-eqz v113, :cond_4

    .line 446
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthToken"

    iget-object v0, v5, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 447
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthSecret"

    iget-object v0, v5, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 448
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterId"

    iget-wide v0, v5, Lco/vine/android/api/VineLogin;->twitterUserId:J

    move-wide/from16 v26, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 452
    :cond_4
    const-string v6, "reactivate"

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_6

    const-string v116, "reactivate"

    .line 454
    .local v116, lastPathSegment:Ljava/lang/String;
    :goto_3
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    aput-object v116, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 457
    .local v17, url:Ljava/lang/StringBuilder;
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v1, v2, v13}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 461
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_7

    .line 462
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v189

    check-cast v189, Lco/vine/android/api/VineLogin;

    .line 463
    .local v189, vl:Lco/vine/android/api/VineLogin;
    move-object/from16 v0, v189

    iget-object v6, v0, Lco/vine/android/api/VineLogin;->username:Ljava/lang/String;

    move-object/from16 v0, v189

    iput-object v6, v0, Lco/vine/android/api/VineLogin;->name:Ljava/lang/String;

    .line 464
    iget-object v6, v5, Lco/vine/android/api/VineLogin;->username:Ljava/lang/String;

    move-object/from16 v0, v189

    iput-object v6, v0, Lco/vine/android/api/VineLogin;->username:Ljava/lang/String;

    .line 465
    const-string v6, "a_name"

    move-object/from16 v0, v189

    iget-object v13, v0, Lco/vine/android/api/VineLogin;->name:Ljava/lang/String;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 466
    const-string v6, "login"

    move-object/from16 v0, p3

    move-object/from16 v1, v189

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 468
    invoke-static/range {v113 .. v113}, Lco/vine/android/util/FlurryUtils;->trackLoginSuccess(Z)V

    .line 471
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "me"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v186

    .line 473
    .local v186, usersMeUrl:Ljava/lang/StringBuilder;
    const/4 v6, 0x2

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 474
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v189

    iget-object v0, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v186

    move-object/from16 v1, v20

    move-object/from16 v2, v16

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 477
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 478
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v121

    check-cast v121, Lco/vine/android/api/VineUser;

    .line 479
    .local v121, me:Lco/vine/android/api/VineUser;
    const-string v6, "avatar_url"

    move-object/from16 v0, v121

    iget-object v13, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 480
    const-string v6, "desc"

    move-object/from16 v0, v121

    iget-object v13, v0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 441
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v113           #isTwitter:Z
    .end local v116           #lastPathSegment:Ljava/lang/String;
    .end local v121           #me:Lco/vine/android/api/VineUser;
    .end local v186           #usersMeUrl:Ljava/lang/StringBuilder;
    .end local v189           #vl:Lco/vine/android/api/VineLogin;
    :cond_5
    const/16 v113, 0x0

    goto/16 :goto_2

    .line 452
    .restart local v113       #isTwitter:Z
    :cond_6
    const-string v116, "authenticate"

    goto/16 :goto_3

    .line 483
    .restart local v17       #url:Ljava/lang/StringBuilder;
    .restart local v116       #lastPathSegment:Ljava/lang/String;
    :cond_7
    new-instance v154, Landroid/os/Bundle;

    invoke-direct/range {v154 .. v154}, Landroid/os/Bundle;-><init>()V

    .line 484
    .restart local v154       #ret:Landroid/os/Bundle;
    const-string v6, "statusCode"

    move-object/from16 v0, v132

    iget v13, v0, Lco/vine/android/network/HttpOperation;->statusCode:I

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 485
    move-object/from16 v0, v132

    iget v6, v0, Lco/vine/android/network/HttpOperation;->statusCode:I

    move/from16 v0, v113

    invoke-static {v0, v6}, Lco/vine/android/util/FlurryUtils;->trackLoginFailure(ZI)V

    .line 486
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v97

    .end local v97           #error:Lco/vine/android/api/VineError;
    check-cast v97, Lco/vine/android/api/VineError;

    .line 487
    .restart local v97       #error:Lco/vine/android/api/VineError;
    if-eqz v97, :cond_8

    .line 488
    const-string v6, "reasonPhrase"

    move-object/from16 v0, v97

    iget-object v13, v0, Lco/vine/android/api/VineError;->message:Ljava/lang/String;

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 489
    const-string v6, "error_code"

    move-object/from16 v0, v97

    iget v13, v0, Lco/vine/android/api/VineError;->errorCode:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 493
    :goto_4
    const-string v6, "executionCode"

    const/4 v13, 0x1

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 491
    :cond_8
    const-string v6, "reasonPhrase"

    const v13, 0x7f0e00a7

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lco/vine/android/service/VineService;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 499
    .end local v5           #login:Lco/vine/android/api/VineLogin;
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v113           #isTwitter:Z
    .end local v116           #lastPathSegment:Ljava/lang/String;
    .end local v135           #password:Ljava/lang/String;
    .end local v154           #ret:Landroid/os/Bundle;
    :sswitch_1
    invoke-virtual {v12}, Lco/vine/android/provider/VineDatabaseHelper;->clearAllData()V

    goto/16 :goto_0

    .line 503
    :sswitch_2
    const-string v6, "a_name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v126

    .line 504
    .local v126, name:Ljava/lang/String;
    const-string v6, "login"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v95

    .line 505
    .local v95, email:Ljava/lang/String;
    const-string v6, "pass"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v135

    .line 506
    .restart local v135       #password:Ljava/lang/String;
    const-string v6, "phone"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v137

    .line 507
    .local v137, phone:Ljava/lang/String;
    const-string v6, "uri"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v77

    check-cast v77, Landroid/net/Uri;

    .line 508
    .local v77, avatarFileUri:Landroid/net/Uri;
    const-string v6, "t_user"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v168

    check-cast v168, Lco/vine/android/api/TwitterUser;

    .line 510
    .local v168, twitterUser:Lco/vine/android/api/TwitterUser;
    invoke-static/range {v86 .. v86}, Lco/vine/android/client/Amazon;->getBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v138

    .line 513
    .local v138, pictureBucket:Ljava/lang/String;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mMediaUtility:Lco/vine/android/util/MediaUtility;

    move-object/from16 v0, v77

    move-object/from16 v1, v138

    move-object/from16 v2, v86

    invoke-virtual {v6, v0, v1, v2}, Lco/vine/android/util/MediaUtility;->getPhotoUri(Landroid/net/Uri;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v101

    .line 520
    .local v101, filename:Ljava/lang/String;
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v13}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v6, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "/users"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 522
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x5

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 524
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 527
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    if-eqz v168, :cond_c

    const/16 v167, 0x1

    .line 528
    .local v167, twitterSignup:Z
    :goto_5
    const-string v6, "key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v163

    .line 529
    .local v163, token:Ljava/lang/String;
    const-string v6, "secret"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v155

    .line 530
    .local v155, secret:Ljava/lang/String;
    if-eqz v167, :cond_d

    .line 531
    move-object/from16 v0, v168

    iget-object v6, v0, Lco/vine/android/api/TwitterUser;->name:Ljava/lang/String;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_9

    .line 532
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "username"

    move-object/from16 v0, v168

    iget-object v0, v0, Lco/vine/android/api/TwitterUser;->name:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 534
    :cond_9
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "location"

    move-object/from16 v0, v168

    iget-object v0, v0, Lco/vine/android/api/TwitterUser;->location:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 535
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "description"

    move-object/from16 v0, v168

    iget-object v0, v0, Lco/vine/android/api/TwitterUser;->description:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 536
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterId"

    move-object/from16 v0, v168

    iget-wide v0, v0, Lco/vine/android/api/TwitterUser;->userId:J

    move-wide/from16 v26, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 538
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthToken"

    move-object/from16 v0, v163

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 539
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthSecret"

    move-object/from16 v0, v155

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 540
    invoke-static/range {v137 .. v137}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_a

    .line 541
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "phoneNumber"

    move-object/from16 v0, v137

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 551
    :cond_a
    :goto_6
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "authenticate"

    const-string v16, "true"

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 553
    if-eqz v101, :cond_b

    .line 555
    invoke-static/range {v86 .. v86}, Lco/vine/android/util/MediaUtility;->getUploadType(Landroid/content/Context;)I

    move-result v125

    .line 556
    .local v125, mode:I
    packed-switch v125, :pswitch_data_0

    .line 564
    move-object/from16 v102, v101

    .line 568
    .local v102, finalAvatarUrl:Ljava/lang/String;
    :goto_7
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "avatarUrl"

    move-object/from16 v0, v102

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 571
    .end local v102           #finalAvatarUrl:Ljava/lang/String;
    .end local v125           #mode:I
    :cond_b
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v1, v2, v13}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 575
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_f

    .line 576
    invoke-static/range {v167 .. v167}, Lco/vine/android/util/FlurryUtils;->onSignupSuccess(Z)V

    .line 577
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v189

    check-cast v189, Lco/vine/android/api/VineLogin;

    .line 578
    .restart local v189       #vl:Lco/vine/android/api/VineLogin;
    if-eqz v167, :cond_e

    .line 579
    move-object/from16 v0, v163

    move-object/from16 v1, v189

    iput-object v0, v1, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    .line 580
    move-object/from16 v0, v155

    move-object/from16 v1, v189

    iput-object v0, v1, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    .line 581
    move-object/from16 v0, v168

    iget-wide v0, v0, Lco/vine/android/api/TwitterUser;->userId:J

    move-wide/from16 v26, v0

    move-wide/from16 v0, v26

    move-object/from16 v2, v189

    iput-wide v0, v2, Lco/vine/android/api/VineLogin;->twitterUserId:J

    .line 582
    const/4 v6, 0x2

    move-object/from16 v0, v189

    iput v6, v0, Lco/vine/android/api/VineLogin;->loginType:I

    .line 586
    :goto_8
    const-string v6, "login"

    move-object/from16 v0, p3

    move-object/from16 v1, v189

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 587
    const-string v6, "a_name"

    move-object/from16 v0, p3

    move-object/from16 v1, v126

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 590
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "me"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v186

    .line 592
    .restart local v186       #usersMeUrl:Ljava/lang/StringBuilder;
    const/4 v6, 0x2

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 593
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v189

    iget-object v0, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v186

    move-object/from16 v1, v20

    move-object/from16 v2, v16

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 596
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 597
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v121

    check-cast v121, Lco/vine/android/api/VineUser;

    .line 598
    .restart local v121       #me:Lco/vine/android/api/VineUser;
    const-string v6, "avatar_url"

    move-object/from16 v0, v121

    iget-object v13, v0, Lco/vine/android/api/VineUser;->avatarUrl:Ljava/lang/String;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 599
    const-string v6, "desc"

    move-object/from16 v0, v121

    iget-object v13, v0, Lco/vine/android/api/VineUser;->description:Ljava/lang/String;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 514
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v101           #filename:Ljava/lang/String;
    .end local v121           #me:Lco/vine/android/api/VineUser;
    .end local v155           #secret:Ljava/lang/String;
    .end local v163           #token:Ljava/lang/String;
    .end local v167           #twitterSignup:Z
    .end local v186           #usersMeUrl:Ljava/lang/StringBuilder;
    .end local v189           #vl:Lco/vine/android/api/VineLogin;
    :catch_0
    move-exception v92

    .line 515
    .local v92, e:Ljava/lang/Exception;
    const/16 v159, 0x384

    .line 516
    invoke-virtual/range {v92 .. v92}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v143

    .line 517
    goto/16 :goto_0

    .line 527
    .end local v92           #e:Ljava/lang/Exception;
    .restart local v17       #url:Ljava/lang/StringBuilder;
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .restart local v101       #filename:Ljava/lang/String;
    :cond_c
    const/16 v167, 0x0

    goto/16 :goto_5

    .line 544
    .restart local v155       #secret:Ljava/lang/String;
    .restart local v163       #token:Ljava/lang/String;
    .restart local v167       #twitterSignup:Z
    :cond_d
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "username"

    move-object/from16 v0, v126

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 545
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "email"

    move-object/from16 v0, v95

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 546
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "password"

    move-object/from16 v0, v135

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 547
    invoke-static/range {v137 .. v137}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_a

    .line 548
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "phoneNumber"

    move-object/from16 v0, v137

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_6

    .line 558
    .restart local v125       #mode:I
    :pswitch_0
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v13}, Lco/vine/android/client/VineAPI;->getAmazonUrl()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "/"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v138

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "/"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v101

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v102

    .line 560
    .restart local v102       #finalAvatarUrl:Ljava/lang/String;
    goto/16 :goto_7

    .line 584
    .end local v102           #finalAvatarUrl:Ljava/lang/String;
    .end local v125           #mode:I
    .restart local v189       #vl:Lco/vine/android/api/VineLogin;
    :cond_e
    move-object/from16 v0, v95

    move-object/from16 v1, v189

    iput-object v0, v1, Lco/vine/android/api/VineLogin;->username:Ljava/lang/String;

    goto/16 :goto_8

    .line 602
    .end local v189           #vl:Lco/vine/android/api/VineLogin;
    :cond_f
    new-instance v154, Landroid/os/Bundle;

    invoke-direct/range {v154 .. v154}, Landroid/os/Bundle;-><init>()V

    .line 603
    .restart local v154       #ret:Landroid/os/Bundle;
    const-string v6, "statusCode"

    move-object/from16 v0, v132

    iget v13, v0, Lco/vine/android/network/HttpOperation;->statusCode:I

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 604
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v97

    .end local v97           #error:Lco/vine/android/api/VineError;
    check-cast v97, Lco/vine/android/api/VineError;

    .line 605
    .restart local v97       #error:Lco/vine/android/api/VineError;
    move-object/from16 v0, v132

    iget v6, v0, Lco/vine/android/network/HttpOperation;->statusCode:I

    move/from16 v0, v167

    move-object/from16 v1, v97

    invoke-static {v0, v1, v6}, Lco/vine/android/util/FlurryUtils;->onSignupFailure(ZLco/vine/android/api/VineError;I)V

    .line 606
    if-eqz v97, :cond_10

    .line 607
    const-string v6, "reasonPhrase"

    move-object/from16 v0, v97

    iget-object v13, v0, Lco/vine/android/api/VineError;->message:Ljava/lang/String;

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 611
    :goto_9
    const-string v6, "executionCode"

    const/4 v13, 0x1

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 609
    :cond_10
    const-string v6, "reasonPhrase"

    const v13, 0x7f0e00a7

    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lco/vine/android/service/VineService;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_9

    .line 617
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v77           #avatarFileUri:Landroid/net/Uri;
    .end local v95           #email:Ljava/lang/String;
    .end local v101           #filename:Ljava/lang/String;
    .end local v126           #name:Ljava/lang/String;
    .end local v135           #password:Ljava/lang/String;
    .end local v137           #phone:Ljava/lang/String;
    .end local v138           #pictureBucket:Ljava/lang/String;
    .end local v154           #ret:Landroid/os/Bundle;
    .end local v155           #secret:Ljava/lang/String;
    .end local v163           #token:Ljava/lang/String;
    .end local v167           #twitterSignup:Z
    .end local v168           #twitterUser:Lco/vine/android/api/TwitterUser;
    :sswitch_3
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 619
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "includePromoted"

    const-string v16, "should_follow_editors_picks"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v16

    invoke-static/range {v16 .. v16}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 621
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "preferences"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 625
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 626
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 629
    const-string v6, "should_follow_editors_picks"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    const/4 v13, 0x1

    if-ne v6, v13, :cond_11

    const/16 v157, 0x1

    .line 630
    .local v157, shouldFollow:Z
    :goto_a
    const-string v6, "should_follow_editors_picks"

    move-object/from16 v0, p3

    move/from16 v1, v157

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 631
    if-nez v157, :cond_1

    .line 632
    const-string v6, "also_fetch_posts"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 629
    .end local v157           #shouldFollow:Z
    :cond_11
    const/16 v157, 0x0

    goto :goto_a

    .line 637
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    :sswitch_4
    const-string v6, "type"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v169

    .line 638
    .local v169, type:I
    move/from16 v0, v169

    invoke-virtual {v12, v0}, Lco/vine/android/provider/VineDatabaseHelper;->expireTimeline(I)V

    goto/16 :goto_0

    .line 642
    .end local v169           #type:I
    :sswitch_5
    move-object/from16 v0, v86

    move-object/from16 v1, v70

    invoke-static {v0, v1}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v69

    .line 643
    .local v69, account:Landroid/accounts/Account;
    if-nez v69, :cond_12

    .line 644
    const-string v6, "email"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v86

    invoke-static {v0, v6}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v69

    .line 645
    if-eqz v69, :cond_1

    .line 650
    :cond_12
    invoke-static/range {v86 .. v86}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v74

    .line 651
    .local v74, am:Landroid/accounts/AccountManager;
    move-object/from16 v0, v74

    move-object/from16 v1, v69

    invoke-static {v0, v1}, Lco/vine/android/client/VineAccountHelper;->getLoginType(Landroid/accounts/AccountManager;Landroid/accounts/Account;)I

    move-result v120

    .line 652
    .local v120, loginType:I
    packed-switch v120, :pswitch_data_1

    goto/16 :goto_0

    .line 654
    :pswitch_1
    move-object/from16 v0, v69

    iget-object v0, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    move-object/from16 v95, v0

    .line 655
    .restart local v95       #email:Ljava/lang/String;
    move-object/from16 v0, v74

    move-object/from16 v1, v69

    invoke-static {v0, v1}, Lco/vine/android/client/VineAccountHelper;->getPassword(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v135

    .line 656
    .restart local v135       #password:Ljava/lang/String;
    invoke-static {}, Lco/vine/android/api/VineParserReader;->createLoginReader()Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 658
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 661
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "username"

    move-object/from16 v0, v95

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 662
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "password"

    move-object/from16 v0, v135

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 664
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v13}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v6, v13}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v13, "/users/authenticate"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 667
    .restart local v17       #url:Ljava/lang/StringBuilder;
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v1, v2, v13}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 671
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 672
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v189

    check-cast v189, Lco/vine/android/api/VineLogin;

    .line 673
    .restart local v189       #vl:Lco/vine/android/api/VineLogin;
    move-object/from16 v0, v189

    iget-object v6, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    move-object/from16 v0, v74

    move-object/from16 v1, v69

    invoke-static {v0, v1, v6}, Lco/vine/android/client/VineAccountHelper;->setSessionKey(Landroid/accounts/AccountManager;Landroid/accounts/Account;Ljava/lang/String;)V

    .line 674
    const-string v6, "s_key"

    move-object/from16 v0, v189

    iget-object v13, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 675
    invoke-static/range {v86 .. v86}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v6

    move-object/from16 v0, v189

    iget-object v13, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    invoke-virtual {v6, v13}, Lco/vine/android/client/AppController;->setSessionKey(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 680
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v95           #email:Ljava/lang/String;
    .end local v135           #password:Ljava/lang/String;
    .end local v189           #vl:Lco/vine/android/api/VineLogin;
    :pswitch_2
    move-object/from16 v0, v74

    move-object/from16 v1, v69

    invoke-static {v0, v1}, Lco/vine/android/client/VineAccountHelper;->getTwitterToken(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v163

    .line 681
    .restart local v163       #token:Ljava/lang/String;
    move-object/from16 v0, v74

    move-object/from16 v1, v69

    invoke-static {v0, v1}, Lco/vine/android/client/VineAccountHelper;->getTwitterSecret(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v155

    .line 682
    .restart local v155       #secret:Ljava/lang/String;
    invoke-static {}, Lco/vine/android/api/VineParserReader;->createLoginReader()Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 684
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 687
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthToken"

    move-object/from16 v0, v163

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 688
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthSecret"

    move-object/from16 v0, v155

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 690
    const-string v6, "reactivate"

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_13

    const-string v136, "reactivate"

    .line 692
    .local v136, pathSegment:Ljava/lang/String;
    :goto_b
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    aput-object v136, v13, v16

    const/16 v16, 0x2

    const-string v18, "twitter"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 695
    .restart local v17       #url:Ljava/lang/StringBuilder;
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v1, v2, v13}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 699
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 700
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v189

    check-cast v189, Lco/vine/android/api/VineLogin;

    .line 701
    .restart local v189       #vl:Lco/vine/android/api/VineLogin;
    move-object/from16 v0, v189

    iget-object v6, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    move-object/from16 v0, v74

    move-object/from16 v1, v69

    invoke-static {v0, v1, v6}, Lco/vine/android/client/VineAccountHelper;->setSessionKey(Landroid/accounts/AccountManager;Landroid/accounts/Account;Ljava/lang/String;)V

    .line 702
    const-string v6, "s_key"

    move-object/from16 v0, v189

    iget-object v13, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 703
    invoke-static/range {v86 .. v86}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v6

    move-object/from16 v0, v189

    iget-object v13, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    invoke-virtual {v6, v13}, Lco/vine/android/client/AppController;->setSessionKey(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 690
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v136           #pathSegment:Ljava/lang/String;
    .end local v189           #vl:Lco/vine/android/api/VineLogin;
    :cond_13
    const-string v136, "authenticate"

    goto :goto_b

    .line 711
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v69           #account:Landroid/accounts/Account;
    .end local v74           #am:Landroid/accounts/AccountManager;
    .end local v120           #loginType:I
    .end local v155           #secret:Ljava/lang/String;
    .end local v163           #token:Ljava/lang/String;
    :sswitch_6
    const-string v6, "key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 712
    .local v8, tokenKey:Ljava/lang/String;
    const-string v6, "secret"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 713
    .local v9, tokenSecret:Ljava/lang/String;
    const-string v6, "uri"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v82

    .line 714
    .local v82, callback:Ljava/lang/String;
    new-instance v6, Lorg/scribe/builder/ServiceBuilder;

    invoke-direct {v6}, Lorg/scribe/builder/ServiceBuilder;-><init>()V

    const-class v13, Lorg/scribe/builder/api/TwitterApi;

    invoke-virtual {v6, v13}, Lorg/scribe/builder/ServiceBuilder;->provider(Ljava/lang/Class;)Lorg/scribe/builder/ServiceBuilder;

    move-result-object v6

    invoke-virtual {v6, v8}, Lorg/scribe/builder/ServiceBuilder;->apiKey(Ljava/lang/String;)Lorg/scribe/builder/ServiceBuilder;

    move-result-object v6

    invoke-virtual {v6, v9}, Lorg/scribe/builder/ServiceBuilder;->apiSecret(Ljava/lang/String;)Lorg/scribe/builder/ServiceBuilder;

    move-result-object v6

    move-object/from16 v0, v82

    invoke-virtual {v6, v0}, Lorg/scribe/builder/ServiceBuilder;->callback(Ljava/lang/String;)Lorg/scribe/builder/ServiceBuilder;

    move-result-object v6

    invoke-virtual {v6}, Lorg/scribe/builder/ServiceBuilder;->build()Lorg/scribe/oauth/OAuthService;

    move-result-object v156

    .line 721
    .local v156, service:Lorg/scribe/oauth/OAuthService;
    invoke-interface/range {v156 .. v156}, Lorg/scribe/oauth/OAuthService;->getRequestToken()Lorg/scribe/model/Token;

    move-result-object v163

    .line 722
    .local v163, token:Lorg/scribe/model/Token;
    move-object/from16 v0, v156

    move-object/from16 v1, v163

    invoke-interface {v0, v1}, Lorg/scribe/oauth/OAuthService;->getAuthorizationUrl(Lorg/scribe/model/Token;)Ljava/lang/String;

    move-result-object v76

    .line 723
    .local v76, authUrl:Ljava/lang/String;
    const-string v6, "load_url"

    move-object/from16 v0, p3

    move-object/from16 v1, v76

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 727
    .end local v8           #tokenKey:Ljava/lang/String;
    .end local v9           #tokenSecret:Ljava/lang/String;
    .end local v76           #authUrl:Ljava/lang/String;
    .end local v82           #callback:Ljava/lang/String;
    .end local v156           #service:Lorg/scribe/oauth/OAuthService;
    .end local v163           #token:Lorg/scribe/model/Token;
    :sswitch_7
    const-string v6, "username"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 728
    .local v7, username:Ljava/lang/String;
    const-string v6, "key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 729
    .restart local v8       #tokenKey:Ljava/lang/String;
    const-string v6, "secret"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 730
    .restart local v9       #tokenSecret:Ljava/lang/String;
    const-string v6, "t_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 731
    .local v10, userId:J
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 732
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v84

    .line 736
    .local v84, client:Lco/vine/android/network/ThreadedHttpOperationClient;
    const-string v6, "reactivate"

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_14

    const-string v136, "reactivate"

    .line 738
    .restart local v136       #pathSegment:Ljava/lang/String;
    :goto_c
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    aput-object v136, v13, v16

    const/16 v16, 0x2

    const-string v18, "twitter"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 741
    .restart local v17       #url:Ljava/lang/StringBuilder;
    new-instance v19, Ljava/util/ArrayList;

    const/4 v6, 0x2

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 743
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthToken"

    invoke-direct {v6, v13, v8}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 744
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthSecret"

    invoke-direct {v6, v13, v9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 745
    const/4 v6, 0x5

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 746
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v84

    move-object/from16 v1, v17

    move-object/from16 v2, v19

    move-object/from16 v3, v20

    invoke-static {v0, v1, v2, v3, v6}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 747
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_15

    .line 748
    const-string v6, "a_exists"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 752
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v189

    check-cast v189, Lco/vine/android/api/VineLogin;

    .line 753
    .restart local v189       #vl:Lco/vine/android/api/VineLogin;
    move-object/from16 v0, v189

    iput-object v7, v0, Lco/vine/android/api/VineLogin;->twitterUsername:Ljava/lang/String;

    .line 754
    move-object/from16 v0, v189

    iput-object v8, v0, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    .line 755
    move-object/from16 v0, v189

    iput-object v9, v0, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    .line 756
    move-object/from16 v0, v189

    iput-wide v10, v0, Lco/vine/android/api/VineLogin;->twitterUserId:J

    .line 757
    const/4 v6, 0x2

    move-object/from16 v0, v189

    iput v6, v0, Lco/vine/android/api/VineLogin;->loginType:I

    .line 758
    const-string v6, "login"

    move-object/from16 v0, p3

    move-object/from16 v1, v189

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 761
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v13}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "/users/me"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v185

    .line 762
    .local v185, usersMe:Ljava/lang/String;
    const/4 v6, 0x2

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 763
    new-instance v6, Ljava/lang/StringBuilder;

    move-object/from16 v0, v185

    invoke-direct {v6, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v189

    iget-object v0, v0, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v84

    move-object/from16 v1, v20

    move-object/from16 v2, v16

    invoke-static {v0, v6, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 765
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 766
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v171

    check-cast v171, Lco/vine/android/api/VineUser;

    .line 767
    .local v171, user:Lco/vine/android/api/VineUser;
    const-string v6, "user"

    move-object/from16 v0, p3

    move-object/from16 v1, v171

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto/16 :goto_0

    .line 736
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v136           #pathSegment:Ljava/lang/String;
    .end local v171           #user:Lco/vine/android/api/VineUser;
    .end local v185           #usersMe:Ljava/lang/String;
    .end local v189           #vl:Lco/vine/android/api/VineLogin;
    :cond_14
    const-string v136, "authenticate"

    goto/16 :goto_c

    .line 772
    .restart local v17       #url:Ljava/lang/StringBuilder;
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .restart local v136       #pathSegment:Ljava/lang/String;
    :cond_15
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v97

    .end local v97           #error:Lco/vine/android/api/VineError;
    check-cast v97, Lco/vine/android/api/VineError;

    .line 773
    .restart local v97       #error:Lco/vine/android/api/VineError;
    if-nez v97, :cond_16

    .line 774
    const v6, 0x7f0e00a3

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lco/vine/android/service/VineService;->getString(I)Ljava/lang/String;

    move-result-object v143

    .line 775
    goto/16 :goto_0

    .line 777
    :cond_16
    move-object/from16 v0, v97

    iget v0, v0, Lco/vine/android/api/VineError;->errorCode:I

    move/from16 v85, v0

    .line 778
    .local v85, code:I
    sget-object v6, Lco/vine/android/api/VineError$VineKnownErrors;->BAD_CREDENTIALS:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v6, v6, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v0, v85

    if-eq v6, v0, :cond_17

    sget-object v6, Lco/vine/android/api/VineError$VineKnownErrors;->RECORD_DOES_NOT_EXIST:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v6, v6, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v0, v85

    if-eq v6, v0, :cond_17

    sget-object v6, Lco/vine/android/api/VineError$VineKnownErrors;->ACCOUNT_DEACTIVATED:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v6, v6, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v0, v85

    if-ne v6, v0, :cond_18

    .line 781
    :cond_17
    new-instance v5, Lco/vine/android/api/VineLogin;

    const/4 v6, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v5 .. v12}, Lco/vine/android/api/VineLogin;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 783
    .end local v12           #dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    .restart local v5       #login:Lco/vine/android/api/VineLogin;
    const-string v6, "login"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 784
    const-string v6, "a_exists"

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 785
    const-string v6, "error_code"

    move-object/from16 v0, v97

    iget v13, v0, Lco/vine/android/api/VineError;->errorCode:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 787
    .end local v5           #login:Lco/vine/android/api/VineLogin;
    .restart local v12       #dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    :cond_18
    move-object/from16 v0, v97

    iget-object v0, v0, Lco/vine/android/api/VineError;->message:Ljava/lang/String;

    move-object/from16 v143, v0

    goto/16 :goto_0

    .line 794
    .end local v7           #username:Ljava/lang/String;
    .end local v8           #tokenKey:Ljava/lang/String;
    .end local v9           #tokenSecret:Ljava/lang/String;
    .end local v10           #userId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v84           #client:Lco/vine/android/network/ThreadedHttpOperationClient;
    .end local v85           #code:I
    .end local v136           #pathSegment:Ljava/lang/String;
    :sswitch_8
    const-string v6, "login"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v187

    check-cast v187, Lco/vine/android/api/VineLogin;

    .line 795
    .local v187, v:Lco/vine/android/api/VineLogin;
    new-instance v6, Lorg/scribe/builder/ServiceBuilder;

    invoke-direct {v6}, Lorg/scribe/builder/ServiceBuilder;-><init>()V

    const-class v13, Lorg/scribe/builder/api/TwitterApi;

    invoke-virtual {v6, v13}, Lorg/scribe/builder/ServiceBuilder;->provider(Ljava/lang/Class;)Lorg/scribe/builder/ServiceBuilder;

    move-result-object v6

    sget-object v13, Lco/vine/android/client/TwitterVineApp;->API_KEY:Ljava/lang/String;

    invoke-virtual {v6, v13}, Lorg/scribe/builder/ServiceBuilder;->apiKey(Ljava/lang/String;)Lorg/scribe/builder/ServiceBuilder;

    move-result-object v6

    sget-object v13, Lco/vine/android/client/TwitterVineApp;->API_SECRET:Ljava/lang/String;

    invoke-virtual {v6, v13}, Lorg/scribe/builder/ServiceBuilder;->apiSecret(Ljava/lang/String;)Lorg/scribe/builder/ServiceBuilder;

    move-result-object v6

    invoke-virtual {v6}, Lorg/scribe/builder/ServiceBuilder;->build()Lorg/scribe/oauth/OAuthService;

    move-result-object v156

    .line 801
    .restart local v156       #service:Lorg/scribe/oauth/OAuthService;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v13}, Lco/vine/android/client/VineAPI;->getTwitterUrl()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "/users/show.json?id="

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v187

    iget-wide v0, v0, Lco/vine/android/api/VineLogin;->twitterUserId:J

    move-wide/from16 v26, v0

    move-wide/from16 v0, v26

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    .line 802
    .local v17, url:Ljava/lang/String;
    new-instance v148, Lorg/scribe/model/OAuthRequest;

    sget-object v6, Lorg/scribe/model/Verb;->GET:Lorg/scribe/model/Verb;

    move-object/from16 v0, v148

    move-object/from16 v1, v17

    invoke-direct {v0, v6, v1}, Lorg/scribe/model/OAuthRequest;-><init>(Lorg/scribe/model/Verb;Ljava/lang/String;)V

    .line 803
    .local v148, request:Lorg/scribe/model/OAuthRequest;
    new-instance v163, Lorg/scribe/model/Token;

    move-object/from16 v0, v187

    iget-object v6, v0, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    move-object/from16 v0, v187

    iget-object v13, v0, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    move-object/from16 v0, v163

    invoke-direct {v0, v6, v13}, Lorg/scribe/model/Token;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 804
    .restart local v163       #token:Lorg/scribe/model/Token;
    move-object/from16 v0, v156

    move-object/from16 v1, v163

    move-object/from16 v2, v148

    invoke-interface {v0, v1, v2}, Lorg/scribe/oauth/OAuthService;->signRequest(Lorg/scribe/model/Token;Lorg/scribe/model/OAuthRequest;)V

    .line 807
    :try_start_1
    invoke-virtual/range {v148 .. v148}, Lorg/scribe/model/OAuthRequest;->send()Lorg/scribe/model/Response;

    move-result-object v150

    .line 809
    .local v150, response:Lorg/scribe/model/Response;
    invoke-virtual/range {v150 .. v150}, Lorg/scribe/model/Response;->isSuccessful()Z
    :try_end_1
    .catch Lorg/scribe/exceptions/OAuthException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v6

    if-eqz v6, :cond_1

    .line 811
    :try_start_2
    new-instance v6, Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-direct {v6}, Lcom/fasterxml/jackson/core/JsonFactory;-><init>()V

    invoke-virtual/range {v150 .. v150}, Lorg/scribe/model/Response;->getBody()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Lcom/fasterxml/jackson/core/JsonFactory;->createJsonParser(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object v133

    .line 812
    .local v133, p:Lcom/fasterxml/jackson/core/JsonParser;
    invoke-virtual/range {v133 .. v133}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 813
    invoke-static/range {v133 .. v133}, Lco/vine/android/api/VineParsers;->parseTwitterUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/TwitterUser;

    move-result-object v161

    .line 815
    .local v161, tUser:Lco/vine/android/api/TwitterUser;
    const-string v6, "t_user"

    move-object/from16 v0, p3

    move-object/from16 v1, v161

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/scribe/exceptions/OAuthException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_0

    .line 816
    .end local v133           #p:Lcom/fasterxml/jackson/core/JsonParser;
    .end local v161           #tUser:Lco/vine/android/api/TwitterUser;
    :catch_1
    move-exception v92

    .line 817
    .local v92, e:Ljava/io/IOException;
    :try_start_3
    sget-boolean v6, Lco/vine/android/service/VineService;->LOGGABLE:Z

    if-eqz v6, :cond_1

    .line 818
    const-string v6, "Failed to parse."

    move-object/from16 v0, v92

    invoke-static {v6, v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catch Lorg/scribe/exceptions/OAuthException; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_0

    .line 823
    .end local v92           #e:Ljava/io/IOException;
    .end local v150           #response:Lorg/scribe/model/Response;
    :catch_2
    move-exception v131

    .line 824
    .local v131, oAuthException:Lorg/scribe/exceptions/OAuthException;
    const-string v6, "Failed to connect."

    move-object/from16 v0, v131

    invoke-static {v6, v0}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 830
    .end local v17           #url:Ljava/lang/String;
    .end local v131           #oAuthException:Lorg/scribe/exceptions/OAuthException;
    .end local v148           #request:Lorg/scribe/model/OAuthRequest;
    .end local v156           #service:Lorg/scribe/oauth/OAuthService;
    .end local v163           #token:Lorg/scribe/model/Token;
    .end local v187           #v:Lco/vine/android/api/VineLogin;
    :sswitch_9
    const-string v6, "username"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 831
    .restart local v7       #username:Ljava/lang/String;
    const-string v6, "pass"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v135

    .line 833
    .restart local v135       #password:Ljava/lang/String;
    new-instance v80, Ltwitter4j/conf/ConfigurationBuilder;

    invoke-direct/range {v80 .. v80}, Ltwitter4j/conf/ConfigurationBuilder;-><init>()V

    .line 834
    .local v80, builder:Ltwitter4j/conf/ConfigurationBuilder;
    sget-object v6, Lco/vine/android/client/TwitterVineApp;->API_KEY:Ljava/lang/String;

    move-object/from16 v0, v80

    invoke-virtual {v0, v6}, Ltwitter4j/conf/ConfigurationBuilder;->setOAuthConsumerKey(Ljava/lang/String;)Ltwitter4j/conf/ConfigurationBuilder;

    .line 835
    sget-object v6, Lco/vine/android/client/TwitterVineApp;->API_SECRET:Ljava/lang/String;

    move-object/from16 v0, v80

    invoke-virtual {v0, v6}, Ltwitter4j/conf/ConfigurationBuilder;->setOAuthConsumerSecret(Ljava/lang/String;)Ltwitter4j/conf/ConfigurationBuilder;

    .line 837
    new-instance v6, Ltwitter4j/VineTwitterFactory;

    invoke-virtual/range {v80 .. v80}, Ltwitter4j/conf/ConfigurationBuilder;->build()Ltwitter4j/conf/Configuration;

    move-result-object v13

    invoke-direct {v6, v13}, Ltwitter4j/VineTwitterFactory;-><init>(Ltwitter4j/conf/Configuration;)V

    new-instance v13, Ltwitter4j/auth/BasicAuthorization;

    move-object/from16 v0, v135

    invoke-direct {v13, v7, v0}, Ltwitter4j/auth/BasicAuthorization;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v13}, Ltwitter4j/VineTwitterFactory;->getInstance(Ltwitter4j/auth/Authorization;)Ltwitter4j/Twitter;

    move-result-object v164

    .line 841
    .local v164, twitter:Ltwitter4j/Twitter;
    :try_start_4
    invoke-interface/range {v164 .. v164}, Ltwitter4j/Twitter;->getOAuthAccessToken()Ltwitter4j/auth/AccessToken;

    move-result-object v67

    .line 842
    .local v67, aToken:Ltwitter4j/auth/AccessToken;
    new-instance v5, Lco/vine/android/api/VineLogin;

    const/4 v13, 0x0

    invoke-virtual/range {v67 .. v67}, Ltwitter4j/auth/AccessToken;->getScreenName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual/range {v67 .. v67}, Ltwitter4j/auth/AccessToken;->getToken()Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {v67 .. v67}, Ltwitter4j/auth/AccessToken;->getTokenSecret()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v67 .. v67}, Ltwitter4j/auth/AccessToken;->getUserId()J

    move-result-wide v17

    const/16 v19, 0x0

    move-object v12, v5

    invoke-direct/range {v12 .. v19}, Lco/vine/android/api/VineLogin;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 844
    .end local v12           #dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    .restart local v5       #login:Lco/vine/android/api/VineLogin;
    const-string v6, "login"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v5}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
    .catch Ltwitter4j/TwitterException; {:try_start_4 .. :try_end_4} :catch_3

    .line 845
    const/16 v159, 0xc8

    .line 864
    const-string v6, "pass"

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 846
    .end local v5           #login:Lco/vine/android/api/VineLogin;
    .end local v67           #aToken:Ltwitter4j/auth/AccessToken;
    :catch_3
    move-exception v92

    .line 847
    .local v92, e:Ltwitter4j/TwitterException;
    :try_start_5
    invoke-virtual/range {v86 .. v86}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v149

    .line 848
    .local v149, res:Landroid/content/res/Resources;
    invoke-virtual/range {v92 .. v92}, Ltwitter4j/TwitterException;->getStatusCode()I

    move-result v6

    const/16 v13, 0x191

    if-ne v6, v13, :cond_1a

    .line 849
    const/16 v159, 0x191

    .line 850
    invoke-static/range {v92 .. v92}, Lco/vine/android/util/Util;->isXauth2FactorError(Ltwitter4j/TwitterException;)Z

    move-result v6

    if-eqz v6, :cond_19

    .line 851
    const v6, 0x7f0e009f

    move-object/from16 v0, v149

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v143

    .line 864
    :goto_d
    const-string v6, "pass"

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 853
    :cond_19
    const v6, 0x7f0e00a1

    :try_start_6
    move-object/from16 v0, v149

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v143

    goto :goto_d

    .line 855
    :cond_1a
    invoke-virtual/range {v92 .. v92}, Ltwitter4j/TwitterException;->isCausedByNetworkIssue()Z

    move-result v6

    if-eqz v6, :cond_1b

    .line 856
    const/16 v159, 0x1f4

    .line 857
    const v6, 0x7f0e00a0

    move-object/from16 v0, v149

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v143

    goto :goto_d

    .line 859
    :cond_1b
    const/16 v159, 0x1f4

    .line 860
    const v6, 0x7f0e00a8

    move-object/from16 v0, v149

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v143

    goto :goto_d

    .line 864
    .end local v92           #e:Ltwitter4j/TwitterException;
    .end local v149           #res:Landroid/content/res/Resources;
    :catchall_0
    move-exception v6

    const-string v13, "pass"

    const/16 v16, 0x0

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v13, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    throw v6

    .line 870
    .end local v7           #username:Ljava/lang/String;
    .end local v80           #builder:Ltwitter4j/conf/ConfigurationBuilder;
    .end local v135           #password:Ljava/lang/String;
    .end local v164           #twitter:Ltwitter4j/Twitter;
    .restart local v12       #dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    :sswitch_a
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackResetPassword()V

    .line 871
    const-string v6, "login"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v95

    .line 872
    .restart local v95       #email:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "forgotPassword"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 874
    .local v17, url:Ljava/lang/StringBuilder;
    const-string v6, "email"

    move-object/from16 v0, v17

    move-object/from16 v1, v95

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 875
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 876
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v1, v13}, Lco/vine/android/network/HttpOperation;->createGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 880
    goto/16 :goto_0

    .line 883
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v95           #email:Ljava/lang/String;
    :sswitch_b
    const-string v6, "post_id"

    const-wide/16 v26, 0x0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v6, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    .line 884
    .local v14, postId:J
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 885
    .local v51, pageType:I
    const-string v6, "page"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v134

    .line 887
    .local v134, page:I
    packed-switch v51, :pswitch_data_2

    .line 913
    :cond_1c
    :goto_e
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "likes"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 916
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 917
    const-string v6, "size"

    const/16 v13, 0x14

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 919
    const/16 v6, 0xb

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 920
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 924
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 925
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v119

    check-cast v119, Lco/vine/android/api/VinePagedData;

    .line 926
    .local v119, likes:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineLike;>;"
    move-object/from16 v0, v119

    iget-object v13, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v0, v119

    iget v0, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move/from16 v16, v0

    move-object/from16 v0, v119

    iget v0, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move/from16 v17, v0

    .end local v17           #url:Ljava/lang/StringBuilder;
    invoke-virtual/range {v12 .. v17}, Lco/vine/android/provider/VineDatabaseHelper;->mergeLikes(Ljava/util/Collection;JII)I

    .line 927
    const-string v6, "count"

    move-object/from16 v0, v119

    iget v13, v0, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 928
    const-string v6, "next_page"

    move-object/from16 v0, v119

    iget v13, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 929
    const-string v6, "previous_page"

    move-object/from16 v0, v119

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 931
    move-object/from16 v0, v119

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_1

    .line 932
    const/4 v6, 0x5

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v6, v13}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 889
    .end local v119           #likes:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineLike;>;"
    :pswitch_3
    const/16 v134, 0x1

    .line 890
    goto/16 :goto_e

    .line 893
    :pswitch_4
    const/4 v6, 0x1

    const/4 v13, 0x5

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v128

    .line 895
    .local v128, nextPage:I
    if-lez v128, :cond_1c

    .line 896
    move/from16 v134, v128

    goto/16 :goto_e

    .line 901
    .end local v128           #nextPage:I
    :pswitch_5
    const/4 v6, 0x1

    const/4 v13, 0x5

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 903
    .local v53, previous:I
    if-lez v53, :cond_1c

    .line 904
    move/from16 v134, v53

    goto/16 :goto_e

    .line 940
    .end local v14           #postId:J
    .end local v51           #pageType:I
    .end local v53           #previous:I
    .end local v134           #page:I
    :sswitch_c
    const-string v6, "profile_id"

    const-wide/16 v26, 0x0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v6, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 941
    .restart local v10       #userId:J
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 942
    .restart local v51       #pageType:I
    const-string v6, "page"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v134

    .line 944
    .restart local v134       #page:I
    packed-switch v51, :pswitch_data_3

    .line 970
    :cond_1d
    :goto_f
    const-wide/16 v26, 0x0

    cmp-long v6, v10, v26

    if-lez v6, :cond_1

    .line 971
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "followers"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 973
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 974
    const-string v6, "size"

    const/16 v13, 0xa

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 975
    const/4 v6, 0x3

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v190

    .line 977
    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    .local v190, vp:Lco/vine/android/api/VineParserReader;
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v190

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 980
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_20

    .line 981
    invoke-virtual/range {v190 .. v190}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v184

    check-cast v184, Lco/vine/android/api/VinePagedData;

    .line 982
    .local v184, users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-eqz v6, :cond_1f

    .line 983
    new-instance v22, Ljava/util/HashMap;

    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    move-object/from16 v0, v22

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 985
    .local v22, orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v112

    .local v112, i$:Ljava/util/Iterator;
    :goto_10
    invoke-interface/range {v112 .. v112}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1e

    invoke-interface/range {v112 .. v112}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v170

    check-cast v170, Lco/vine/android/api/VineUser;

    .line 986
    .local v170, u:Lco/vine/android/api/VineUser;
    move-object/from16 v0, v170

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->userId:J

    move-wide/from16 v26, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v170

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->orderId:J

    move-wide/from16 v26, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_10

    .line 946
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v22           #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v112           #i$:Ljava/util/Iterator;
    .end local v170           #u:Lco/vine/android/api/VineUser;
    .end local v184           #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    .end local v190           #vp:Lco/vine/android/api/VineParserReader;
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    :pswitch_6
    const/16 v134, 0x1

    .line 947
    goto/16 :goto_f

    .line 950
    :pswitch_7
    const/4 v6, 0x1

    const/4 v13, 0x2

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v128

    .line 952
    .restart local v128       #nextPage:I
    if-lez v128, :cond_1d

    .line 953
    move/from16 v134, v128

    goto/16 :goto_f

    .line 958
    .end local v128           #nextPage:I
    :pswitch_8
    const/4 v6, 0x1

    const/4 v13, 0x2

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 960
    .restart local v53       #previous:I
    if-lez v53, :cond_1d

    .line 961
    move/from16 v134, v53

    goto/16 :goto_f

    .line 988
    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    .end local v53           #previous:I
    .restart local v17       #url:Ljava/lang/StringBuilder;
    .restart local v22       #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    .restart local v112       #i$:Ljava/util/Iterator;
    .restart local v184       #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    .restart local v190       #vp:Lco/vine/android/api/VineParserReader;
    :cond_1e
    move-object/from16 v0, v184

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    .end local v17           #url:Ljava/lang/StringBuilder;
    const/16 v18, 0x2

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move/from16 v20, v0

    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move/from16 v21, v0

    move-object/from16 v16, v12

    invoke-virtual/range {v16 .. v22}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 991
    const-string v6, "count"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 992
    const-string v6, "next_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 993
    const-string v6, "previous_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 995
    .end local v22           #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v112           #i$:Ljava/util/Iterator;
    :cond_1f
    move-object/from16 v0, v184

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_20

    .line 996
    const/4 v6, 0x2

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    const-string v16, "order_id ASC"

    move-object/from16 v0, v16

    invoke-virtual {v12, v6, v13, v0}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;Ljava/lang/String;)V

    .end local v184           #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    :cond_20
    move-object/from16 v20, v190

    .line 1001
    .end local v190           #vp:Lco/vine/android/api/VineParserReader;
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    goto/16 :goto_0

    .line 1005
    .end local v10           #userId:J
    .end local v51           #pageType:I
    .end local v134           #page:I
    :sswitch_d
    const-string v6, "profile_id"

    const-wide/16 v26, 0x0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v6, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 1006
    .restart local v10       #userId:J
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 1007
    .restart local v51       #pageType:I
    const-string v6, "page"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v134

    .line 1009
    .restart local v134       #page:I
    packed-switch v51, :pswitch_data_4

    .line 1035
    :cond_21
    :goto_11
    const-wide/16 v26, 0x0

    cmp-long v6, v10, v26

    if-lez v6, :cond_1

    .line 1036
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "following"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1038
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1039
    const-string v6, "size"

    const/16 v13, 0xa

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1041
    const/4 v6, 0x3

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v190

    .line 1043
    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    .restart local v190       #vp:Lco/vine/android/api/VineParserReader;
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v190

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1046
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_24

    .line 1047
    invoke-virtual/range {v190 .. v190}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v184

    check-cast v184, Lco/vine/android/api/VinePagedData;

    .line 1048
    .restart local v184       #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-eqz v6, :cond_23

    .line 1049
    new-instance v22, Ljava/util/HashMap;

    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    move-object/from16 v0, v22

    invoke-direct {v0, v6}, Ljava/util/HashMap;-><init>(I)V

    .line 1051
    .restart local v22       #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v112

    .restart local v112       #i$:Ljava/util/Iterator;
    :goto_12
    invoke-interface/range {v112 .. v112}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_22

    invoke-interface/range {v112 .. v112}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v170

    check-cast v170, Lco/vine/android/api/VineUser;

    .line 1052
    .restart local v170       #u:Lco/vine/android/api/VineUser;
    move-object/from16 v0, v170

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->userId:J

    move-wide/from16 v26, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    move-object/from16 v0, v170

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->orderId:J

    move-wide/from16 v26, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v13

    move-object/from16 v0, v22

    invoke-virtual {v0, v6, v13}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_12

    .line 1011
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v22           #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v112           #i$:Ljava/util/Iterator;
    .end local v170           #u:Lco/vine/android/api/VineUser;
    .end local v184           #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    .end local v190           #vp:Lco/vine/android/api/VineParserReader;
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    :pswitch_9
    const/16 v134, 0x1

    .line 1012
    goto/16 :goto_11

    .line 1015
    :pswitch_a
    const/4 v6, 0x1

    const/4 v13, 0x1

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v128

    .line 1017
    .restart local v128       #nextPage:I
    if-lez v128, :cond_21

    .line 1018
    move/from16 v134, v128

    goto/16 :goto_11

    .line 1023
    .end local v128           #nextPage:I
    :pswitch_b
    const/4 v6, 0x1

    const/4 v13, 0x1

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 1025
    .restart local v53       #previous:I
    if-lez v53, :cond_21

    .line 1026
    move/from16 v134, v53

    goto/16 :goto_11

    .line 1054
    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    .end local v53           #previous:I
    .restart local v17       #url:Ljava/lang/StringBuilder;
    .restart local v22       #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    .restart local v112       #i$:Ljava/util/Iterator;
    .restart local v184       #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    .restart local v190       #vp:Lco/vine/android/api/VineParserReader;
    :cond_22
    move-object/from16 v0, v184

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v17, v0

    .end local v17           #url:Ljava/lang/StringBuilder;
    const/16 v18, 0x1

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v19

    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move/from16 v20, v0

    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move/from16 v21, v0

    move-object/from16 v16, v12

    invoke-virtual/range {v16 .. v22}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 1057
    const-string v6, "count"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1058
    const-string v6, "next_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1059
    const-string v6, "previous_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1061
    .end local v22           #orderMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/Long;Ljava/lang/Long;>;"
    .end local v112           #i$:Ljava/util/Iterator;
    :cond_23
    move-object/from16 v0, v184

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_24

    .line 1062
    const/4 v6, 0x1

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    const-string v16, "order_id ASC"

    move-object/from16 v0, v16

    invoke-virtual {v12, v6, v13, v0}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;Ljava/lang/String;)V

    .end local v184           #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    :cond_24
    move-object/from16 v20, v190

    .line 1067
    .end local v190           #vp:Lco/vine/android/api/VineParserReader;
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    goto/16 :goto_0

    .line 1071
    .end local v10           #userId:J
    .end local v51           #pageType:I
    .end local v134           #page:I
    :sswitch_e
    const-string v6, "s_owner_id"

    const-wide/16 v26, 0x0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v6, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v10

    .line 1072
    .restart local v10       #userId:J
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 1073
    .restart local v51       #pageType:I
    const-string v6, "page"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v134

    .line 1075
    .restart local v134       #page:I
    packed-switch v51, :pswitch_data_5

    .line 1101
    :cond_25
    :goto_13
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "friends"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1103
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1104
    const-string v6, "size"

    const/16 v13, 0xa

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1106
    const/4 v6, 0x3

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1107
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v31

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1111
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1112
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v184

    check-cast v184, Lco/vine/android/api/VinePagedData;

    .line 1113
    .restart local v184       #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-eqz v6, :cond_26

    .line 1114
    move-object/from16 v0, v184

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v24, v0

    .end local v24           #sessionOwnerId:J
    const/16 v25, 0xa

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move/from16 v27, v0

    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move/from16 v28, v0

    const/16 v29, 0x0

    move-object/from16 v23, v12

    invoke-virtual/range {v23 .. v29}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 1117
    const-string v6, "count"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1118
    const-string v6, "next_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1119
    const-string v6, "previous_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1121
    :cond_26
    move-object/from16 v0, v184

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_1

    .line 1122
    const/16 v6, 0xa

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    const-string v16, "order_id ASC"

    move-object/from16 v0, v16

    invoke-virtual {v12, v6, v13, v0}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1077
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v184           #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    .restart local v24       #sessionOwnerId:J
    :pswitch_c
    const/16 v134, 0x1

    .line 1078
    goto/16 :goto_13

    .line 1081
    :pswitch_d
    const/4 v6, 0x1

    const/16 v13, 0xa

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v128

    .line 1083
    .restart local v128       #nextPage:I
    if-lez v128, :cond_25

    .line 1084
    move/from16 v134, v128

    goto/16 :goto_13

    .line 1089
    .end local v128           #nextPage:I
    :pswitch_e
    const/4 v6, 0x1

    const/16 v13, 0xa

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 1091
    .restart local v53       #previous:I
    if-lez v53, :cond_25

    .line 1092
    move/from16 v134, v53

    goto/16 :goto_13

    .line 1130
    .end local v10           #userId:J
    .end local v51           #pageType:I
    .end local v53           #previous:I
    .end local v134           #page:I
    :sswitch_f
    const-string v6, "type"

    const/4 v13, -0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v26

    const-string v6, "size"

    const/16 v13, 0xa

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v27

    const-string v6, "profile_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v29

    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v31

    .end local v31           #key:Ljava/lang/String;
    move-object/from16 v23, p0

    move-object/from16 v28, v12

    move-object/from16 v32, p3

    invoke-direct/range {v23 .. v32}, Lco/vine/android/service/VineService;->getPosts(JIILco/vine/android/provider/VineDatabaseHelper;JILandroid/os/Bundle;)Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1134
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->getReader()Lco/vine/android/network/HttpOperationReader;

    move-result-object v20

    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    check-cast v20, Lco/vine/android/api/VineParserReader;

    .line 1135
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    goto/16 :goto_0

    .line 1138
    .restart local v31       #key:Ljava/lang/String;
    :sswitch_10
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 1139
    .restart local v14       #postId:J
    const-wide/16 v26, 0x0

    cmp-long v6, v14, v26

    if-lez v6, :cond_1

    .line 1140
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "timelines"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1142
    .restart local v17       #url:Ljava/lang/StringBuilder;
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/service/VineService;->limitCommentAndLikesIfNeeded(Ljava/lang/StringBuilder;)V

    .line 1143
    const/16 v6, 0x8

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1144
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1146
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1147
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v151

    check-cast v151, Lco/vine/android/api/VinePagedData;

    .line 1149
    .local v151, response:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    :try_start_7
    move-object/from16 v0, v151

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v27, v0

    const/16 v28, 0x7

    const-string v29, ""

    const/16 v30, 0x0

    const/16 v31, 0x0

    const/16 v32, 0x0

    const-wide/16 v33, 0x0

    const/16 v35, 0x1

    move-object/from16 v26, v12

    invoke-virtual/range {v26 .. v35}, Lco/vine/android/provider/VineDatabaseHelper;->mergePosts(Ljava/util/Collection;ILjava/lang/String;IIIJZ)Lco/vine/android/provider/DbResponse;
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto/16 :goto_0

    .line 1152
    .end local v31           #key:Ljava/lang/String;
    :catch_4
    move-exception v92

    .line 1153
    .local v92, e:Ljava/io/IOException;
    sget-boolean v6, Lco/vine/android/service/VineService;->LOGGABLE:Z

    if-eqz v6, :cond_1

    .line 1154
    invoke-virtual/range {v92 .. v92}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 1162
    .end local v14           #postId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v92           #e:Ljava/io/IOException;
    .end local v151           #response:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    .restart local v31       #key:Ljava/lang/String;
    :sswitch_11
    const-string v6, "post_id"

    const-wide/16 v26, 0x0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v6, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v27

    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v29

    const-string v6, "size"

    const/16 v13, 0xa

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v30

    move-object/from16 v26, p0

    move-object/from16 v32, p3

    move-object/from16 v33, v12

    invoke-direct/range {v26 .. v33}, Lco/vine/android/service/VineService;->getComments(JIILjava/lang/String;Landroid/os/Bundle;Lco/vine/android/provider/VineDatabaseHelper;)Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1166
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->getReader()Lco/vine/android/network/HttpOperationReader;

    move-result-object v20

    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    check-cast v20, Lco/vine/android/api/VineParserReader;

    .line 1167
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackGetComments()V

    goto/16 :goto_0

    .line 1171
    :sswitch_12
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "editions"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1174
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0x15

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1175
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1179
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_27

    .line 1180
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v94

    check-cast v94, Ljava/util/ArrayList;

    .line 1181
    .local v94, editions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    move-object/from16 v0, v94

    invoke-virtual {v12, v0}, Lco/vine/android/provider/VineDatabaseHelper;->mergeEditions(Ljava/util/ArrayList;)V

    .line 1182
    const-string v6, "editions"

    move-object/from16 v0, p3

    move-object/from16 v1, v94

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 1184
    .end local v94           #editions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    :cond_27
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackGetEditions()V

    goto/16 :goto_0

    .line 1188
    .end local v17           #url:Ljava/lang/StringBuilder;
    :sswitch_13
    const-string v6, "entities"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v40

    .line 1189
    .local v40, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v33

    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v35

    const-string v6, "username"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v37

    const-string v6, "comment"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v38

    const-string v6, "avatar_url"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v39

    move-object/from16 v32, p0

    move-object/from16 v41, v12

    invoke-direct/range {v32 .. v41}, Lco/vine/android/service/VineService;->postComment(JJLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Lco/vine/android/provider/VineDatabaseHelper;)Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1192
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->getReader()Lco/vine/android/network/HttpOperationReader;

    move-result-object v20

    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    check-cast v20, Lco/vine/android/api/VineParserReader;

    .line 1193
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackPostComment()V

    goto/16 :goto_0

    .line 1197
    .end local v40           #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :sswitch_14
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v26

    const-string v6, "comment_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p0

    move-wide/from16 v1, v26

    invoke-direct {v0, v1, v2, v6, v12}, Lco/vine/android/service/VineService;->deleteComment(JLjava/lang/String;Lco/vine/android/provider/VineDatabaseHelper;)Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1199
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->getReader()Lco/vine/android/network/HttpOperationReader;

    move-result-object v20

    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    check-cast v20, Lco/vine/android/api/VineParserReader;

    .line 1200
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackDeleteComment()V

    goto/16 :goto_0

    .line 1204
    :sswitch_15
    move-object/from16 v0, p0

    move-object/from16 v1, v31

    move-object/from16 v2, p3

    invoke-direct {v0, v1, v2}, Lco/vine/android/service/VineService;->getUsersMe(Ljava/lang/String;Landroid/os/Bundle;)Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1205
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->getReader()Lco/vine/android/network/HttpOperationReader;

    move-result-object v20

    .end local v20           #vp:Lco/vine/android/api/VineParserReader;
    check-cast v20, Lco/vine/android/api/VineParserReader;

    .line 1206
    .restart local v20       #vp:Lco/vine/android/api/VineParserReader;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/util/FlurryUtils;->trackGetUser(Z)V

    goto/16 :goto_0

    .line 1210
    :sswitch_16
    const-string v6, "key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v165

    .line 1211
    .local v165, twitterKey:Ljava/lang/String;
    const-string v6, "secret"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v166

    .line 1213
    .local v166, twitterSecret:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x5

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "following"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    const-string v18, "suggested"

    aput-object v18, v13, v16

    const/16 v16, 0x4

    const-string v18, "twitter"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1220
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x3

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1222
    new-instance v19, Ljava/util/ArrayList;

    const/4 v6, 0x2

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1223
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthToken"

    move-object/from16 v0, v165

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1224
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthSecret"

    move-object/from16 v0, v166

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1226
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1229
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1230
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Ljava/util/ArrayList;

    .line 1231
    .local v33, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    if-eqz v33, :cond_1

    invoke-virtual/range {v33 .. v33}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 1232
    const/16 v34, 0x6

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v35

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    move-object/from16 v32, v12

    invoke-virtual/range {v32 .. v38}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 1234
    const-string v6, "count"

    invoke-virtual/range {v33 .. v33}, Ljava/util/ArrayList;->size()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 1241
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v33           #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    .end local v165           #twitterKey:Ljava/lang/String;
    .end local v166           #twitterSecret:Ljava/lang/String;
    :sswitch_17
    const/16 v73, 0x0

    .line 1243
    .local v73, addressBook:Ljava/lang/String;
    :try_start_8
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/util/Util;->getAddressJson(Landroid/content/ContentResolver;)Ljava/lang/String;
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    move-result-object v73

    .line 1248
    :goto_14
    if-nez v73, :cond_28

    if-eqz v132, :cond_28

    .line 1249
    const/16 v6, 0x3e8

    move-object/from16 v0, v132

    iput v6, v0, Lco/vine/android/network/HttpOperation;->statusCode:I

    .line 1250
    new-instance v97, Lco/vine/android/api/VineError;

    .end local v97           #error:Lco/vine/android/api/VineError;
    const/16 v6, 0x3e8

    const-string v13, "Could not create json."

    move-object/from16 v0, v97

    invoke-direct {v0, v6, v13}, Lco/vine/android/api/VineError;-><init>(ILjava/lang/String;)V

    .line 1251
    .restart local v97       #error:Lco/vine/android/api/VineError;
    goto/16 :goto_0

    .line 1244
    :catch_5
    move-exception v92

    .line 1245
    .restart local v92       #e:Ljava/io/IOException;
    invoke-virtual/range {v92 .. v92}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_14

    .line 1254
    .end local v92           #e:Ljava/io/IOException;
    :cond_28
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x5

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "following"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    const-string v18, "suggested"

    aput-object v18, v13, v16

    const/16 v16, 0x4

    const-string v18, "contacts"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1261
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x3

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1263
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 1264
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "addressBook"

    move-object/from16 v0, v73

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1265
    invoke-static {}, Lco/vine/android/util/Util;->getLocale()Ljava/lang/String;

    move-result-object v115

    .line 1266
    .local v115, language:Ljava/lang/String;
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "locale"

    move-object/from16 v0, v115

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1268
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v18, v0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-static/range {v16 .. v21}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1272
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1273
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Ljava/util/ArrayList;

    .line 1274
    .restart local v33       #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    if-eqz v33, :cond_1

    invoke-virtual/range {v33 .. v33}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 1275
    const/16 v34, 0x7

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v35

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    move-object/from16 v32, v12

    invoke-virtual/range {v32 .. v38}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 1277
    const-string v6, "count"

    invoke-virtual/range {v33 .. v33}, Ljava/util/ArrayList;->size()I

    move-result v13

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 1283
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v33           #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    .end local v73           #addressBook:Ljava/lang/String;
    .end local v115           #language:Ljava/lang/String;
    :sswitch_18
    const-string v6, "type"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v12, v6}, Lco/vine/android/provider/VineDatabaseHelper;->removeUsersByGroup(I)V

    goto/16 :goto_0

    .line 1287
    :sswitch_19
    const-string v6, "follow_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v173

    .line 1288
    .local v173, userIdToFollow:J
    const-string v6, "notify"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v39

    .line 1289
    .local v39, notify:Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v173 .. v174}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "followers"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1292
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1294
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v34

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v39, v0

    .end local v39           #notify:Z
    move-object/from16 v35, v17

    move-object/from16 v38, v20

    invoke-static/range {v34 .. v39}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1298
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1301
    const/4 v6, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    const-string v16, "order_id ASC"

    move-object/from16 v0, v16

    invoke-virtual {v12, v6, v13, v0}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1308
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v173           #userIdToFollow:J
    :sswitch_1a
    const-string v6, "follow_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v181

    .line 1309
    .local v181, userToUnfollow:J
    const-string v6, "profile_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v87

    .line 1310
    .local v87, currentProfileId:J
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v71

    .line 1311
    .local v71, activeUserId:J
    const-string v6, "notify"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v39

    .line 1312
    .restart local v39       #notify:Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v181 .. v182}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "followers"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1315
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1317
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1321
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1322
    cmp-long v6, v87, v71

    if-nez v6, :cond_29

    const/16 v91, 0x1

    .line 1323
    .local v91, deleteRow:Z
    :goto_15
    move-wide/from16 v0, v181

    move/from16 v2, v91

    move/from16 v3, v39

    invoke-virtual {v12, v0, v1, v2, v3}, Lco/vine/android/provider/VineDatabaseHelper;->removeFollow(JZZ)I

    .line 1324
    const/4 v6, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    const-string v16, "order_id ASC"

    move-object/from16 v0, v16

    invoke-virtual {v12, v6, v13, v0}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1322
    .end local v91           #deleteRow:Z
    :cond_29
    const/16 v91, 0x0

    goto :goto_15

    .line 1331
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v39           #notify:Z
    .end local v71           #activeUserId:J
    .end local v87           #currentProfileId:J
    .end local v181           #userToUnfollow:J
    :sswitch_1b
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 1332
    .restart local v14       #postId:J
    const-string v6, "notify"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v130

    .line 1333
    .local v130, notify:Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "likes"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1335
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0xa

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1336
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v34

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v36, v0

    const/16 v37, 0x0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v39, v0

    move-object/from16 v35, v17

    move-object/from16 v38, v20

    invoke-static/range {v34 .. v39}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1339
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1340
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v118

    check-cast v118, Ljava/lang/Long;

    .line 1342
    .local v118, likeId:Ljava/lang/Long;
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v122

    .line 1343
    .local v122, meUserId:J
    const-string v6, "username"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1345
    .restart local v7       #username:Ljava/lang/String;
    new-instance v117, Lco/vine/android/api/VineLike;

    invoke-direct/range {v117 .. v117}, Lco/vine/android/api/VineLike;-><init>()V

    .line 1346
    .local v117, like:Lco/vine/android/api/VineLike;
    invoke-virtual/range {v118 .. v118}, Ljava/lang/Long;->longValue()J

    move-result-wide v26

    move-wide/from16 v0, v26

    move-object/from16 v2, v117

    iput-wide v0, v2, Lco/vine/android/api/VineLike;->likeId:J

    .line 1347
    move-wide/from16 v0, v122

    move-object/from16 v2, v117

    iput-wide v0, v2, Lco/vine/android/api/VineLike;->userId:J

    .line 1348
    move-object/from16 v0, v117

    iput-object v7, v0, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    .line 1349
    move-object/from16 v0, v117

    iput-wide v14, v0, Lco/vine/android/api/VineLike;->postId:J

    .line 1351
    move-object/from16 v0, v117

    move/from16 v1, v130

    invoke-virtual {v12, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->addLike(Lco/vine/android/api/VineLike;Z)I

    goto/16 :goto_0

    .line 1356
    .end local v7           #username:Ljava/lang/String;
    .end local v14           #postId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v117           #like:Lco/vine/android/api/VineLike;
    .end local v118           #likeId:Ljava/lang/Long;
    .end local v122           #meUserId:J
    .end local v130           #notify:Z
    :sswitch_1c
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 1357
    .restart local v14       #postId:J
    const-string v6, "notify"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v39

    .line 1358
    .restart local v39       #notify:Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "likes"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1360
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0xa

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1361
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1364
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    move-object/from16 v34, v12

    move-wide/from16 v35, v14

    move-wide/from16 v37, v24

    .line 1365
    invoke-virtual/range {v34 .. v39}, Lco/vine/android/provider/VineDatabaseHelper;->removeLike(JJZ)I

    goto/16 :goto_0

    .line 1370
    .end local v14           #postId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v39           #notify:Z
    :sswitch_1d
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 1371
    .restart local v14       #postId:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "repost"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1373
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0x13

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1374
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v41

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v43, v0

    const/16 v44, 0x0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v46, v0

    move-object/from16 v42, v17

    move-object/from16 v45, v20

    invoke-static/range {v41 .. v46}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1377
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1378
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v145

    check-cast v145, Lco/vine/android/api/VineRepost;

    .line 1379
    .local v145, repost:Lco/vine/android/api/VineRepost;
    const-string v6, "username"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1381
    .restart local v7       #username:Ljava/lang/String;
    move-wide/from16 v0, v24

    move-object/from16 v2, v145

    iput-wide v0, v2, Lco/vine/android/api/VineRepost;->userId:J

    .line 1382
    move-object/from16 v0, v145

    iput-object v7, v0, Lco/vine/android/api/VineRepost;->username:Ljava/lang/String;

    .line 1384
    const-string v6, "repost"

    move-object/from16 v0, p3

    move-object/from16 v1, v145

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 1386
    const/4 v6, 0x0

    move-object/from16 v0, v145

    move-wide/from16 v1, v24

    invoke-virtual {v12, v0, v1, v2, v6}, Lco/vine/android/provider/VineDatabaseHelper;->revine(Lco/vine/android/api/VineRepost;JZ)I

    goto/16 :goto_0

    .line 1391
    .end local v7           #username:Ljava/lang/String;
    .end local v14           #postId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v145           #repost:Lco/vine/android/api/VineRepost;
    :sswitch_1e
    const-string v6, "following"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v46

    .line 1392
    .local v46, following:Z
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 1393
    .restart local v14       #postId:J
    const-string v6, "repost_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v146

    .line 1394
    .local v146, repostId:J
    const-string v6, "notify"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v39

    .line 1395
    .restart local v39       #notify:Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "repost"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    invoke-static/range {v146 .. v147}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1397
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1399
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1402
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    move-object/from16 v41, v12

    move-wide/from16 v42, v14

    move-wide/from16 v44, v24

    move/from16 v47, v39

    .line 1403
    invoke-virtual/range {v41 .. v47}, Lco/vine/android/provider/VineDatabaseHelper;->unRevine(JJZZ)I

    goto/16 :goto_0

    .line 1408
    .end local v14           #postId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v39           #notify:Z
    .end local v46           #following:Z
    .end local v146           #repostId:J
    :sswitch_1f
    const-string v6, "post_id"

    const-wide/16 v26, 0x0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v6, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v14

    .line 1409
    .restart local v14       #postId:J
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 1410
    .restart local v51       #pageType:I
    const-string v6, "page"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v134

    .line 1412
    .restart local v134       #page:I
    packed-switch v51, :pswitch_data_6

    .line 1439
    :cond_2a
    :goto_16
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "reposts"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1442
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1443
    const-string v6, "size"

    const/16 v13, 0x14

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1445
    const/4 v6, 0x3

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1446
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1450
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1451
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v184

    check-cast v184, Lco/vine/android/api/VinePagedData;

    .line 1452
    .restart local v184       #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, v184

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v48, v0

    const/16 v49, 0x9

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v50

    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move/from16 v51, v0

    .end local v51           #pageType:I
    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move/from16 v52, v0

    const/16 v53, 0x0

    move-object/from16 v47, v12

    invoke-virtual/range {v47 .. v53}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 1454
    const-string v6, "count"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1455
    const-string v6, "next_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1456
    const-string v6, "previous_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1458
    move-object/from16 v0, v184

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_1

    .line 1459
    const/16 v6, 0x9

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v6, v13}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 1414
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v184           #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    .restart local v51       #pageType:I
    :pswitch_f
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackSeeReviners()V

    .line 1415
    const/16 v134, 0x1

    .line 1416
    goto/16 :goto_16

    .line 1419
    :pswitch_10
    const/4 v6, 0x1

    const/16 v13, 0x9

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v128

    .line 1421
    .restart local v128       #nextPage:I
    if-lez v128, :cond_2a

    .line 1422
    move/from16 v134, v128

    goto/16 :goto_16

    .line 1427
    .end local v128           #nextPage:I
    :pswitch_11
    const/4 v6, 0x1

    const/16 v13, 0x9

    invoke-static {v14, v15}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 1429
    .restart local v53       #previous:I
    if-lez v53, :cond_2a

    .line 1430
    move/from16 v134, v53

    goto/16 :goto_16

    .line 1466
    .end local v14           #postId:J
    .end local v51           #pageType:I
    .end local v53           #previous:I
    .end local v134           #page:I
    :sswitch_20
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 1467
    .restart local v51       #pageType:I
    const-string v6, "follow_reqs"

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v109

    .line 1468
    .local v109, getFollowRequests:Z
    const/16 v134, 0x1

    .line 1469
    .restart local v134       #page:I
    packed-switch v51, :pswitch_data_7

    .line 1488
    :cond_2b
    :goto_17
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "notifications"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1491
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v13, "clear"

    const-string v6, "clear"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2d

    const/4 v6, 0x1

    :goto_18
    move-object/from16 v0, v17

    invoke-static {v0, v13, v6}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1492
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1493
    const-string v6, "size"

    const/16 v13, 0x14

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1495
    const/16 v6, 0x9

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1497
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1500
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1501
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v153

    check-cast v153, Lco/vine/android/api/VinePagedData;

    .line 1502
    .local v153, results:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineNotification;>;"
    move-object/from16 v0, v153

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v129, v0

    .line 1503
    .local v129, notifs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineNotification;>;"
    move-object/from16 v0, v153

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, v153

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, v129

    invoke-virtual {v12, v0, v6, v13}, Lco/vine/android/provider/VineDatabaseHelper;->mergeActivity(Ljava/util/Collection;II)I

    .line 1505
    if-eqz v109, :cond_2c

    .line 1506
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "notifications"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    const-string v18, "followRequests"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v105

    .line 1510
    .local v105, followUrl:Ljava/lang/StringBuilder;
    const-string v6, "page"

    const/4 v13, 0x1

    move-object/from16 v0, v105

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1511
    const-string v6, "size"

    const/16 v13, 0x14

    move-object/from16 v0, v105

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1513
    const/16 v6, 0x9

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v106

    .line 1516
    .local v106, followVp:Lco/vine/android/api/VineParserReader;
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v105

    move-object/from16 v1, v106

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v104

    .line 1520
    .local v104, followOp:Lco/vine/android/network/HttpOperation;
    invoke-virtual/range {v104 .. v104}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_2c

    .line 1521
    invoke-virtual/range {v106 .. v106}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v103

    check-cast v103, Lco/vine/android/api/VinePagedData;

    .line 1523
    .local v103, followNotifs:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineNotification;>;"
    move-object/from16 v0, v103

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    const/4 v13, 0x0

    const/16 v16, 0x0

    move/from16 v0, v16

    invoke-virtual {v12, v6, v13, v0}, Lco/vine/android/provider/VineDatabaseHelper;->mergeActivity(Ljava/util/Collection;II)I

    .line 1524
    const-string v6, "follow_reqs_c"

    move-object/from16 v0, v103

    iget v13, v0, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1528
    .end local v103           #followNotifs:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineNotification;>;"
    .end local v104           #followOp:Lco/vine/android/network/HttpOperation;
    .end local v105           #followUrl:Ljava/lang/StringBuilder;
    .end local v106           #followVp:Lco/vine/android/api/VineParserReader;
    :cond_2c
    move-object/from16 v0, v153

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_1

    .line 1529
    invoke-virtual {v12}, Lco/vine/android/provider/VineDatabaseHelper;->markLastActivity()V

    goto/16 :goto_0

    .line 1472
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v129           #notifs:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineNotification;>;"
    .end local v153           #results:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineNotification;>;"
    :pswitch_12
    const/16 v134, 0x1

    .line 1473
    goto/16 :goto_17

    .line 1476
    :pswitch_13
    const/4 v6, 0x3

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 1478
    .restart local v53       #previous:I
    if-lez v53, :cond_2b

    .line 1479
    move/from16 v134, v53

    goto/16 :goto_17

    .line 1491
    .end local v53           #previous:I
    .restart local v17       #url:Ljava/lang/StringBuilder;
    :cond_2d
    const/4 v6, 0x0

    goto/16 :goto_18

    .line 1535
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v51           #pageType:I
    .end local v109           #getFollowRequests:Z
    .end local v134           #page:I
    :sswitch_21
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 1536
    .restart local v10       #userId:J
    cmp-long v6, v10, v24

    if-eqz v6, :cond_2e

    const/4 v6, 0x1

    :goto_19
    invoke-static {v6}, Lco/vine/android/util/FlurryUtils;->trackGetUser(Z)V

    .line 1537
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "profiles"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1540
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x2

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1541
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1544
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1545
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v171

    check-cast v171, Lco/vine/android/api/VineUser;

    .line 1546
    .restart local v171       #user:Lco/vine/android/api/VineUser;
    const-string v6, "user"

    move-object/from16 v0, p3

    move-object/from16 v1, v171

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto/16 :goto_0

    .line 1536
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v171           #user:Lco/vine/android/api/VineUser;
    :cond_2e
    const/4 v6, 0x0

    goto :goto_19

    .line 1551
    .end local v10           #userId:J
    :sswitch_22
    new-instance v19, Ljava/util/ArrayList;

    const/4 v6, 0x1

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1553
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "edition"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1555
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "edition"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v93

    .line 1556
    .local v93, edition:Ljava/lang/String;
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "edition"

    move-object/from16 v0, v93

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1557
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1558
    invoke-static/range {p0 .. p0}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1561
    goto/16 :goto_0

    .line 1564
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v93           #edition:Ljava/lang/String;
    :sswitch_23
    const-string v6, "uri"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v78

    check-cast v78, Landroid/net/Uri;

    .line 1565
    .local v78, avatarUri:Landroid/net/Uri;
    const/16 v100, 0x0

    .line 1566
    .local v100, f:Ljava/lang/String;
    invoke-static/range {v86 .. v86}, Lco/vine/android/client/Amazon;->getBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v138

    .line 1567
    .restart local v138       #pictureBucket:Ljava/lang/String;
    if-eqz v78, :cond_2f

    .line 1569
    :try_start_9
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mMediaUtility:Lco/vine/android/util/MediaUtility;

    move-object/from16 v0, v78

    move-object/from16 v1, v138

    move-object/from16 v2, v86

    invoke-virtual {v6, v0, v1, v2}, Lco/vine/android/util/MediaUtility;->getPhotoUri(Landroid/net/Uri;Ljava/lang/String;Landroid/content/Context;)Ljava/lang/String;
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_6

    move-result-object v100

    .line 1577
    :cond_2f
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1580
    .restart local v17       #url:Ljava/lang/StringBuilder;
    new-instance v19, Ljava/util/ArrayList;

    if-nez v78, :cond_33

    const/4 v6, 0x5

    :goto_1a
    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1583
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "username"

    const-string v16, "a_name"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1584
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "description"

    const-string v16, "desc"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1586
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "location"

    const-string v16, "location"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1589
    if-eqz v78, :cond_34

    invoke-virtual/range {v78 .. v78}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_34

    .line 1590
    const-string v102, ""

    .line 1607
    .restart local v102       #finalAvatarUrl:Ljava/lang/String;
    :goto_1b
    if-eqz v78, :cond_30

    .line 1608
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "avatarUrl"

    move-object/from16 v0, v102

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1611
    :cond_30
    const-string v6, "email"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v95

    .line 1612
    .restart local v95       #email:Ljava/lang/String;
    invoke-static/range {v95 .. v95}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_31

    .line 1613
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "email"

    move-object/from16 v0, v95

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1616
    :cond_31
    const-string v6, "phone"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v137

    .line 1617
    .restart local v137       #phone:Ljava/lang/String;
    invoke-static/range {v137 .. v137}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_32

    .line 1618
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "phoneNumber"

    const-string v16, "phone"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1621
    :cond_32
    const/4 v6, 0x2

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1622
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1625
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1626
    if-nez v78, :cond_35

    .line 1627
    const-string v6, "avatar_url"

    const-string v13, ""

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1570
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v95           #email:Ljava/lang/String;
    .end local v102           #finalAvatarUrl:Ljava/lang/String;
    .end local v137           #phone:Ljava/lang/String;
    :catch_6
    move-exception v92

    .line 1571
    .local v92, e:Ljava/lang/Exception;
    const/16 v159, 0x384

    .line 1572
    invoke-virtual/range {v92 .. v92}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v143

    .line 1573
    goto/16 :goto_0

    .line 1580
    .end local v92           #e:Ljava/lang/Exception;
    .restart local v17       #url:Ljava/lang/StringBuilder;
    :cond_33
    const/4 v6, 0x6

    goto/16 :goto_1a

    .line 1592
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    :cond_34
    invoke-static/range {v86 .. v86}, Lco/vine/android/util/MediaUtility;->getUploadType(Landroid/content/Context;)I

    move-result v125

    .line 1593
    .restart local v125       #mode:I
    packed-switch v125, :pswitch_data_8

    .line 1601
    move-object/from16 v102, v100

    .restart local v102       #finalAvatarUrl:Ljava/lang/String;
    goto/16 :goto_1b

    .line 1595
    .end local v102           #finalAvatarUrl:Ljava/lang/String;
    :pswitch_14
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v13}, Lco/vine/android/client/VineAPI;->getAmazonUrl()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "/"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v138

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v13, "/"

    invoke-virtual {v6, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, v100

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v102

    .line 1597
    .restart local v102       #finalAvatarUrl:Ljava/lang/String;
    goto/16 :goto_1b

    .line 1629
    .end local v125           #mode:I
    .restart local v95       #email:Ljava/lang/String;
    .restart local v137       #phone:Ljava/lang/String;
    :cond_35
    const-string v6, "avatar_url"

    move-object/from16 v0, p3

    move-object/from16 v1, v102

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1635
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v78           #avatarUri:Landroid/net/Uri;
    .end local v95           #email:Ljava/lang/String;
    .end local v100           #f:Ljava/lang/String;
    .end local v102           #finalAvatarUrl:Ljava/lang/String;
    .end local v137           #phone:Ljava/lang/String;
    .end local v138           #pictureBucket:Ljava/lang/String;
    :sswitch_24
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackReportPost()V

    .line 1636
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 1637
    .restart local v14       #postId:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "complaints"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1639
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1641
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v47

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v49, v0

    const/16 v50, 0x0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v52, v0

    move-object/from16 v48, v17

    move-object/from16 v51, v20

    invoke-static/range {v47 .. v52}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1644
    goto/16 :goto_0

    .line 1647
    .end local v14           #postId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    :sswitch_25
    const-string v6, "time"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v26

    move-wide/from16 v0, v26

    invoke-virtual {v12, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->cleanUp(J)I

    goto/16 :goto_0

    .line 1651
    :sswitch_26
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 1652
    .restart local v14       #postId:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1654
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1655
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1658
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1659
    invoke-virtual {v12, v14, v15}, Lco/vine/android/provider/VineDatabaseHelper;->deletePost(J)I

    goto/16 :goto_0

    .line 1664
    .end local v14           #postId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    :sswitch_27
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackConnectTwitter()V

    .line 1665
    const-string v6, "key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v163

    .line 1666
    .local v163, token:Ljava/lang/String;
    const-string v6, "secret"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v155

    .line 1667
    .restart local v155       #secret:Ljava/lang/String;
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 1668
    .restart local v10       #userId:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1670
    .restart local v17       #url:Ljava/lang/StringBuilder;
    new-instance v19, Ljava/util/ArrayList;

    const/4 v6, 0x3

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1671
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthToken"

    move-object/from16 v0, v163

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1672
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthSecret"

    move-object/from16 v0, v155

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1673
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterId"

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1674
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1676
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1678
    goto/16 :goto_0

    .line 1681
    .end local v10           #userId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v155           #secret:Ljava/lang/String;
    .end local v163           #token:Ljava/lang/String;
    :sswitch_28
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackDisConnectTwitter()V

    .line 1682
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1684
    .restart local v17       #url:Ljava/lang/StringBuilder;
    new-instance v19, Ljava/util/ArrayList;

    const/4 v6, 0x3

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1685
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthToken"

    const-string v16, ""

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1686
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterOauthSecret"

    const-string v16, ""

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1687
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "twitterId"

    const-string v16, ""

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1688
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1689
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1691
    goto/16 :goto_0

    .line 1694
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    :sswitch_29
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 1695
    .restart local v10       #userId:J
    const/4 v6, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v10, v11, v6, v13}, Lco/vine/android/provider/VineDatabaseHelper;->removePostsFromGroupByUser(JILjava/lang/String;)I

    goto/16 :goto_0

    .line 1700
    .end local v10           #userId:J
    :sswitch_2a
    invoke-direct/range {p0 .. p0}, Lco/vine/android/service/VineService;->getClientProfile()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1701
    goto/16 :goto_0

    .line 1704
    :sswitch_2b
    const-string v6, "post_share_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v139

    .line 1705
    .local v139, postShareId:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "timelines"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "s"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    aput-object v139, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1708
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0x8

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1709
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1713
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1714
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v151

    check-cast v151, Lco/vine/android/api/VinePagedData;

    .line 1715
    .restart local v151       #response:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    move-object/from16 v0, v151

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v114, v0

    .line 1716
    .local v114, items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    invoke-virtual/range {v114 .. v114}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 1717
    const-string v13, "post_id"

    const/4 v6, 0x0

    move-object/from16 v0, v114

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lco/vine/android/api/VinePost;

    iget-wide v0, v6, Lco/vine/android/api/VinePost;->postId:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v13, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_0

    .line 1723
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v114           #items:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v139           #postShareId:Ljava/lang/String;
    .end local v151           #response:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    :sswitch_2c
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackConnectFacebook()V

    .line 1724
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1727
    .restart local v17       #url:Ljava/lang/StringBuilder;
    new-instance v19, Ljava/util/ArrayList;

    const/4 v6, 0x3

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 1728
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "facebookOauthToken"

    const-string v16, "facebook_token"

    move-object/from16 v0, p3

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1731
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1732
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1736
    const-string v13, "Send facebook token result {}."

    if-eqz v132, :cond_36

    move-object/from16 v0, v132

    iget v6, v0, Lco/vine/android/network/HttpOperation;->statusCode:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    :goto_1c
    invoke-static {v13, v6}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1738
    if-eqz v132, :cond_1

    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1739
    const/4 v6, 0x0

    move-object/from16 v0, p0

    invoke-static {v0, v6}, Lco/vine/android/client/AppController;->setPendingFacebookToken(Landroid/content/Context;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_36
    move-object/from16 v6, v132

    .line 1736
    goto :goto_1c

    .line 1744
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    :sswitch_2d
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-static/range {v86 .. v86}, Lco/vine/android/util/BuildUtil;->get(Landroid/content/Context;)Lco/vine/android/util/BuildUtil;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/util/BuildUtil;->getStatusUrl()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v17

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1745
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0xf

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1746
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v1, v13}, Lco/vine/android/network/HttpOperation;->createGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1748
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1749
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v158

    check-cast v158, Lco/vine/android/api/ServerStatus;

    .line 1750
    .local v158, ss:Lco/vine/android/api/ServerStatus;
    const-string v6, "server_status"

    move-object/from16 v0, p3

    move-object/from16 v1, v158

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto/16 :goto_0

    .line 1755
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v158           #ss:Lco/vine/android/api/ServerStatus;
    :sswitch_2e
    const-string v6, "q"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v142

    .line 1756
    .local v142, query:Ljava/lang/String;
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 1757
    .restart local v51       #pageType:I
    const-string v6, "page"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v134

    .line 1759
    .restart local v134       #page:I
    packed-switch v51, :pswitch_data_9

    .line 1785
    :cond_37
    :goto_1d
    invoke-static/range {v142 .. v142}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 1787
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackSearchUsers()V

    .line 1789
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "search"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    aput-object v142, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1791
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1792
    const-string v6, "size"

    const/16 v13, 0x32

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1794
    const/4 v6, 0x3

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1795
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v31

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1799
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1800
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v184

    check-cast v184, Lco/vine/android/api/VinePagedData;

    .line 1801
    .restart local v184       #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-eqz v6, :cond_38

    .line 1802
    move-object/from16 v0, v184

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v48, v0

    const/16 v49, 0x8

    const/16 v50, 0x0

    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move/from16 v51, v0

    .end local v51           #pageType:I
    move-object/from16 v0, v184

    iget v0, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move/from16 v52, v0

    const/16 v53, 0x0

    move-object/from16 v47, v12

    invoke-virtual/range {v47 .. v53}, Lco/vine/android/provider/VineDatabaseHelper;->mergeUsers(Ljava/util/Collection;ILjava/lang/String;IILjava/util/Map;)I

    .line 1804
    const-string v6, "count"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1805
    const-string v6, "next_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1806
    const-string v6, "previous_page"

    move-object/from16 v0, v184

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1808
    :cond_38
    move-object/from16 v0, v184

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_1

    .line 1809
    const/16 v6, 0x8

    const/4 v13, 0x0

    const-string v16, "_id DESC"

    move-object/from16 v0, v16

    invoke-virtual {v12, v6, v13, v0}, Lco/vine/android/provider/VineDatabaseHelper;->markLastUser(ILjava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1761
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v184           #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    .restart local v51       #pageType:I
    :pswitch_15
    const/16 v134, 0x1

    .line 1762
    goto/16 :goto_1d

    .line 1765
    :pswitch_16
    const/4 v6, 0x1

    const/16 v13, 0x8

    const/16 v16, 0x0

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v128

    .line 1767
    .restart local v128       #nextPage:I
    if-lez v128, :cond_37

    .line 1768
    move/from16 v134, v128

    goto/16 :goto_1d

    .line 1773
    .end local v128           #nextPage:I
    :pswitch_17
    const/4 v6, 0x1

    const/16 v13, 0x8

    const/16 v16, 0x0

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 1775
    .restart local v53       #previous:I
    if-lez v53, :cond_37

    .line 1776
    move/from16 v134, v53

    goto/16 :goto_1d

    .line 1816
    .end local v51           #pageType:I
    .end local v53           #previous:I
    .end local v134           #page:I
    .end local v142           #query:Ljava/lang/String;
    :sswitch_2f
    const-string v6, "posts"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v48

    .line 1817
    .local v48, posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    const-string v6, "type"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v49

    .line 1818
    .local v49, groupType:I
    const-string v6, "tag_name"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v50

    .line 1819
    .local v50, tag:Ljava/lang/String;
    const-string v6, "page_type"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v51

    .line 1820
    .restart local v51       #pageType:I
    const-string v6, "next_page"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v52

    .line 1821
    .local v52, next:I
    const-string v6, "previous_page"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v53

    .line 1822
    .restart local v53       #previous:I
    const-string v6, "time"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v54

    .line 1823
    .local v54, anchor:J
    const-string v6, "user_init"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v56

    .line 1824
    .local v56, userInitiated:Z
    if-eqz v48, :cond_1

    move-object/from16 v47, v12

    .line 1826
    :try_start_a
    invoke-virtual/range {v47 .. v56}, Lco/vine/android/provider/VineDatabaseHelper;->mergePosts(Ljava/util/Collection;ILjava/lang/String;IIIJZ)Lco/vine/android/provider/DbResponse;

    .line 1828
    if-gtz v52, :cond_1

    .line 1829
    move/from16 v0, v49

    move-object/from16 v1, v50

    invoke-virtual {v12, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->markLastPost(ILjava/lang/String;)V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7

    goto/16 :goto_0

    .line 1831
    :catch_7
    move-exception v92

    .line 1832
    .local v92, e:Ljava/io/IOException;
    invoke-virtual/range {v92 .. v92}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_0

    .line 1838
    .end local v48           #posts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VinePost;>;"
    .end local v49           #groupType:I
    .end local v50           #tag:Ljava/lang/String;
    .end local v51           #pageType:I
    .end local v52           #next:I
    .end local v53           #previous:I
    .end local v54           #anchor:J
    .end local v56           #userInitiated:Z
    .end local v92           #e:Ljava/io/IOException;
    :sswitch_30
    const-string v6, "q"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v142

    .line 1839
    .restart local v142       #query:Ljava/lang/String;
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 1840
    .restart local v51       #pageType:I
    const-string v6, "page"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v134

    .line 1842
    .restart local v134       #page:I
    packed-switch v51, :pswitch_data_a

    .line 1866
    :cond_39
    :goto_1e
    invoke-static/range {v142 .. v142}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 1868
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackSearchTags()V

    .line 1870
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "tags"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "search"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    aput-object v142, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1872
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1873
    const-string v6, "size"

    const/16 v13, 0x32

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 1875
    const/16 v6, 0xe

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1876
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v31

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1880
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1881
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v162

    check-cast v162, Lco/vine/android/api/VinePagedData;

    .line 1882
    .local v162, tags:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineTag;>;"
    move-object/from16 v0, v162

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-eqz v6, :cond_3a

    .line 1883
    move-object/from16 v0, v162

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v0, v162

    iget v13, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, v162

    iget v0, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-virtual {v12, v6, v13, v0}, Lco/vine/android/provider/VineDatabaseHelper;->mergeSearchedTags(Ljava/util/Collection;II)I

    .line 1884
    const-string v6, "count"

    move-object/from16 v0, v162

    iget v13, v0, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1885
    const-string v6, "next_page"

    move-object/from16 v0, v162

    iget v13, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1886
    const-string v6, "previous_page"

    move-object/from16 v0, v162

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 1888
    :cond_3a
    move-object/from16 v0, v162

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_1

    .line 1889
    invoke-virtual {v12}, Lco/vine/android/provider/VineDatabaseHelper;->markLastTag()V

    goto/16 :goto_0

    .line 1844
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v162           #tags:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineTag;>;"
    :pswitch_18
    const/16 v134, 0x1

    .line 1845
    goto/16 :goto_1e

    .line 1848
    :pswitch_19
    const/4 v6, 0x4

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getNextPageCursor(IILjava/lang/String;Z)I

    move-result v128

    .line 1849
    .restart local v128       #nextPage:I
    if-lez v128, :cond_39

    .line 1850
    move/from16 v134, v128

    goto/16 :goto_1e

    .line 1855
    .end local v128           #nextPage:I
    :pswitch_1a
    const/4 v6, 0x4

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 1856
    .restart local v53       #previous:I
    if-lez v53, :cond_39

    .line 1857
    move/from16 v134, v53

    goto/16 :goto_1e

    .line 1895
    .end local v51           #pageType:I
    .end local v53           #previous:I
    .end local v134           #page:I
    .end local v142           #query:Ljava/lang/String;
    :sswitch_31
    const-string v6, "notify"

    const/4 v13, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v39

    .line 1896
    .restart local v39       #notify:Z
    move/from16 v0, v39

    invoke-virtual {v12, v0}, Lco/vine/android/provider/VineDatabaseHelper;->clearCachedData(Z)V

    .line 1897
    const/16 v159, 0xc8

    .line 1898
    goto/16 :goto_0

    .line 1901
    .end local v39           #notify:Z
    :sswitch_32
    invoke-virtual {v12}, Lco/vine/android/provider/VineDatabaseHelper;->clearAllData()V

    .line 1902
    const/16 v159, 0xc8

    .line 1903
    goto/16 :goto_0

    .line 1906
    :sswitch_33
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 1907
    .restart local v10       #userId:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "blocked"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1910
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0x11

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1911
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v31

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1915
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1916
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v79

    check-cast v79, Ljava/util/ArrayList;

    .line 1917
    .local v79, blockedUsers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    const-string v6, "blocked_users"

    move-object/from16 v0, p3

    move-object/from16 v1, v79

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto/16 :goto_0

    .line 1923
    .end local v10           #userId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v79           #blockedUsers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    :sswitch_34
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackBlockUser()V

    .line 1924
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v89

    .line 1925
    .local v89, currentUserId:J
    const-string v6, "block_user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v175

    .line 1926
    .local v175, userToBlock:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v89 .. v90}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "blocked"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    invoke-static/range {v175 .. v176}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1929
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1930
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v57

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v59, v0

    const/16 v60, 0x0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v62, v0

    move-object/from16 v58, v17

    move-object/from16 v61, v20

    invoke-static/range {v57 .. v62}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1934
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1935
    sget-object v6, Lco/vine/android/api/VineParsers$API_RESPONSE;->SUCCESS:Lco/vine/android/api/VineParsers$API_RESPONSE;

    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v6, v13}, Lco/vine/android/api/VineParsers$API_RESPONSE;->equals(Ljava/lang/Object;)Z

    move-result v172

    .line 1936
    .local v172, userBlocked:Z
    const-string v6, "response_success"

    move-object/from16 v0, p3

    move/from16 v1, v172

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1941
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v89           #currentUserId:J
    .end local v172           #userBlocked:Z
    .end local v175           #userToBlock:J
    :sswitch_35
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackUnBlockUser()V

    .line 1942
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v89

    .line 1943
    .restart local v89       #currentUserId:J
    const-string v6, "block_user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v179

    .line 1944
    .local v179, userToUnblock:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v89 .. v90}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "blocked"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    invoke-static/range {v179 .. v180}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1947
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1948
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1952
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1953
    sget-object v6, Lco/vine/android/api/VineParsers$API_RESPONSE;->SUCCESS:Lco/vine/android/api/VineParsers$API_RESPONSE;

    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v6, v13}, Lco/vine/android/api/VineParsers$API_RESPONSE;->equals(Ljava/lang/Object;)Z

    move-result v183

    .line 1954
    .local v183, userUnblocked:Z
    const-string v6, "response_success"

    move-object/from16 v0, p3

    move/from16 v1, v183

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 1959
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v89           #currentUserId:J
    .end local v179           #userToUnblock:J
    .end local v183           #userUnblocked:Z
    :sswitch_36
    invoke-static {}, Lco/vine/android/util/FlurryUtils;->trackReportUser()V

    .line 1960
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v177

    .line 1961
    .local v177, userToReport:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v177 .. v178}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "complaints"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1964
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1965
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v57

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v59, v0

    const/16 v60, 0x0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v62, v0

    move-object/from16 v58, v17

    move-object/from16 v61, v20

    invoke-static/range {v57 .. v62}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1968
    goto/16 :goto_0

    .line 1971
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v177           #userToReport:J
    :sswitch_37
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v107

    .line 1972
    .local v107, followerId:J
    const-string v6, "accept"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v68

    .line 1973
    .local v68, accept:Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x5

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "followers"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    const-string v18, "requests"

    aput-object v18, v13, v16

    const/16 v16, 0x4

    invoke-static/range {v107 .. v108}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1976
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1977
    if-eqz v68, :cond_3b

    .line 1978
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    const/16 v16, 0x0

    move-object/from16 v0, v17

    move-object/from16 v1, v16

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 1986
    :goto_1f
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1987
    move-wide/from16 v0, v107

    invoke-virtual {v12, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->removeFollowRequest(J)V

    goto/16 :goto_0

    .line 1982
    :cond_3b
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    goto :goto_1f

    .line 1992
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v68           #accept:Z
    .end local v107           #followerId:J
    :sswitch_38
    const-string v6, "explicit"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v99

    .line 1993
    .local v99, explicit:Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "explicit"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 1995
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 1997
    if-eqz v99, :cond_3c

    .line 1998
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v57

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v59, v0

    const/16 v60, 0x0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v62, v0

    move-object/from16 v58, v17

    move-object/from16 v61, v20

    invoke-static/range {v57 .. v62}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2005
    :goto_20
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    goto/16 :goto_0

    .line 2002
    :cond_3c
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v132

    goto :goto_20

    .line 2009
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v99           #explicit:Z
    :sswitch_39
    const-string v6, "priv"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v141

    .line 2010
    .local v141, priv:Z
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2012
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2013
    new-instance v19, Ljava/util/ArrayList;

    const/4 v6, 0x1

    move-object/from16 v0, v19

    invoke-direct {v0, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 2015
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v13, Lorg/apache/http/message/BasicNameValuePair;

    const-string v16, "private"

    if-eqz v141, :cond_3d

    const-string v6, "1"

    :goto_21
    move-object/from16 v0, v16

    invoke-direct {v13, v0, v6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2016
    invoke-static/range {p0 .. p0}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2019
    goto/16 :goto_0

    .line 2015
    :cond_3d
    const-string v6, "0"

    goto :goto_21

    .line 2022
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v141           #priv:Z
    :sswitch_3a
    const-string v6, "page_type"

    const/4 v13, 0x1

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v51

    .line 2023
    .restart local v51       #pageType:I
    const/16 v134, 0x1

    .line 2024
    .restart local v134       #page:I
    packed-switch v51, :pswitch_data_b

    .line 2043
    :cond_3e
    :goto_22
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "channels"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "featured"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2045
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "page"

    move-object/from16 v0, v17

    move/from16 v1, v134

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 2047
    const/16 v6, 0x12

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2048
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2051
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2052
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v152

    check-cast v152, Lco/vine/android/api/VinePagedData;

    .line 2053
    .local v152, results:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineChannel;>;"
    move-object/from16 v0, v152

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v83, v0

    .line 2054
    .local v83, channels:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineChannel;>;"
    move-object/from16 v0, v152

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    move-object/from16 v0, v152

    iget v13, v0, Lco/vine/android/api/VinePagedData;->previousPage:I

    move-object/from16 v0, v83

    invoke-virtual {v12, v0, v6, v13}, Lco/vine/android/provider/VineDatabaseHelper;->mergeChannels(Ljava/util/Collection;II)I

    .line 2056
    move-object/from16 v0, v152

    iget v6, v0, Lco/vine/android/api/VinePagedData;->nextPage:I

    if-gtz v6, :cond_1

    .line 2057
    invoke-virtual {v12}, Lco/vine/android/provider/VineDatabaseHelper;->markLastChannel()V

    goto/16 :goto_0

    .line 2027
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v83           #channels:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineChannel;>;"
    .end local v152           #results:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineChannel;>;"
    :pswitch_1b
    const/16 v134, 0x1

    .line 2028
    goto :goto_22

    .line 2031
    :pswitch_1c
    const/4 v6, 0x2

    const/4 v13, 0x0

    const/16 v16, 0x0

    const/16 v18, 0x1

    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-virtual {v12, v6, v13, v0, v1}, Lco/vine/android/provider/VineDatabaseHelper;->getPreviousPageCursor(IILjava/lang/String;Z)I

    move-result v53

    .line 2033
    .restart local v53       #previous:I
    if-lez v53, :cond_3e

    .line 2034
    move/from16 v134, v53

    goto :goto_22

    .line 2063
    .end local v51           #pageType:I
    .end local v53           #previous:I
    .end local v134           #page:I
    :sswitch_3b
    const-string v6, "post"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v191

    check-cast v191, Lco/vine/android/api/VinePostResponse;

    .line 2064
    .local v191, vpr:Lco/vine/android/api/VinePostResponse;
    invoke-static/range {p0 .. p0}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v75

    .line 2065
    .local v75, api:Lco/vine/android/client/VineAPI;
    invoke-virtual/range {v75 .. v75}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "timelines"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    move-object/from16 v0, v191

    iget-wide v0, v0, Lco/vine/android/api/VinePostResponse;->postId:J

    move-wide/from16 v26, v0

    invoke-static/range {v26 .. v27}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v110

    .line 2067
    .local v110, getPostUrl:Ljava/lang/StringBuilder;
    invoke-static/range {p0 .. p0}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v84

    .line 2068
    .restart local v84       #client:Lco/vine/android/network/ThreadedHttpOperationClient;
    const/16 v6, 0x8

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2069
    move-object/from16 v0, v84

    move-object/from16 v1, v110

    move-object/from16 v2, v75

    move-object/from16 v3, v20

    move-object/from16 v4, v31

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2071
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_3f

    .line 2072
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v140

    check-cast v140, Lco/vine/android/api/VinePagedData;

    .line 2073
    .local v140, posts:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    if-eqz v140, :cond_1

    move-object/from16 v0, v140

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 2074
    invoke-static/range {p0 .. p0}, Lco/vine/android/provider/VineDatabaseHelper;->getDatabaseHelper(Landroid/content/Context;)Lco/vine/android/provider/VineDatabaseHelper;

    move-result-object v57

    .line 2076
    .local v57, db:Lco/vine/android/provider/VineDatabaseHelper;
    :try_start_b
    move-object/from16 v0, v140

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v58, v0

    const/16 v59, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v60

    const/16 v61, 0x0

    const/16 v62, 0x0

    const/16 v63, 0x0

    const-wide/16 v64, 0x0

    const/16 v66, 0x1

    invoke-virtual/range {v57 .. v66}, Lco/vine/android/provider/VineDatabaseHelper;->mergePosts(Ljava/util/Collection;ILjava/lang/String;IIIJZ)Lco/vine/android/provider/DbResponse;

    .line 2078
    move-object/from16 v0, v140

    iget-object v0, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v58, v0

    const/16 v59, 0x2

    invoke-static/range {v24 .. v25}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v60

    const/16 v61, 0x0

    const/16 v62, 0x0

    const/16 v63, 0x0

    const-wide/16 v64, 0x0

    const/16 v66, 0x1

    invoke-virtual/range {v57 .. v66}, Lco/vine/android/provider/VineDatabaseHelper;->mergePosts(Ljava/util/Collection;ILjava/lang/String;IIIJZ)Lco/vine/android/provider/DbResponse;
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_8

    goto/16 :goto_0

    .line 2080
    :catch_8
    move-exception v92

    .line 2081
    .restart local v92       #e:Ljava/io/IOException;
    const-string v6, "Error writing uploaded post to db"

    move-object/from16 v0, v92

    invoke-static {v6, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 2085
    .end local v57           #db:Lco/vine/android/provider/VineDatabaseHelper;
    .end local v92           #e:Ljava/io/IOException;
    .end local v140           #posts:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VinePost;>;"
    :cond_3f
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v97

    .end local v97           #error:Lco/vine/android/api/VineError;
    check-cast v97, Lco/vine/android/api/VineError;

    .line 2086
    .restart local v97       #error:Lco/vine/android/api/VineError;
    if-eqz v132, :cond_1

    if-eqz v97, :cond_1

    .line 2087
    const-string v6, "Error retrieving uploaded post from server: {} {}"

    move-object/from16 v0, v132

    iget v13, v0, Lco/vine/android/network/HttpOperation;->statusCode:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    move-object/from16 v0, v97

    iget-object v0, v0, Lco/vine/android/api/VineError;->message:Ljava/lang/String;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    invoke-static {v6, v13, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 2094
    .end local v75           #api:Lco/vine/android/client/VineAPI;
    .end local v84           #client:Lco/vine/android/network/ThreadedHttpOperationClient;
    .end local v110           #getPostUrl:Ljava/lang/StringBuilder;
    .end local v191           #vpr:Lco/vine/android/api/VinePostResponse;
    :sswitch_3c
    const-string v6, "gcmRegId"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v144

    .line 2095
    .local v144, regId:Ljava/lang/String;
    if-nez v144, :cond_40

    .line 2096
    const-string v144, ""

    .line 2098
    :cond_40
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 2100
    .restart local v10       #userId:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2102
    .restart local v17       #url:Ljava/lang/StringBuilder;
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 2103
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "deviceToken"

    move-object/from16 v0, v144

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2105
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2106
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2110
    goto/16 :goto_0

    .line 2113
    .end local v10           #userId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v144           #regId:Ljava/lang/String;
    :sswitch_3d
    const-string v6, "gcmRegId"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v144

    .line 2114
    .restart local v144       #regId:Ljava/lang/String;
    if-nez v144, :cond_41

    .line 2115
    const-string v144, ""

    .line 2117
    :cond_41
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 2118
    .restart local v10       #userId:J
    const-string v6, "s_key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v81

    .line 2119
    .local v81, cachedKey:Ljava/lang/String;
    if-nez v81, :cond_42

    .line 2120
    const-string v81, ""

    .line 2123
    :cond_42
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "deviceToken"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2125
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "deviceToken"

    move-object/from16 v0, v17

    move-object/from16 v1, v144

    invoke-static {v0, v6, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 2127
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2128
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v81

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2132
    goto/16 :goto_0

    .line 2135
    .end local v10           #userId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v81           #cachedKey:Ljava/lang/String;
    .end local v144           #regId:Ljava/lang/String;
    :sswitch_3e
    invoke-virtual {v12}, Lco/vine/android/provider/VineDatabaseHelper;->markNotificationsCleared()I

    .line 2136
    const/16 v159, 0xc8

    .line 2137
    goto/16 :goto_0

    .line 2140
    :sswitch_3f
    const-string v6, "post_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v14

    .line 2141
    .restart local v14       #postId:J
    const-string v6, "network"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v127

    .line 2142
    .local v127, network:Ljava/lang/String;
    const-string v6, "message"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v124

    .line 2144
    .local v124, message:Ljava/lang/String;
    move-object/from16 v0, v127

    invoke-static {v0, v14, v15}, Lco/vine/android/util/FlurryUtils;->trackSharePost(Ljava/lang/String;J)V

    .line 2146
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "posts"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "share"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    aput-object v127, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2148
    .restart local v17       #url:Ljava/lang/StringBuilder;
    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .line 2149
    .restart local v19       #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    const-string v13, "message"

    move-object/from16 v0, v124

    invoke-direct {v6, v13, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2151
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2152
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v18, v0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-static/range {v16 .. v21}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2156
    goto/16 :goto_0

    .line 2159
    .end local v14           #postId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v19           #params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    .end local v124           #message:Ljava/lang/String;
    .end local v127           #network:Ljava/lang/String;
    :sswitch_40
    const-string v6, "s_key"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v81

    .line 2160
    .restart local v81       #cachedKey:Ljava/lang/String;
    if-nez v81, :cond_43

    .line 2161
    const-string v81, ""

    .line 2163
    :cond_43
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "authenticate"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2165
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2166
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v81

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2169
    goto/16 :goto_0

    .line 2172
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v81           #cachedKey:Ljava/lang/String;
    :sswitch_41
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static/range {v24 .. v25}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "pendingNotificationsCount"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2175
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0x14

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2177
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2180
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2181
    const-string v13, "count"

    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    move-object/from16 v0, p3

    invoke-virtual {v0, v13, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_0

    .line 2186
    .end local v17           #url:Ljava/lang/StringBuilder;
    :sswitch_42
    const-string v6, "q"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v142

    .line 2187
    .restart local v142       #query:Ljava/lang/String;
    invoke-virtual/range {v142 .. v142}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/client/VineAPI;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v96

    .line 2188
    .local v96, encodedQuery:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "search"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    aput-object v96, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2190
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const-string v6, "st"

    const-string v13, "mention"

    move-object/from16 v0, v17

    invoke-static {v0, v6, v13}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V

    .line 2192
    const/4 v6, 0x3

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2193
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v31

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2197
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2198
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v184

    check-cast v184, Lco/vine/android/api/VinePagedData;

    .line 2199
    .restart local v184       #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    move-object/from16 v0, v184

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-eqz v6, :cond_1

    .line 2200
    const-string v6, "q"

    move-object/from16 v0, p3

    move-object/from16 v1, v142

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2201
    const-string v6, "users"

    move-object/from16 v0, v184

    iget-object v13, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto/16 :goto_0

    .line 2207
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v96           #encodedQuery:Ljava/lang/String;
    .end local v142           #query:Ljava/lang/String;
    .end local v184           #users:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineUser;>;"
    :sswitch_43
    const-string v6, "q"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v142

    .line 2208
    .restart local v142       #query:Ljava/lang/String;
    invoke-static/range {v142 .. v142}, Lco/vine/android/client/VineAPI;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v96

    .line 2209
    .restart local v96       #encodedQuery:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "tags"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "search"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    aput-object v96, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2212
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/16 v6, 0xe

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2213
    invoke-virtual/range {p0 .. p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    move-object/from16 v2, v31

    invoke-static {v6, v0, v13, v1, v2}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2217
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2218
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v162

    check-cast v162, Lco/vine/android/api/VinePagedData;

    .line 2219
    .restart local v162       #tags:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineTag;>;"
    move-object/from16 v0, v162

    iget-object v6, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    if-eqz v6, :cond_1

    .line 2220
    const-string v6, "q"

    move-object/from16 v0, p3

    move-object/from16 v1, v142

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2221
    const-string v6, "tags"

    move-object/from16 v0, v162

    iget-object v13, v0, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    move-object/from16 v0, p3

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    goto/16 :goto_0

    .line 2229
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v96           #encodedQuery:Ljava/lang/String;
    .end local v142           #query:Ljava/lang/String;
    .end local v162           #tags:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<Lco/vine/android/api/VineTag;>;"
    :sswitch_44
    invoke-static/range {v86 .. v86}, Lco/vine/android/util/LoopManager;->get(Landroid/content/Context;)Lco/vine/android/util/LoopManager;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/util/LoopManager;->commit()V

    goto/16 :goto_0

    .line 2233
    :sswitch_45
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "me"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2237
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2238
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2242
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2243
    sget-object v6, Lco/vine/android/api/VineParsers$API_RESPONSE;->SUCCESS:Lco/vine/android/api/VineParsers$API_RESPONSE;

    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v6, v13}, Lco/vine/android/api/VineParsers$API_RESPONSE;->equals(Ljava/lang/Object;)Z

    move-result v160

    .line 2244
    .local v160, success:Z
    const-string v6, "response_success"

    move-object/from16 v0, p3

    move/from16 v1, v160

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 2249
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v160           #success:Z
    :sswitch_46
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 2250
    .restart local v10       #userId:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "followers"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    const-string v18, "reposts"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2256
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2257
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v58

    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v60, v0

    const/16 v61, 0x0

    const/4 v6, 0x0

    new-array v0, v6, [Ljava/lang/String;

    move-object/from16 v63, v0

    move-object/from16 v59, v17

    move-object/from16 v62, v20

    invoke-static/range {v58 .. v63}, Lco/vine/android/network/HttpOperation;->createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2261
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2262
    sget-object v6, Lco/vine/android/api/VineParsers$API_RESPONSE;->SUCCESS:Lco/vine/android/api/VineParsers$API_RESPONSE;

    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v6, v13}, Lco/vine/android/api/VineParsers$API_RESPONSE;->equals(Ljava/lang/Object;)Z

    move-result v160

    .line 2263
    .restart local v160       #success:Z
    const-string v6, "response_success"

    move-object/from16 v0, p3

    move/from16 v1, v160

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 2268
    .end local v10           #userId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v160           #success:Z
    :sswitch_47
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 2269
    .restart local v10       #userId:J
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x4

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "followers"

    aput-object v18, v13, v16

    const/16 v16, 0x3

    const-string v18, "reposts"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2275
    .restart local v17       #url:Ljava/lang/StringBuilder;
    const/4 v6, 0x1

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2276
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2280
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2281
    invoke-virtual {v12, v10, v11}, Lco/vine/android/provider/VineDatabaseHelper;->removePostsByReposterId(J)V

    .line 2283
    sget-object v6, Lco/vine/android/api/VineParsers$API_RESPONSE;->SUCCESS:Lco/vine/android/api/VineParsers$API_RESPONSE;

    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v13

    invoke-virtual {v6, v13}, Lco/vine/android/api/VineParsers$API_RESPONSE;->equals(Ljava/lang/Object;)Z

    move-result v160

    .line 2284
    .restart local v160       #success:Z
    const-string v6, "response_success"

    move-object/from16 v0, p3

    move/from16 v1, v160

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto/16 :goto_0

    .line 2289
    .end local v10           #userId:J
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v160           #success:Z
    :sswitch_48
    const-string v6, "user_id"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    .line 2290
    .restart local v10       #userId:J
    const-string v6, "block_profile_reposts"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v111

    .line 2291
    .local v111, hide:Z
    move/from16 v0, v111

    invoke-virtual {v12, v10, v11, v0}, Lco/vine/android/provider/VineDatabaseHelper;->setShouldHideProfileRevines(JZ)Z

    goto/16 :goto_0

    .line 2295
    .end local v10           #userId:J
    .end local v111           #hide:Z
    :sswitch_49
    const-string v6, "vanity_url"

    move-object/from16 v0, p3

    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v188

    .line 2296
    .local v188, vanityUrlSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v6, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    invoke-virtual {v6}, Lco/vine/android/client/VineAPI;->getBaseUrl()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x3

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    const-string v18, "users"

    aput-object v18, v13, v16

    const/16 v16, 0x1

    const-string v18, "profiles"

    aput-object v18, v13, v16

    const/16 v16, 0x2

    const-string v18, "vanity"

    aput-object v18, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2302
    .restart local v17       #url:Ljava/lang/StringBuilder;
    invoke-virtual/range {v188 .. v188}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v112

    .restart local v112       #i$:Ljava/util/Iterator;
    :goto_23
    invoke-interface/range {v112 .. v112}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_44

    invoke-interface/range {v112 .. v112}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v136

    check-cast v136, Ljava/lang/String;

    .line 2303
    .restart local v136       #pathSegment:Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/16 v16, 0x0

    aput-object v136, v13, v16

    invoke-static {v6, v13}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v17

    .line 2304
    goto :goto_23

    .line 2306
    .end local v136           #pathSegment:Ljava/lang/String;
    :cond_44
    const/4 v6, 0x2

    invoke-static {v6}, Lco/vine/android/api/VineParserReader;->createParserReader(I)Lco/vine/android/api/VineParserReader;

    move-result-object v20

    .line 2307
    invoke-static/range {v86 .. v86}, Lco/vine/android/network/ThreadedHttpOperationClient;->getInstance(Landroid/content/Context;)Lco/vine/android/network/ThreadedHttpOperationClient;

    move-result-object v6

    move-object/from16 v0, p0

    iget-object v13, v0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-static {v6, v0, v13, v1}, Lco/vine/android/network/HttpOperation;->createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;

    move-result-object v6

    invoke-virtual {v6}, Lco/vine/android/network/HttpOperation;->execute()Lco/vine/android/network/HttpOperation;

    move-result-object v132

    .line 2311
    invoke-virtual/range {v132 .. v132}, Lco/vine/android/network/HttpOperation;->isOK()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 2312
    invoke-virtual/range {v20 .. v20}, Lco/vine/android/api/VineParserReader;->getParsedObject()Ljava/lang/Object;

    move-result-object v171

    check-cast v171, Lco/vine/android/api/VineUser;

    .line 2313
    .restart local v171       #user:Lco/vine/android/api/VineUser;
    const-string v6, "user_id"

    move-object/from16 v0, v171

    iget-wide v0, v0, Lco/vine/android/api/VineUser;->userId:J

    move-wide/from16 v26, v0

    move-object/from16 v0, p3

    move-wide/from16 v1, v26

    invoke-virtual {v0, v6, v1, v2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    goto/16 :goto_0

    .line 2339
    .end local v12           #dbHelper:Lco/vine/android/provider/VineDatabaseHelper;
    .end local v17           #url:Ljava/lang/StringBuilder;
    .end local v24           #sessionOwnerId:J
    .end local v31           #key:Ljava/lang/String;
    .end local v112           #i$:Ljava/util/Iterator;
    .end local v171           #user:Lco/vine/android/api/VineUser;
    .end local v188           #vanityUrlSegments:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v98       #errorCode:I
    .restart local v154       #ret:Landroid/os/Bundle;
    :cond_45
    sget-object v6, Lco/vine/android/api/VineError$VineKnownErrors;->INVALID_SESSION:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v6, v6, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v0, v98

    if-eq v0, v6, :cond_46

    sget-object v6, Lco/vine/android/api/VineError$VineKnownErrors;->EXPIRED_SESSION:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v6, v6, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v0, v98

    if-ne v0, v6, :cond_47

    .line 2341
    :cond_46
    const-string v6, "executionCode"

    const/4 v13, 0x2

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 2344
    :cond_47
    sget-object v6, Lco/vine/android/api/VineError$VineKnownErrors;->CAPTCHA:Lco/vine/android/api/VineError$VineKnownErrors;

    iget v6, v6, Lco/vine/android/api/VineError$VineKnownErrors;->code:I

    move/from16 v0, v98

    if-ne v0, v6, :cond_49

    .line 2345
    const-string v6, "executionCode"

    const/4 v13, 0x4

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2346
    const-string v6, "captcha_url"

    move-object/from16 v0, v97

    iget-object v13, v0, Lco/vine/android/api/VineError;->data:Ljava/lang/String;

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 2352
    .end local v98           #errorCode:I
    :cond_48
    const-string v6, "statusCode"

    move-object/from16 v0, v154

    move/from16 v1, v159

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 2353
    invoke-static/range {v143 .. v143}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_49

    .line 2354
    const-string v6, "reasonPhrase"

    move-object/from16 v0, v154

    move-object/from16 v1, v143

    invoke-virtual {v0, v6, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 2358
    :cond_49
    sget-boolean v6, Lco/vine/android/service/VineService;->LOGGABLE:Z

    if-eqz v6, :cond_4a

    .line 2359
    const-string v6, "{} complete {}, {}"

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-static/range {v159 .. v159}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v16

    move-object/from16 v0, v16

    move-object/from16 v1, v143

    invoke-static {v6, v13, v0, v1}, Lcom/edisonwang/android/slog/SLog;->i(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 2362
    :cond_4a
    const-string v6, "executionCode"

    const/4 v13, 0x1

    move-object/from16 v0, v154

    invoke-virtual {v0, v6, v13}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 431
    :sswitch_data_0
    .sparse-switch
        0x2 -> :sswitch_0
        0x3 -> :sswitch_1
        0x4 -> :sswitch_2
        0x5 -> :sswitch_6
        0x6 -> :sswitch_7
        0x7 -> :sswitch_8
        0x8 -> :sswitch_9
        0x9 -> :sswitch_a
        0xa -> :sswitch_15
        0xb -> :sswitch_b
        0xc -> :sswitch_11
        0xd -> :sswitch_f
        0xe -> :sswitch_13
        0xf -> :sswitch_16
        0x10 -> :sswitch_17
        0x11 -> :sswitch_18
        0x12 -> :sswitch_19
        0x13 -> :sswitch_1a
        0x14 -> :sswitch_20
        0x15 -> :sswitch_21
        0x16 -> :sswitch_c
        0x17 -> :sswitch_d
        0x18 -> :sswitch_1b
        0x19 -> :sswitch_1c
        0x1a -> :sswitch_23
        0x1b -> :sswitch_24
        0x1c -> :sswitch_10
        0x1d -> :sswitch_25
        0x1e -> :sswitch_14
        0x1f -> :sswitch_26
        0x20 -> :sswitch_27
        0x21 -> :sswitch_28
        0x22 -> :sswitch_29
        0x23 -> :sswitch_2a
        0x24 -> :sswitch_2b
        0x25 -> :sswitch_2c
        0x26 -> :sswitch_2d
        0x27 -> :sswitch_42
        0x28 -> :sswitch_43
        0x29 -> :sswitch_2e
        0x2a -> :sswitch_30
        0x2b -> :sswitch_2f
        0x2c -> :sswitch_3
        0x2d -> :sswitch_4
        0x2e -> :sswitch_33
        0x2f -> :sswitch_34
        0x30 -> :sswitch_35
        0x31 -> :sswitch_36
        0x32 -> :sswitch_37
        0x33 -> :sswitch_38
        0x34 -> :sswitch_39
        0x35 -> :sswitch_3a
        0x36 -> :sswitch_1d
        0x37 -> :sswitch_1e
        0x38 -> :sswitch_1f
        0x39 -> :sswitch_3b
        0x3a -> :sswitch_31
        0x3b -> :sswitch_32
        0x3c -> :sswitch_3c
        0x3d -> :sswitch_3d
        0x3e -> :sswitch_3e
        0x3f -> :sswitch_3f
        0x40 -> :sswitch_40
        0x41 -> :sswitch_41
        0x42 -> :sswitch_44
        0x43 -> :sswitch_45
        0x44 -> :sswitch_46
        0x45 -> :sswitch_47
        0x46 -> :sswitch_12
        0x47 -> :sswitch_22
        0x48 -> :sswitch_e
        0x49 -> :sswitch_48
        0x4b -> :sswitch_49
        0x3e8 -> :sswitch_5
    .end sparse-switch

    .line 556
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch

    .line 652
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 887
    :pswitch_data_2
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_5
    .end packed-switch

    .line 944
    :pswitch_data_3
    .packed-switch 0x1
        :pswitch_6
        :pswitch_7
        :pswitch_8
    .end packed-switch

    .line 1009
    :pswitch_data_4
    .packed-switch 0x1
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch

    .line 1075
    :pswitch_data_5
    .packed-switch 0x1
        :pswitch_c
        :pswitch_d
        :pswitch_e
    .end packed-switch

    .line 1412
    :pswitch_data_6
    .packed-switch 0x1
        :pswitch_f
        :pswitch_10
        :pswitch_11
    .end packed-switch

    .line 1469
    :pswitch_data_7
    .packed-switch 0x1
        :pswitch_12
        :pswitch_12
        :pswitch_13
    .end packed-switch

    .line 1593
    :pswitch_data_8
    .packed-switch 0x1
        :pswitch_14
    .end packed-switch

    .line 1759
    :pswitch_data_9
    .packed-switch 0x1
        :pswitch_15
        :pswitch_16
        :pswitch_17
    .end packed-switch

    .line 1842
    :pswitch_data_a
    .packed-switch 0x1
        :pswitch_18
        :pswitch_19
        :pswitch_1a
    .end packed-switch

    .line 2024
    :pswitch_data_b
    .packed-switch 0x1
        :pswitch_1b
        :pswitch_1b
        :pswitch_1c
    .end packed-switch
.end method

.method public limitCommentAndLikesIfNeeded(Ljava/lang/StringBuilder;)V
    .locals 2
    .parameter "url"

    .prologue
    const/4 v1, 0x0

    .line 2367
    invoke-static {p0}, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2368
    const-string v0, "c_max"

    invoke-static {p1, v0, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 2369
    const-string v0, "l_max"

    invoke-static {p1, v0, v1}, Lco/vine/android/client/VineAPI;->addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V

    .line 2371
    :cond_0
    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .parameter "intent"

    .prologue
    .line 356
    iget-object v0, p0, Lco/vine/android/service/VineService;->mBinder:Landroid/os/IBinder;

    return-object v0
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 361
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 362
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/service/VineService;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 363
    new-instance v0, Ljava/util/LinkedHashMap;

    const/16 v1, 0x32

    const/high16 v2, 0x4248

    invoke-direct {v0, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IF)V

    iput-object v0, p0, Lco/vine/android/service/VineService;->mStartIds:Ljava/util/LinkedHashMap;

    .line 364
    invoke-static {p0}, Lco/vine/android/client/VineAPI;->getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/service/VineService;->mApi:Lco/vine/android/client/VineAPI;

    .line 365
    new-instance v0, Lco/vine/android/util/MediaUtility;

    invoke-virtual {p0}, Lco/vine/android/service/VineService;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lco/vine/android/util/MediaUtility;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lco/vine/android/service/VineService;->mMediaUtility:Lco/vine/android/util/MediaUtility;

    .line 366
    iget-object v0, p0, Lco/vine/android/service/VineService;->mServiceBroadCastReceiver:Landroid/content/BroadcastReceiver;

    sget-object v1, Lco/vine/android/service/VineService;->SERVICE_INTENT_FILTER:Landroid/content/IntentFilter;

    invoke-virtual {p0, v0, v1}, Lco/vine/android/service/VineService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 367
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 371
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 372
    iget-object v0, p0, Lco/vine/android/service/VineService;->mServiceBroadCastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lco/vine/android/service/VineService;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 373
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 9
    .parameter "intent"
    .parameter "flags"
    .parameter "startId"

    .prologue
    .line 377
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    .line 378
    .local v4, bundle:Landroid/os/Bundle;
    const-string v0, "ibinder"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Lco/vine/android/service/VineServiceCallback;

    .line 380
    .local v7, cb:Lco/vine/android/service/VineServiceCallback;
    if-eqz v7, :cond_1

    .line 381
    invoke-virtual {v7}, Lco/vine/android/service/VineServiceCallback;->getResponder()Lco/vine/android/service/VineServiceResponder;

    move-result-object v5

    .line 385
    .local v5, responder:Lco/vine/android/service/VineServiceResponder;
    :goto_0
    sget-object v0, Lco/vine/android/service/VineService;->sActionMap:Ljava/util/HashMap;

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    .line 386
    .local v6, action:Ljava/lang/Integer;
    if-nez v6, :cond_2

    .line 387
    sget-boolean v0, Lco/vine/android/service/VineService;->LOGGABLE:Z

    if-eqz v0, :cond_0

    .line 388
    const-string v0, "VineService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown action: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 396
    :cond_0
    :goto_1
    const/4 v0, 0x2

    return v0

    .line 383
    .end local v5           #responder:Lco/vine/android/service/VineServiceResponder;
    .end local v6           #action:Ljava/lang/Integer;
    :cond_1
    const/4 v5, 0x0

    .restart local v5       #responder:Lco/vine/android/service/VineServiceResponder;
    goto :goto_0

    .line 390
    .restart local v6       #action:Ljava/lang/Integer;
    :cond_2
    if-nez v4, :cond_3

    .line 391
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Intent must contain extras: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 393
    :cond_3
    iget-object v8, p0, Lco/vine/android/service/VineService;->mExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lco/vine/android/service/VineService$ExecutionRunnable;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v3

    move-object v1, p0

    move v2, p3

    invoke-direct/range {v0 .. v5}, Lco/vine/android/service/VineService$ExecutionRunnable;-><init>(Lco/vine/android/service/VineService;IILandroid/os/Bundle;Lco/vine/android/service/VineServiceResponder;)V

    invoke-interface {v8, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 394
    iget-object v0, p0, Lco/vine/android/service/VineService;->mStartIds:Ljava/util/LinkedHashMap;

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1
.end method

.method public postAction(Lco/vine/android/service/PendingAction;)V
    .locals 7
    .parameter "action"

    .prologue
    .line 400
    iget-object v6, p0, Lco/vine/android/service/VineService;->mExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lco/vine/android/service/VineService$ExecutionRunnable;

    const/4 v2, 0x0

    iget v3, p1, Lco/vine/android/service/PendingAction;->actionCode:I

    iget-object v4, p1, Lco/vine/android/service/PendingAction;->bundle:Landroid/os/Bundle;

    iget-object v5, p1, Lco/vine/android/service/PendingAction;->responder:Lco/vine/android/service/VineServiceResponder;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lco/vine/android/service/VineService$ExecutionRunnable;-><init>(Lco/vine/android/service/VineService;IILandroid/os/Bundle;Lco/vine/android/service/VineServiceResponder;)V

    invoke-interface {v6, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 402
    return-void
.end method
