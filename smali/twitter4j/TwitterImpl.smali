.class Ltwitter4j/TwitterImpl;
.super Ltwitter4j/TwitterBaseImpl;
.source "TwitterImpl.java"

# interfaces
.implements Ltwitter4j/Twitter;


# static fields
.field private static final implicitParamsMap:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ltwitter4j/conf/Configuration;",
            "[",
            "Ltwitter4j/internal/http/HttpParameter;",
            ">;"
        }
    .end annotation
.end field

.field private static final implicitParamsStrMap:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ltwitter4j/conf/Configuration;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0x14a09c9e28673704L


# instance fields
.field private final IMPLICIT_PARAMS:[Ltwitter4j/internal/http/HttpParameter;

.field private final IMPLICIT_PARAMS_STR:Ljava/lang/String;

.field private final INCLUDE_MY_RETWEET:Ltwitter4j/internal/http/HttpParameter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Ltwitter4j/TwitterImpl;->implicitParamsMap:Ljava/util/Map;

    .line 44
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Ltwitter4j/TwitterImpl;->implicitParamsStrMap:Ljava/util/Map;

    return-void
.end method

.method constructor <init>(Ltwitter4j/conf/Configuration;Ltwitter4j/auth/Authorization;)V
    .locals 10
    .parameter "conf"
    .parameter "auth"

    .prologue
    .line 48
    invoke-direct {p0, p1, p2}, Ltwitter4j/TwitterBaseImpl;-><init>(Ltwitter4j/conf/Configuration;Ltwitter4j/auth/Authorization;)V

    .line 49
    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "include_my_retweet"

    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->isIncludeMyRetweetEnabled()Z

    move-result v8

    invoke-direct {v6, v7, v8}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Z)V

    iput-object v6, p0, Ltwitter4j/TwitterImpl;->INCLUDE_MY_RETWEET:Ltwitter4j/internal/http/HttpParameter;

    .line 50
    sget-object v6, Ltwitter4j/TwitterImpl;->implicitParamsMap:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ltwitter4j/internal/http/HttpParameter;

    .line 51
    .local v1, implicitParams:[Ltwitter4j/internal/http/HttpParameter;
    sget-object v6, Ltwitter4j/TwitterImpl;->implicitParamsStrMap:Ljava/util/Map;

    invoke-interface {v6, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 52
    .local v2, implicitParamsStr:Ljava/lang/String;
    if-nez v1, :cond_2

    .line 53
    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->isIncludeEntitiesEnabled()Z

    move-result v6

    if-eqz v6, :cond_3

    const-string v3, "1"

    .line 54
    .local v3, includeEntities:Ljava/lang/String;
    :goto_0
    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->isIncludeRTsEnabled()Z

    move-result v6

    if-eqz v6, :cond_4

    const-string v4, "1"

    .line 55
    .local v4, includeRTs:Ljava/lang/String;
    :goto_1
    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getContributingTo()J

    move-result-wide v6

    const-wide/16 v8, -0x1

    cmp-long v6, v6, v8

    if-eqz v6, :cond_5

    const/4 v0, 0x1

    .line 56
    .local v0, contributorsEnabled:Z
    :goto_2
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "include_entities="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "&include_rts="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v0, :cond_6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "&contributingto="

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getContributingTo()J

    move-result-wide v8

    invoke-virtual {v6, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    :goto_3
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 58
    sget-object v6, Ltwitter4j/TwitterImpl;->implicitParamsStrMap:Ljava/util/Map;

    invoke-interface {v6, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    new-instance v5, Ljava/util/ArrayList;

    const/4 v6, 0x4

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 61
    .local v5, params:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "include_entities"

    invoke-direct {v6, v7, v3}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "include_rts"

    invoke-direct {v6, v7, v4}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    if-eqz v0, :cond_0

    .line 64
    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "contributingto"

    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->getContributingTo()J

    move-result-wide v8

    invoke-direct {v6, v7, v8, v9}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;J)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    :cond_0
    invoke-interface {p1}, Ltwitter4j/conf/Configuration;->isTrimUserEnabled()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 67
    new-instance v6, Ltwitter4j/internal/http/HttpParameter;

    const-string v7, "trim_user"

    const-string v8, "1"

    invoke-direct {v6, v7, v8}, Ltwitter4j/internal/http/HttpParameter;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    :cond_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    new-array v6, v6, [Ltwitter4j/internal/http/HttpParameter;

    invoke-interface {v5, v6}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    .end local v1           #implicitParams:[Ltwitter4j/internal/http/HttpParameter;
    check-cast v1, [Ltwitter4j/internal/http/HttpParameter;

    .line 70
    .restart local v1       #implicitParams:[Ltwitter4j/internal/http/HttpParameter;
    sget-object v6, Ltwitter4j/TwitterImpl;->implicitParamsMap:Ljava/util/Map;

    invoke-interface {v6, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .end local v0           #contributorsEnabled:Z
    .end local v3           #includeEntities:Ljava/lang/String;
    .end local v4           #includeRTs:Ljava/lang/String;
    .end local v5           #params:Ljava/util/List;,"Ljava/util/List<Ltwitter4j/internal/http/HttpParameter;>;"
    :cond_2
    iput-object v1, p0, Ltwitter4j/TwitterImpl;->IMPLICIT_PARAMS:[Ltwitter4j/internal/http/HttpParameter;

    .line 73
    iput-object v2, p0, Ltwitter4j/TwitterImpl;->IMPLICIT_PARAMS_STR:Ljava/lang/String;

    .line 74
    return-void

    .line 53
    :cond_3
    const-string v3, "0"

    goto/16 :goto_0

    .line 54
    .restart local v3       #includeEntities:Ljava/lang/String;
    :cond_4
    const-string v4, "0"

    goto/16 :goto_1

    .line 55
    .restart local v4       #includeRTs:Ljava/lang/String;
    :cond_5
    const/4 v0, 0x0

    goto/16 :goto_2

    .line 56
    .restart local v0       #contributorsEnabled:Z
    :cond_6
    const-string v6, ""

    goto :goto_3
.end method

.method private get(Ljava/lang/String;)Ltwitter4j/internal/http/HttpResponse;
    .locals 6
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 1900
    invoke-virtual {p0}, Ltwitter4j/TwitterImpl;->ensureAuthorizationEnabled()V

    .line 1901
    const-string v3, "?"

    invoke-virtual {p1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1902
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Ltwitter4j/TwitterImpl;->IMPLICIT_PARAMS_STR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1906
    :goto_0
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v3}, Ltwitter4j/conf/Configuration;->isMBeanEnabled()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1907
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v4, p0, Ltwitter4j/TwitterImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, p1, v4}, Ltwitter4j/internal/http/HttpClientWrapper;->get(Ljava/lang/String;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v0

    .line 1918
    :goto_1
    return-object v0

    .line 1904
    :cond_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Ltwitter4j/TwitterImpl;->IMPLICIT_PARAMS_STR:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 1910
    :cond_1
    const/4 v0, 0x0

    .line 1911
    .local v0, response:Ltwitter4j/internal/http/HttpResponse;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 1913
    .local v1, start:J
    :try_start_0
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v4, p0, Ltwitter4j/TwitterImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, p1, v4}, Ltwitter4j/internal/http/HttpClientWrapper;->get(Ljava/lang/String;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 1915
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    .line 1917
    goto :goto_1

    .line 1915
    :catchall_0
    move-exception v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v1

    .line 1917
    throw v3
.end method

.method private get(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;)Ltwitter4j/internal/http/HttpResponse;
    .locals 6
    .parameter "url"
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 1923
    invoke-virtual {p0}, Ltwitter4j/TwitterImpl;->ensureAuthorizationEnabled()V

    .line 1924
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v3}, Ltwitter4j/conf/Configuration;->isMBeanEnabled()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1925
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-direct {p0, p2}, Ltwitter4j/TwitterImpl;->mergeImplicitParams([Ltwitter4j/internal/http/HttpParameter;)[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v4

    iget-object v5, p0, Ltwitter4j/TwitterImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, p1, v4, v5}, Ltwitter4j/internal/http/HttpClientWrapper;->get(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v0

    .line 1936
    :goto_0
    return-object v0

    .line 1928
    :cond_0
    const/4 v0, 0x0

    .line 1929
    .local v0, response:Ltwitter4j/internal/http/HttpResponse;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 1931
    .local v1, start:J
    :try_start_0
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-direct {p0, p2}, Ltwitter4j/TwitterImpl;->mergeImplicitParams([Ltwitter4j/internal/http/HttpParameter;)[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v4

    iget-object v5, p0, Ltwitter4j/TwitterImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, p1, v4, v5}, Ltwitter4j/internal/http/HttpClientWrapper;->get(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 1933
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    .line 1935
    goto :goto_0

    .line 1933
    :catchall_0
    move-exception v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v1

    .line 1935
    throw v3
.end method

.method private isOk(Ltwitter4j/internal/http/HttpResponse;)Z
    .locals 2
    .parameter "response"

    .prologue
    .line 2015
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0x12c

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private mergeImplicitParams([Ltwitter4j/internal/http/HttpParameter;)[Ltwitter4j/internal/http/HttpParameter;
    .locals 1
    .parameter "params"

    .prologue
    .line 2011
    iget-object v0, p0, Ltwitter4j/TwitterImpl;->IMPLICIT_PARAMS:[Ltwitter4j/internal/http/HttpParameter;

    invoke-direct {p0, p1, v0}, Ltwitter4j/TwitterImpl;->mergeParameters([Ltwitter4j/internal/http/HttpParameter;[Ltwitter4j/internal/http/HttpParameter;)[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v0

    return-object v0
.end method

.method private mergeParameters([Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/internal/http/HttpParameter;)[Ltwitter4j/internal/http/HttpParameter;
    .locals 3
    .parameter "params1"
    .parameter "params2"

    .prologue
    const/4 v2, 0x0

    .line 1994
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 1995
    array-length v1, p1

    add-int/lit8 v1, v1, 0x1

    new-array v0, v1, [Ltwitter4j/internal/http/HttpParameter;

    .line 1996
    .local v0, params:[Ltwitter4j/internal/http/HttpParameter;
    array-length v1, p1

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1997
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aput-object p2, v0, v1

    .line 2006
    .end local v0           #params:[Ltwitter4j/internal/http/HttpParameter;
    :goto_0
    return-object v0

    .line 2000
    :cond_0
    if-nez p1, :cond_1

    if-nez p2, :cond_1

    .line 2001
    new-array v0, v2, [Ltwitter4j/internal/http/HttpParameter;

    goto :goto_0

    .line 2003
    :cond_1
    if-eqz p1, :cond_2

    move-object v0, p1

    .line 2004
    goto :goto_0

    .line 2006
    :cond_2
    const/4 v1, 0x1

    new-array v0, v1, [Ltwitter4j/internal/http/HttpParameter;

    aput-object p2, v0, v2

    goto :goto_0
.end method

.method private mergeParameters([Ltwitter4j/internal/http/HttpParameter;[Ltwitter4j/internal/http/HttpParameter;)[Ltwitter4j/internal/http/HttpParameter;
    .locals 4
    .parameter "params1"
    .parameter "params2"

    .prologue
    const/4 v3, 0x0

    .line 1977
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 1978
    array-length v1, p1

    array-length v2, p2

    add-int/2addr v1, v2

    new-array v0, v1, [Ltwitter4j/internal/http/HttpParameter;

    .line 1979
    .local v0, params:[Ltwitter4j/internal/http/HttpParameter;
    array-length v1, p1

    invoke-static {p1, v3, v0, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1980
    array-length v1, p1

    array-length v2, p2

    invoke-static {p2, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1989
    .end local v0           #params:[Ltwitter4j/internal/http/HttpParameter;
    :goto_0
    return-object v0

    .line 1983
    :cond_0
    if-nez p1, :cond_1

    if-nez p2, :cond_1

    .line 1984
    new-array v0, v3, [Ltwitter4j/internal/http/HttpParameter;

    goto :goto_0

    .line 1986
    :cond_1
    if-eqz p1, :cond_2

    move-object v0, p1

    .line 1987
    goto :goto_0

    :cond_2
    move-object v0, p2

    .line 1989
    goto :goto_0
.end method

.method private post(Ljava/lang/String;)Ltwitter4j/internal/http/HttpResponse;
    .locals 6
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 1941
    invoke-virtual {p0}, Ltwitter4j/TwitterImpl;->ensureAuthorizationEnabled()V

    .line 1942
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v3}, Ltwitter4j/conf/Configuration;->isMBeanEnabled()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1943
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v4, p0, Ltwitter4j/TwitterImpl;->IMPLICIT_PARAMS:[Ltwitter4j/internal/http/HttpParameter;

    iget-object v5, p0, Ltwitter4j/TwitterImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, p1, v4, v5}, Ltwitter4j/internal/http/HttpClientWrapper;->post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v0

    .line 1954
    :goto_0
    return-object v0

    .line 1946
    :cond_0
    const/4 v0, 0x0

    .line 1947
    .local v0, response:Ltwitter4j/internal/http/HttpResponse;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 1949
    .local v1, start:J
    :try_start_0
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    iget-object v4, p0, Ltwitter4j/TwitterImpl;->IMPLICIT_PARAMS:[Ltwitter4j/internal/http/HttpParameter;

    iget-object v5, p0, Ltwitter4j/TwitterImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, p1, v4, v5}, Ltwitter4j/internal/http/HttpClientWrapper;->post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 1951
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    .line 1953
    goto :goto_0

    .line 1951
    :catchall_0
    move-exception v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v1

    .line 1953
    throw v3
.end method

.method private post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;)Ltwitter4j/internal/http/HttpResponse;
    .locals 6
    .parameter "url"
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 1959
    invoke-virtual {p0}, Ltwitter4j/TwitterImpl;->ensureAuthorizationEnabled()V

    .line 1960
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v3}, Ltwitter4j/conf/Configuration;->isMBeanEnabled()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1961
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-direct {p0, p2}, Ltwitter4j/TwitterImpl;->mergeImplicitParams([Ltwitter4j/internal/http/HttpParameter;)[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v4

    iget-object v5, p0, Ltwitter4j/TwitterImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, p1, v4, v5}, Ltwitter4j/internal/http/HttpClientWrapper;->post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v0

    .line 1972
    :goto_0
    return-object v0

    .line 1964
    :cond_0
    const/4 v0, 0x0

    .line 1965
    .local v0, response:Ltwitter4j/internal/http/HttpResponse;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    .line 1967
    .local v1, start:J
    :try_start_0
    iget-object v3, p0, Ltwitter4j/TwitterImpl;->http:Ltwitter4j/internal/http/HttpClientWrapper;

    invoke-direct {p0, p2}, Ltwitter4j/TwitterImpl;->mergeImplicitParams([Ltwitter4j/internal/http/HttpParameter;)[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v4

    iget-object v5, p0, Ltwitter4j/TwitterImpl;->auth:Ltwitter4j/auth/Authorization;

    invoke-virtual {v3, p1, v4, v5}, Ltwitter4j/internal/http/HttpClientWrapper;->post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;)Ltwitter4j/internal/http/HttpResponse;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 1969
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v1

    .line 1971
    goto :goto_0

    .line 1969
    :catchall_0
    move-exception v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v1

    .line 1971
    throw v3
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 2020
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TwitterImpl{INCLUDE_MY_RETWEET="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/TwitterImpl;->INCLUDE_MY_RETWEET:Ltwitter4j/internal/http/HttpParameter;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
