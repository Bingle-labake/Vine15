.class abstract Ltwitter4j/TwitterBaseImpl;
.super Ljava/lang/Object;
.source "TwitterBaseImpl.java"

# interfaces
.implements Ltwitter4j/TwitterBase;
.implements Ljava/io/Serializable;
.implements Ltwitter4j/auth/OAuthSupport;
.implements Ltwitter4j/internal/http/HttpResponseListener;


# static fields
.field private static final serialVersionUID:J = -0x34e79201c9363e6cL


# instance fields
.field protected auth:Ltwitter4j/auth/Authorization;

.field protected conf:Ltwitter4j/conf/Configuration;

.field protected factory:Ltwitter4j/internal/json/z_T4JInternalFactory;

.field protected transient http:Ltwitter4j/internal/http/HttpClientWrapper;

.field protected transient id:J

.field protected transient screenName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ltwitter4j/conf/Configuration;Ltwitter4j/auth/Authorization;)V
    .locals 2
    .parameter "conf"
    .parameter "auth"

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Ltwitter4j/TwitterBaseImpl;->screenName:Ljava/lang/String;

    .line 36
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Ltwitter4j/TwitterBaseImpl;->id:J

    .line 47
    iput-object p1, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    .line 48
    iput-object p2, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    .line 49
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->init()V

    .line 50
    return-void
.end method

.method private getOAuth()Ltwitter4j/auth/OAuthSupport;
    .locals 2

    .prologue
    .line 399
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    instance-of v0, v0, Ltwitter4j/auth/OAuthSupport;

    if-nez v0, :cond_0

    .line 400
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OAuth consumer key/secret combination not supplied"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 403
    :cond_0
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    check-cast v0, Ltwitter4j/auth/OAuthSupport;

    return-object v0
.end method

.method private init()V
    .locals 7

    .prologue
    .line 53
    iget-object v5, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    if-nez v5, :cond_0

    .line 55
    iget-object v5, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v5}, Ltwitter4j/conf/Configuration;->getOAuthConsumerKey()Ljava/lang/String;

    move-result-object v2

    .line 56
    .local v2, consumerKey:Ljava/lang/String;
    iget-object v5, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v5}, Ltwitter4j/conf/Configuration;->getOAuthConsumerSecret()Ljava/lang/String;

    move-result-object v3

    .line 58
    .local v3, consumerSecret:Ljava/lang/String;
    if-eqz v2, :cond_0

    if-eqz v3, :cond_0

    .line 59
    iget-object v5, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v5}, Ltwitter4j/conf/Configuration;->isApplicationOnlyAuthEnabled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 81
    .end local v2           #consumerKey:Ljava/lang/String;
    .end local v3           #consumerSecret:Ljava/lang/String;
    :cond_0
    :goto_0
    new-instance v5, Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v6, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-direct {v5, v6}, Ltwitter4j/internal/http/HttpClientWrapper;-><init>(Ltwitter4j/internal/http/HttpClientWrapperConfiguration;)V

    iput-object v5, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    .line 82
    iget-object v5, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-virtual {v5, p0}, Ltwitter4j/internal/http/HttpClientWrapper;->setHttpResponseListener(Ltwitter4j/internal/http/HttpResponseListener;)V

    .line 83
    invoke-virtual {p0}, Ltwitter4j/TwitterBaseImpl;->setFactory()V

    .line 84
    return-void

    .line 69
    .restart local v2       #consumerKey:Ljava/lang/String;
    .restart local v3       #consumerSecret:Ljava/lang/String;
    :cond_1
    new-instance v4, Ltwitter4j/auth/OAuthAuthorization;

    iget-object v5, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-direct {v4, v5}, Ltwitter4j/auth/OAuthAuthorization;-><init>(Ltwitter4j/conf/Configuration;)V

    .line 70
    .local v4, oauth:Ltwitter4j/auth/OAuthAuthorization;
    iget-object v5, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v5}, Ltwitter4j/conf/Configuration;->getOAuthAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 71
    .local v0, accessToken:Ljava/lang/String;
    iget-object v5, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v5}, Ltwitter4j/conf/Configuration;->getOAuthAccessTokenSecret()Ljava/lang/String;

    move-result-object v1

    .line 72
    .local v1, accessTokenSecret:Ljava/lang/String;
    if-eqz v0, :cond_2

    if-eqz v1, :cond_2

    .line 73
    new-instance v5, Ltwitter4j/auth/AccessToken;

    invoke-direct {v5, v0, v1}, Ltwitter4j/auth/AccessToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ltwitter4j/auth/OAuthAuthorization;->setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V

    .line 75
    :cond_2
    iput-object v4, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    goto :goto_0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 2
    .parameter "stream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 237
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readFields()Ljava/io/ObjectInputStream$GetField;

    .line 239
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltwitter4j/conf/Configuration;

    iput-object v0, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    .line 240
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltwitter4j/auth/Authorization;

    iput-object v0, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    .line 242
    new-instance v0, Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v1, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-direct {v0, v1}, Ltwitter4j/internal/http/HttpClientWrapper;-><init>(Ltwitter4j/internal/http/HttpClientWrapperConfiguration;)V

    iput-object v0, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    .line 243
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-virtual {v0, p0}, Ltwitter4j/internal/http/HttpClientWrapper;->setHttpResponseListener(Ltwitter4j/internal/http/HttpResponseListener;)V

    .line 244
    invoke-virtual {p0}, Ltwitter4j/TwitterBaseImpl;->setFactory()V

    .line 245
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 1
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 220
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->putFields()Ljava/io/ObjectOutputStream$PutField;

    .line 221
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->writeFields()V

    .line 223
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 224
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 232
    return-void
