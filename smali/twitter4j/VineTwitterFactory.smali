.class public final Ltwitter4j/VineTwitterFactory;
.super Ljava/lang/Object;
.source "VineTwitterFactory.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field static final DEFAULT_AUTHORIZATION:Ltwitter4j/auth/Authorization; = null

.field private static final SINGLETON:Ltwitter4j/Twitter; = null

.field private static final TWITTER_CONSTRUCTOR:Ljava/lang/reflect/Constructor; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/reflect/Constructor",
            "<",
            "Ltwitter4j/Twitter;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = 0x481470a850d0e763L


# instance fields
.field private final conf:Ltwitter4j/conf/Configuration;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .prologue
    .line 24
    invoke-static {}, Ltwitter4j/conf/ConfigurationContext;->getInstance()Ltwitter4j/conf/Configuration;

    move-result-object v5

    invoke-static {v5}, Ltwitter4j/auth/AuthorizationFactory;->getInstance(Ltwitter4j/conf/Configuration;)Ltwitter4j/auth/Authorization;

    move-result-object v5

    sput-object v5, Ltwitter4j/VineTwitterFactory;->DEFAULT_AUTHORIZATION:Ltwitter4j/auth/Authorization;

    .line 30
    const/4 v1, 0x0

    .line 31
    .local v1, className:Ljava/lang/String;
    invoke-static {}, Ltwitter4j/conf/ConfigurationContext;->getInstance()Ltwitter4j/conf/Configuration;

    move-result-object v5

    invoke-interface {v5}, Ltwitter4j/conf/Configuration;->isGAE()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 32
    const-string v0, "twitter4j.AppEngineTwitterImpl"

    .line 34
    .local v0, APP_ENGINE_TWITTER_IMPL:Ljava/lang/String;
    :try_start_0
    const-string v5, "twitter4j.AppEngineTwitterImpl"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 35
    const-string v1, "twitter4j.AppEngineTwitterImpl"
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_5

    .line 39
    .end local v0           #APP_ENGINE_TWITTER_IMPL:Ljava/lang/String;
    :cond_0
    :goto_0
    if-nez v1, :cond_1

    .line 40
    const-string v1, "twitter4j.VineTwitter4j"

    .line 45
    :cond_1
    :try_start_1
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    .line 46
    .local v2, clazz:Ljava/lang/Class;
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ltwitter4j/conf/Configuration;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Ltwitter4j/auth/Authorization;

    aput-object v7, v5, v6

    invoke-virtual {v2, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v3

    .line 52
    .local v3, constructor:Ljava/lang/reflect/Constructor;,"Ljava/lang/reflect/Constructor<Ltwitter4j/Twitter;>;"
    sput-object v3, Ltwitter4j/VineTwitterFactory;->TWITTER_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    .line 55
    :try_start_2
    sget-object v5, Ltwitter4j/VineTwitterFactory;->TWITTER_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Ltwitter4j/conf/ConfigurationContext;->getInstance()Ltwitter4j/conf/Configuration;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    sget-object v8, Ltwitter4j/VineTwitterFactory;->DEFAULT_AUTHORIZATION:Ltwitter4j/auth/Authorization;

    aput-object v8, v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ltwitter4j/Twitter;

    sput-object v5, Ltwitter4j/VineTwitterFactory;->SINGLETON:Ltwitter4j/Twitter;
    :try_end_2
    .catch Ljava/lang/InstantiationException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_2 .. :try_end_2} :catch_4

    .line 63
    return-void

    .line 47
    .end local v2           #clazz:Ljava/lang/Class;
    .end local v3           #constructor:Ljava/lang/reflect/Constructor;,"Ljava/lang/reflect/Constructor<Ltwitter4j/Twitter;>;"
    :catch_0
    move-exception v4

    .line 48
    .local v4, e:Ljava/lang/NoSuchMethodException;
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 49
    .end local v4           #e:Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v4

    .line 50
    .local v4, e:Ljava/lang/ClassNotFoundException;
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 56
    .end local v4           #e:Ljava/lang/ClassNotFoundException;
    .restart local v2       #clazz:Ljava/lang/Class;
    .restart local v3       #constructor:Ljava/lang/reflect/Constructor;,"Ljava/lang/reflect/Constructor<Ltwitter4j/Twitter;>;"
    :catch_2
    move-exception v4

    .line 57
    .local v4, e:Ljava/lang/InstantiationException;
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 58
    .end local v4           #e:Ljava/lang/InstantiationException;
    :catch_3
    move-exception v4

    .line 59
    .local v4, e:Ljava/lang/IllegalAccessException;
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 60
    .end local v4           #e:Ljava/lang/IllegalAccessException;
    :catch_4
    move-exception v4

    .line 61
    .local v4, e:Ljava/lang/reflect/InvocationTargetException;
    new-instance v5, Ljava/lang/AssertionError;

    invoke-direct {v5, v4}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v5

    .line 36
    .end local v2           #clazz:Ljava/lang/Class;
    .end local v3           #constructor:Ljava/lang/reflect/Constructor;,"Ljava/lang/reflect/Constructor<Ltwitter4j/Twitter;>;"
    .end local v4           #e:Ljava/lang/reflect/InvocationTargetException;
    .restart local v0       #APP_ENGINE_TWITTER_IMPL:Ljava/lang/String;
    :catch_5
    move-exception v5

    goto :goto_0
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 69
    invoke-static {}, Ltwitter4j/conf/ConfigurationContext;->getInstance()Ltwitter4j/conf/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Ltwitter4j/VineTwitterFactory;-><init>(Ltwitter4j/conf/Configuration;)V

    .line 70
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "configTreePath"

    .prologue
    .line 91
    invoke-static {p1}, Ltwitter4j/conf/ConfigurationContext;->getInstance(Ljava/lang/String;)Ltwitter4j/conf/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Ltwitter4j/VineTwitterFactory;-><init>(Ltwitter4j/conf/Configuration;)V

    .line 92
    return-void
