.class public Ltwitter4j/internal/http/HttpClientImpl;
.super Ltwitter4j/internal/http/HttpClientBase;
.source "HttpClientImpl.java"

# interfaces
.implements Ltwitter4j/internal/http/HttpResponseCode;
.implements Ljava/io/Serializable;


# static fields
.field private static final instanceMap:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ltwitter4j/internal/http/HttpClientConfiguration;",
            "Ltwitter4j/internal/http/HttpClient;",
            ">;"
        }
    .end annotation
.end field

.field private static final serialVersionUID:J = -0x7a63fdacd4e632ffL


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 48
    invoke-static {}, Ltwitter4j/conf/ConfigurationContext;->getInstance()Ltwitter4j/conf/Configuration;

    move-result-object v0

    invoke-interface {v0}, Ltwitter4j/conf/Configuration;->isDalvik()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    const-string v0, "http.keepAlive"

    const-string v1, "false"

    invoke-static {v0, v1}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 63
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    sput-object v0, Ltwitter4j/internal/http/HttpClientImpl;->instanceMap:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    invoke-static {}, Ltwitter4j/conf/ConfigurationContext;->getInstance()Ltwitter4j/conf/Configuration;

    move-result-object v0

    invoke-direct {p0, v0}, Ltwitter4j/internal/http/HttpClientBase;-><init>(Ltwitter4j/internal/http/HttpClientConfiguration;)V

    .line 57
    return-void
.end method

.method public constructor <init>(Ltwitter4j/internal/http/HttpClientConfiguration;)V
    .locals 0
    .parameter "conf"

    .prologue
    .line 60
    invoke-direct {p0, p1}, Ltwitter4j/internal/http/HttpClientBase;-><init>(Ltwitter4j/internal/http/HttpClientConfiguration;)V

    .line 61
    return-void
.end method

.method public static getInstance(Ltwitter4j/internal/http/HttpClientConfiguration;)Ltwitter4j/internal/http/HttpClient;
    .locals 2
    .parameter "conf"

    .prologue
    .line 66
    sget-object v1, Ltwitter4j/internal/http/HttpClientImpl;->instanceMap:Ljava/util/Map;

    invoke-interface {v1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltwitter4j/internal/http/HttpClient;

    .line 67
    .local v0, client:Ltwitter4j/internal/http/HttpClient;
    if-nez v0, :cond_0

    .line 68
    new-instance v0, Ltwitter4j/internal/http/HttpClientImpl;

    .end local v0           #client:Ltwitter4j/internal/http/HttpClient;
    invoke-direct {v0, p0}, Ltwitter4j/internal/http/HttpClientImpl;-><init>(Ltwitter4j/internal/http/HttpClientConfiguration;)V

    .line 69
    .restart local v0       #client:Ltwitter4j/internal/http/HttpClient;
    sget-object v1, Ltwitter4j/internal/http/HttpClientImpl;->instanceMap:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    :cond_0
    return-object v0
.end method

.method private setHeaders(Ltwitter4j/internal/http/HttpRequest;Ljava/net/HttpURLConnection;)V
    .locals 4
    .parameter "req"
    .parameter "connection"

    .prologue
    .line 212
    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpRequest;->getAuthorization()Ltwitter4j/auth/Authorization;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpRequest;->getAuthorization()Ltwitter4j/auth/Authorization;

    move-result-object v3

    invoke-interface {v3, p1}, Ltwitter4j/auth/Authorization;->getAuthorizationHeader(Ltwitter4j/internal/http/HttpRequest;)Ljava/lang/String;

    move-result-object v0

    .local v0, authorizationHeader:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 216
    const-string v3, "Authorization"

    invoke-virtual {p2, v3, v0}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .end local v0           #authorizationHeader:Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpRequest;->getRequestHeaders()Ljava/util/Map;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 219
    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpRequest;->getRequestHeaders()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 220
    .local v2, key:Ljava/lang/String;
    invoke-virtual {p1}, Ltwitter4j/internal/http/HttpRequest;->getRequestHeaders()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p2, v2, v3}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 224
    .end local v1           #i$:Ljava/util/Iterator;
    .end local v2           #key:Ljava/lang/String;
    :cond_1
    return-void
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ltwitter4j/internal/http/HttpResponse;
    .locals 6
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 75
    new-instance v0, Ltwitter4j/internal/http/HttpRequest;

    sget-object v1, Ltwitter4j/internal/http/RequestMethod;->GET:Ltwitter4j/internal/http/RequestMethod;

    move-object v2, p1

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v5}, Ltwitter4j/internal/http/HttpRequest;-><init>(Ltwitter4j/internal/http/RequestMethod;Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;Ljava/util/Map;)V

    invoke-virtual {p0, v0}, Ltwitter4j/internal/http/HttpClientImpl;->request(Ltwitter4j/internal/http/HttpRequest;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method protected getConnection(Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .locals 5
    .parameter "url"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 228
    invoke-virtual {p0}, Ltwitter4j/internal/http/HttpClientImpl;->isProxyConfigured()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 229
    iget-object v2, p0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v2}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpProxyUser()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v2}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpProxyUser()Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 234
    new-instance v2, Ltwitter4j/internal/http/HttpClientImpl$1;

    invoke-direct {v2, p0}, Ltwitter4j/internal/http/HttpClientImpl$1;-><init>(Ltwitter4j/internal/http/HttpClientImpl;)V

    invoke-static {v2}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    .line 248
    :cond_0
    new-instance v1, Ljava/net/Proxy;

    sget-object v2, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    iget-object v3, p0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v3}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpProxyHost()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v4}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpProxyPort()I

    move-result v4

    invoke-static {v3, v4}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 253
    .local v1, proxy:Ljava/net/Proxy;
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 257
    .end local v1           #proxy:Ljava/net/Proxy;
    .local v0, con:Ljava/net/HttpURLConnection;
    :goto_0
    iget-object v2, p0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v2}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpConnectionTimeout()I

    move-result v2

    if-lez v2, :cond_1

    .line 258
    iget-object v2, p0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v2}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpConnectionTimeout()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 260
    :cond_1
    iget-object v2, p0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v2}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpReadTimeout()I

    move-result v2

    if-lez v2, :cond_2

    .line 261
    iget-object v2, p0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v2}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpReadTimeout()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 263
    :cond_2
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 264
    return-object v0

    .line 255
    .end local v0           #con:Ljava/net/HttpURLConnection;
    :cond_3
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .restart local v0       #con:Ljava/net/HttpURLConnection;
    goto :goto_0
