.class public Lco/vine/android/client/VineAPI;
.super Ljava/lang/Object;
.source "VineAPI.java"


# static fields
.field public static final ACCEPT_LANGUAGE_HEADER:Ljava/lang/String; = "Accept-Language"

.field private static final ENCODER:Lcom/google/gdata/util/common/base/PercentEscaper; = null

.field public static final GLOBAL_SIZE:I = 0x14

.field public static final PATH_SEPARATOR:C = '/'

.field public static final RESOURCE_AUTHENTICATE:Ljava/lang/String; = "authenticate"

.field public static final RESOURCE_BLOCKED:Ljava/lang/String; = "blocked"

.field public static final RESOURCE_CHANNELS:Ljava/lang/String; = "channels"

.field public static final RESOURCE_CLIENT_PROFILE:Ljava/lang/String; = "clientprofiles"

.field public static final RESOURCE_COMMENTS:Ljava/lang/String; = "comments"

.field public static final RESOURCE_COMPLAINTS:Ljava/lang/String; = "complaints"

.field public static final RESOURCE_CONTACTS:Ljava/lang/String; = "contacts"

.field public static final RESOURCE_DEVICE_TOKEN:Ljava/lang/String; = "deviceToken"

.field public static final RESOURCE_EDITION:Ljava/lang/String; = "edition"

.field public static final RESOURCE_EDITIONS:Ljava/lang/String; = "editions"

.field public static final RESOURCE_EXPLICIT:Ljava/lang/String; = "explicit"

.field public static final RESOURCE_FEATURED:Ljava/lang/String; = "featured"

.field public static final RESOURCE_FOLLOWERS:Ljava/lang/String; = "followers"

.field public static final RESOURCE_FOLLOWING:Ljava/lang/String; = "following"

.field public static final RESOURCE_FOLLOW_REQUESTS:Ljava/lang/String; = "followRequests"

.field public static final RESOURCE_FRIENDS:Ljava/lang/String; = "friends"

.field public static final RESOURCE_GRAPH:Ljava/lang/String; = "graph"

.field public static final RESOURCE_LIKES:Ljava/lang/String; = "likes"

.field public static final RESOURCE_ME:Ljava/lang/String; = "me"

.field public static final RESOURCE_NOTIFICATIONS:Ljava/lang/String; = "notifications"

.field public static final RESOURCE_POPULAR_NOW:Ljava/lang/String; = "popular"

.field public static final RESOURCE_POSTS:Ljava/lang/String; = "posts"

.field public static final RESOURCE_PREFERENCES:Ljava/lang/String; = "preferences"

.field public static final RESOURCE_PROFILES:Ljava/lang/String; = "profiles"

.field public static final RESOURCE_REACTIVATE:Ljava/lang/String; = "reactivate"

.field public static final RESOURCE_REPOST:Ljava/lang/String; = "repost"

.field public static final RESOURCE_REPOSTS:Ljava/lang/String; = "reposts"

.field public static final RESOURCE_REQUESTS:Ljava/lang/String; = "requests"

.field public static final RESOURCE_SEARCH:Ljava/lang/String; = "search"

.field public static final RESOURCE_SHARE:Ljava/lang/String; = "share"

.field public static final RESOURCE_SHARED:Ljava/lang/String; = "s"

.field public static final RESOURCE_SUGGESTED:Ljava/lang/String; = "suggested"

.field public static final RESOURCE_TAGS:Ljava/lang/String; = "tags"

.field public static final RESOURCE_TIMELINES:Ljava/lang/String; = "timelines"

.field public static final RESOURCE_TRENDING:Ljava/lang/String; = "trending"

.field public static final RESOURCE_TWITTER:Ljava/lang/String; = "twitter"

.field public static final RESOURCE_USERS:Ljava/lang/String; = "users"

.field public static final RESOURCE_VANITY:Ljava/lang/String; = "vanity"

