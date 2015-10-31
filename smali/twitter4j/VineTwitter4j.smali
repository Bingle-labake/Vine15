.class public Ltwitter4j/VineTwitter4j;
.super Ltwitter4j/TwitterImpl;
.source "VineTwitter4j.java"


# direct methods
.method constructor <init>(Ltwitter4j/conf/Configuration;Ltwitter4j/auth/Authorization;)V
    .locals 0
    .parameter "conf"
    .parameter "auth"

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Ltwitter4j/TwitterImpl;-><init>(Ltwitter4j/conf/Configuration;Ltwitter4j/auth/Authorization;)V

    .line 28
    return-void
.end method

.method private getOAuth()Ltwitter4j/auth/OAuthSupport;
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Ltwitter4j/VineTwitter4j;->auth:Ltwitter4j/auth/Authorization;

    instance-of v0, v0, Ltwitter4j/auth/OAuthSupport;

    if-nez v0, :cond_0

    .line 83
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "OAuth consumer key/secret combination not supplied"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 86
    :cond_0
    iget-object v0, p0, Ltwitter4j/VineTwitter4j;->auth:Ltwitter4j/auth/Authorization;

    check-cast v0, Ltwitter4j/auth/OAuthSupport;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic equals(Ljava/lang/Object;)Z
    .locals 1
    .parameter "x0"

    .prologue
    .line 20
    invoke-super {p0, p1}, Ltwitter4j/TwitterImpl;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic getConfiguration()Ltwitter4j/conf/Configuration;
    .locals 1

    .prologue
    .line 20
    invoke-super {p0}, Ltwitter4j/TwitterImpl;->getConfiguration()Ltwitter4j/conf/Configuration;

    move-result-object v0

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
    .line 32
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Ltwitter4j/VineTwitter4j;->getAuthorization()Ltwitter4j/auth/Authorization;

    move-result-object v1

    .line 34
    .local v1, auth:Ltwitter4j/auth/Authorization;
    instance-of v6, v1, Ltwitter4j/auth/BasicAuthorization;

    if-eqz v6, :cond_1

    .line 35
    move-object v0, v1

    check-cast v0, Ltwitter4j/auth/BasicAuthorization;

    move-object v2, v0

    .line 36
    .local v2, basicAuth:Ltwitter4j/auth/BasicAuthorization;
    iget-object v6, p0, Ltwitter4j/VineTwitter4j;->conf:Ltwitter4j/conf/Configuration;

    invoke-static {v6}, Ltwitter4j/auth/VineAuthorizationFactory;->getInstance(Ltwitter4j/conf/Configuration;)Ltwitter4j/auth/Authorization;

    move-result-object v1

    .line 37
    instance-of v6, v1, Ltwitter4j/auth/VineOauthAuthorization;

    if-eqz v6, :cond_0

    .line 38
    iput-object v1, p0, Ltwitter4j/VineTwitter4j;->auth:Ltwitter4j/auth/Authorization;

    .line 39
    move-object v0, v1

    check-cast v0, Ltwitter4j/auth/VineOauthAuthorization;

    move-object v4, v0

    .line 40
    .local v4, oauthAuth:Ltwitter4j/auth/VineOauthAuthorization;
    invoke-virtual {v2}, Ltwitter4j/auth/BasicAuthorization;->getUserId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2}, Ltwitter4j/auth/BasicAuthorization;->getPassword()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ltwitter4j/auth/VineOauthAuthorization;->getOAuthAccessToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;

    move-result-object v3

    .line 55
    .end local v2           #basicAuth:Ltwitter4j/auth/BasicAuthorization;
    .end local v4           #oauthAuth:Ltwitter4j/auth/VineOauthAuthorization;
    .local v3, oauthAccessToken:Ltwitter4j/auth/AccessToken;
    :goto_0
    invoke-virtual {v3}, Ltwitter4j/auth/AccessToken;->getScreenName()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Ltwitter4j/VineTwitter4j;->screenName:Ljava/lang/String;

    .line 56
    invoke-virtual {v3}, Ltwitter4j/auth/AccessToken;->getUserId()J

    move-result-wide v6

    iput-wide v6, p0, Ltwitter4j/VineTwitter4j;->id:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    monitor-exit p0

    return-object v3

    .line 42
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

    .line 32
    .end local v1           #auth:Ltwitter4j/auth/Authorization;
    .end local v2           #basicAuth:Ltwitter4j/auth/BasicAuthorization;
    :catchall_0
    move-exception v6

    monitor-exit p0

    throw v6

    .line 45
    .restart local v1       #auth:Ltwitter4j/auth/Authorization;
    :cond_1
    :try_start_2
    instance-of v6, v1, Ltwitter4j/internal/http/XAuthAuthorization;

    if-eqz v6, :cond_2

    .line 46
    move-object v0, v1

    check-cast v0, Ltwitter4j/internal/http/XAuthAuthorization;

    move-object v5, v0

    .line 47
    .local v5, xauth:Ltwitter4j/internal/http/XAuthAuthorization;
    iput-object v5, p0, Ltwitter4j/VineTwitter4j;->auth:Ltwitter4j/auth/Authorization;

    .line 48
    new-instance v4, Ltwitter4j/auth/OAuthAuthorization;

    iget-object v6, p0, Ltwitter4j/VineTwitter4j;->conf:Ltwitter4j/conf/Configuration;

    invoke-direct {v4, v6}, Ltwitter4j/auth/OAuthAuthorization;-><init>(Ltwitter4j/conf/Configuration;)V

    .line 49
    .local v4, oauthAuth:Ltwitter4j/auth/OAuthAuthorization;
    invoke-virtual {v5}, Ltwitter4j/internal/http/XAuthAuthorization;->getConsumerKey()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Ltwitter4j/internal/http/XAuthAuthorization;->getConsumerSecret()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ltwitter4j/auth/OAuthAuthorization;->setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    invoke-virtual {v5}, Ltwitter4j/internal/http/XAuthAuthorization;->getUserId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5}, Ltwitter4j/internal/http/XAuthAuthorization;->getPassword()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ltwitter4j/auth/OAuthAuthorization;->getOAuthAccessToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;

    move-result-object v3

    .line 51
    .restart local v3       #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    goto :goto_0

    .line 52
    .end local v3           #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    .end local v4           #oauthAuth:Ltwitter4j/auth/OAuthAuthorization;
    .end local v5           #xauth:Ltwitter4j/internal/http/XAuthAuthorization;
    :cond_2
    invoke-direct {p0}, Ltwitter4j/VineTwitter4j;->getOAuth()Ltwitter4j/auth/OAuthSupport;

    move-result-object v6

    invoke-interface {v6}, Ltwitter4j/auth/OAuthSupport;->getOAuthAccessToken()Ltwitter4j/auth/AccessToken;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v3

    .restart local v3       #oauthAccessToken:Ltwitter4j/auth/AccessToken;
    goto :goto_0