.end method

.method public post(Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;)Ltwitter4j/internal/http/HttpResponse;
    .locals 6
    .parameter "url"
    .parameter "params"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 79
    new-instance v0, Ltwitter4j/internal/http/HttpRequest;

    sget-object v1, Ltwitter4j/internal/http/RequestMethod;->POST:Ltwitter4j/internal/http/RequestMethod;

    move-object v2, p1

    move-object v3, p2

    move-object v5, v4

    invoke-direct/range {v0 .. v5}, Ltwitter4j/internal/http/HttpRequest;-><init>(Ltwitter4j/internal/http/RequestMethod;Ljava/lang/String;[Ltwitter4j/internal/http/HttpParameter;Ltwitter4j/auth/Authorization;Ljava/util/Map;)V

    invoke-virtual {p0, v0}, Ltwitter4j/internal/http/HttpClientImpl;->request(Ltwitter4j/internal/http/HttpRequest;)Ltwitter4j/internal/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public request(Ltwitter4j/internal/http/HttpRequest;)Ltwitter4j/internal/http/HttpResponse;
    .locals 25
    .parameter "req"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 85
    move-object/from16 v0, p0

    iget-object v0, v0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpRetryCount()I

    move-result v22

    add-int/lit8 v21, v22, 0x1

    .line 86
    .local v21, retry:I
    const/16 v17, 0x0

    .line 87
    .local v17, res:Ltwitter4j/internal/http/HttpResponse;
    const/16 v20, 0x0

    .local v20, retriedCount:I
    move-object/from16 v18, v17

    .end local v17           #res:Ltwitter4j/internal/http/HttpResponse;
    .local v18, res:Ltwitter4j/internal/http/HttpResponse;
    :goto_0
    move/from16 v0, v20

    move/from16 v1, v21

    if-ge v0, v1, :cond_b

    .line 88
    const/16 v19, -0x1

    .line 91
    .local v19, responseCode:I
    const/4 v13, 0x0

    .line 93
    .local v13, os:Ljava/io/OutputStream;
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ltwitter4j/internal/http/HttpRequest;->getURL()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ltwitter4j/internal/http/HttpClientImpl;->getConnection(Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v7

    .line 94
    .local v7, con:Ljava/net/HttpURLConnection;
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 95
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v7}, Ltwitter4j/internal/http/HttpClientImpl;->setHeaders(Ltwitter4j/internal/http/HttpRequest;Ljava/net/HttpURLConnection;)V

    .line 96
    invoke-virtual/range {p1 .. p1}, Ltwitter4j/internal/http/HttpRequest;->getMethod()Ltwitter4j/internal/http/RequestMethod;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ltwitter4j/internal/http/RequestMethod;->name()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 97
    invoke-virtual/range {p1 .. p1}, Ltwitter4j/internal/http/HttpRequest;->getMethod()Ltwitter4j/internal/http/RequestMethod;

    move-result-object v22

    sget-object v23, Ltwitter4j/internal/http/RequestMethod;->POST:Ltwitter4j/internal/http/RequestMethod;

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    if-ne v0, v1, :cond_4

    .line 98
    invoke-virtual/range {p1 .. p1}, Ltwitter4j/internal/http/HttpRequest;->getParameters()[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ltwitter4j/internal/http/HttpParameter;->containsFile([Ltwitter4j/internal/http/HttpParameter;)Z

    move-result v22

    if-eqz v22, :cond_7

    .line 99
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "----Twitter4J-upload"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v23

    invoke-virtual/range {v22 .. v24}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 100
    .local v4, boundary:Ljava/lang/String;
    const-string v22, "Content-Type"

    new-instance v23, Ljava/lang/StringBuilder;

    invoke-direct/range {v23 .. v23}, Ljava/lang/StringBuilder;-><init>()V

    const-string v24, "multipart/form-data; boundary="

    invoke-virtual/range {v23 .. v24}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    move-object/from16 v0, v23

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v7, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "--"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 102
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 103
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v13

    .line 104
    new-instance v14, Ljava/io/DataOutputStream;

    invoke-direct {v14, v13}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 105
    .local v14, out:Ljava/io/DataOutputStream;
    invoke-virtual/range {p1 .. p1}, Ltwitter4j/internal/http/HttpRequest;->getParameters()[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v3

    .local v3, arr$:[Ltwitter4j/internal/http/HttpParameter;
    array-length v11, v3

    .local v11, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_1
    if-ge v8, v11, :cond_3

    aget-object v15, v3, v8

    .line 106
    .local v15, param:Ltwitter4j/internal/http/HttpParameter;
    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->isFile()Z

    move-result v22

    if-eqz v22, :cond_2

    .line 107
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\r\n"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 108
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Content-Disposition: form-data; name=\""

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\"; filename=\""

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->getFile()Ljava/io/File;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\"\r\n"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 109
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Content-Type: "

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->getContentType()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\r\n\r\n"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 110
    new-instance v9, Ljava/io/BufferedInputStream;

    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->hasFileBody()Z

    move-result v22

    if-eqz v22, :cond_0

    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->getFileBody()Ljava/io/InputStream;

    move-result-object v22

    :goto_2
    move-object/from16 v0, v22

    invoke-direct {v9, v0}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 113
    .local v9, in:Ljava/io/BufferedInputStream;
    const/16 v22, 0x400

    move/from16 v0, v22

    new-array v5, v0, [B

    .line 115
    .local v5, buff:[B
    :goto_3
    invoke-virtual {v9, v5}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v12

    .local v12, length:I
    const/16 v22, -0x1

    move/from16 v0, v22

    if-eq v12, v0, :cond_1

    .line 116
    const/16 v22, 0x0

    move/from16 v0, v22

    invoke-virtual {v14, v5, v0, v12}, Ljava/io/DataOutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    .line 175
    .end local v3           #arr$:[Ltwitter4j/internal/http/HttpParameter;
    .end local v4           #boundary:Ljava/lang/String;
    .end local v5           #buff:[B
    .end local v7           #con:Ljava/net/HttpURLConnection;
    .end local v8           #i$:I
    .end local v9           #in:Ljava/io/BufferedInputStream;
    .end local v11           #len$:I
    .end local v12           #length:I
    .end local v14           #out:Ljava/io/DataOutputStream;
    .end local v15           #param:Ltwitter4j/internal/http/HttpParameter;
    :catchall_0
    move-exception v22

    move-object/from16 v17, v18

    .line 176
    .end local v18           #res:Ltwitter4j/internal/http/HttpResponse;
    .restart local v17       #res:Ltwitter4j/internal/http/HttpResponse;
    :goto_4
    :try_start_1
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 178
    :goto_5
    :try_start_2
    throw v22
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 180
    :catch_0
    move-exception v10

    .line 182
    .local v10, ioe:Ljava/io/IOException;
    move-object/from16 v0, p0

    iget-object v0, v0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpRetryCount()I

    move-result v22

    move/from16 v0, v20

    move/from16 v1, v22

    if-ne v0, v1, :cond_a

    .line 183
    new-instance v22, Ltwitter4j/TwitterException;

    invoke-virtual {v10}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move/from16 v2, v19

    invoke-direct {v0, v1, v10, v2}, Ltwitter4j/TwitterException;-><init>(Ljava/lang/String;Ljava/lang/Exception;I)V

    throw v22

    .line 110
    .end local v10           #ioe:Ljava/io/IOException;
    .end local v17           #res:Ltwitter4j/internal/http/HttpResponse;
    .restart local v3       #arr$:[Ltwitter4j/internal/http/HttpParameter;
    .restart local v4       #boundary:Ljava/lang/String;
    .restart local v7       #con:Ljava/net/HttpURLConnection;
    .restart local v8       #i$:I
    .restart local v11       #len$:I
    .restart local v14       #out:Ljava/io/DataOutputStream;
    .restart local v15       #param:Ltwitter4j/internal/http/HttpParameter;
    .restart local v18       #res:Ltwitter4j/internal/http/HttpResponse;
    :cond_0
    :try_start_3
    new-instance v22, Ljava/io/FileInputStream;

    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->getFile()Ljava/io/File;

    move-result-object v23

    invoke-direct/range {v22 .. v23}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    goto :goto_2

    .line 118
    .restart local v5       #buff:[B
    .restart local v9       #in:Ljava/io/BufferedInputStream;
    .restart local v12       #length:I
    :cond_1
    const-string v22, "\r\n"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 119
    invoke-virtual {v9}, Ljava/io/BufferedInputStream;->close()V

    .line 105
    .end local v5           #buff:[B
    .end local v9           #in:Ljava/io/BufferedInputStream;
    .end local v12           #length:I
    :goto_6
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_1

    .line 121
    :cond_2
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\r\n"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 122
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "Content-Disposition: form-data; name=\""

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->getName()Ljava/lang/String;

    move-result-object v23

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "\"\r\n"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 123
    const-string v22, "Content-Type: text/plain; charset=UTF-8\r\n\r\n"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 125
    invoke-virtual {v15}, Ltwitter4j/internal/http/HttpParameter;->getValue()Ljava/lang/String;

    move-result-object v22

    const-string v23, "UTF-8"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v14, v0}, Ljava/io/DataOutputStream;->write([B)V

    .line 126
    const-string v22, "\r\n"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    goto :goto_6

    .line 129
    .end local v15           #param:Ltwitter4j/internal/http/HttpParameter;
    :cond_3
    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string v23, "--\r\n"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 130
    const-string v22, "\r\n"

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v14, v1}, Ltwitter4j/internal/http/HttpClientImpl;->write(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    .line 144
    .end local v3           #arr$:[Ltwitter4j/internal/http/HttpParameter;
    .end local v4           #boundary:Ljava/lang/String;
    .end local v8           #i$:I
    .end local v11           #len$:I
    .end local v14           #out:Ljava/io/DataOutputStream;
    :goto_7
    invoke-virtual {v13}, Ljava/io/OutputStream;->flush()V

    .line 145
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    .line 147
    :cond_4
    new-instance v17, Ltwitter4j/internal/http/HttpResponseImpl;

    move-object/from16 v0, p0

    iget-object v0, v0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    move-object/from16 v22, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v22

    invoke-direct {v0, v7, v1}, Ltwitter4j/internal/http/HttpResponseImpl;-><init>(Ljava/net/HttpURLConnection;Ltwitter4j/internal/http/HttpClientConfiguration;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 148
    .end local v18           #res:Ltwitter4j/internal/http/HttpResponse;
    .restart local v17       #res:Ltwitter4j/internal/http/HttpResponse;
    :try_start_4
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v19

    .line 163
    const/16 v22, 0xc8

    move/from16 v0, v19

    move/from16 v1, v22

    if-lt v0, v1, :cond_5

    const/16 v22, 0x12e

    move/from16 v0, v19

    move/from16 v1, v22

    if-eq v0, v1, :cond_8

    const/16 v22, 0x12c

    move/from16 v0, v22

    move/from16 v1, v19

    if-gt v0, v1, :cond_8

    .line 164
    :cond_5
    const/16 v22, 0x1a4

    move/from16 v0, v19

    move/from16 v1, v22

    if-eq v0, v1, :cond_6

    const/16 v22, 0x190

    move/from16 v0, v19

    move/from16 v1, v22

    if-eq v0, v1, :cond_6

    const/16 v22, 0x1f4

    move/from16 v0, v19

    move/from16 v1, v22

    if-lt v0, v1, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpRetryCount()I

    move-result v22

    move/from16 v0, v20

    move/from16 v1, v22

    if-ne v0, v1, :cond_9

    .line 168
    :cond_6
    new-instance v22, Ltwitter4j/TwitterException;

    invoke-virtual/range {v17 .. v17}, Ltwitter4j/internal/http/HttpResponse;->asString()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v17

    invoke-direct {v0, v1, v2}, Ltwitter4j/TwitterException;-><init>(Ljava/lang/String;Ltwitter4j/internal/http/HttpResponse;)V

    throw v22
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 175
    :catchall_1
    move-exception v22

    goto/16 :goto_4

    .line 133
    .end local v17           #res:Ltwitter4j/internal/http/HttpResponse;
    .restart local v18       #res:Ltwitter4j/internal/http/HttpResponse;
    :cond_7
    :try_start_5
    const-string v22, "Content-Type"

    const-string v23, "application/x-www-form-urlencoded"

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v7, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-virtual/range {p1 .. p1}, Ltwitter4j/internal/http/HttpRequest;->getParameters()[Ltwitter4j/internal/http/HttpParameter;

    move-result-object v22

    invoke-static/range {v22 .. v22}, Ltwitter4j/internal/http/HttpParameter;->encodeParameters([Ltwitter4j/internal/http/HttpParameter;)Ljava/lang/String;

    move-result-object v16

    .line 137
    .local v16, postParam:Ljava/lang/String;
    const-string v22, "UTF-8"

    move-object/from16 v0, v16

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v6

    .line 138
    .local v6, bytes:[B
    const-string v22, "Content-Length"

    array-length v0, v6

    move/from16 v23, v0

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    invoke-virtual {v7, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    const/16 v22, 0x1

    move/from16 v0, v22

    invoke-virtual {v7, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 141
    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v13

    .line 142
    invoke-virtual {v13, v6}, Ljava/io/OutputStream;->write([B)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto/16 :goto_7

    .line 176
    .end local v6           #bytes:[B
    .end local v16           #postParam:Ljava/lang/String;
    .end local v18           #res:Ltwitter4j/internal/http/HttpResponse;
    .restart local v17       #res:Ltwitter4j/internal/http/HttpResponse;
    :cond_8
    :try_start_6
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0

    .line 196
    .end local v7           #con:Ljava/net/HttpURLConnection;
    .end local v13           #os:Ljava/io/OutputStream;
    .end local v19           #responseCode:I
    :goto_8
    return-object v17

    .line 176
    .restart local v7       #con:Ljava/net/HttpURLConnection;
    .restart local v13       #os:Ljava/io/OutputStream;
    .restart local v19       #responseCode:I
    :cond_9
    :try_start_7
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_0

    .line 191
    .end local v7           #con:Ljava/net/HttpURLConnection;
    :cond_a
    :goto_9
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Ltwitter4j/internal/http/HttpClientImpl;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    move-object/from16 v22, v0

    invoke-interface/range {v22 .. v22}, Ltwitter4j/internal/http/HttpClientConfiguration;->getHttpRetryIntervalSeconds()I

    move-result v22

    move/from16 v0, v22

    mul-int/lit16 v0, v0, 0x3e8

    move/from16 v22, v0

    move/from16 v0, v22

    int-to-long v0, v0

    move-wide/from16 v22, v0

    invoke-static/range {v22 .. v23}, Ljava/lang/Thread;->sleep(J)V
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_4

    .line 87
    :goto_a
    add-int/lit8 v20, v20, 0x1

    move-object/from16 v18, v17

    .end local v17           #res:Ltwitter4j/internal/http/HttpResponse;
    .restart local v18       #res:Ltwitter4j/internal/http/HttpResponse;
    goto/16 :goto_0

    .line 177
    .end local v18           #res:Ltwitter4j/internal/http/HttpResponse;
    .restart local v7       #con:Ljava/net/HttpURLConnection;
    .restart local v17       #res:Ltwitter4j/internal/http/HttpResponse;
    :catch_1
    move-exception v22

    goto :goto_8

    :catch_2
    move-exception v22

    goto :goto_9

    .end local v7           #con:Ljava/net/HttpURLConnection;
    :catch_3
    move-exception v23

    goto/16 :goto_5

    .line 192
    :catch_4
    move-exception v22

    goto :goto_a

    .end local v13           #os:Ljava/io/OutputStream;
    .end local v17           #res:Ltwitter4j/internal/http/HttpResponse;
    .end local v19           #responseCode:I
    .restart local v18       #res:Ltwitter4j/internal/http/HttpResponse;
    :cond_b
    move-object/from16 v17, v18

    .end local v18           #res:Ltwitter4j/internal/http/HttpResponse;
    .restart local v17       #res:Ltwitter4j/internal/http/HttpResponse;
    goto :goto_8
.end method