.field public static final SECRET_AUTH_HEADER:Ljava/lang/String; = "X-Vine-Auth"

.field public static final X_VINE_CLIENT:Ljava/lang/String; = "X-Vine-Client"

.field private static mApi:Lco/vine/android/client/VineAPI;


# instance fields
.field private mAccountName:Ljava/lang/String;

.field private final mAmazonUrl:Ljava/lang/String;

.field private final mBaseCdnUrl:Ljava/lang/String;

.field private final mBaseUrl:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private mLocale:Ljava/lang/String;

.field private mSession:Lco/vine/android/client/Session;

.field private final mTwitterUrl:Ljava/lang/String;

.field private mXVineClientHeader:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 70
    new-instance v0, Lcom/google/gdata/util/common/base/PercentEscaper;

    const-string v1, "-._~"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/google/gdata/util/common/base/PercentEscaper;-><init>(Ljava/lang/String;Z)V

    sput-object v0, Lco/vine/android/client/VineAPI;->ENCODER:Lcom/google/gdata/util/common/base/PercentEscaper;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    iput-object p1, p0, Lco/vine/android/client/VineAPI;->mContext:Landroid/content/Context;

    .line 88
    invoke-static {p1}, Lco/vine/android/util/BuildUtil;->get(Landroid/content/Context;)Lco/vine/android/util/BuildUtil;

    move-result-object v2

    invoke-virtual {v2}, Lco/vine/android/util/BuildUtil;->getBaseUrl()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/client/VineAPI;->mBaseUrl:Ljava/lang/String;

    .line 89
    invoke-static {p1}, Lco/vine/android/util/BuildUtil;->get(Landroid/content/Context;)Lco/vine/android/util/BuildUtil;

    move-result-object v2

    invoke-virtual {v2}, Lco/vine/android/util/BuildUtil;->getBaseCdnUrl()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/client/VineAPI;->mBaseCdnUrl:Ljava/lang/String;

    .line 90
    const v2, 0x7f0e0046

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/client/VineAPI;->mAmazonUrl:Ljava/lang/String;

    .line 91
    const v2, 0x7f0e01c7

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/client/VineAPI;->mTwitterUrl:Ljava/lang/String;

    .line 93
    invoke-virtual {p0}, Lco/vine/android/client/VineAPI;->refreshLocale()V

    .line 96
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    iget-object v0, v2, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    .line 98
    .local v0, clientHeader:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 99
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "android"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "-gb"

    :goto_0
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lco/vine/android/client/VineAPI;->mXVineClientHeader:Ljava/lang/String;

    .line 104
    .end local v0           #clientHeader:Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 99
    .restart local v0       #clientHeader:Ljava/lang/String;
    :cond_1
    const-string v2, ""
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 101
    .end local v0           #clientHeader:Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 102
    .local v1, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, 0x0

    iput-object v2, p0, Lco/vine/android/client/VineAPI;->mXVineClientHeader:Ljava/lang/String;

    goto :goto_1
.end method

