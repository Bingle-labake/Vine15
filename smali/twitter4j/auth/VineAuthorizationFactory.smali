.class public Ltwitter4j/auth/VineAuthorizationFactory;
.super Ljava/lang/Object;
.source "VineAuthorizationFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance(Ltwitter4j/conf/Configuration;)Ltwitter4j/auth/Authorization;
    .locals 9
    .parameter "conf"

    .prologue
    .line 35
    const/4 v2, 0x0

    .line 36
    .local v2, auth:Ltwitter4j/auth/Authorization;
    invoke-interface {p0}, Ltwitter4j/conf/Configuration;->getOAuthConsumerKey()Ljava/lang/String;

    move-result-object v3

    .line 37
    .local v3, consumerKey:Ljava/lang/String;
    invoke-interface {p0}, Ltwitter4j/conf/Configuration;->getOAuthConsumerSecret()Ljava/lang/String;

    move-result-object v4

    .line 39
    .local v4, consumerSecret:Ljava/lang/String;
    if-eqz v3, :cond_2

    if-eqz v4, :cond_2

    .line 40
    new-instance v5, Ltwitter4j/auth/VineOauthAuthorization;

    invoke-direct {v5, p0}, Ltwitter4j/auth/VineOauthAuthorization;-><init>(Ltwitter4j/conf/Configuration;)V

    .line 41
    .local v5, oauth:Ltwitter4j/auth/VineOauthAuthorization;
    invoke-interface {p0}, Ltwitter4j/conf/Configuration;->getOAuthAccessToken()Ljava/lang/String;

    move-result-object v0

    .line 42
    .local v0, accessToken:Ljava/lang/String;
    invoke-interface {p0}, Ltwitter4j/conf/Configuration;->getOAuthAccessTokenSecret()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, accessTokenSecret:Ljava/lang/String;
    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    .line 44
    new-instance v8, Ltwitter4j/auth/AccessToken;

    invoke-direct {v8, v0, v1}, Ltwitter4j/auth/AccessToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v8}, Ltwitter4j/auth/VineOauthAuthorization;->setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V

    .line 46
    :cond_0
    move-object v2, v5

    .line 54
    .end local v0           #accessToken:Ljava/lang/String;
    .end local v1           #accessTokenSecret:Ljava/lang/String;
    .end local v5           #oauth:Ltwitter4j/auth/VineOauthAuthorization;
    :cond_1
    :goto_0
    return-object v2

    .line 48
    :cond_2
    invoke-interface {p0}, Ltwitter4j/conf/Configuration;->getUser()Ljava/lang/String;

    move-result-object v7

    .line 49
    .local v7, screenName:Ljava/lang/String;
    invoke-interface {p0}, Ltwitter4j/conf/Configuration;->getPassword()Ljava/lang/String;

    move-result-object v6

    .line 50
    .local v6, password:Ljava/lang/String;
    if-eqz v7, :cond_1

    if-eqz v6, :cond_1

    .line 51
    new-instance v2, Ltwitter4j/auth/BasicAuthorization;

    .end local v2           #auth:Ltwitter4j/auth/Authorization;
    invoke-direct {v2, v7, v6}, Ltwitter4j/auth/BasicAuthorization;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .restart local v2       #auth:Ltwitter4j/auth/Authorization;
    goto :goto_0
.end method
