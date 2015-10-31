.class public Ltwitter4j/auth/VineOauthAuthorization;
.super Ljava/lang/Object;
.source "VineOauthAuthorization.java"

# interfaces
.implements Ltwitter4j/auth/Authorization;
.implements Ljava/io/Serializable;
.implements Ltwitter4j/auth/OAuthSupport;


# static fields
.field private static final HMAC_SHA1:Ljava/lang/String; = "HmacSHA1"

#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field private static final OAUTH_SIGNATURE_METHOD:Ltwitter4j/internal/http/HttpParameter; = null

.field private static RAND:Ljava/util/Random; = null

.field private static final TAG:Ljava/lang/String; = "t4jVineOauth"

.field private static transient http:Ltwitter4j/internal/http/HttpClientWrapper; = null

.field private static final serialVersionUID:J = -0x3c9fc4eaff57b01aL


# instance fields
.field private final conf:Ltwitter4j/conf/Configuration;

.field private consumerKey:Ljava/lang/String;

.field private consumerSecret:Ljava/lang/String;

.field private oauthToken:Ltwitter4j/auth/OAuthToken;

.field private realm:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 52
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    sput-boolean v0, Ltwitter4j/auth/VineOauthAuthorization;->LOGGABLE:Z

    .line 55
    new-instance v0, Ltwitter4j/internal/http/HttpParameter;

    const-string v1, "oauth_signature_method"

    const-string v2, "HMAC-SHA1"

    invoke-direct {v0, v1, v2}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Ltwitter4j/auth/VineOauthAuthorization;->OAUTH_SIGNATURE_METHOD:Ltwitter4j/internal/http/HttpParameter;

    .line 277
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Ltwitter4j/auth/VineOauthAuthorization;->RAND:Ljava/util/Random;

    return-void
.end method

.method public constructor <init>(Ltwitter4j/conf/Configuration;)V
    .locals 3
    .parameter "conf"

    .prologue
    const/4 v1, 0x0

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    const-string v0, ""

    iput-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    .line 60
    iput-object v1, p0, Ltwitter4j/auth/VineOauthAuthorization;->realm:Ljava/lang/String;

    .line 62
    iput-object v1, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    .line 70
    iput-object p1, p0, Ltwitter4j/auth/VineOauthAuthorization;->conf:Ltwitter4j/conf/Configuration;

    .line 71
    new-instance v0, Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-direct {v0, p1}, Ltwitter4j/internal/http/HttpClientWrapper;-><init>(Ltwitter4j/internal/http/HttpClientWrapperConfiguration;)V

    sput-object v0, Ltwitter4j/auth/VineOauthAuthorization;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    .line 72
    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getOAuthConsumerKey()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getOAuthConsumerSecret()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Ltwitter4j/auth/VineOauthAuthorization;->setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getOAuthAccessToken()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getOAuthAccessTokenSecret()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 74
    new-instance v0, Ltwitter4j/auth/AccessToken;

    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getOAuthAccessToken()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getOAuthAccessTokenSecret()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ltwitter4j/auth/AccessToken;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Ltwitter4j/auth/VineOauthAuthorization;->setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V

    .line 76
    :cond_0
    return-void
.end method

