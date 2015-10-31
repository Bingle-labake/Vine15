.class public abstract Ltwitter4j/internal/http/HttpClientBase;
.super Ljava/lang/Object;
.source "HttpClientBase.java"

# interfaces
.implements Ltwitter4j/internal/http/HttpClient;
.implements Ljava/io/Serializable;


# static fields
#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field private static final TAG:Ljava/lang/String; = "t4jHttpClientBase"

.field private static final serialVersionUID:J = 0x60615468668a4591L


# instance fields
.field protected final CONF:Ltwitter4j/internal/http/HttpClientConfiguration;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    sput-boolean v0, Ltwitter4j/internal/http/HttpClientBase;->LOGGABLE:Z

    return-void
.end method

.method public constructor <init>(Ltwitter4j/internal/http/HttpClientConfiguration;)V
    .locals 0
    .parameter "conf"

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Ltwitter4j/internal/http/HttpClientBase;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    .line 19
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .parameter "o"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 38
    if-ne p0, p1, :cond_1

    .line 45
    :cond_0
    :goto_0
    return v1

    .line 39
    :cond_1
    instance-of v3, p1, Ltwitter4j/internal/http/HttpClientBase;

    if-nez v3, :cond_2

    move v1, v2

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 41
    check-cast v0, Ltwitter4j/internal/http/HttpClientBase;

    .line 43
    .local v0, that:Ltwitter4j/internal/http/HttpClientBase;
    iget-object v3, p0, Ltwitter4j/internal/http/HttpClientBase;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    iget-object v4, v0, Ltwitter4j/internal/http/HttpClientBase;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Ltwitter4j/internal/http/HttpClientBase;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method

.method protected isProxyConfigured()Z
    .locals 2

    .prologue
    .line 26
    iget-object v0, p0, Ltwitter4j/internal/http/HttpClientBase;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v0}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpProxyHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Ltwitter4j/internal/http/HttpClientBase;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v0}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpProxyHost()Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public shutdown()V
    .locals 0

    .prologue
    .line 23
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HttpClientBase{CONF="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/internal/http/HttpClientBase;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    .locals 1
    .parameter "out"
    .parameter "outStr"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 30
    invoke-virtual {p1, p2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 31
    sget-boolean v0, Ltwitter4j/internal/http/HttpClientBase;->LOGGABLE:Z

    if-eqz v0, :cond_0

    .line 32
    const-string v0, "t4jHttpClientBase"

    invoke-static {v0, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 34
    :cond_0
    return-void
.end method