.end method


# virtual methods
.method protected final ensureAuthorizationEnabled()V
    .locals 2

    .prologue
    .line 205
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-interface {v0}, Ltwitter4j/auth/Authorization;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_0

    .line 206
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Authentication credentials are missing. See http://twitter4j.org/en/configuration.html for the detail."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 209
    :cond_0
    return-void
.end method

.method protected final ensureOAuthEnabled()V
    .locals 2

    .prologue
    .line 212
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    instance-of v0, v0, Ltwitter4j/auth/OAuthAuthorization;

    if-nez v0, :cond_0

    .line 213
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OAuth required. Authentication credentials are missing. See http://twitter4j.org/en/configuration.html for the detail."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 216
    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 431
    if-ne p0, p1, :cond_1

    .line 444
    :cond_0
    :goto_0
    return v1

    .line 432
    :cond_1
    instance-of v3, p1, Ltwitter4j/TwitterBaseImpl;

    if-nez v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 434
    check-cast v0, Ltwitter4j/TwitterBaseImpl;

    .line 436
    .local v0, that:Ltwitter4j/TwitterBaseImpl;
    iget-object v3, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    if-eqz v3, :cond_4

    iget-object v3, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    iget-object v4, v0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    :cond_3
    move v1, v2

    .line 437
    goto :goto_0

    .line 436
    :cond_4
    iget-object v3, v0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    if-nez v3, :cond_3

    .line 438
    :cond_5
    iget-object v3, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    iget-object v4, v0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    move v1, v2

    goto :goto_0

    .line 439
    :cond_6
    iget-object v3, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    if-eqz v3, :cond_7

    iget-object v3, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v4, v0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-virtual {v3, v4}, Ltwitter4j/internal/http/HttpClientWrapper;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 440
    goto :goto_0

    .line 439
    :cond_7
    iget-object v3, v0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public final getAuthorization()Ltwitter4j/auth/Authorization;
    .locals 1

    .prologue
    .line 185
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    return-object v0
.end method

.method public getConfiguration()Ltwitter4j/conf/Configuration;
    .locals 1

    .prologue
    .line 193
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    return-object v0
.end method