.method public static addParam(Ljava/lang/StringBuilder;Ljava/lang/String;[JII)I
    .locals 4
    .parameter "sb"
    .parameter "name"
    .parameter "values"
    .parameter "start"
    .parameter "max"

    .prologue
    .line 276
    if-eqz p2, :cond_2

    array-length v2, p2

    if-ge p3, v2, :cond_2

    if-lez p4, :cond_2

    .line 277
    invoke-static {p0, p1}, Lco/vine/android/client/VineAPI;->prefixParam(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 278
    add-int v2, p3, p4

    array-length v3, p2

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 279
    .local v0, end:I
    move v1, p3

    .local v1, i:I
    :goto_0
    if-ge v1, v0, :cond_1

    .line 280
    aget-wide v2, p2, v1

    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 281
    add-int/lit8 v2, v0, -0x1

    if-ge v1, v2, :cond_0

    .line 282
    const/16 v2, 0x2c

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 279
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 285
    :cond_1
    sub-int v2, v0, p3

    .line 287
    .end local v0           #end:I
    .end local v1           #i:I
    :goto_1
    return v2

    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static addParam(Ljava/lang/StringBuilder;Ljava/lang/String;D)V
    .locals 1
    .parameter "sb"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 260
    invoke-static {p0, p1}, Lco/vine/android/client/VineAPI;->prefixParam(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 261
    return-void
.end method

.method public static addParam(Ljava/lang/StringBuilder;Ljava/lang/String;I)V
    .locals 1
    .parameter "sb"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 238
    invoke-static {p0, p1}, Lco/vine/android/client/VineAPI;->prefixParam(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 239
    return-void
.end method

.method public static addParam(Ljava/lang/StringBuilder;Ljava/lang/String;J)V
    .locals 1
    .parameter "sb"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 249
    invoke-static {p0, p1}, Lco/vine/android/client/VineAPI;->prefixParam(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 250
    return-void
.end method

.method public static addParam(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "sb"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 271
    invoke-static {p0, p1}, Lco/vine/android/client/VineAPI;->prefixParam(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {p2}, Lco/vine/android/client/VineAPI;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    return-void
.end method

.method public static addParam(Ljava/lang/StringBuilder;Ljava/lang/String;Z)V
    .locals 1
    .parameter "sb"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 227
    invoke-static {p0, p1}, Lco/vine/android/client/VineAPI;->prefixParam(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 228
    return-void
.end method

.method public static varargs buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;
    .locals 6
    .parameter "baseUrl"
    .parameter "paths"

    .prologue
    .line 209
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 210
    .local v4, sb:Ljava/lang/StringBuilder;
    if-eqz p1, :cond_0

    .line 211
    move-object v0, p1

    .local v0, arr$:[Ljava/lang/Object;
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 212
    .local v3, path:Ljava/lang/Object;
    const/16 v5, 0x2f

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 213
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 211
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 216
    .end local v0           #arr$:[Ljava/lang/Object;
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #path:Ljava/lang/Object;
    :cond_0
    return-object v4
.end method

.method public static encode(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "text"

    .prologue
    .line 302
    if-nez p0, :cond_0

    .line 303
    const-string v0, ""

    .line 305
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lco/vine/android/client/VineAPI;->ENCODER:Lcom/google/gdata/util/common/base/PercentEscaper;

    invoke-virtual {v0, p0}, Lcom/google/gdata/util/common/base/PercentEscaper;->escape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static getInstance(Landroid/content/Context;)Lco/vine/android/client/VineAPI;
    .locals 1
    .parameter "context"

    .prologue
    .line 107
    sget-object v0, Lco/vine/android/client/VineAPI;->mApi:Lco/vine/android/client/VineAPI;

    if-nez v0, :cond_0

    .line 108
    new-instance v0, Lco/vine/android/client/VineAPI;

    invoke-direct {v0, p0}, Lco/vine/android/client/VineAPI;-><init>(Landroid/content/Context;)V

    sput-object v0, Lco/vine/android/client/VineAPI;->mApi:Lco/vine/android/client/VineAPI;

    .line 110
    :cond_0
    sget-object v0, Lco/vine/android/client/VineAPI;->mApi:Lco/vine/android/client/VineAPI;

    return-object v0
.end method

.method private getSessionKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lco/vine/android/client/VineAPI;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getSessionKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static prefixParam(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    .locals 2
    .parameter "sb"
    .parameter "name"

    .prologue
    .line 292
    const-string v0, "?"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 293
    const/16 v0, 0x3f

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 297
    :goto_0
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0

    .line 295
    :cond_0
    const/16 v0, 0x26

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method


# virtual methods
.method public addClientHeaders(Lorg/apache/http/HttpRequest;)V
    .locals 3
    .parameter "request"

    .prologue
    .line 140
    iget-object v1, p0, Lco/vine/android/client/VineAPI;->mXVineClientHeader:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 151
    :cond_0
    :goto_0
    return-void

    .line 143
    :cond_1
    const-string v1, "X-Vine-Client"

    iget-object v2, p0, Lco/vine/android/client/VineAPI;->mXVineClientHeader:Ljava/lang/String;

    invoke-interface {p1, v1, v2}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    invoke-static {}, Lco/vine/android/util/Util;->getLocale()Ljava/lang/String;

    move-result-object v0

    .line 145
    .local v0, language:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 146
    const-string v1, "Accept-Language"

    invoke-interface {p1, v1, v0}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 148
    :cond_2
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isProduction()Z

    move-result v1

    if-nez v1, :cond_0

    .line 149
    const-string v1, "X-Vine-Auth"

    invoke-virtual {p0}, Lco/vine/android/client/VineAPI;->getAuthHeaderSecret()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v1, v2}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public addContentTypeHeader(Lco/vine/android/network/HttpOperation;Ljava/lang/String;)V
    .locals 2
    .parameter "op"
    .parameter "contentType"

    .prologue
    .line 175
    invoke-virtual {p1}, Lco/vine/android/network/HttpOperation;->getHttpRequest()Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v0

    .line 176
    .local v0, req:Lorg/apache/http/HttpRequest;
    const-string v1, "content-type"

    invoke-interface {v0, v1, p2}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    return-void
.end method

.method public addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;)V
    .locals 3
    .parameter "op"

    .prologue
    .line 158
    invoke-virtual {p1}, Lco/vine/android/network/HttpOperation;->getHttpRequest()Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v0

    .line 159
    .local v0, req:Lorg/apache/http/HttpRequest;
    const-string v1, "vine-session-id"

    invoke-direct {p0}, Lco/vine/android/client/VineAPI;->getSessionKey()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    return-void
.end method

.method public addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;Ljava/lang/String;)V
    .locals 2
    .parameter "op"
    .parameter "key"

    .prologue
    .line 163
    invoke-virtual {p1}, Lco/vine/android/network/HttpOperation;->getHttpRequest()Lorg/apache/http/client/methods/HttpRequestBase;

    move-result-object v0

    .line 164
    .local v0, req:Lorg/apache/http/HttpRequest;
    const-string v1, "vine-session-id"

    invoke-interface {v0, v1, p2}, Lorg/apache/http/HttpRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 165
    return-void
.end method

.method public varargs buildUrl([Ljava/lang/Object;)Ljava/lang/StringBuilder;
    .locals 1
    .parameter "paths"

    .prologue
    .line 195
    iget-object v0, p0, Lco/vine/android/client/VineAPI;->mBaseUrl:Ljava/lang/String;

    invoke-static {v0, p1}, Lco/vine/android/client/VineAPI;->buildUponUrl(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    return-object v0
.end method

.method public getAmazonUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lco/vine/android/client/VineAPI;->mAmazonUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthHeaderSecret()Ljava/lang/String;
    .locals 2

    .prologue
    .line 184
    iget-object v0, p0, Lco/vine/android/client/VineAPI;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0e0048

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBaseCdnUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lco/vine/android/client/VineAPI;->mBaseCdnUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getBaseUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 124
    iget-object v0, p0, Lco/vine/android/client/VineAPI;->mBaseUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getTwitterUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lco/vine/android/client/VineAPI;->mTwitterUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getVineClientHeader()Ljava/lang/String;
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lco/vine/android/client/VineAPI;->mXVineClientHeader:Ljava/lang/String;

    return-object v0
.end method

.method public refreshLocale()V
    .locals 2

    .prologue
    .line 114
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, locale:Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 117
    iput-object v0, p0, Lco/vine/android/client/VineAPI;->mLocale:Ljava/lang/String;

    .line 121
    :goto_0
    return-void

    .line 119
    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lco/vine/android/client/VineAPI;->mLocale:Ljava/lang/String;

    goto :goto_0
.end method