.method static constructRequestURL(Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .parameter "url"

    .prologue
    const/16 v7, 0x8

    const/4 v6, -0x1

    const/4 v5, 0x0

    .line 455
    const-string v4, "?"

    invoke-virtual {p0, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    .line 456
    .local v2, index:I
    if-eq v6, v2, :cond_0

    .line 457
    invoke-virtual {p0, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 459
    :cond_0
    const-string v4, "/"

    invoke-virtual {p0, v4, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    .line 460
    .local v3, slashIndex:I
    invoke-virtual {p0, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 461
    .local v0, baseURL:Ljava/lang/String;
    const-string v4, ":"

    invoke-virtual {v0, v4, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    .line 462
    .local v1, colonIndex:I
    if-eq v6, v1, :cond_1

    .line 464
    const-string v4, "http://"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    const-string v4, ":80"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 466
    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 472
    :cond_1
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 474
    return-object p0

    .line 467
    :cond_2
    const-string v4, "https://"

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string v4, ":443"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 469
    invoke-virtual {v0, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static encodeParameters(Ljava/util/List;)Ljava/lang/String;
    .locals 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ltwitter4j/internal/http/HttpParameter;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 412
    .local p0, httpParams:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    const-string v0, "&"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Ltwitter4j/auth/VineOauthAuthorization;->encodeParameters(Ljava/util/List;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static encodeParameters(Ljava/util/List;Ljava/lang/String;Z)Ljava/lang/String;
    .locals 5
    .parameter
    .parameter "splitter"
    .parameter "quot"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ltwitter4j/internal/http/HttpParameter;",
            ">;",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 416
    .local p0, httpParams:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 417
    .local v0, buf:Ljava/lang/StringBuilder;
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltwitter4j/internal/http/HttpParameter;

    .line 418
    .local v2, param:Ltwitter4j/internal/http/HttpParameter;
    invoke-virtual {v2}, Ltwitter4j/internal/http/HttpParameter;->isFile()Z

    move-result v3

    if-nez v3, :cond_0

    .line 419
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_2

    .line 420
    if-eqz p2, :cond_1

    .line 421
    const-string v3, "\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    :cond_1
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 425
    :cond_2
    invoke-virtual {v2}, Ltwitter4j/internal/http/HttpParameter;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    if-eqz p2, :cond_3

    .line 427
    const-string v3, "\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 429
    :cond_3
    invoke-virtual {v2}, Ltwitter4j/internal/http/HttpParameter;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 432
    .end local v2           #param:Ltwitter4j/internal/http/HttpParameter;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    if-eqz v3, :cond_5

    .line 433
    if-eqz p2, :cond_5

    .line 434
    const-string v3, "\""

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 437
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private ensureTokenIsAvailable()V
    .locals 2

    .prologue
    .line 85
    iget-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    if-nez v0, :cond_0

    .line 86
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No Token available."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_0
    return-void
.end method

.method static normalizeAuthorizationHeaders(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ltwitter4j/internal/http/HttpParameter;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 395
    .local p0, params:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 396
    invoke-static {p0}, Ltwitter4j/auth/VineOauthAuthorization;->encodeParameters(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static normalizeRequestParameters(Ljava/util/List;)Ljava/lang/String;
    .locals 1
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ltwitter4j/internal/http/HttpParameter;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 390
    .local p0, params:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 391
    invoke-static {p0}, Ltwitter4j/auth/VineOauthAuthorization;->encodeParameters(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static normalizeRequestParameters([Ltwitter4j/internal/http/HttpParameter;)Ljava/lang/String;
    .locals 1
    .parameter "params"

    .prologue
    .line 386
    invoke-static {p0}, Ltwitter4j/auth/VineOauthAuthorization;->toParamList([Ltwitter4j/internal/http/HttpParameter;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ltwitter4j/auth/VineOauthAuthorization;->normalizeRequestParameters(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private parseGetParameters(Ljava/lang/String;Ljava/util/List;)V
    .locals 11
    .parameter "url"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ltwitter4j/internal/http/HttpParameter;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 253
    .local p2, signatureBaseParams:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    const-string v7, "?"

    invoke-virtual {p1, v7}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 254
    .local v4, queryStart:I
    const/4 v7, -0x1

    if-eq v7, v4, :cond_1

    .line 255
    add-int/lit8 v7, v4, 0x1

    invoke-virtual {p1, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "&"

    invoke-static {v7, v8}, Ltwitter4j/internal/util/z_T4JInternalStringUtil;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 257
    .local v5, queryStrs:[Ljava/lang/String;
    move-object v0, v5

    .local v0, arr$:[Ljava/lang/String;
    :try_start_0
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 258
    .local v3, query:Ljava/lang/String;
    const-string v7, "="

    invoke-static {v3, v7}, Ltwitter4j/internal/util/z_T4JInternalStringUtil;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 259
    .local v6, split:[Ljava/lang/String;
    array-length v7, v6

    const/4 v8, 0x2

    if-ne v7, v8, :cond_0

    .line 260
    new-instance v7, Ltwitter4j/internal/http/HttpParameter;

    const/4 v8, 0x0

    aget-object v8, v6, v8

    const-string v9, "UTF-8"

    invoke-static {v8, v9}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x1

    aget-object v9, v6, v9

    const-string v10, "UTF-8"

    invoke-static {v9, v10}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v8, v9}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 265
    :cond_0
    new-instance v7, Ltwitter4j/internal/http/HttpParameter;

    const/4 v8, 0x0

    aget-object v8, v6, v8

    const-string v9, "UTF-8"

    invoke-static {v8, v9}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-direct {v7, v8, v9}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 270
    .end local v1           #i$:I
    .end local v2           #len$:I
    .end local v3           #query:Ljava/lang/String;
    .end local v6           #split:[Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 275
    .end local v0           #arr$:[Ljava/lang/String;
    .end local v5           #queryStrs:[Ljava/lang/String;
    :cond_1
    return-void
.end method

.method static toParamList([Ltwitter4j/internal/http/HttpParameter;)Ljava/util/List;
    .locals 2
    .parameter "params"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ltwitter4j/internal/http/HttpParameter;",
            ")",
            "Ljava/util/List",
            "<",
            "Ltwitter4j/internal/http/HttpParameter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 400
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 401
    .local v0, paramList:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 402
    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 486
    if-ne p0, p1, :cond_1

    .line 498
    :cond_0
    :goto_0
    return v1

    .line 487
    :cond_1
    instance-of v3, p1, Ltwitter4j/auth/OAuthSupport;

    if-nez v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 489
    check-cast v0, Ltwitter4j/auth/VineOauthAuthorization;

    .line 491
    .local v0, that:Ltwitter4j/auth/VineOauthAuthorization;
    iget-object v3, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    if-eqz v3, :cond_4

    iget-object v3, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    :cond_3
    move v1, v2

    .line 492
    goto :goto_0

    .line 491
    :cond_4
    iget-object v3, v0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    if-nez v3, :cond_3

    .line 493
    :cond_5
    iget-object v3, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    if-eqz v3, :cond_7

    iget-object v3, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    iget-object v4, v0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    :cond_6
    move v1, v2

    .line 494
    goto :goto_0

    .line 493
    :cond_7
    iget-object v3, v0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    if-nez v3, :cond_6

    .line 495
    :cond_8
    iget-object v3, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    if-eqz v3, :cond_9

    iget-object v3, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    iget-object v4, v0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    invoke-virtual {v3, v4}, Ltwitter4j/auth/OAuthToken;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 496
    goto :goto_0

    .line 495
    :cond_9
    iget-object v3, v0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method generateAuthorizationHeader(Ljava/lang/String;Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ljava/lang/String;Ljava/lang/String;Ltwitter4j/auth/OAuthToken;)Ljava/lang/String;
    .locals 8
    .parameter "method"
    .parameter "url"
    .parameter "params"
    .parameter "nonce"
    .parameter "timestamp"
    .parameter "otoken"

    .prologue
    .line 212
    if-nez p3, :cond_0

    .line 213
    const/4 v5, 0x0

    new-array p3, v5, [Ltwitter4j/internal/http/HttpParameter;

    .line 215
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    const/4 v5, 0x5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 216
    .local v2, oauthHeaderParams:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    new-instance v5, Ltwitter4j/internal/http/HttpParameter;

    const-string v6, "oauth_consumer_key"

    iget-object v7, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    invoke-direct {v5, v6, v7}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    sget-object v5, Ltwitter4j/auth/VineOauthAuthorization;->OAUTH_SIGNATURE_METHOD:Ltwitter4j/internal/http/HttpParameter;

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 218
    new-instance v5, Ltwitter4j/internal/http/HttpParameter;

    const-string v6, "oauth_timestamp"

    invoke-direct {v5, v6, p5}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 219
    new-instance v5, Ltwitter4j/internal/http/HttpParameter;

    const-string v6, "oauth_nonce"

    invoke-direct {v5, v6, p4}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    new-instance v5, Ltwitter4j/internal/http/HttpParameter;

    const-string v6, "oauth_version"

    const-string v7, "1.0"

    invoke-direct {v5, v6, v7}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 221
    if-eqz p6, :cond_1

    .line 222
    new-instance v5, Ltwitter4j/internal/http/HttpParameter;

    const-string v6, "oauth_token"

    invoke-virtual {p6}, Ltwitter4j/auth/OAuthToken;->getToken()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 224
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    array-length v6, p3

    add-int/2addr v5, v6

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 226
    .local v4, signatureBaseParams:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    invoke-interface {v4, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 227
    invoke-static {p3}, Ltwitter4j/internal/http/HttpParameter;->containsFile([Ltwitter4j/internal/http/HttpParameter;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 228
    invoke-static {p3}, Ltwitter4j/auth/VineOauthAuthorization;->toParamList([Ltwitter4j/internal/http/HttpParameter;)Ljava/util/List;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 230
    :cond_2
    invoke-direct {p0, p2, v4}, Ltwitter4j/auth/VineOauthAuthorization;->parseGetParameters(Ljava/lang/String;Ljava/util/List;)V

    .line 231
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {p2}, Ltwitter4j/auth/VineOauthAuthorization;->constructRequestURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 233
    .local v0, base:Ljava/lang/StringBuilder;
    invoke-static {v4}, Ltwitter4j/auth/VineOauthAuthorization;->normalizeRequestParameters(Ljava/util/List;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 234
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 235
    .local v1, oauthBaseString:Ljava/lang/String;
    sget-boolean v5, Ltwitter4j/auth/VineOauthAuthorization;->LOGGABLE:Z

    if-eqz v5, :cond_3

    .line 236
    const-string v5, "t4jVineOauth"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "OAuth base string: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    :cond_3
    invoke-virtual {p0, v1, p6}, Ltwitter4j/auth/VineOauthAuthorization;->generateSignature(Ljava/lang/String;Ltwitter4j/auth/OAuthToken;)Ljava/lang/String;

    move-result-object v3

    .line 239
    .local v3, signature:Ljava/lang/String;
    sget-boolean v5, Ltwitter4j/auth/VineOauthAuthorization;->LOGGABLE:Z

    if-eqz v5, :cond_4

    .line 240
    const-string v5, "t4jVineOauth"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "OAuth signature: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 243
    :cond_4
    new-instance v5, Ltwitter4j/internal/http/HttpParameter;

    const-string v6, "oauth_signature"

    invoke-direct {v5, v6, v3}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    iget-object v5, p0, Ltwitter4j/auth/VineOauthAuthorization;->realm:Ljava/lang/String;

    if-eqz v5, :cond_5

    .line 247
    new-instance v5, Ltwitter4j/internal/http/HttpParameter;

    const-string v6, "realm"

    iget-object v7, p0, Ltwitter4j/auth/VineOauthAuthorization;->realm:Ljava/lang/String;

    invoke-direct {v5, v6, v7}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 249
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "OAuth "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ","

    const/4 v7, 0x1

    invoke-static {v2, v6, v7}, Ltwitter4j/auth/VineOauthAuthorization;->encodeParameters(Ljava/util/List;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method generateAuthorizationHeader(Ljava/lang/String;Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/OAuthToken;)Ljava/lang/String;
    .locals 11
    .parameter "method"
    .parameter "url"
    .parameter "params"
    .parameter "token"

    .prologue
    .line 284
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long v9, v0, v2

    .line 285
    .local v9, timestamp:J
    sget-object v0, Ltwitter4j/auth/VineOauthAuthorization;->RAND:Ljava/util/Random;

    invoke-virtual {v0}, Ljava/util/Random;->nextInt()I

    move-result v0

    int-to-long v0, v0

    add-long v7, v9, v0

    .line 286
    .local v7, nonce:J
    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v6, p4

    invoke-virtual/range {v0 .. v6}, Ltwitter4j/auth/VineOauthAuthorization;->generateAuthorizationHeader(Ljava/lang/String;Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ljava/lang/String;Ljava/lang/String;Ltwitter4j/auth/OAuthToken;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public generateOAuthSignatureHttpParams(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 13
    .parameter "method"
    .parameter "url"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Ltwitter4j/internal/http/HttpParameter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 290
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const-wide/16 v11, 0x3e8

    div-long v7, v9, v11

    .line 291
    .local v7, timestamp:J
    sget-object v9, Ltwitter4j/auth/VineOauthAuthorization;->RAND:Ljava/util/Random;

    invoke-virtual {v9}, Ljava/util/Random;->nextInt()I

    move-result v9

    int-to-long v9, v9

    add-long v1, v7, v9

    .line 293
    .local v1, nonce:J
    new-instance v4, Ljava/util/ArrayList;

    const/4 v9, 0x5

    invoke-direct {v4, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 294
    .local v4, oauthHeaderParams:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    new-instance v9, Ltwitter4j/internal/http/HttpParameter;

    const-string v10, "oauth_consumer_key"

    iget-object v11, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    invoke-direct {v9, v10, v11}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 295
    sget-object v9, Ltwitter4j/auth/VineOauthAuthorization;->OAUTH_SIGNATURE_METHOD:Ltwitter4j/internal/http/HttpParameter;

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 296
    new-instance v9, Ltwitter4j/internal/http/HttpParameter;

    const-string v10, "oauth_timestamp"

    invoke-direct {v9, v10, v7, v8}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;J)V

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 297
    new-instance v9, Ltwitter4j/internal/http/HttpParameter;

    const-string v10, "oauth_nonce"

    invoke-direct {v9, v10, v1, v2}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;J)V

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    new-instance v9, Ltwitter4j/internal/http/HttpParameter;

    const-string v10, "oauth_version"

    const-string v11, "1.0"

    invoke-direct {v9, v10, v11}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 299
    iget-object v9, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    if-eqz v9, :cond_0

    .line 300
    new-instance v9, Ltwitter4j/internal/http/HttpParameter;

    const-string v10, "oauth_token"

    iget-object v11, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    invoke-virtual {v11}, Ltwitter4j/auth/OAuthToken;->getToken()Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 303
    :cond_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v9

    invoke-direct {v6, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 304
    .local v6, signatureBaseParams:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    invoke-interface {v6, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 305
    invoke-direct {p0, p2, v6}, Ltwitter4j/auth/VineOauthAuthorization;->parseGetParameters(Ljava/lang/String;Ljava/util/List;)V

    .line 307
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v10, "&"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {p2}, Ltwitter4j/auth/VineOauthAuthorization;->constructRequestURL(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "&"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 309
    .local v0, base:Ljava/lang/StringBuilder;
    invoke-static {v6}, Ltwitter4j/auth/VineOauthAuthorization;->normalizeRequestParameters(Ljava/util/List;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 311
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 312
    .local v3, oauthBaseString:Ljava/lang/String;
    iget-object v9, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    invoke-virtual {p0, v3, v9}, Ltwitter4j/auth/VineOauthAuthorization;->generateSignature(Ljava/lang/String;Ltwitter4j/auth/OAuthToken;)Ljava/lang/String;

    move-result-object v5

    .line 314
    .local v5, signature:Ljava/lang/String;
    new-instance v9, Ltwitter4j/internal/http/HttpParameter;

    const-string v10, "oauth_signature"

    invoke-direct {v9, v10, v5}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 316
    return-object v4
.end method

.method generateSignature(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter "data"

    .prologue
    .line 362
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ltwitter4j/auth/VineOauthAuthorization;->generateSignature(Ljava/lang/String;Ltwitter4j/auth/OAuthToken;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method generateSignature(Ljava/lang/String;Ltwitter4j/auth/OAuthToken;)Ljava/lang/String;
    .locals 8
    .parameter "data"
    .parameter "token"

    .prologue
    .line 328
    const/4 v0, 0x0

    .line 330
    .local v0, byteHMAC:[B
    :try_start_0
    const-string v6, "HmacSHA1"

    invoke-static {v6}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v2

    .line 332
    .local v2, mac:Ljavax/crypto/Mac;
    if-nez p2, :cond_1

    .line 333
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    invoke-static {v7}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 334
    .local v4, oauthSignature:Ljava/lang/String;
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    const-string v7, "HmacSHA1"

    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 343
    .end local v4           #oauthSignature:Ljava/lang/String;
    .local v5, spec:Ljavax/crypto/spec/SecretKeySpec;
    :cond_0
    :goto_0
    invoke-virtual {v2, v5}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 344
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    invoke-virtual {v2, v6}, Ljavax/crypto/Mac;->doFinal([B)[B
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v0

    .line 356
    invoke-static {v0}, Ltwitter4j/internal/http/BASE64Encoder;->encode([B)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 336
    .end local v5           #spec:Ljavax/crypto/spec/SecretKeySpec;
    :cond_1
    :try_start_1
    invoke-virtual {p2}, Ltwitter4j/auth/OAuthToken;->getSecretKeySpec()Ljavax/crypto/spec/SecretKeySpec;

    move-result-object v5

    .line 337
    .restart local v5       #spec:Ljavax/crypto/spec/SecretKeySpec;
    if-nez v5, :cond_0

    .line 338
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    invoke-static {v7}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p2}, Ltwitter4j/auth/OAuthToken;->getTokenSecret()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ltwitter4j/internal/http/HttpParameter;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 339
    .restart local v4       #oauthSignature:Ljava/lang/String;
    new-instance v5, Ljavax/crypto/spec/SecretKeySpec;

    .end local v5           #spec:Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    move-result-object v6

    const-string v7, "HmacSHA1"

    invoke-direct {v5, v6, v7}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 340
    .restart local v5       #spec:Ljavax/crypto/spec/SecretKeySpec;
    invoke-virtual {p2, v5}, Ltwitter4j/auth/OAuthToken;->setSecretKeySpec(Ljavax/crypto/spec/SecretKeySpec;)V
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 345
    .end local v2           #mac:Ljavax/crypto/Mac;
    .end local v4           #oauthSignature:Ljava/lang/String;
    .end local v5           #spec:Ljavax/crypto/spec/SecretKeySpec;
    :catch_0
    move-exception v1

    .line 346
    .local v1, ike:Ljava/security/InvalidKeyException;
    sget-boolean v6, Ltwitter4j/auth/VineOauthAuthorization;->LOGGABLE:Z

    if-eqz v6, :cond_2

    .line 347
    const-string v6, "t4jVineOauth"

    const-string v7, "Failed initialize \"Message Authentication Code\" (MAC)"

    invoke-static {v6, v7, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 349
    :cond_2
    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6

    .line 350
    .end local v1           #ike:Ljava/security/InvalidKeyException;
    :catch_1
    move-exception v3

    .line 351
    .local v3, nsae:Ljava/security/NoSuchAlgorithmException;
    sget-boolean v6, Ltwitter4j/auth/VineOauthAuthorization;->LOGGABLE:Z

    if-eqz v6, :cond_3

    .line 352
    const-string v6, "t4jVineOauth"

    const-string v7, "Failed to get HmacSHA1 \"Message Authentication Code\" (MAC)"

    invoke-static {v6, v7, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 354
    :cond_3
    new-instance v6, Ljava/lang/AssertionError;

    invoke-direct {v6, v3}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v6
.end method

.method public getAuthorizationHeader(Ltwitter4j/internal/http/HttpRequest;)Ljava/lang/String;
    .locals 4
    .parameter "req"

    .prologue
    .line 81
    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpRequest;->getMethod()Ltwitter4j/internal/http/RequestMethod;

    move-result-object v0

    invoke-virtual {v0}, Ltwitter4j/internal/http/RequestMethod;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpRequest;->getURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpRequest;->getParameters()[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v2

    iget-object v3, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    invoke-virtual {p0, v0, v1, v2, v3}, Ltwitter4j/auth/VineOauthAuthorization;->generateAuthorizationHeader(Ljava/lang/String;Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/OAuthToken;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOAuthAccessToken()Ltwitter4j/auth/AccessToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 140
    invoke-direct {p0}, Ltwitter4j/auth/VineOauthAuthorization;->ensureTokenIsAvailable()V

    .line 141
    iget-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    instance-of v0, v0, Ltwitter4j/auth/AccessToken;

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    check-cast v0, Ltwitter4j/auth/AccessToken;

    .line 145
    :goto_0
    return-object v0

    .line 144
    :cond_0
    new-instance v0, Ltwitter4j/auth/AccessToken;

    sget-object v1, Ltwitter4j/auth/VineOauthAuthorization;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v2}, Ltwitter4j/conf/Configuration;->getOAuthAccessTokenURL()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p0}, Ltwitter4j/internal/http/HttpClientWrapper;->post(Ljava/lang/String;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v1

    invoke-direct {v0, v1}, Ltwitter4j/auth/AccessToken;-><init>(Ltwitter4j/internal/http/HttpResponse;)V

    iput-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    .line 145
    iget-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    check-cast v0, Ltwitter4j/auth/AccessToken;

    goto :goto_0
.end method

.method public getOAuthAccessToken(Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    .locals 7
    .parameter "oauthVerifier"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 153
    invoke-direct {p0}, Ltwitter4j/auth/VineOauthAuthorization;->ensureTokenIsAvailable()V

    .line 154
    new-instance v0, Ltwitter4j/auth/AccessToken;

    sget-object v1, Ltwitter4j/auth/VineOauthAuthorization;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v2}, Ltwitter4j/conf/Configuration;->getOAuthAccessTokenURL()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ltwitter4j/internal/http/HttpParameter;

    const/4 v4, 0x0

    new-instance v5, Ltwitter4j/internal/http/HttpParameter;

    const-string v6, "oauth_verifier"

    invoke-direct {v5, v6, p1}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3, p0}, Ltwitter4j/internal/http/HttpClientWrapper;->post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v1

    invoke-direct {v0, v1}, Ltwitter4j/auth/AccessToken;-><init>(Ltwitter4j/internal/http/HttpResponse;)V

    iput-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    .line 156
    iget-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    check-cast v0, Ltwitter4j/auth/AccessToken;

    return-object v0
.end method

.method public getOAuthAccessToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    .locals 9
    .parameter "screenName"
    .parameter "password"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 183
    :try_start_0
    iget-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v2}, Ltwitter4j/conf/Configuration;->getOAuthAccessTokenURL()Ljava/lang/String;

    move-result-object v1

    .line 184
    .local v1, url:Ljava/lang/String;
    const-string v2, "http://"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_0

    .line 187
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "https://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/4 v3, 0x7

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 189
    :cond_0
    new-instance v2, Ltwitter4j/auth/AccessToken;

    sget-object v3, Ltwitter4j/auth/VineOauthAuthorization;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    const/4 v4, 0x4

    new-array v4, v4, [Ltwitter4j/internal/http/HttpParameter;

    const/4 v5, 0x0

    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "x_auth_username"

    invoke-direct {v6, v7, p1}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v6, v4, v5

    const/4 v5, 0x1

    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "x_auth_password"

    invoke-direct {v6, v7, p2}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v6, v4, v5

    const/4 v5, 0x2

    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "x_auth_mode"

    const-string v8, "client_auth"

    invoke-direct {v6, v7, v8}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v6, v4, v5

    const/4 v5, 0x3

    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "send_error_codes"

    const/4 v8, 0x1

    invoke-direct {v6, v7, v8}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Z)V

    aput-object v6, v4, v5

    invoke-virtual {v3, v1, v4, p0}, Ltwitter4j/internal/http/HttpClientWrapper;->post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v3

    invoke-direct {v2, v3}, Ltwitter4j/auth/AccessToken;-><init>(Ltwitter4j/internal/http/HttpResponse;)V

    iput-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    .line 195
    iget-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    check-cast v2, Ltwitter4j/auth/AccessToken;
    :try_end_0
    .catch Ltwitter4j/TwitterException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    .line 196
    .end local v1           #url:Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 197
    .local v0, te:Ltwitter4j/TwitterException;
    new-instance v2, Ltwitter4j/TwitterException;

    const-string v3, "The screen name / password combination seems to be invalid."

    invoke-virtual {v0}, Ltwitter4j/TwitterException;->getStatusCode()I

    move-result v4

    invoke-direct {v2, v3, v0, v4}, Ltwitter4j/TwitterException;-><init>(Ljava/lang/String;Ljava/lang/Exception;I)V

    throw v2
.end method

.method public getOAuthAccessToken(Ltwitter4j/auth/RequestToken;)Ltwitter4j/auth/AccessToken;
    .locals 1
    .parameter "requestToken"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 164
    iput-object p1, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    .line 165
    invoke-virtual {p0}, Ltwitter4j/auth/VineOauthAuthorization;->getOAuthAccessToken()Ltwitter4j/auth/AccessToken;

    move-result-object v0

    return-object v0
.end method

.method public getOAuthAccessToken(Ltwitter4j/auth/RequestToken;Ljava/lang/String;)Ltwitter4j/auth/AccessToken;
    .locals 1
    .parameter "requestToken"
    .parameter "oauthVerifier"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 173
    iput-object p1, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    .line 174
    invoke-virtual {p0, p2}, Ltwitter4j/auth/VineOauthAuthorization;->getOAuthAccessToken(Ljava/lang/String;)Ltwitter4j/auth/AccessToken;

    move-result-object v0

    return-object v0
.end method

.method public getOAuthRequestToken()Ltwitter4j/auth/RequestToken;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 105
    invoke-virtual {p0, v0, v0}, Ltwitter4j/auth/VineOauthAuthorization;->getOAuthRequestToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/RequestToken;

    move-result-object v0

    return-object v0
.end method

.method public getOAuthRequestToken(Ljava/lang/String;)Ltwitter4j/auth/RequestToken;
    .locals 1
    .parameter "callbackURL"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 113
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Ltwitter4j/auth/VineOauthAuthorization;->getOAuthRequestToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/RequestToken;

    move-result-object v0

    return-object v0
.end method

.method public getOAuthRequestToken(Ljava/lang/String;Ljava/lang/String;)Ltwitter4j/auth/RequestToken;
    .locals 5
    .parameter "callbackURL"
    .parameter "xAuthAccessType"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 121
    iget-object v1, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    instance-of v1, v1, Ltwitter4j/auth/AccessToken;

    if-eqz v1, :cond_0

    .line 122
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Access token already available."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 124
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .local v0, params:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    if-eqz p1, :cond_1

    .line 126
    new-instance v1, Ltwitter4j/internal/http/HttpParameter;

    const-string v2, "oauth_callback"

    invoke-direct {v1, v2, p1}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 128
    :cond_1
    if-eqz p2, :cond_2

    .line 129
    new-instance v1, Ltwitter4j/internal/http/HttpParameter;

    const-string v2, "x_auth_access_type"

    invoke-direct {v1, v2, p2}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 131
    :cond_2
    new-instance v2, Ltwitter4j/auth/RequestToken;

    sget-object v3, Ltwitter4j/auth/VineOauthAuthorization;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v1, p0, Ltwitter4j/auth/VineOauthAuthorization;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v1}, Ltwitter4j/conf/Configuration;->getOAuthRequestTokenURL()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ltwitter4j/internal/http/HttpParameter;

    invoke-interface {v0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ltwitter4j/internal/http/HttpParameter;

    invoke-virtual {v3, v4, v1, p0}, Ltwitter4j/internal/http/HttpClientWrapper;->post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v1

    invoke-direct {v2, v1, p0}, Ltwitter4j/auth/RequestToken;-><init>(Ltwitter4j/internal/http/HttpResponse;Ltwitter4j/auth/OAuthSupport;)V

    iput-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    .line 132
    iget-object v1, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    check-cast v1, Ltwitter4j/auth/RequestToken;

    return-object v1
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 503
    iget-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 504
    .local v0, result:I
    :goto_0
    mul-int/lit8 v3, v0, 0x1f

    iget-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_1
    add-int v0, v3, v2

    .line 505
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    if-eqz v3, :cond_0

    iget-object v1, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    invoke-virtual {v1}, Ltwitter4j/auth/OAuthToken;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 506
    return v0

    .end local v0           #result:I
    :cond_1
    move v0, v1

    .line 503
    goto :goto_0

    .restart local v0       #result:I
    :cond_2
    move v2, v1

    .line 504
    goto :goto_1
.end method

.method public isEnabled()Z
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    if-eqz v0, :cond_0

    iget-object v0, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    instance-of v0, v0, Ltwitter4j/auth/AccessToken;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V
    .locals 0
    .parameter "accessToken"

    .prologue
    .line 206
    iput-object p1, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    .line 207
    return-void
.end method

.method public setOAuthConsumer(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .parameter "consumerKey"
    .parameter "consumerSecret"

    .prologue
    .line 479
    if-eqz p1, :cond_0

    .end local p1
    :goto_0
    iput-object p1, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    .line 480
    if-eqz p2, :cond_1

    .end local p2
    :goto_1
    iput-object p2, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerSecret:Ljava/lang/String;

    .line 481
    return-void

    .line 479
    .restart local p1
    .restart local p2
    :cond_0
    const-string p1, ""

    goto :goto_0

    .line 480
    .end local p1
    :cond_1
    const-string p2, ""

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 511
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "OAuthAuthorization{consumerKey=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/auth/VineOauthAuthorization;->consumerKey:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", consumerSecret=\'******************************************\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", oauthToken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/auth/VineOauthAuthorization;->oauthToken:Ltwitter4j/auth/OAuthToken;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