.method public declared-synchronized getOAuthAccessToken()Ltwitter4j/auth/AccessToken;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 317
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Ltwitter4j/TwitterBaseImpl;->getAuthorization()Ltwitter4j/auth/Authorization;

    move-result-object v1

    .line 319
    .local v1, auth:Ltwitter4j/auth/Authorization;
    instance-of v6, v1, Ltwitter4j/auth/BasicAuthorization;

    if-eqz v6, :cond_1

    .line 320
    move-object v0, v1

    check-cast v0, Ltwitter4j/auth/BasicAuthorization;

    move-object v2, v0

    .line 321
    .local v2, basicAuth:Ltwitter4j/auth/BasicAuthorization;
    iget-object v6, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-static {v6}, Ltwitter4j/auth/AuthorizationFactory;->getInstance(Ltwitter4j/conf/Configuration;)Ltwitter4j/auth/Authorization;

    move-result-object v1

    .line 322
    instance-of v6, v1, Ltwitter4j/auth/OAuthAuthorization;

    if-eqz v6, :cond_0

    .line 323
    iput-object v1, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    .line 324
    move-object v0, v1

    check-cast v0, Ltwitter4j/auth/OAuthAuthorization;

    move-object v4, v0

    .line 325
    .local v4, oauthAuth:Ltwitter4j/auth/OAuthAuthorization;
    invoke-virtual {v2}, Ltwitter4j/auth/BasicAuthorization;->getUserId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Ltwitter4j/auth/BasicAuthorization;->getPassword()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ltwitter4j/auth/OAuthAuthorization;->getOAuthAccessToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;

    move-result-object v3

    .line 340
    .end local v2           #basicAuth:Ltwitter4j/auth/BasicAuthorization;
    .end local v4           #oauthAuth:Ltwitter4j/auth/OAuthAuthorization;
    .local v3, oauthAccessToken:Ltwitter4j/auth/AccessToken;
    :goto_0
    invoke-virtual {v3}, Ltwitter4j/auth/AccessToken;->getScreenName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Ltwitter4j/TwitterBaseImpl;->screenName:Ljava/lang/String;

    .line 341
    invoke-virtual {v3}, Ltwitter4j/auth/AccessToken;->getUserId()J

    move-result-wide v6

    iput-wide v6, p0, Ltwitter4j/TwitterBaseImpl;->id:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 342
    monitor-exit p0

    return-object v3

    .line 327
    .end local v3           #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    .restart local v2       #basicAuth:Ltwitter4j/auth/BasicAuthorization;
    :cond_0
    :try_start_1
    new-instance v6, Ljava/lang/IllegalStateException;

    const-string v7, "consumer key / secret combination not supplied."

    invoke-direct {v6, v7}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v6
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 317
    .end local v1           #auth:Ltwitter4j/auth/Authorization;
    .end local v2           #basicAuth:Ltwitter4j/auth/BasicAuthorization;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 330
    .restart local v1       #auth:Ltwitter4j/auth/Authorization;
    :cond_1
    :try_start_2
    instance-of v6, v1, Ltwitter4j/internal/http/XAuthAuthorization;

    if-eqz v6, :cond_2

    .line 331
    move-object v0, v1

    check-cast v0, Ltwitter4j/internal/http/XAuthAuthorization;

    move-object v5, v0

    .line 332
    .local v5, xauth:Ltwitter4j/internal/http/XAuthAuthorization;
    iput-object v5, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    .line 333
    new-instance v4, Ltwitter4j/auth/OAuthAuthorization;

    iget-object v6, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-direct {v4, v6}, Ltwitter4j/auth/OAuthAuthorization;-><init>(Ltwitter4j/conf/Configuration;)V

    .line 334
    .restart local v4       #oauthAuth:Ltwitter4j/auth/OAuthAuthorization;
    invoke-virtual {v5}, Ltwitter4j/internal/http/XAuthAuthorization;->getConsumerKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Ltwitter4j/internal/http/XAuthAuthorization;->getConsumerSecret()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ltwitter4j/auth/OAuthAuthorization;->setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    invoke-virtual {v5}, Ltwitter4j/internal/http/XAuthAuthorization;->getUserId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Ltwitter4j/internal/http/XAuthAuthorization;->getPassword()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ltwitter4j/auth/OAuthAuthorization;->getOAuthAccessToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;

    move-result-object v3

    .line 336
    .restart local v3       #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    goto :goto_0

    .line 337
    .end local v3           #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    .end local v4           #oauthAuth:Ltwitter4j/auth/OAuthAuthorization;
    .end local v5           #xauth:Ltwitter4j/internal/http/XAuthAuthorization;
    :cond_2
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v6

    invoke-interface {v6}, Ltwitter4j/auth/OAuthSupport;->getOAuthAccessToken()Ltwitter4j/auth/AccessToken;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .restart local v3       #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    goto :goto_0