.end method

.method public constructor <init>(Ltwitter4j/conf/Configuration;)V
    .locals 2
    .parameter "conf"

    .prologue
    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    if-nez p1, :cond_0

    .line 80
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "configuration cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_0
    iput-object p1, p0, Ltwitter4j/VineTwitterFactory;->conf:Ltwitter4j/conf/Configuration;

    .line 83
    return-void
.end method

.method public static getSingleton()Ltwitter4j/Twitter;
    .locals 1

    .prologue
    .line 142
    sget-object v0, Ltwitter4j/VineTwitterFactory;->SINGLETON:Ltwitter4j/Twitter;

    return-object v0
.end method


# virtual methods
.method public getInstance()Ltwitter4j/Twitter;
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Ltwitter4j/VineTwitterFactory;->conf:Ltwitter4j/conf/Configuration;

    invoke-static {v0}, Ltwitter4j/auth/AuthorizationFactory;->getInstance(Ltwitter4j/conf/Configuration;)Ltwitter4j/auth/Authorization;

    move-result-object v0

    invoke-virtual {p0, v0}, Ltwitter4j/VineTwitterFactory;->getInstance(Ltwitter4j/auth/Authorization;)Ltwitter4j/Twitter;

    move-result-object v0

    return-object v0
.end method

.method public getInstance(Ltwitter4j/auth/AccessToken;)Ltwitter4j/Twitter;
    .locals 5
    .parameter "accessToken"

    .prologue
    .line 113
    iget-object v3, p0, Ltwitter4j/VineTwitterFactory;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v3}, Ltwitter4j/conf/Configuration;->getOAuthConsumerKey()Ljava/lang/String;

    move-result-object v0

    .line 114
    .local v0, consumerKey:Ljava/lang/String;
    iget-object v3, p0, Ltwitter4j/VineTwitterFactory;->conf:Ltwitter4j/conf/Configuration;

    invoke-interface {v3}, Ltwitter4j/conf/Configuration;->getOAuthConsumerSecret()Ljava/lang/String;

    move-result-object v1

    .line 115
    .local v1, consumerSecret:Ljava/lang/String;
    if-nez v0, :cond_0

    if-nez v1, :cond_0

    .line 116
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Consumer key and Consumer secret not supplied."

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 118
    :cond_0
    new-instance v2, Ltwitter4j/auth/OAuthAuthorization;

    iget-object v3, p0, Ltwitter4j/VineTwitterFactory;->conf:Ltwitter4j/conf/Configuration;

    invoke-direct {v2, v3}, Ltwitter4j/auth/OAuthAuthorization;-><init>(Ltwitter4j/conf/Configuration;)V

    .line 119
    .local v2, oauth:Ltwitter4j/auth/OAuthAuthorization;
    invoke-virtual {v2, p1}, Ltwitter4j/auth/OAuthAuthorization;->setOAuthAccessToken(Ltwitter4j/auth/AccessToken;)V

    .line 120
    invoke-virtual {p0, v2}, Ltwitter4j/VineTwitterFactory;->getInstance(Ltwitter4j/auth/Authorization;)Ltwitter4j/Twitter;

    move-result-object v3

    return-object v3
.end method

.method public getInstance(Ltwitter4j/auth/Authorization;)Ltwitter4j/Twitter;
    .locals 5
    .parameter "auth"

    .prologue
    .line 125
    :try_start_0
    sget-object v1, Ltwitter4j/VineTwitterFactory;->TWITTER_CONSTRUCTOR:Ljava/lang/reflect/Constructor;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Ltwitter4j/VineTwitterFactory;->conf:Ltwitter4j/conf/Configuration;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ltwitter4j/Twitter;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2

    return-object v1

    .line 126
    :catch_0
    move-exception v0

    .line 127
    .local v0, e:Ljava/lang/InstantiationException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 128
    .end local v0           #e:Ljava/lang/InstantiationException;
    :catch_1
    move-exception v0

    .line 129
    .local v0, e:Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 130
    .end local v0           #e:Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v0

    .line 131
    .local v0, e:Ljava/lang/reflect/InvocationTargetException;
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1
.end method