.end method

.method public declared-synchronized getOAuthAccessToken(Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    .locals 1
    .parameter "oauthVerifier"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 62
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Ltwitter4j/TwitterImpl;->getOAuthAccessToken(Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
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
    .line 77
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1, p2}, Ltwitter4j/TwitterImpl;->getOAuthAccessToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
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
    .locals 1
    .parameter "requestToken"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 67
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1}, Ltwitter4j/TwitterImpl;->getOAuthAccessToken(Ltwitter4j/auth/RequestToken;)Ltwitter4j/auth/AccessToken;
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
    .line 72
    monitor-enter p0

    :try_start_0
    invoke-super {p0, p1, p2}, Ltwitter4j/TwitterImpl;->getOAuthAccessToken(Ltwitter4j/auth/RequestToken;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
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

.method public bridge synthetic getOAuthRequestToken()Ltwitter4j/auth/RequestToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-super {p0}, Ltwitter4j/TwitterImpl;->getOAuthRequestToken()Ltwitter4j/auth/RequestToken;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOAuthRequestToken(Ljava/lang/String;)Ltwitter4j/auth/RequestToken;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-super {p0, p1}, Ltwitter4j/TwitterImpl;->getOAuthRequestToken(Ljava/lang/String;)Ltwitter4j/auth/RequestToken;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getOAuthRequestToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/RequestToken;
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 20
    invoke-super {p0, p1, p2}, Ltwitter4j/TwitterImpl;->getOAuthRequestToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/RequestToken;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic hashCode()I
    .locals 1

    .prologue
    .line 20
    invoke-super {p0}, Ltwitter4j/TwitterImpl;->hashCode()I

    move-result v0

    return v0
.end method

.method public httpResponseReceived(Ltwitter4j/internal/http/HttpResponseEvent;)V
    .locals 0
    .parameter "event"

    .prologue
    .line 121
    return-void
.end method

.method public bridge synthetic setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V
    .locals 0
    .parameter "x0"

    .prologue
    .line 20
    invoke-super {p0, p1}, Ltwitter4j/TwitterImpl;->setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V

    return-void
.end method

.method public bridge synthetic setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 20
    invoke-super {p0, p1, p2}, Ltwitter4j/TwitterImpl;->setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public bridge synthetic shutdown()V
    .locals 0

    .prologue
    .line 20
    invoke-super {p0}, Ltwitter4j/TwitterImpl;->shutdown()V

    return-void
.end method

.method public bridge synthetic toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 20
    invoke-super {p0}, Ltwitter4j/TwitterImpl;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