.end method

.method public declared-synchronized getOAuthAccessToken(Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    .locals 2
    .parameter "oauthVerifier"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 353
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v1

    invoke-interface {v1, p1}, Ltwitter4j/auth/OAuthSupport;->getOAuthAccessToken(Ljava/lang/String;)Ltwitter4j/auth/AccessToken;

    move-result-object v0

    .line 354
    .local v0, oauthAccessToken:Ltwitter4j/auth/AccessToken;
    invoke-virtual {v0}, Ltwitter4j/auth/AccessToken;->getScreenName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Ltwitter4j/TwitterBaseImpl;->screenName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 355
    monitor-exit p0

    return-object v0

    .line 353
    .end local v0           #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getOAuthAccessToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    .locals 1
    .parameter "screenName"
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 394
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ltwitter4j/auth/OAuthSupport;->getOAuthAccessToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized getOAuthAccessToken(Ltwitter4j/auth/RequestToken;)Ltwitter4j/auth/AccessToken;
    .locals 3
    .parameter "requestToken"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 365
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v0

    .line 366
    .local v0, oauth:Ltwitter4j/auth/OAuthSupport;
    invoke-interface {v0, p1}, Ltwitter4j/auth/OAuthSupport;->getOAuthAccessToken(Ltwitter4j/auth/RequestToken;)Ltwitter4j/auth/AccessToken;

    move-result-object v1

    .line 367
    .local v1, oauthAccessToken:Ltwitter4j/auth/AccessToken;
    invoke-virtual {v1}, Ltwitter4j/auth/AccessToken;->getScreenName()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Ltwitter4j/TwitterBaseImpl;->screenName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 368
    monitor-exit p0

    return-object v1

    .line 365
    .end local v0           #oauth:Ltwitter4j/auth/OAuthSupport;
    .end local v1           #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized getOAuthAccessToken(Ltwitter4j/auth/RequestToken;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    .locals 1
    .parameter "requestToken"
    .parameter "oauthVerifier"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 378
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ltwitter4j/auth/OAuthSupport;->getOAuthAccessToken(Ltwitter4j/auth/RequestToken;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getOAuthRequestToken()Ltwitter4j/auth/RequestToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 287
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ltwitter4j/TwitterBaseImpl;->getOAuthRequestToken(Ljava/lang/String;)Ltwitter4j/auth/RequestToken;

    move-result-object v0

    return-object v0
.end method

.method public getOAuthRequestToken(Ljava/lang/String;)Ltwitter4j/auth/RequestToken;
    .locals 1
    .parameter "callbackUrl"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 295
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v0

    invoke-interface {v0, p1}, Ltwitter4j/auth/OAuthSupport;->getOAuthRequestToken(Ljava/lang/String;)Ltwitter4j/auth/RequestToken;

    move-result-object v0

    return-object v0
.end method

.method public getOAuthRequestToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/RequestToken;
    .locals 1
    .parameter "callbackUrl"
    .parameter "xAuthAccessType"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 303
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ltwitter4j/auth/OAuthSupport;->getOAuthRequestToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/RequestToken;

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 449
    iget-object v1, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 450
    .local v0, result:I
    mul-int/lit8 v3, v0, 0x1f

    iget-object v1, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    if-eqz v1, :cond_1

    iget-object v1, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-virtual {v1}, Ltwitter4j/internal/http/HttpClientWrapper;->hashCode()I

    move-result v1

    :goto_0
    add-int v0, v3, v1

    .line 452
    mul-int/lit8 v1, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    if-eqz v3, :cond_0

    iget-object v2, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :cond_0
    add-int v0, v1, v2

    .line 453
    return v0

    :cond_1
    move v1, v2

    .line 450
    goto :goto_0
.end method

.method public httpResponseReceived(Ltwitter4j/internal/http/HttpResponseEvent;)V
    .locals 0
    .parameter "event"

    .prologue
    .line 178
    return-void
.end method

.method protected setFactory()V
    .locals 2

    .prologue
    .line 87
    new-instance v0, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;

    iget-object v1, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-direct {v0, v1}, Ltwitter4j/internal/json/z_T4JInternalJSONImplFactory;-><init>(Ltwitter4j/conf/Configuration;)V

    iput-object v0, p0, Ltwitter4j/TwitterBaseImpl;->factory:Ltwitter4j/internal/json/z_T4JInternalFactory;

    .line 88
    return-void
.end method

.method public declared-synchronized setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V
    .locals 1
    .parameter "accessToken"

    .prologue
    .line 386
    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Ltwitter4j/TwitterBaseImpl;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v0

    invoke-interface {v0, p1}, Ltwitter4j/auth/OAuthSupport;->setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 387
    monitor-exit p0

    return-void

    .line 386
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .parameter "consumerKey"
    .parameter "consumerSecret"

    .prologue
    .line 255
    monitor-enter p0

    if-nez p1, :cond_0

    .line 256
    :try_start_0
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "consumer key is null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 255
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 258
    :cond_0
    if-nez p2, :cond_1

    .line 259
    :try_start_1
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "consumer secret is null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 262
    :cond_1
    iget-object v2, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    if-nez v2, :cond_4

    .line 263
    iget-object v2, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v2}, Ltwitter4j/conf/Configuration;->isApplicationOnlyAuthEnabled()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-eqz v2, :cond_3

    .line 280
    :cond_2
    :goto_0
    monitor-exit p0

    return-void

    .line 268
    :cond_3
    :try_start_2
    new-instance v0, Ltwitter4j/auth/OAuthAuthorization;

    iget-object v2, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-direct {v0, v2}, Ltwitter4j/auth/OAuthAuthorization;-><init>(Ltwitter4j/conf/Configuration;)V

    .line 269
    .local v0, oauth:Ltwitter4j/auth/OAuthAuthorization;
    invoke-virtual {v0, p1, p2}, Ltwitter4j/auth/OAuthAuthorization;->setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    iput-object v0, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    goto :goto_0

    .line 272
    .end local v0           #oauth:Ltwitter4j/auth/OAuthAuthorization;
    :cond_4
    iget-object v2, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    instance-of v2, v2, Ltwitter4j/auth/BasicAuthorization;

    if-eqz v2, :cond_5

    .line 273
    new-instance v1, Ltwitter4j/internal/http/XAuthAuthorization;

    iget-object v2, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    check-cast v2, Ltwitter4j/auth/BasicAuthorization;

    invoke-direct {v1, v2}, Ltwitter4j/internal/http/XAuthAuthorization;-><init>(Ltwitter4j/auth/BasicAuthorization;)V

    .line 274
    .local v1, xauth:Ltwitter4j/internal/http/XAuthAuthorization;
    invoke-virtual {v1, p1, p2}, Ltwitter4j/internal/http/XAuthAuthorization;->setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    iput-object v1, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    goto :goto_0

    .line 277
    .end local v1           #xauth:Ltwitter4j/internal/http/XAuthAuthorization;
    :cond_5
    iget-object v2, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    instance-of v2, v2, Ltwitter4j/auth/OAuthAuthorization;

    if-eqz v2, :cond_2

    .line 278
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "consumer key/secret pair already set."

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method public shutdown()V
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-virtual {v0}, Ltwitter4j/internal/http/HttpClientWrapper;->shutdown()V

    .line 202
    :cond_0
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 458
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TwitterBase{conf="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/TwitterBaseImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", http="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/TwitterBaseImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", auth="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/TwitterBaseImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
