.class Ltwitter4j/conf/ConfigurationBase;
.super Ljava/lang/Object;
.source "ConfigurationBase.java"

# interfaces
.implements Ltwitter4j/conf/Configuration;
.implements Ljava/io/Serializable;


# static fields
.field public static final DALVIK:Ljava/lang/String; = "twitter4j.dalvik"

.field private static final DEFAULT_OAUTH2_INVALIDATE_TOKEN_URL:Ljava/lang/String; = "https://api.twitter.com/oauth2/invalidate_token"

.field private static final DEFAULT_OAUTH2_TOKEN_URL:Ljava/lang/String; = "https://api.twitter.com/oauth2/token"

.field private static final DEFAULT_OAUTH_ACCESS_TOKEN_URL:Ljava/lang/String; = "https://api.twitter.com/oauth/access_token"

.field private static final DEFAULT_OAUTH_AUTHENTICATION_URL:Ljava/lang/String; = "https://api.twitter.com/oauth/authenticate"

.field private static final DEFAULT_OAUTH_AUTHORIZATION_URL:Ljava/lang/String; = "https://api.twitter.com/oauth/authorize"

.field private static final DEFAULT_OAUTH_REQUEST_TOKEN_URL:Ljava/lang/String; = "https://api.twitter.com/oauth/request_token"

.field private static final DEFAULT_REST_BASE_URL:Ljava/lang/String; = "https://api.twitter.com/1.1/"

.field private static final DEFAULT_SITE_STREAM_BASE_URL:Ljava/lang/String; = "https://sitestream.twitter.com/1.1/"

.field private static final DEFAULT_STREAM_BASE_URL:Ljava/lang/String; = "https://stream.twitter.com/1.1/"

.field private static final DEFAULT_USER_STREAM_BASE_URL:Ljava/lang/String; = "https://userstream.twitter.com/1.1/"

.field public static final GAE:Ljava/lang/String; = "twitter4j.gae"

.field static dalvikDetected:Ljava/lang/String; = null

.field static gaeDetected:Ljava/lang/String; = null

.field private static final instances:Ljava/util/List; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ltwitter4j/conf/ConfigurationBase;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0x5bbd3477f3537f08L


# instance fields
.field private IS_DALVIK:Z

.field private IS_GAE:Z

.field private applicationOnlyAuthEnabled:Z

.field private asyncNumThreads:I

.field private clientURL:Ljava/lang/String;

.field private clientVersion:Ljava/lang/String;

.field private contributingTo:J

.field private debug:Z

.field private defaultMaxPerRoute:I

.field private dispatcherImpl:Ljava/lang/String;

.field private gzipEnabled:Z

.field private httpConnectionTimeout:I

.field private httpProxyHost:Ljava/lang/String;

.field private httpProxyPassword:Ljava/lang/String;

.field private httpProxyPort:I

.field private httpProxyUser:Ljava/lang/String;

.field private httpReadTimeout:I

.field private httpRetryCount:I

.field private httpRetryIntervalSeconds:I

.field private httpStreamingReadTimeout:I

.field private includeEntitiesEnabled:Z

.field private includeMyRetweetEnabled:Z

.field private includeRTsEnabled:Z

.field private jsonStoreEnabled:Z

.field private loggerFactory:Ljava/lang/String;

.field private maxTotalConnections:I

.field private mbeanEnabled:Z

.field private mediaProvider:Ljava/lang/String;

.field private mediaProviderAPIKey:Ljava/lang/String;

.field private mediaProviderParameters:Ljava/util/Properties;

.field private oAuth2AccessToken:Ljava/lang/String;

.field private oAuth2InvalidateTokenURL:Ljava/lang/String;

.field private oAuth2TokenType:Ljava/lang/String;

.field private oAuth2TokenURL:Ljava/lang/String;

.field private oAuthAccessToken:Ljava/lang/String;

.field private oAuthAccessTokenSecret:Ljava/lang/String;

.field private oAuthAccessTokenURL:Ljava/lang/String;

.field private oAuthAuthenticationURL:Ljava/lang/String;

.field private oAuthAuthorizationURL:Ljava/lang/String;

.field private oAuthConsumerKey:Ljava/lang/String;

.field private oAuthConsumerSecret:Ljava/lang/String;

.field private oAuthRequestTokenURL:Ljava/lang/String;

.field private password:Ljava/lang/String;

.field private prettyDebug:Z

.field requestHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private restBaseURL:Ljava/lang/String;

.field private siteStreamBaseURL:Ljava/lang/String;

.field private stallWarningsEnabled:Z

.field private streamBaseURL:Ljava/lang/String;

.field private trimUserEnabled:Z

.field private useSSL:Z

.field private user:Ljava/lang/String;

.field private userAgent:Ljava/lang/String;

.field private userStreamBaseURL:Ljava/lang/String;

.field private userStreamRepliesAllEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 132
    :try_start_0
    const-string v1, "dalvik.system.VMRuntime"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 133
    const-string v1, "true"

    sput-object v1, Ltwitter4j/conf/ConfigurationBase;->dalvikDetected:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 140
    .local v0, cnfe:Ljava/lang/ClassNotFoundException;
    :goto_0
    :try_start_1
    const-string v1, "com.google.appengine.api.urlfetch.URLFetchService"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 141
    const-string v1, "true"

    sput-object v1, Ltwitter4j/conf/ConfigurationBase;->gaeDetected:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 975
    :goto_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Ltwitter4j/conf/ConfigurationBase;->instances:Ljava/util/List;

    return-void

    .line 134
    .end local v0           #cnfe:Ljava/lang/ClassNotFoundException;
    :catch_0
    move-exception v0

    .line 135
    .restart local v0       #cnfe:Ljava/lang/ClassNotFoundException;
    const-string v1, "false"

    sput-object v1, Ltwitter4j/conf/ConfigurationBase;->dalvikDetected:Ljava/lang/String;

    goto :goto_0

    .line 142
    :catch_1
    move-exception v0

    .line 143
    const-string v1, "false"

    sput-object v1, Ltwitter4j/conf/ConfigurationBase;->gaeDetected:Ljava/lang/String;

    goto :goto_1
.end method

.method protected constructor <init>()V
    .locals 8

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    iput-boolean v7, p0, Ltwitter4j/conf/ConfigurationBase;->includeRTsEnabled:Z

    .line 80
    iput-boolean v7, p0, Ltwitter4j/conf/ConfigurationBase;->includeEntitiesEnabled:Z

    .line 82
    iput-boolean v7, p0, Ltwitter4j/conf/ConfigurationBase;->includeMyRetweetEnabled:Z

    .line 84
    iput-boolean v6, p0, Ltwitter4j/conf/ConfigurationBase;->trimUserEnabled:Z

    .line 94
    iput-boolean v6, p0, Ltwitter4j/conf/ConfigurationBase;->applicationOnlyAuthEnabled:Z

    .line 148
    invoke-virtual {p0, v6}, Ltwitter4j/conf/ConfigurationBase;->setDebug(Z)V

    .line 149
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setUser(Ljava/lang/String;)V

    .line 150
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setPassword(Ljava/lang/String;)V

    .line 151
    invoke-virtual {p0, v7}, Ltwitter4j/conf/ConfigurationBase;->setUseSSL(Z)V

    .line 152
    invoke-virtual {p0, v6}, Ltwitter4j/conf/ConfigurationBase;->setPrettyDebugEnabled(Z)V

    .line 153
    invoke-virtual {p0, v7}, Ltwitter4j/conf/ConfigurationBase;->setGZIPEnabled(Z)V

    .line 154
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setHttpProxyHost(Ljava/lang/String;)V

    .line 155
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setHttpProxyUser(Ljava/lang/String;)V

    .line 156
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setHttpProxyPassword(Ljava/lang/String;)V

    .line 157
    const/4 v3, -0x1

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setHttpProxyPort(I)V

    .line 158
    const/16 v3, 0x4e20

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setHttpConnectionTimeout(I)V

    .line 159
    const v3, 0x1d4c0

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setHttpReadTimeout(I)V

    .line 160
    const v3, 0x9c40

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setHttpStreamingReadTimeout(I)V

    .line 161
    invoke-virtual {p0, v6}, Ltwitter4j/conf/ConfigurationBase;->setHttpRetryCount(I)V

    .line 162
    const/4 v3, 0x5

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setHttpRetryIntervalSeconds(I)V

    .line 163
    const/16 v3, 0x14

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setHttpMaxTotalConnections(I)V

    .line 164
    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setHttpDefaultMaxPerRoute(I)V

    .line 165
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setOAuthConsumerKey(Ljava/lang/String;)V

    .line 166
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setOAuthConsumerSecret(Ljava/lang/String;)V

    .line 167
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setOAuthAccessToken(Ljava/lang/String;)V

    .line 168
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setOAuthAccessTokenSecret(Ljava/lang/String;)V

    .line 169
    invoke-virtual {p0, v7}, Ltwitter4j/conf/ConfigurationBase;->setAsyncNumThreads(I)V

    .line 170
    const-wide/16 v3, -0x1

    invoke-virtual {p0, v3, v4}, Ltwitter4j/conf/ConfigurationBase;->setContributingTo(J)V

    .line 171
    invoke-static {}, Ltwitter4j/Version;->getVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setClientVersion(Ljava/lang/String;)V

    .line 172
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http://twitter4j.org/en/twitter4j-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ltwitter4j/Version;->getVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".xml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setClientURL(Ljava/lang/String;)V

    .line 173
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "twitter4j http://twitter4j.org/ /"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Ltwitter4j/Version;->getVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setUserAgent(Ljava/lang/String;)V

    .line 175
    invoke-virtual {p0, v6}, Ltwitter4j/conf/ConfigurationBase;->setJSONStoreEnabled(Z)V

    .line 177
    invoke-virtual {p0, v6}, Ltwitter4j/conf/ConfigurationBase;->setMBeanEnabled(Z)V

    .line 179
    const-string v3, "https://api.twitter.com/oauth/request_token"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setOAuthRequestTokenURL(Ljava/lang/String;)V

    .line 180
    const-string v3, "https://api.twitter.com/oauth/authorize"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setOAuthAuthorizationURL(Ljava/lang/String;)V

    .line 181
    const-string v3, "https://api.twitter.com/oauth/access_token"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setOAuthAccessTokenURL(Ljava/lang/String;)V

    .line 182
    const-string v3, "https://api.twitter.com/oauth/authenticate"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setOAuthAuthenticationURL(Ljava/lang/String;)V

    .line 183
    const-string v3, "https://api.twitter.com/oauth2/token"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setOAuth2TokenURL(Ljava/lang/String;)V

    .line 184
    const-string v3, "https://api.twitter.com/oauth2/invalidate_token"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setOAuth2InvalidateTokenURL(Ljava/lang/String;)V

    .line 186
    const-string v3, "https://api.twitter.com/1.1/"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setRestBaseURL(Ljava/lang/String;)V

    .line 187
    const-string v3, "https://stream.twitter.com/1.1/"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setStreamBaseURL(Ljava/lang/String;)V

    .line 188
    const-string v3, "https://userstream.twitter.com/1.1/"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setUserStreamBaseURL(Ljava/lang/String;)V

    .line 189
    const-string v3, "https://sitestream.twitter.com/1.1/"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setSiteStreamBaseURL(Ljava/lang/String;)V

    .line 191
    const-string v3, "twitter4j.internal.async.DispatcherImpl"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setDispatcherImpl(Ljava/lang/String;)V

    .line 192
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setLoggerFactory(Ljava/lang/String;)V

    .line 194
    invoke-virtual {p0, v6}, Ltwitter4j/conf/ConfigurationBase;->setUserStreamRepliesAllEnabled(Z)V

    .line 195
    invoke-virtual {p0, v7}, Ltwitter4j/conf/ConfigurationBase;->setStallWarningsEnabled(Z)V

    .line 198
    :try_start_0
    const-string v3, "twitter4j.dalvik"

    sget-object v4, Ltwitter4j/conf/ConfigurationBase;->dalvikDetected:Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 203
    .local v1, isDalvik:Ljava/lang/String;
    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iput-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->IS_DALVIK:Z

    .line 207
    :try_start_1
    const-string v3, "twitter4j.gae"

    sget-object v4, Ltwitter4j/conf/ConfigurationBase;->gaeDetected:Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .line 212
    .local v2, isGAE:Ljava/lang/String;
    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    iput-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->IS_GAE:Z

    .line 214
    const-string v3, "TWITTER"

    invoke-virtual {p0, v3}, Ltwitter4j/conf/ConfigurationBase;->setMediaProvider(Ljava/lang/String;)V

    .line 215
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setMediaProviderAPIKey(Ljava/lang/String;)V

    .line 216
    invoke-virtual {p0, v5}, Ltwitter4j/conf/ConfigurationBase;->setMediaProviderParameters(Ljava/util/Properties;)V

    .line 217
    return-void

    .line 199
    .end local v1           #isDalvik:Ljava/lang/String;
    .end local v2           #isGAE:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 201
    .local v0, ignore:Ljava/lang/SecurityException;
    sget-object v1, Ltwitter4j/conf/ConfigurationBase;->dalvikDetected:Ljava/lang/String;

    .restart local v1       #isDalvik:Ljava/lang/String;
    goto :goto_0

    .line 208
    .end local v0           #ignore:Ljava/lang/SecurityException;
    :catch_1
    move-exception v0

    .line 210
    .restart local v0       #ignore:Ljava/lang/SecurityException;
    sget-object v2, Ltwitter4j/conf/ConfigurationBase;->gaeDetected:Ljava/lang/String;

    .restart local v2       #isGAE:Ljava/lang/String;
    goto :goto_1
.end method

.method private static cacheInstance(Ltwitter4j/conf/ConfigurationBase;)V
    .locals 1
    .parameter "conf"

    .prologue
    .line 978
    sget-object v0, Ltwitter4j/conf/ConfigurationBase;->instances:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 979
    sget-object v0, Ltwitter4j/conf/ConfigurationBase;->instances:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 981
    :cond_0
    return-void
.end method

.method private fixRestBaseURL()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 520
    const-string v0, "https://api.twitter.com/1.1/"

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    invoke-static {v2, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 521
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    invoke-static {v0, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    .line 523
    :cond_0
    const-string v0, "https://api.twitter.com/oauth/access_token"

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    invoke-static {v2, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 524
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    invoke-static {v0, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    .line 526
    :cond_1
    const-string v0, "https://api.twitter.com/oauth/authenticate"

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    invoke-static {v2, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 527
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    invoke-static {v0, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    .line 529
    :cond_2
    const-string v0, "https://api.twitter.com/oauth/authorize"

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    invoke-static {v2, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 530
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    invoke-static {v0, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    .line 532
    :cond_3
    const-string v0, "https://api.twitter.com/oauth/request_token"

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    invoke-static {v2, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 533
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    invoke-static {v0, v1}, Ltwitter4j/conf/ConfigurationBase;->fixURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    .line 535
    :cond_4
    return-void
.end method

.method static fixURL(ZLjava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "useSSL"
    .parameter "url"

    .prologue
    .line 748
    if-nez p1, :cond_0

    .line 749
    const/4 v2, 0x0

    .line 759
    :goto_0
    return-object v2

    .line 751
    :cond_0
    const-string v2, "://"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 752
    .local v1, index:I
    const/4 v2, -0x1

    if-ne v2, v1, :cond_1

    .line 753
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "url should contain \'://\'"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 755
    :cond_1
    add-int/lit8 v2, v1, 0x3

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    .line 756
    .local v0, hostAndLater:Ljava/lang/String;
    if-eqz p0, :cond_2

    .line 757
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 759
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "http://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method private static getInstance(Ltwitter4j/conf/ConfigurationBase;)Ltwitter4j/conf/ConfigurationBase;
    .locals 2
    .parameter "configurationBase"

    .prologue
    .line 989
    sget-object v1, Ltwitter4j/conf/ConfigurationBase;->instances:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .local v0, index:I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 990
    sget-object v1, Ltwitter4j/conf/ConfigurationBase;->instances:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 993
    .end local p0
    :goto_0
    return-object p0

    .restart local p0
    :cond_0
    sget-object v1, Ltwitter4j/conf/ConfigurationBase;->instances:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltwitter4j/conf/ConfigurationBase;

    move-object p0, v1

    goto :goto_0
.end method

.method private initRequestHeaders()V
    .locals 3

    .prologue
    .line 292
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    .line 293
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    const-string v1, "X-Twitter-Client-Version"

    invoke-virtual {p0}, Ltwitter4j/conf/ConfigurationBase;->getClientVersion()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    const-string v1, "X-Twitter-Client-URL"

    invoke-virtual {p0}, Ltwitter4j/conf/ConfigurationBase;->getClientURL()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    const-string v1, "X-Twitter-Client"

    const-string v2, "Twitter4J"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 297
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    const-string v1, "User-Agent"

    invoke-virtual {p0}, Ltwitter4j/conf/ConfigurationBase;->getUserAgent()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 298
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->gzipEnabled:Z

    if-eqz v0, :cond_0

    .line 299
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    const-string v1, "Accept-Encoding"

    const-string v2, "gzip"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 301
    :cond_0
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->IS_DALVIK:Z

    if-eqz v0, :cond_1

    .line 302
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    const-string v1, "Connection"

    const-string v2, "close"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    :cond_1
    return-void
.end method


# virtual methods
.method protected cacheInstance()V
    .locals 0

    .prologue
    .line 984
    invoke-static {p0}, Ltwitter4j/conf/ConfigurationBase;->cacheInstance(Ltwitter4j/conf/ConfigurationBase;)V

    .line 985
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 765
    if-ne p0, p1, :cond_1

    .line 851
    :cond_0
    :goto_0
    return v1

    .line 766
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 768
    check-cast v0, Ltwitter4j/conf/ConfigurationBase;

    .line 770
    .local v0, that:Ltwitter4j/conf/ConfigurationBase;
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->IS_DALVIK:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->IS_DALVIK:Z

    if-eq v3, v4, :cond_4

    move v1, v2

    goto :goto_0

    .line 771
    :cond_4
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->IS_GAE:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->IS_GAE:Z

    if-eq v3, v4, :cond_5

    move v1, v2

    goto :goto_0

    .line 772
    :cond_5
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->asyncNumThreads:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->asyncNumThreads:I

    if-eq v3, v4, :cond_6

    move v1, v2

    goto :goto_0

    .line 773
    :cond_6
    iget-wide v3, p0, Ltwitter4j/conf/ConfigurationBase;->contributingTo:J

    iget-wide v5, v0, Ltwitter4j/conf/ConfigurationBase;->contributingTo:J

    cmp-long v3, v3, v5

    if-eqz v3, :cond_7

    move v1, v2

    goto :goto_0

    .line 774
    :cond_7
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->debug:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->debug:Z

    if-eq v3, v4, :cond_8

    move v1, v2

    goto :goto_0

    .line 775
    :cond_8
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->defaultMaxPerRoute:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->defaultMaxPerRoute:I

    if-eq v3, v4, :cond_9

    move v1, v2

    goto :goto_0

    .line 776
    :cond_9
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->gzipEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->gzipEnabled:Z

    if-eq v3, v4, :cond_a

    move v1, v2

    goto :goto_0

    .line 777
    :cond_a
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpConnectionTimeout:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpConnectionTimeout:I

    if-eq v3, v4, :cond_b

    move v1, v2

    goto :goto_0

    .line 778
    :cond_b
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPort:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPort:I

    if-eq v3, v4, :cond_c

    move v1, v2

    goto :goto_0

    .line 779
    :cond_c
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpReadTimeout:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpReadTimeout:I

    if-eq v3, v4, :cond_d

    move v1, v2

    goto :goto_0

    .line 780
    :cond_d
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryCount:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpRetryCount:I

    if-eq v3, v4, :cond_e

    move v1, v2

    goto :goto_0

    .line 781
    :cond_e
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryIntervalSeconds:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpRetryIntervalSeconds:I

    if-eq v3, v4, :cond_f

    move v1, v2

    goto :goto_0

    .line 782
    :cond_f
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpStreamingReadTimeout:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpStreamingReadTimeout:I

    if-eq v3, v4, :cond_10

    move v1, v2

    goto :goto_0

    .line 783
    :cond_10
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->includeEntitiesEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->includeEntitiesEnabled:Z

    if-eq v3, v4, :cond_11

    move v1, v2

    goto/16 :goto_0

    .line 784
    :cond_11
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->includeMyRetweetEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->includeMyRetweetEnabled:Z

    if-eq v3, v4, :cond_12

    move v1, v2

    goto/16 :goto_0

    .line 785
    :cond_12
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->trimUserEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->trimUserEnabled:Z

    if-eq v3, v4, :cond_13

    move v1, v2

    goto/16 :goto_0

    .line 786
    :cond_13
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->includeRTsEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->includeRTsEnabled:Z

    if-eq v3, v4, :cond_14

    move v1, v2

    goto/16 :goto_0

    .line 787
    :cond_14
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->jsonStoreEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->jsonStoreEnabled:Z

    if-eq v3, v4, :cond_15

    move v1, v2

    goto/16 :goto_0

    .line 788
    :cond_15
    iget v3, p0, Ltwitter4j/conf/ConfigurationBase;->maxTotalConnections:I

    iget v4, v0, Ltwitter4j/conf/ConfigurationBase;->maxTotalConnections:I

    if-eq v3, v4, :cond_16

    move v1, v2

    goto/16 :goto_0

    .line 789
    :cond_16
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->mbeanEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->mbeanEnabled:Z

    if-eq v3, v4, :cond_17

    move v1, v2

    goto/16 :goto_0

    .line 790
    :cond_17
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->prettyDebug:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->prettyDebug:Z

    if-eq v3, v4, :cond_18

    move v1, v2

    goto/16 :goto_0

    .line 791
    :cond_18
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->stallWarningsEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->stallWarningsEnabled:Z

    if-eq v3, v4, :cond_19

    move v1, v2

    goto/16 :goto_0

    .line 792
    :cond_19
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->applicationOnlyAuthEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->applicationOnlyAuthEnabled:Z

    if-eq v3, v4, :cond_1a

    move v1, v2

    goto/16 :goto_0

    .line 793
    :cond_1a
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    if-eq v3, v4, :cond_1b

    move v1, v2

    goto/16 :goto_0

    .line 794
    :cond_1b
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamRepliesAllEnabled:Z

    iget-boolean v4, v0, Ltwitter4j/conf/ConfigurationBase;->userStreamRepliesAllEnabled:Z

    if-eq v3, v4, :cond_1c

    move v1, v2

    goto/16 :goto_0

    .line 795
    :cond_1c
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    if-eqz v3, :cond_1e

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1f

    :cond_1d
    move v1, v2

    goto/16 :goto_0

    :cond_1e
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    if-nez v3, :cond_1d

    .line 796
    :cond_1f
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    if-eqz v3, :cond_21

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_22

    :cond_20
    move v1, v2

    .line 797
    goto/16 :goto_0

    .line 796
    :cond_21
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    if-nez v3, :cond_20

    .line 798
    :cond_22
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    if-eqz v3, :cond_24

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_25

    :cond_23
    move v1, v2

    .line 799
    goto/16 :goto_0

    .line 798
    :cond_24
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    if-nez v3, :cond_23

    .line 800
    :cond_25
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    if-eqz v3, :cond_27

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_28

    :cond_26
    move v1, v2

    .line 801
    goto/16 :goto_0

    .line 800
    :cond_27
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    if-nez v3, :cond_26

    .line 802
    :cond_28
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    if-eqz v3, :cond_2a

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2b

    :cond_29
    move v1, v2

    .line 803
    goto/16 :goto_0

    .line 802
    :cond_2a
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    if-nez v3, :cond_29

    .line 804
    :cond_2b
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    if-eqz v3, :cond_2d

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2e

    :cond_2c
    move v1, v2

    .line 805
    goto/16 :goto_0

    .line 804
    :cond_2d
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    if-nez v3, :cond_2c

    .line 806
    :cond_2e
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    if-eqz v3, :cond_30

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_31

    :cond_2f
    move v1, v2

    .line 807
    goto/16 :goto_0

    .line 806
    :cond_30
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    if-nez v3, :cond_2f

    .line 808
    :cond_31
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    if-eqz v3, :cond_33

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_34

    :cond_32
    move v1, v2

    .line 809
    goto/16 :goto_0

    .line 808
    :cond_33
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    if-nez v3, :cond_32

    .line 810
    :cond_34
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    if-eqz v3, :cond_36

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_37

    :cond_35
    move v1, v2

    .line 811
    goto/16 :goto_0

    .line 810
    :cond_36
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    if-nez v3, :cond_35

    .line 812
    :cond_37
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    if-eqz v3, :cond_39

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    invoke-virtual {v3, v4}, Ljava/util/Properties;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3a

    :cond_38
    move v1, v2

    .line 813
    goto/16 :goto_0

    .line 812
    :cond_39
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    if-nez v3, :cond_38

    .line 814
    :cond_3a
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    if-eqz v3, :cond_3c

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3d

    :cond_3b
    move v1, v2

    .line 815
    goto/16 :goto_0

    .line 814
    :cond_3c
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    if-nez v3, :cond_3b

    .line 816
    :cond_3d
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    if-eqz v3, :cond_3f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_40

    :cond_3e
    move v1, v2

    .line 817
    goto/16 :goto_0

    .line 816
    :cond_3f
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    if-nez v3, :cond_3e

    .line 818
    :cond_40
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    if-eqz v3, :cond_42

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_43

    :cond_41
    move v1, v2

    .line 819
    goto/16 :goto_0

    .line 818
    :cond_42
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    if-nez v3, :cond_41

    .line 820
    :cond_43
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    if-eqz v3, :cond_45

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_46

    :cond_44
    move v1, v2

    .line 821
    goto/16 :goto_0

    .line 820
    :cond_45
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    if-nez v3, :cond_44

    .line 822
    :cond_46
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    if-eqz v3, :cond_48

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_49

    :cond_47
    move v1, v2

    .line 823
    goto/16 :goto_0

    .line 822
    :cond_48
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    if-nez v3, :cond_47

    .line 824
    :cond_49
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    if-eqz v3, :cond_4b

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4c

    :cond_4a
    move v1, v2

    .line 825
    goto/16 :goto_0

    .line 824
    :cond_4b
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    if-nez v3, :cond_4a

    .line 826
    :cond_4c
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    if-eqz v3, :cond_4e

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4f

    :cond_4d
    move v1, v2

    .line 827
    goto/16 :goto_0

    .line 826
    :cond_4e
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    if-nez v3, :cond_4d

    .line 828
    :cond_4f
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    if-eqz v3, :cond_51

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_52

    :cond_50
    move v1, v2

    .line 829
    goto/16 :goto_0

    .line 828
    :cond_51
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    if-nez v3, :cond_50

    .line 830
    :cond_52
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    if-eqz v3, :cond_54

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_55

    :cond_53
    move v1, v2

    .line 831
    goto/16 :goto_0

    .line 830
    :cond_54
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    if-nez v3, :cond_53

    .line 832
    :cond_55
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    if-eqz v3, :cond_57

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_58

    :cond_56
    move v1, v2

    .line 833
    goto/16 :goto_0

    .line 832
    :cond_57
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    if-nez v3, :cond_56

    .line 834
    :cond_58
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    if-eqz v3, :cond_5a

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5b

    :cond_59
    move v1, v2

    .line 835
    goto/16 :goto_0

    .line 834
    :cond_5a
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    if-nez v3, :cond_59

    .line 836
    :cond_5b
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    if-eqz v3, :cond_5d

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5e

    :cond_5c
    move v1, v2

    .line 837
    goto/16 :goto_0

    .line 836
    :cond_5d
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    if-nez v3, :cond_5c

    .line 838
    :cond_5e
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    if-eqz v3, :cond_60

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_61

    :cond_5f
    move v1, v2

    goto/16 :goto_0

    :cond_60
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    if-nez v3, :cond_5f

    .line 839
    :cond_61
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    if-eqz v3, :cond_63

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    invoke-interface {v3, v4}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_64

    :cond_62
    move v1, v2

    .line 840
    goto/16 :goto_0

    .line 839
    :cond_63
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    if-nez v3, :cond_62

    .line 841
    :cond_64
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_66

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_67

    :cond_65
    move v1, v2

    goto/16 :goto_0

    :cond_66
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    if-nez v3, :cond_65

    .line 842
    :cond_67
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_69

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6a

    :cond_68
    move v1, v2

    .line 843
    goto/16 :goto_0

    .line 842
    :cond_69
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    if-nez v3, :cond_68

    .line 844
    :cond_6a
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_6c

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6d

    :cond_6b
    move v1, v2

    .line 845
    goto/16 :goto_0

    .line 844
    :cond_6c
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    if-nez v3, :cond_6b

    .line 846
    :cond_6d
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    if-eqz v3, :cond_6f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_70

    :cond_6e
    move v1, v2

    goto/16 :goto_0

    :cond_6f
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    if-nez v3, :cond_6e

    .line 847
    :cond_70
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    if-eqz v3, :cond_72

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_73

    :cond_71
    move v1, v2

    goto/16 :goto_0

    :cond_72
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    if-nez v3, :cond_71

    .line 848
    :cond_73
    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_74

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 849
    goto/16 :goto_0

    .line 848
    :cond_74
    iget-object v3, v0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public final getAsyncNumThreads()I
    .locals 1

    .prologue
    .line 473
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->asyncNumThreads:I

    return v0
.end method

.method public final getClientURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 501
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    return-object v0
.end method

.method public final getClientVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 491
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    return-object v0
.end method

.method public final getContributingTo()J
    .locals 2

    .prologue
    .line 482
    iget-wide v0, p0, Ltwitter4j/conf/ConfigurationBase;->contributingTo:J

    return-wide v0
.end method

.method public getDispatcherImpl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 626
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    return-object v0
.end method

.method public final getHttpConnectionTimeout()I
    .locals 1

    .prologue
    .line 351
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpConnectionTimeout:I

    return v0
.end method

.method public final getHttpDefaultMaxPerRoute()I
    .locals 1

    .prologue
    .line 406
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->defaultMaxPerRoute:I

    return v0
.end method

.method public final getHttpMaxTotalConnections()I
    .locals 1

    .prologue
    .line 397
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->maxTotalConnections:I

    return v0
.end method

.method public final getHttpProxyHost()Ljava/lang/String;
    .locals 1

    .prologue
    .line 315
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    return-object v0
.end method

.method public final getHttpProxyPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 333
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    return-object v0
.end method

.method public final getHttpProxyPort()I
    .locals 1

    .prologue
    .line 342
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPort:I

    return v0
.end method

.method public final getHttpProxyUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 324
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    return-object v0
.end method

.method public final getHttpReadTimeout()I
    .locals 1

    .prologue
    .line 360
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpReadTimeout:I

    return v0
.end method

.method public final getHttpRetryCount()I
    .locals 1

    .prologue
    .line 379
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryCount:I

    return v0
.end method

.method public final getHttpRetryIntervalSeconds()I
    .locals 1

    .prologue
    .line 388
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryIntervalSeconds:I

    return v0
.end method

.method public getHttpStreamingReadTimeout()I
    .locals 1

    .prologue
    .line 369
    iget v0, p0, Ltwitter4j/conf/ConfigurationBase;->httpStreamingReadTimeout:I

    return v0
.end method

.method public getLoggerFactory()Ljava/lang/String;
    .locals 1

    .prologue
    .line 635
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaProvider()Ljava/lang/String;
    .locals 1

    .prologue
    .line 722
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaProviderAPIKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 731
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    return-object v0
.end method

.method public getMediaProviderParameters()Ljava/util/Properties;
    .locals 1

    .prologue
    .line 740
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    return-object v0
.end method

.method public getOAuth2AccessToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 464
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuth2InvalidateTokenURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 616
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuth2TokenType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 455
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuth2TokenURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 606
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuthAccessToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuthAccessTokenSecret()Ljava/lang/String;
    .locals 1

    .prologue
    .line 446
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuthAccessTokenURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 586
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuthAuthenticationURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 596
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuthAuthorizationURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 576
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    return-object v0
.end method

.method public final getOAuthConsumerKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 417
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    return-object v0
.end method

.method public final getOAuthConsumerSecret()Ljava/lang/String;
    .locals 1

    .prologue
    .line 427
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    return-object v0
.end method

.method public getOAuthRequestTokenURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 566
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    return-object v0
.end method

.method public final getPassword()Ljava/lang/String;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getRequestHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 308
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    return-object v0
.end method

.method public getRestBaseURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 511
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    return-object v0
.end method

.method public getSiteStreamBaseURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 557
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    return-object v0
.end method

.method public getStreamBaseURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 539
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    return-object v0
.end method

.method public final getUser()Ljava/lang/String;
    .locals 1

    .prologue
    .line 248
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    return-object v0
.end method

.method public final getUserAgent()Ljava/lang/String;
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    return-object v0
.end method

.method public getUserStreamBaseURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 548
    iget-object v0, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 9

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 856
    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->debug:Z

    if-eqz v3, :cond_1

    move v0, v1

    .line 857
    .local v0, result:I
    :goto_0
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    if-eqz v3, :cond_2

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int v0, v4, v3

    .line 858
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    if-eqz v3, :cond_3

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    add-int v0, v4, v3

    .line 859
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    if-eqz v3, :cond_4

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3
    add-int v0, v4, v3

    .line 860
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    if-eqz v3, :cond_5

    move v3, v1

    :goto_4
    add-int v0, v4, v3

    .line 861
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->prettyDebug:Z

    if-eqz v3, :cond_6

    move v3, v1

    :goto_5
    add-int v0, v4, v3

    .line 862
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->gzipEnabled:Z

    if-eqz v3, :cond_7

    move v3, v1

    :goto_6
    add-int v0, v4, v3

    .line 863
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    if-eqz v3, :cond_8

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_7
    add-int v0, v4, v3

    .line 864
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    if-eqz v3, :cond_9

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_8
    add-int v0, v4, v3

    .line 865
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    if-eqz v3, :cond_a

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_9
    add-int v0, v4, v3

    .line 866
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPort:I

    add-int v0, v3, v4

    .line 867
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->httpConnectionTimeout:I

    add-int v0, v3, v4

    .line 868
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->httpReadTimeout:I

    add-int v0, v3, v4

    .line 869
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->httpStreamingReadTimeout:I

    add-int v0, v3, v4

    .line 870
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryCount:I

    add-int v0, v3, v4

    .line 871
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryIntervalSeconds:I

    add-int v0, v3, v4

    .line 872
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->maxTotalConnections:I

    add-int v0, v3, v4

    .line 873
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->defaultMaxPerRoute:I

    add-int v0, v3, v4

    .line 874
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    if-eqz v3, :cond_b

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_a
    add-int v0, v4, v3

    .line 875
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    if-eqz v3, :cond_c

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_b
    add-int v0, v4, v3

    .line 876
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    if-eqz v3, :cond_d

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_c
    add-int v0, v4, v3

    .line 877
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    if-eqz v3, :cond_e

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_d
    add-int v0, v4, v3

    .line 878
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    if-eqz v3, :cond_f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_e
    add-int v0, v4, v3

    .line 879
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    if-eqz v3, :cond_10

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_f
    add-int v0, v4, v3

    .line 880
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    if-eqz v3, :cond_11

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_10
    add-int v0, v4, v3

    .line 881
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    if-eqz v3, :cond_12

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_11
    add-int v0, v4, v3

    .line 882
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    if-eqz v3, :cond_13

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_12
    add-int v0, v4, v3

    .line 883
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    if-eqz v3, :cond_14

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_13
    add-int v0, v4, v3

    .line 884
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    if-eqz v3, :cond_15

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_14
    add-int v0, v4, v3

    .line 885
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    if-eqz v3, :cond_16

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_15
    add-int v0, v4, v3

    .line 886
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_17

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_16
    add-int v0, v4, v3

    .line 887
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_18

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_17
    add-int v0, v4, v3

    .line 888
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_19

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_18
    add-int v0, v4, v3

    .line 889
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    if-eqz v3, :cond_1a

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_19
    add-int v0, v4, v3

    .line 890
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    if-eqz v3, :cond_1b

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1a
    add-int v0, v4, v3

    .line 891
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    if-eqz v3, :cond_1c

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1b
    add-int v0, v4, v3

    .line 892
    mul-int/lit8 v3, v0, 0x1f

    iget v4, p0, Ltwitter4j/conf/ConfigurationBase;->asyncNumThreads:I

    add-int v0, v3, v4

    .line 893
    mul-int/lit8 v3, v0, 0x1f

    iget-wide v4, p0, Ltwitter4j/conf/ConfigurationBase;->contributingTo:J

    iget-wide v6, p0, Ltwitter4j/conf/ConfigurationBase;->contributingTo:J

    const/16 v8, 0x20

    ushr-long/2addr v6, v8

    xor-long/2addr v4, v6

    long-to-int v4, v4

    add-int v0, v3, v4

    .line 894
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->includeRTsEnabled:Z

    if-eqz v3, :cond_1d

    move v3, v1

    :goto_1c
    add-int v0, v4, v3

    .line 895
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->includeEntitiesEnabled:Z

    if-eqz v3, :cond_1e

    move v3, v1

    :goto_1d
    add-int v0, v4, v3

    .line 896
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->includeMyRetweetEnabled:Z

    if-eqz v3, :cond_1f

    move v3, v1

    :goto_1e
    add-int v0, v4, v3

    .line 897
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->trimUserEnabled:Z

    if-eqz v3, :cond_20

    move v3, v1

    :goto_1f
    add-int v0, v4, v3

    .line 898
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->jsonStoreEnabled:Z

    if-eqz v3, :cond_21

    move v3, v1

    :goto_20
    add-int v0, v4, v3

    .line 899
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->mbeanEnabled:Z

    if-eqz v3, :cond_22

    move v3, v1

    :goto_21
    add-int v0, v4, v3

    .line 900
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamRepliesAllEnabled:Z

    if-eqz v3, :cond_23

    move v3, v1

    :goto_22
    add-int v0, v4, v3

    .line 901
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->stallWarningsEnabled:Z

    if-eqz v3, :cond_24

    move v3, v1

    :goto_23
    add-int v0, v4, v3

    .line 902
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->applicationOnlyAuthEnabled:Z

    if-eqz v3, :cond_25

    move v3, v1

    :goto_24
    add-int v0, v4, v3

    .line 903
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    if-eqz v3, :cond_26

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_25
    add-int v0, v4, v3

    .line 904
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    if-eqz v3, :cond_27

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_26
    add-int v0, v4, v3

    .line 905
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    if-eqz v3, :cond_28

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    invoke-virtual {v3}, Ljava/util/Properties;->hashCode()I

    move-result v3

    :goto_27
    add-int v0, v4, v3

    .line 906
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    if-eqz v3, :cond_29

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_28
    add-int v0, v4, v3

    .line 907
    mul-int/lit8 v4, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    if-eqz v3, :cond_2a

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_29
    add-int v0, v4, v3

    .line 908
    mul-int/lit8 v4, v0, 0x1f

    iget-boolean v3, p0, Ltwitter4j/conf/ConfigurationBase;->IS_DALVIK:Z

    if-eqz v3, :cond_2b

    move v3, v1

    :goto_2a
    add-int v0, v4, v3

    .line 909
    mul-int/lit8 v3, v0, 0x1f

    iget-boolean v4, p0, Ltwitter4j/conf/ConfigurationBase;->IS_GAE:Z

    if-eqz v4, :cond_2c

    :goto_2b
    add-int v0, v3, v1

    .line 910
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    if-eqz v3, :cond_0

    iget-object v2, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->hashCode()I

    move-result v2

    :cond_0
    add-int v0, v1, v2

    .line 911
    return v0

    .end local v0           #result:I
    :cond_1
    move v0, v2

    .line 856
    goto/16 :goto_0

    .restart local v0       #result:I
    :cond_2
    move v3, v2

    .line 857
    goto/16 :goto_1

    :cond_3
    move v3, v2

    .line 858
    goto/16 :goto_2

    :cond_4
    move v3, v2

    .line 859
    goto/16 :goto_3

    :cond_5
    move v3, v2

    .line 860
    goto/16 :goto_4

    :cond_6
    move v3, v2

    .line 861
    goto/16 :goto_5

    :cond_7
    move v3, v2

    .line 862
    goto/16 :goto_6

    :cond_8
    move v3, v2

    .line 863
    goto/16 :goto_7

    :cond_9
    move v3, v2

    .line 864
    goto/16 :goto_8

    :cond_a
    move v3, v2

    .line 865
    goto/16 :goto_9

    :cond_b
    move v3, v2

    .line 874
    goto/16 :goto_a

    :cond_c
    move v3, v2

    .line 875
    goto/16 :goto_b

    :cond_d
    move v3, v2

    .line 876
    goto/16 :goto_c

    :cond_e
    move v3, v2

    .line 877
    goto/16 :goto_d

    :cond_f
    move v3, v2

    .line 878
    goto/16 :goto_e

    :cond_10
    move v3, v2

    .line 879
    goto/16 :goto_f

    :cond_11
    move v3, v2

    .line 880
    goto/16 :goto_10

    :cond_12
    move v3, v2

    .line 881
    goto/16 :goto_11

    :cond_13
    move v3, v2

    .line 882
    goto/16 :goto_12

    :cond_14
    move v3, v2

    .line 883
    goto/16 :goto_13

    :cond_15
    move v3, v2

    .line 884
    goto/16 :goto_14

    :cond_16
    move v3, v2

    .line 885
    goto/16 :goto_15

    :cond_17
    move v3, v2

    .line 886
    goto/16 :goto_16

    :cond_18
    move v3, v2

    .line 887
    goto/16 :goto_17

    :cond_19
    move v3, v2

    .line 888
    goto/16 :goto_18

    :cond_1a
    move v3, v2

    .line 889
    goto/16 :goto_19

    :cond_1b
    move v3, v2

    .line 890
    goto/16 :goto_1a

    :cond_1c
    move v3, v2

    .line 891
    goto/16 :goto_1b

    :cond_1d
    move v3, v2

    .line 894
    goto/16 :goto_1c

    :cond_1e
    move v3, v2

    .line 895
    goto/16 :goto_1d

    :cond_1f
    move v3, v2

    .line 896
    goto/16 :goto_1e

    :cond_20
    move v3, v2

    .line 897
    goto/16 :goto_1f

    :cond_21
    move v3, v2

    .line 898
    goto/16 :goto_20

    :cond_22
    move v3, v2

    .line 899
    goto/16 :goto_21

    :cond_23
    move v3, v2

    .line 900
    goto/16 :goto_22

    :cond_24
    move v3, v2

    .line 901
    goto/16 :goto_23

    :cond_25
    move v3, v2

    .line 902
    goto/16 :goto_24

    :cond_26
    move v3, v2

    .line 903
    goto/16 :goto_25

    :cond_27
    move v3, v2

    .line 904
    goto/16 :goto_26

    :cond_28
    move v3, v2

    .line 905
    goto/16 :goto_27

    :cond_29
    move v3, v2

    .line 906
    goto/16 :goto_28

    :cond_2a
    move v3, v2

    .line 907
    goto/16 :goto_29

    :cond_2b
    move v3, v2

    .line 908
    goto/16 :goto_2a

    :cond_2c
    move v1, v2

    .line 909
    goto/16 :goto_2b
.end method

.method public isApplicationOnlyAuthEnabled()Z
    .locals 1

    .prologue
    .line 713
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->applicationOnlyAuthEnabled:Z

    return v0
.end method

.method public final isDalvik()Z
    .locals 1

    .prologue
    .line 220
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->IS_DALVIK:Z

    return v0
.end method

.method public final isDebugEnabled()Z
    .locals 1

    .prologue
    .line 229
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->debug:Z

    return v0
.end method

.method public isGAE()Z
    .locals 1

    .prologue
    .line 224
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->IS_GAE:Z

    return v0
.end method

.method public isGZIPEnabled()Z
    .locals 1

    .prologue
    .line 285
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->gzipEnabled:Z

    return v0
.end method

.method public isIncludeEntitiesEnabled()Z
    .locals 1

    .prologue
    .line 645
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->includeEntitiesEnabled:Z

    return v0
.end method

.method public isIncludeMyRetweetEnabled()Z
    .locals 1

    .prologue
    .line 661
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->includeMyRetweetEnabled:Z

    return v0
.end method

.method public isIncludeRTsEnabled()Z
    .locals 1

    .prologue
    .line 640
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->includeRTsEnabled:Z

    return v0
.end method

.method public isJSONStoreEnabled()Z
    .locals 1

    .prologue
    .line 677
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->jsonStoreEnabled:Z

    return v0
.end method

.method public isMBeanEnabled()Z
    .locals 1

    .prologue
    .line 686
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->mbeanEnabled:Z

    return v0
.end method

.method public isPrettyDebugEnabled()Z
    .locals 1

    .prologue
    .line 266
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->prettyDebug:Z

    return v0
.end method

.method public isStallWarningsEnabled()Z
    .locals 1

    .prologue
    .line 704
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->stallWarningsEnabled:Z

    return v0
.end method

.method public isTrimUserEnabled()Z
    .locals 1

    .prologue
    .line 669
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->trimUserEnabled:Z

    return v0
.end method

.method public isUserStreamRepliesAllEnabled()Z
    .locals 1

    .prologue
    .line 695
    iget-boolean v0, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamRepliesAllEnabled:Z

    return v0
.end method

.method protected readResolve()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/ObjectStreamException;
        }
    .end annotation

    .prologue
    .line 999
    invoke-static {p0}, Ltwitter4j/conf/ConfigurationBase;->getInstance(Ltwitter4j/conf/ConfigurationBase;)Ltwitter4j/conf/ConfigurationBase;

    move-result-object v0

    return-object v0
.end method

.method protected final setApplicationOnlyAuthEnabled(Z)V
    .locals 0
    .parameter "applicationOnlyAuthEnabled"

    .prologue
    .line 717
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->applicationOnlyAuthEnabled:Z

    .line 718
    return-void
.end method

.method protected final setAsyncNumThreads(I)V
    .locals 0
    .parameter "asyncNumThreads"

    .prologue
    .line 477
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->asyncNumThreads:I

    .line 478
    return-void
.end method

.method protected final setClientURL(Ljava/lang/String;)V
    .locals 0
    .parameter "clientURL"

    .prologue
    .line 505
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    .line 506
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->initRequestHeaders()V

    .line 507
    return-void
.end method

.method protected final setClientVersion(Ljava/lang/String;)V
    .locals 0
    .parameter "clientVersion"

    .prologue
    .line 495
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    .line 496
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->initRequestHeaders()V

    .line 497
    return-void
.end method

.method protected final setContributingTo(J)V
    .locals 0
    .parameter "contributingTo"

    .prologue
    .line 486
    iput-wide p1, p0, Ltwitter4j/conf/ConfigurationBase;->contributingTo:J

    .line 487
    return-void
.end method

.method protected final setDebug(Z)V
    .locals 0
    .parameter "debug"

    .prologue
    .line 233
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->debug:Z

    .line 234
    return-void
.end method

.method protected final setDispatcherImpl(Ljava/lang/String;)V
    .locals 0
    .parameter "dispatcherImpl"

    .prologue
    .line 630
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    .line 631
    return-void
.end method

.method protected final setGZIPEnabled(Z)V
    .locals 0
    .parameter "gzipEnabled"

    .prologue
    .line 279
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->gzipEnabled:Z

    .line 280
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->initRequestHeaders()V

    .line 281
    return-void
.end method

.method protected final setHttpConnectionTimeout(I)V
    .locals 0
    .parameter "connectionTimeout"

    .prologue
    .line 355
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpConnectionTimeout:I

    .line 356
    return-void
.end method

.method protected final setHttpDefaultMaxPerRoute(I)V
    .locals 0
    .parameter "defaultMaxPerRoute"

    .prologue
    .line 410
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->defaultMaxPerRoute:I

    .line 411
    return-void
.end method

.method protected final setHttpMaxTotalConnections(I)V
    .locals 0
    .parameter "maxTotalConnections"

    .prologue
    .line 401
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->maxTotalConnections:I

    .line 402
    return-void
.end method

.method protected final setHttpProxyHost(Ljava/lang/String;)V
    .locals 0
    .parameter "proxyHost"

    .prologue
    .line 319
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    .line 320
    return-void
.end method

.method protected final setHttpProxyPassword(Ljava/lang/String;)V
    .locals 0
    .parameter "proxyPassword"

    .prologue
    .line 337
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    .line 338
    return-void
.end method

.method protected final setHttpProxyPort(I)V
    .locals 0
    .parameter "proxyPort"

    .prologue
    .line 346
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPort:I

    .line 347
    return-void
.end method

.method protected final setHttpProxyUser(Ljava/lang/String;)V
    .locals 0
    .parameter "proxyUser"

    .prologue
    .line 328
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    .line 329
    return-void
.end method

.method protected final setHttpReadTimeout(I)V
    .locals 0
    .parameter "readTimeout"

    .prologue
    .line 364
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpReadTimeout:I

    .line 365
    return-void
.end method

.method protected final setHttpRetryCount(I)V
    .locals 0
    .parameter "retryCount"

    .prologue
    .line 383
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryCount:I

    .line 384
    return-void
.end method

.method protected final setHttpRetryIntervalSeconds(I)V
    .locals 0
    .parameter "retryIntervalSeconds"

    .prologue
    .line 392
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryIntervalSeconds:I

    .line 393
    return-void
.end method

.method protected final setHttpStreamingReadTimeout(I)V
    .locals 0
    .parameter "httpStreamingReadTimeout"

    .prologue
    .line 373
    iput p1, p0, Ltwitter4j/conf/ConfigurationBase;->httpStreamingReadTimeout:I

    .line 374
    return-void
.end method

.method protected final setIncludeEntitiesEnbled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 657
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->includeEntitiesEnabled:Z

    .line 658
    return-void
.end method

.method public setIncludeMyRetweetEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 665
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->includeMyRetweetEnabled:Z

    .line 666
    return-void
.end method

.method protected final setIncludeRTsEnbled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 653
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->includeRTsEnabled:Z

    .line 654
    return-void
.end method

.method protected final setJSONStoreEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 681
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->jsonStoreEnabled:Z

    .line 682
    return-void
.end method

.method protected final setLoggerFactory(Ljava/lang/String;)V
    .locals 0
    .parameter "loggerImpl"

    .prologue
    .line 649
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    .line 650
    return-void
.end method

.method protected final setMBeanEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 690
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->mbeanEnabled:Z

    .line 691
    return-void
.end method

.method protected final setMediaProvider(Ljava/lang/String;)V
    .locals 0
    .parameter "mediaProvider"

    .prologue
    .line 726
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    .line 727
    return-void
.end method

.method protected final setMediaProviderAPIKey(Ljava/lang/String;)V
    .locals 0
    .parameter "mediaProviderAPIKey"

    .prologue
    .line 735
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    .line 736
    return-void
.end method

.method protected final setMediaProviderParameters(Ljava/util/Properties;)V
    .locals 0
    .parameter "props"

    .prologue
    .line 744
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    .line 745
    return-void
.end method

.method protected final setOAuth2AccessToken(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuth2AccessToken"

    .prologue
    .line 468
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    .line 469
    return-void
.end method

.method protected final setOAuth2InvalidateTokenURL(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuth2InvalidateTokenURL"

    .prologue
    .line 620
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    .line 621
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 622
    return-void
.end method

.method protected final setOAuth2TokenType(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuth2TokenType"

    .prologue
    .line 459
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    .line 460
    return-void
.end method

.method protected final setOAuth2TokenURL(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuth2TokenURL"

    .prologue
    .line 610
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    .line 611
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 612
    return-void
.end method

.method protected final setOAuthAccessToken(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuthAccessToken"

    .prologue
    .line 441
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    .line 442
    return-void
.end method

.method protected final setOAuthAccessTokenSecret(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuthAccessTokenSecret"

    .prologue
    .line 450
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    .line 451
    return-void
.end method

.method protected final setOAuthAccessTokenURL(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuthAccessTokenURL"

    .prologue
    .line 590
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    .line 591
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 592
    return-void
.end method

.method protected final setOAuthAuthenticationURL(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuthAuthenticationURL"

    .prologue
    .line 600
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    .line 601
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 602
    return-void
.end method

.method protected final setOAuthAuthorizationURL(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuthAuthorizationURL"

    .prologue
    .line 580
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    .line 581
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 582
    return-void
.end method

.method protected final setOAuthConsumerKey(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuthConsumerKey"

    .prologue
    .line 421
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    .line 422
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 423
    return-void
.end method

.method protected final setOAuthConsumerSecret(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuthConsumerSecret"

    .prologue
    .line 431
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    .line 432
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 433
    return-void
.end method

.method protected final setOAuthRequestTokenURL(Ljava/lang/String;)V
    .locals 0
    .parameter "oAuthRequestTokenURL"

    .prologue
    .line 570
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    .line 571
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 572
    return-void
.end method

.method protected final setPassword(Ljava/lang/String;)V
    .locals 0
    .parameter "password"

    .prologue
    .line 261
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    .line 262
    return-void
.end method

.method protected final setPrettyDebugEnabled(Z)V
    .locals 0
    .parameter "prettyDebug"

    .prologue
    .line 275
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->prettyDebug:Z

    .line 276
    return-void
.end method

.method protected final setRestBaseURL(Ljava/lang/String;)V
    .locals 0
    .parameter "restBaseURL"

    .prologue
    .line 515
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    .line 516
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 517
    return-void
.end method

.method protected final setSiteStreamBaseURL(Ljava/lang/String;)V
    .locals 0
    .parameter "siteStreamBaseURL"

    .prologue
    .line 561
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    .line 562
    return-void
.end method

.method protected final setStallWarningsEnabled(Z)V
    .locals 0
    .parameter "stallWarningsEnabled"

    .prologue
    .line 708
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->stallWarningsEnabled:Z

    .line 709
    return-void
.end method

.method protected final setStreamBaseURL(Ljava/lang/String;)V
    .locals 0
    .parameter "streamBaseURL"

    .prologue
    .line 543
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    .line 544
    return-void
.end method

.method public setTrimUserEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 673
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->trimUserEnabled:Z

    .line 674
    return-void
.end method

.method protected final setUseSSL(Z)V
    .locals 0
    .parameter "useSSL"

    .prologue
    .line 270
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    .line 271
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->fixRestBaseURL()V

    .line 272
    return-void
.end method

.method protected final setUser(Ljava/lang/String;)V
    .locals 0
    .parameter "user"

    .prologue
    .line 252
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    .line 253
    return-void
.end method

.method protected final setUserAgent(Ljava/lang/String;)V
    .locals 0
    .parameter "userAgent"

    .prologue
    .line 242
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    .line 243
    invoke-direct {p0}, Ltwitter4j/conf/ConfigurationBase;->initRequestHeaders()V

    .line 244
    return-void
.end method

.method protected final setUserStreamBaseURL(Ljava/lang/String;)V
    .locals 0
    .parameter "siteStreamBaseURL"

    .prologue
    .line 552
    iput-object p1, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    .line 553
    return-void
.end method

.method protected final setUserStreamRepliesAllEnabled(Z)V
    .locals 0
    .parameter "enabled"

    .prologue
    .line 699
    iput-boolean p1, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamRepliesAllEnabled:Z

    .line 700
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    const/16 v3, 0x27

    .line 916
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ConfigurationBase{debug="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->debug:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", userAgent=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->userAgent:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", user=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->user:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", password=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->password:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", useSSL="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->useSSL:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", prettyDebug="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->prettyDebug:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", gzipEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->gzipEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpProxyHost=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyHost:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpProxyUser=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyUser:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpProxyPassword=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPassword:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpProxyPort="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpProxyPort:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpConnectionTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpConnectionTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpReadTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpReadTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpStreamingReadTimeout="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpStreamingReadTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpRetryCount="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryCount:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", httpRetryIntervalSeconds="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->httpRetryIntervalSeconds:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", maxTotalConnections="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->maxTotalConnections:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", defaultMaxPerRoute="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->defaultMaxPerRoute:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuthConsumerKey=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuthConsumerSecret=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthConsumerSecret:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuthAccessToken=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuthAccessTokenSecret=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenSecret:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuth2TokenType=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuth2AccessToken=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2AccessToken:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuthRequestTokenURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthRequestTokenURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuthAuthorizationURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthorizationURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuthAccessTokenURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAccessTokenURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuthAuthenticationURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuthAuthenticationURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuth2TokenURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2TokenURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oAuth2InvalidateTokenURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->oAuth2InvalidateTokenURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", restBaseURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->restBaseURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", streamBaseURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->streamBaseURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", userStreamBaseURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamBaseURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", siteStreamBaseURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->siteStreamBaseURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", dispatcherImpl=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->dispatcherImpl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", loggerFactory=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->loggerFactory:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", asyncNumThreads="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/conf/ConfigurationBase;->asyncNumThreads:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", contributingTo="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Ltwitter4j/conf/ConfigurationBase;->contributingTo:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", includeRTsEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->includeRTsEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", includeEntitiesEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->includeEntitiesEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", includeMyRetweetEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->includeMyRetweetEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", trimUserEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->trimUserEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", jsonStoreEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->jsonStoreEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mbeanEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->mbeanEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", userStreamRepliesAllEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->userStreamRepliesAllEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", stallWarningsEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->stallWarningsEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", applicationOnlyAuthEnabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->applicationOnlyAuthEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mediaProvider=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProvider:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mediaProviderAPIKey=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderAPIKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", mediaProviderParameters="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->mediaProviderParameters:Ljava/util/Properties;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", clientVersion=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->clientVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", clientURL=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->clientURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", IS_DALVIK="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->IS_DALVIK:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", IS_GAE="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/conf/ConfigurationBase;->IS_GAE:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", requestHeaders="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/conf/ConfigurationBase;->requestHeaders:Ljava/util/Map;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
