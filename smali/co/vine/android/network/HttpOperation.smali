.class public Lco/vine/android/network/HttpOperation;
.super Ljava/lang/Object;
.source "HttpOperation.java"


# static fields
.field private static final DEFAULT_AUTH_RETRIES:I = 0x1

.field private static final DEFAULT_READER:Lco/vine/android/network/HttpOperationReader; = null

.field public static final DEFAULT_RETRIES:I = 0x0

.field private static final EMPTY_RESULTS:[Lco/vine/android/network/HttpResult; = null

.field public static final FORM_URLENCODED_HEADER:Ljava/lang/String; = "application/x-www-form-urlencoded"

.field private static final HEADER_DATE:Ljava/lang/String; = "Date"

.field public static final HIGH_PRIORITY_RETRIES:I = 0x1

.field public static final HTTP_MULTIPLE_REDIRECT:I = 0x12c

.field public static final HTTP_OK:I = 0xc8

#the value of this static final field might be set in the static constructor
.field private static final LOGGABLE:Z = false

.field private static final TAG:Ljava/lang/String; = "HttpOperation"

.field public static final USER_AGENT_STRING:Ljava/lang/String; = null

.field private static final X_RATELIMIT_LIMIT:Ljava/lang/String; = "X-RateLimit-Limit"

.field private static final X_RATELIMIT_REMAINING:Ljava/lang/String; = "X-RateLimit-Remaining"

.field private static final X_RATELIMIT_RESET:Ljava/lang/String; = "X-RateLimit-Reset"

.field public static final sTimeOffset:Ljava/util/concurrent/atomic/AtomicLong;


# instance fields
.field public exception:Ljava/lang/Exception;

.field private final mHttpClient:Lorg/apache/http/client/HttpClient;

.field private final mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

.field private final mReader:Lco/vine/android/network/HttpOperationReader;

.field private mResults:[Lco/vine/android/network/HttpResult;

.field public statusCode:I

.field public statusPhrase:Ljava/lang/String;

.field public uploadKey:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 65
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/network/HttpOperation;->USER_AGENT_STRING:Ljava/lang/String;

    .line 70
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "HttpOperation"

    const/4 v2, 0x3

    invoke-static {v0, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lco/vine/android/network/HttpOperation;->LOGGABLE:Z

    .line 83
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    const-wide/16 v2, 0x0

    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    sput-object v0, Lco/vine/android/network/HttpOperation;->sTimeOffset:Ljava/util/concurrent/atomic/AtomicLong;

    .line 90
    new-array v0, v1, [Lco/vine/android/network/HttpResult;

    sput-object v0, Lco/vine/android/network/HttpOperation;->EMPTY_RESULTS:[Lco/vine/android/network/HttpResult;

    .line 91
    new-instance v0, Lco/vine/android/network/DefaultHttpOperationReader;

    invoke-direct {v0}, Lco/vine/android/network/DefaultHttpOperationReader;-><init>()V

    sput-object v0, Lco/vine/android/network/HttpOperation;->DEFAULT_READER:Lco/vine/android/network/HttpOperationReader;

    return-void

    :cond_1
    move v0, v1

    .line 70
    goto :goto_0
.end method

.method public constructor <init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V
    .locals 2
    .parameter "client"
    .parameter "httpReq"
    .parameter "reader"
    .parameter "api"

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    const-string v0, "Accept-Encoding"

    const-string v1, "gzip"

    invoke-virtual {p2, v0, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    const-string v0, "User-Agent"

    sget-object v1, Lco/vine/android/network/HttpOperation;->USER_AGENT_STRING:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 117
    if-eqz p4, :cond_0

    .line 118
    invoke-virtual {p4, p2}, Lco/vine/android/client/VineAPI;->addClientHeaders(Lorg/apache/http/HttpRequest;)V

    .line 121
    :cond_0
    invoke-virtual {p1}, Lco/vine/android/network/HttpOperationClient;->getHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v0

    iput-object v0, p0, Lco/vine/android/network/HttpOperation;->mHttpClient:Lorg/apache/http/client/HttpClient;

    .line 122
    iput-object p2, p0, Lco/vine/android/network/HttpOperation;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    .line 123
    if-nez p3, :cond_1

    .line 124
    sget-object v0, Lco/vine/android/network/HttpOperation;->DEFAULT_READER:Lco/vine/android/network/HttpOperationReader;

    iput-object v0, p0, Lco/vine/android/network/HttpOperation;->mReader:Lco/vine/android/network/HttpOperationReader;

    .line 128
    :goto_0
    return-void

    .line 126
    :cond_1
    iput-object p3, p0, Lco/vine/android/network/HttpOperation;->mReader:Lco/vine/android/network/HttpOperationReader;

    goto :goto_0
.end method

.method public static createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;
    .locals 3
    .parameter "client"
    .parameter "url"
    .parameter "api"
    .parameter "reader"

    .prologue
    .line 506
    new-instance v0, Lorg/apache/http/client/methods/HttpDelete;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/http/client/methods/HttpDelete;-><init>(Ljava/lang/String;)V

    .line 507
    .local v0, delete:Lorg/apache/http/client/methods/HttpDelete;
    new-instance v1, Lco/vine/android/network/HttpOperation;

    invoke-direct {v1, p0, v0, p3, p2}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    .line 508
    .local v1, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p2, v1}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;)V

    .line 509
    return-object v1
.end method

.method public static createBasicAuthDeleteRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;
    .locals 3
    .parameter "client"
    .parameter "url"
    .parameter "api"
    .parameter "reader"
    .parameter "key"

    .prologue
    .line 515
    new-instance v0, Lorg/apache/http/client/methods/HttpDelete;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/http/client/methods/HttpDelete;-><init>(Ljava/lang/String;)V

    .line 516
    .local v0, delete:Lorg/apache/http/client/methods/HttpDelete;
    new-instance v1, Lco/vine/android/network/HttpOperation;

    invoke-direct {v1, p0, v0, p3, p2}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    .line 517
    .local v1, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p2, v1, p4}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;Ljava/lang/String;)V

    .line 518
    return-object v1
.end method

.method public static createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;
    .locals 3
    .parameter "client"
    .parameter "url"
    .parameter "api"
    .parameter "reader"

    .prologue
    .line 404
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 405
    .local v0, get:Lorg/apache/http/client/methods/HttpGet;
    new-instance v1, Lco/vine/android/network/HttpOperation;

    invoke-direct {v1, p0, v0, p3, p2}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    .line 406
    .local v1, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p2, v1}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;)V

    .line 407
    return-object v1
.end method

.method public static createBasicAuthGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;Ljava/lang/String;)Lco/vine/android/network/HttpOperation;
    .locals 3
    .parameter "client"
    .parameter "url"
    .parameter "api"
    .parameter "reader"
    .parameter "key"

    .prologue
    .line 413
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 414
    .local v0, get:Lorg/apache/http/client/methods/HttpGet;
    new-instance v1, Lco/vine/android/network/HttpOperation;

    invoke-direct {v1, p0, v0, p3, p2}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    .line 415
    .local v1, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p2, v1, p4}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;Ljava/lang/String;)V

    .line 416
    return-object v1
.end method

.method public static createBasicAuthJsonPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/HashMap;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;
    .locals 2
    .parameter "client"
    .parameter "url"
    .parameter "api"
    .parameter
    .parameter "reader"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/network/HttpOperationClient;",
            "Ljava/lang/StringBuilder;",
            "Lco/vine/android/client/VineAPI;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lco/vine/android/network/HttpOperationReader;",
            ")",
            "Lco/vine/android/network/HttpOperation;"
        }
    .end annotation

    .prologue
    .line 488
    .local p3, body:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-static {p0, p1, p3, p4, p2}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/CharSequence;Ljava/util/HashMap;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v0

    .line 489
    .local v0, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p2, v0}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;)V

    .line 490
    const-string v1, "application/json"

    invoke-virtual {p2, v0, v1}, Lco/vine/android/client/VineAPI;->addContentTypeHeader(Lco/vine/android/network/HttpOperation;Ljava/lang/String;)V

    .line 491
    return-object v0
.end method

.method public static varargs createBasicAuthPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;[Ljava/lang/String;)Lco/vine/android/network/HttpOperation;
    .locals 5
    .parameter "client"
    .parameter "url"
    .parameter "api"
    .parameter
    .parameter "reader"
    .parameter "headers"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/network/HttpOperationClient;",
            "Ljava/lang/StringBuilder;",
            "Lco/vine/android/client/VineAPI;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/message/BasicNameValuePair;",
            ">;",
            "Lco/vine/android/network/HttpOperationReader;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Lco/vine/android/network/HttpOperation;"
        }
    .end annotation

    .prologue
    .line 466
    .local p3, params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    invoke-static {p0, p1, p3, p4, p2}, Lco/vine/android/network/HttpOperation;->createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;

    move-result-object v4

    .line 467
    .local v4, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p2, v4}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;)V

    .line 468
    move-object v0, p5

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 469
    .local v1, header:Ljava/lang/String;
    invoke-virtual {p2, v4, v1}, Lco/vine/android/client/VineAPI;->addContentTypeHeader(Lco/vine/android/network/HttpOperation;Ljava/lang/String;)V

    .line 468
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 471
    .end local v1           #header:Ljava/lang/String;
    :cond_0
    return-object v4
.end method

.method public static createBasicAuthPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;
    .locals 5
    .parameter "client"
    .parameter "url"
    .parameter "api"
    .parameter
    .parameter "reader"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/network/HttpOperationClient;",
            "Ljava/lang/StringBuilder;",
            "Lco/vine/android/client/VineAPI;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/message/BasicNameValuePair;",
            ">;",
            "Lco/vine/android/network/HttpOperationReader;",
            ")",
            "Lco/vine/android/network/HttpOperation;"
        }
    .end annotation

    .prologue
    .line 433
    .local p3, params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v3, Lorg/apache/http/client/methods/HttpPut;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 436
    .local v3, put:Lorg/apache/http/client/methods/HttpPut;
    if-eqz p3, :cond_0

    .line 438
    :try_start_0
    new-instance v1, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v4, "UTF-8"

    invoke-direct {v1, p3, v4}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 439
    .local v1, entity:Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    invoke-virtual {v3, v1}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 445
    .end local v1           #entity:Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :cond_0
    :goto_0
    new-instance v2, Lco/vine/android/network/HttpOperation;

    invoke-direct {v2, p0, v3, p4, p2}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    .line 446
    .local v2, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p2, v2}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;)V

    .line 447
    return-object v2

    .line 440
    .end local v2           #op:Lco/vine/android/network/HttpOperation;
    :catch_0
    move-exception v0

    .line 441
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static createGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;
    .locals 2
    .parameter "client"
    .parameter "url"
    .parameter "reader"
    .parameter "api"

    .prologue
    .line 532
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 533
    .local v0, get:Lorg/apache/http/client/methods/HttpGet;
    new-instance v1, Lco/vine/android/network/HttpOperation;

    invoke-direct {v1, p0, v0, p2, p3}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    return-object v1
.end method

.method public static createMediaPutRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/network/HttpOperationReader;Lorg/apache/http/HttpEntity;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;
    .locals 3
    .parameter "client"
    .parameter "url"
    .parameter "reader"
    .parameter "entity"
    .parameter "api"

    .prologue
    .line 549
    new-instance v1, Lorg/apache/http/client/methods/HttpPut;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 550
    .local v1, put:Lorg/apache/http/client/methods/HttpPut;
    if-eqz p3, :cond_0

    .line 551
    invoke-virtual {v1, p3}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 553
    :cond_0
    new-instance v0, Lco/vine/android/network/HttpOperation;

    invoke-direct {v0, p0, v1, p2, p4}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    .line 554
    .local v0, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p4, v0}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;)V

    .line 555
    return-object v0
.end method

.method private static createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/CharSequence;Ljava/util/HashMap;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;
    .locals 7
    .parameter "client"
    .parameter "url"
    .parameter
    .parameter "reader"
    .parameter "api"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/network/HttpOperationClient;",
            "Ljava/lang/CharSequence;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lco/vine/android/network/HttpOperationReader;",
            "Lco/vine/android/client/VineAPI;",
            ")",
            "Lco/vine/android/network/HttpOperation;"
        }
    .end annotation

    .prologue
    .line 595
    .local p2, body:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    new-instance v4, Lorg/apache/http/client/methods/HttpPost;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 598
    .local v4, post:Lorg/apache/http/client/methods/HttpPost;
    if-eqz p2, :cond_0

    .line 600
    :try_start_0
    new-instance v3, Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;

    invoke-direct {v3}, Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;-><init>()V

    .line 601
    .local v3, mapper:Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;
    invoke-virtual {v3, p2}, Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;->valueToTree(Ljava/lang/Object;)Lcom/flurry/org/codehaus/jackson/JsonNode;

    move-result-object v2

    .line 602
    .local v2, jsonBody:Lcom/flurry/org/codehaus/jackson/JsonNode;
    new-instance v1, Lorg/apache/http/entity/StringEntity;

    invoke-virtual {v3, v2}, Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;->writeValueAsString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v1, v5, v6}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 603
    .local v1, entity:Lorg/apache/http/entity/StringEntity;
    const-string v5, "application/json"

    invoke-virtual {v1, v5}, Lorg/apache/http/entity/StringEntity;->setContentType(Ljava/lang/String;)V

    .line 604
    const-string v5, "UTF-8"

    invoke-virtual {v1, v5}, Lorg/apache/http/entity/StringEntity;->setContentEncoding(Ljava/lang/String;)V

    .line 605
    invoke-virtual {v4, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 611
    .end local v1           #entity:Lorg/apache/http/entity/StringEntity;
    .end local v2           #jsonBody:Lcom/flurry/org/codehaus/jackson/JsonNode;
    .end local v3           #mapper:Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;
    :cond_0
    :goto_0
    new-instance v5, Lco/vine/android/network/HttpOperation;

    invoke-direct {v5, p0, v4, p3, p4}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    return-object v5

    .line 606
    :catch_0
    move-exception v0

    .line 607
    .local v0, e:Ljava/io/IOException;
    const-string v5, "Failed to create Post Request."

    invoke-static {v5, v0}, Lcom/edisonwang/android/slog/SLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static createPostRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Ljava/util/ArrayList;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)Lco/vine/android/network/HttpOperation;
    .locals 4
    .parameter "client"
    .parameter "url"
    .parameter
    .parameter "reader"
    .parameter "api"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lco/vine/android/network/HttpOperationClient;",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/message/BasicNameValuePair;",
            ">;",
            "Lco/vine/android/network/HttpOperationReader;",
            "Lco/vine/android/client/VineAPI;",
            ")",
            "Lco/vine/android/network/HttpOperation;"
        }
    .end annotation

    .prologue
    .line 569
    .local p2, params:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lorg/apache/http/message/BasicNameValuePair;>;"
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 572
    .local v2, post:Lorg/apache/http/client/methods/HttpPost;
    if-eqz p2, :cond_0

    .line 574
    :try_start_0
    new-instance v1, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v3, "UTF-8"

    invoke-direct {v1, p2, v3}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 575
    .local v1, entity:Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    invoke-virtual {v2, v1}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 581
    .end local v1           #entity:Lorg/apache/http/client/entity/UrlEncodedFormEntity;
    :cond_0
    :goto_0
    new-instance v3, Lco/vine/android/network/HttpOperation;

    invoke-direct {v3, p0, v2, p3, p4}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    return-object v3

    .line 576
    :catch_0
    move-exception v0

    .line 577
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method public static createResourceGetRequest(Lco/vine/android/network/HttpOperationClient;Ljava/lang/StringBuilder;Lco/vine/android/client/VineAPI;Lco/vine/android/network/HttpOperationReader;)Lco/vine/android/network/HttpOperation;
    .locals 4
    .parameter "client"
    .parameter "url"
    .parameter "api"
    .parameter "reader"

    .prologue
    .line 538
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 539
    .local v0, get:Lorg/apache/http/client/methods/HttpGet;
    new-instance v1, Lco/vine/android/network/HttpOperation;

    invoke-direct {v1, p0, v0, p3, p2}, Lco/vine/android/network/HttpOperation;-><init>(Lco/vine/android/network/HttpOperationClient;Lorg/apache/http/client/methods/HttpRequestBase;Lco/vine/android/network/HttpOperationReader;Lco/vine/android/client/VineAPI;)V

    .line 540
    .local v1, op:Lco/vine/android/network/HttpOperation;
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "https"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 541
    invoke-virtual {p2, v1}, Lco/vine/android/client/VineAPI;->addSessionKeyAuthHeader(Lco/vine/android/network/HttpOperation;)V

    .line 543
    :cond_0
    return-object v1
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lco/vine/android/network/HttpOperation;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    invoke-virtual {v0}, Lorg/apache/http/client/methods/HttpRequestBase;->abort()V

    .line 136
    return-void
.end method

.method public execute()Lco/vine/android/network/HttpOperation;
    .locals 1

    .prologue
    .line 144
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lco/vine/android/network/HttpOperation;->execute(I)Lco/vine/android/network/HttpOperation;

    move-result-object v0

    return-object v0
.end method

.method public final execute(I)Lco/vine/android/network/HttpOperation;
    .locals 50
    .parameter "retries"

    .prologue
    .line 158
    const/4 v10, 0x1

    .line 161
    .local v10, authRetry:I
    const/16 v22, 0x0

    .line 162
    .local v22, e:Ljava/lang/Exception;
    const/16 v45, 0x0

    .line 168
    .local v45, uploadKey:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lco/vine/android/network/HttpOperation;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    move-object/from16 v27, v0

    .line 169
    .local v27, httpReq:Lorg/apache/http/client/methods/HttpRequestBase;
    new-instance v40, Ljava/util/ArrayList;

    const/4 v3, 0x0

    move/from16 v0, p1

    invoke-static {v0, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v40

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 172
    .local v40, results:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/network/HttpResult;>;"
    const-wide/16 v5, -0x1

    .line 175
    .local v5, firstByte:J
    :cond_0
    const-wide/16 v35, 0x0

    .line 176
    .local v35, readTime:J
    const-wide/16 v33, 0x0

    .line 177
    .local v33, openTime:J
    const-wide/16 v13, 0x0

    .line 178
    .local v13, closeTime:J
    sget-object v3, Lco/vine/android/network/HttpOperation;->sTimeOffset:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v18

    .line 181
    .local v18, currentTimeOffset:J
    move-object/from16 v0, p0

    move-wide/from16 v1, v18

    invoke-virtual {v0, v1, v2}, Lco/vine/android/network/HttpOperation;->prepareRequest(J)V

    .line 183
    sget-boolean v3, Lco/vine/android/network/HttpOperation;->LOGGABLE:Z

    if-eqz v3, :cond_1

    .line 184
    const-string v3, "HttpOperation"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpRequestBase;->getMethod()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, " "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 188
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    .line 192
    .local v11, before:J
    :try_start_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/network/HttpOperation;->mHttpClient:Lorg/apache/http/client/HttpClient;

    move-object/from16 v0, v27

    invoke-interface {v3, v0}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v38

    .line 193
    .local v38, resp:Lorg/apache/http/HttpResponse;
    invoke-interface/range {v38 .. v38}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v42

    .line 194
    .local v42, statusLine:Lorg/apache/http/StatusLine;
    invoke-interface/range {v42 .. v42}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v41

    .line 196
    .local v41, statusCode:I
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long v5, v3, v11

    .line 198
    invoke-interface/range {v42 .. v42}, Lorg/apache/http/StatusLine;->getReasonPhrase()Ljava/lang/String;

    move-result-object v37

    .line 200
    .local v37, reasonPhrase:Ljava/lang/String;
    sget-boolean v3, Lco/vine/android/network/HttpOperation;->LOGGABLE:Z

    if-eqz v3, :cond_2

    .line 201
    const-string v3, "HttpOperation"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v41

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, "/"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v37

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, " ["

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, "]"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    :cond_2
    sparse-switch v41, :sswitch_data_0

    .line 239
    const/16 p1, 0x0

    .line 243
    :cond_3
    :goto_0
    :sswitch_0
    invoke-interface/range {v38 .. v38}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v23

    .line 244
    .local v23, entity:Lorg/apache/http/HttpEntity;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long v33, v3, v11

    .line 246
    if-eqz v23, :cond_6

    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 248
    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v3

    if-eqz v3, :cond_c

    .line 249
    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpEntity;->getContentEncoding()Lorg/apache/http/Header;

    move-result-object v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v15

    .line 253
    .local v15, contentEncoding:Ljava/lang/String;
    :goto_1
    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v24

    .line 255
    .local v24, entityContentType:Lorg/apache/http/Header;
    if-eqz v24, :cond_d

    .line 256
    invoke-interface/range {v24 .. v24}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v17

    .line 260
    .local v17, contentType:Ljava/lang/String;
    :goto_2
    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v3

    long-to-int v0, v3

    move/from16 v16, v0

    .line 261
    .local v16, contentLength:I
    sget-boolean v3, Lco/vine/android/network/HttpOperation;->LOGGABLE:Z

    if-eqz v3, :cond_4

    .line 262
    const-string v3, "HttpOperation"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "read: Encoding: "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, ", type: "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, ", length: "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 265
    :cond_4
    const/16 v28, 0x0

    .line 267
    .local v28, in:Ljava/io/InputStream;
    :try_start_1
    new-instance v30, Lco/vine/android/util/MeasureInputStream;

    invoke-interface/range {v23 .. v23}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v3

    move-object/from16 v0, v30

    invoke-direct {v0, v3}, Lco/vine/android/util/MeasureInputStream;-><init>(Ljava/io/InputStream;)V

    .line 269
    .local v30, measuredIn:Lco/vine/android/util/MeasureInputStream;
    move-object/from16 v28, v30

    .line 270
    if-nez v17, :cond_e

    .line 295
    :cond_5
    :goto_3
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/network/HttpOperation;->mReader:Lco/vine/android/network/HttpOperationReader;

    move/from16 v0, v41

    move/from16 v1, v16

    move-object/from16 v2, v28

    invoke-interface {v3, v0, v1, v2}, Lco/vine/android/network/HttpOperationReader;->readInput(IILjava/io/InputStream;)V

    .line 296
    invoke-virtual/range {v30 .. v30}, Lco/vine/android/util/MeasureInputStream;->getReadTime()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v35

    .line 298
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v31

    .line 299
    .local v31, now:J
    invoke-static/range {v28 .. v28}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 300
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result-wide v3

    sub-long v13, v3, v31

    .line 314
    .end local v15           #contentEncoding:Ljava/lang/String;
    .end local v16           #contentLength:I
    .end local v17           #contentType:Ljava/lang/String;
    .end local v24           #entityContentType:Lorg/apache/http/Header;
    .end local v28           #in:Ljava/io/InputStream;
    .end local v30           #measuredIn:Lco/vine/android/util/MeasureInputStream;
    .end local v31           #now:J
    :cond_6
    add-long v3, v33, v35

    add-long v7, v3, v13

    .line 315
    .local v7, durationMs:J
    const-wide/16 v3, -0x1

    cmp-long v3, v5, v3

    if-eqz v3, :cond_8

    sget-boolean v3, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-nez v3, :cond_7

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    const-wide v47, 0x3fb999999999999aL

    cmpl-double v3, v3, v47

    if-lez v3, :cond_8

    .line 316
    :cond_7
    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v46

    .line 317
    .local v46, uri:Ljava/net/URI;
    const-string v3, "{}, {} took {} ms to open and {} total."

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v47

    aput-object v47, v4, v9

    const/4 v9, 0x1

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v47

    aput-object v47, v4, v9

    const/4 v9, 0x2

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v4, v9

    const/4 v9, 0x3

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v4, v9

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 318
    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v47, "/r/videos/"

    move-object/from16 v0, v47

    invoke-virtual {v9, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    invoke-static/range {v3 .. v9}, Lco/vine/android/util/FlurryUtils;->trackRespondTime(Ljava/lang/String;Ljava/lang/String;JJZ)V

    .line 324
    .end local v46           #uri:Ljava/net/URI;
    :cond_8
    new-instance v39, Lco/vine/android/network/HttpResult;

    move-object/from16 v0, v39

    move/from16 v1, v41

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v2}, Lco/vine/android/network/HttpResult;-><init>(ILjava/lang/String;)V

    .line 325
    .local v39, result:Lco/vine/android/network/HttpResult;
    move-object/from16 v0, v22

    move-object/from16 v1, v39

    iput-object v0, v1, Lco/vine/android/network/HttpResult;->exception:Ljava/lang/Exception;

    .line 326
    move-object/from16 v0, v39

    iput-wide v7, v0, Lco/vine/android/network/HttpResult;->durationMs:J

    .line 327
    move-object/from16 v0, v45

    move-object/from16 v1, v39

    iput-object v0, v1, Lco/vine/android/network/HttpResult;->uploadKey:Ljava/lang/String;

    .line 328
    const/16 v3, 0xc8

    move/from16 v0, v41

    if-eq v0, v3, :cond_9

    .line 329
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/network/HttpOperation;->mReader:Lco/vine/android/network/HttpOperationReader;

    move-object/from16 v0, v39

    invoke-interface {v3, v0}, Lco/vine/android/network/HttpOperationReader;->onHandleError(Lco/vine/android/network/HttpResult;)V

    .line 331
    :cond_9
    move-object/from16 v0, v40

    move-object/from16 v1, v39

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 333
    add-int/lit8 p1, p1, -0x1

    .line 334
    if-gez p1, :cond_0

    .line 336
    .end local v23           #entity:Lorg/apache/http/HttpEntity;
    .end local v38           #resp:Lorg/apache/http/HttpResponse;
    .end local v39           #result:Lco/vine/android/network/HttpResult;
    .end local v42           #statusLine:Lorg/apache/http/StatusLine;
    :cond_a
    :goto_4
    move/from16 v0, v41

    move-object/from16 v1, p0

    iput v0, v1, Lco/vine/android/network/HttpOperation;->statusCode:I

    .line 337
    move-object/from16 v0, v37

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/network/HttpOperation;->statusPhrase:Ljava/lang/String;

    .line 338
    move-object/from16 v0, v22

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/network/HttpOperation;->exception:Ljava/lang/Exception;

    .line 339
    move-object/from16 v0, v45

    move-object/from16 v1, p0

    iput-object v0, v1, Lco/vine/android/network/HttpOperation;->uploadKey:Ljava/lang/String;

    .line 341
    invoke-virtual/range {v40 .. v40}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-array v3, v3, [Lco/vine/android/network/HttpResult;

    move-object/from16 v0, p0

    iput-object v3, v0, Lco/vine/android/network/HttpOperation;->mResults:[Lco/vine/android/network/HttpResult;

    .line 342
    move-object/from16 v0, p0

    iget-object v3, v0, Lco/vine/android/network/HttpOperation;->mResults:[Lco/vine/android/network/HttpResult;

    move-object/from16 v0, v40

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 344
    return-object p0

    .line 208
    .end local v7           #durationMs:J
    .restart local v38       #resp:Lorg/apache/http/HttpResponse;
    .restart local v42       #statusLine:Lorg/apache/http/StatusLine;
    :sswitch_1
    :try_start_3
    const-string v3, "X-Upload-Key"

    move-object/from16 v0, v38

    invoke-interface {v0, v3}, Lorg/apache/http/HttpResponse;->getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header;

    move-result-object v26

    .line 209
    .local v26, headers:[Lorg/apache/http/Header;
    if-eqz v26, :cond_3

    move-object/from16 v0, v26

    array-length v3, v0

    if-lez v3, :cond_3

    .line 210
    const/4 v3, 0x0

    aget-object v3, v26, v3

    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v45

    goto/16 :goto_0

    .line 215
    .end local v26           #headers:[Lorg/apache/http/Header;
    :sswitch_2
    const-string v3, "Date"

    move-object/from16 v0, v38

    invoke-interface {v0, v3}, Lorg/apache/http/HttpResponse;->getLastHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v21

    .line 216
    .local v21, dateHeader:Lorg/apache/http/Header;
    if-eqz v21, :cond_b

    .line 217
    sget-object v3, Lco/vine/android/util/Util;->DATE_TIME_RFC1123:Ljava/text/SimpleDateFormat;

    invoke-interface/range {v21 .. v21}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v20

    .line 218
    .local v20, d:Ljava/util/Date;
    invoke-virtual/range {v20 .. v20}, Ljava/util/Date;->getTime()J

    move-result-wide v43

    .line 219
    .local v43, ts:J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v31

    .line 220
    .restart local v31       #now:J
    sget-object v3, Lco/vine/android/network/HttpOperation;->sTimeOffset:Ljava/util/concurrent/atomic/AtomicLong;

    sub-long v47, v43, v31

    move-wide/from16 v0, v47

    invoke-virtual {v3, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 222
    .end local v20           #d:Ljava/util/Date;
    .end local v31           #now:J
    .end local v43           #ts:J
    :cond_b
    if-lez v10, :cond_3

    .line 223
    add-int/lit8 v10, v10, -0x1

    .line 224
    add-int/lit8 p1, p1, 0x1

    goto/16 :goto_0

    .line 251
    .end local v21           #dateHeader:Lorg/apache/http/Header;
    .restart local v23       #entity:Lorg/apache/http/HttpEntity;
    :cond_c
    const/4 v15, 0x0

    .restart local v15       #contentEncoding:Ljava/lang/String;
    goto/16 :goto_1

    .line 258
    .restart local v24       #entityContentType:Lorg/apache/http/Header;
    :cond_d
    const/16 v17, 0x0

    .restart local v17       #contentType:Ljava/lang/String;
    goto/16 :goto_2

    .line 273
    .restart local v16       #contentLength:I
    .restart local v28       #in:Ljava/io/InputStream;
    .restart local v30       #measuredIn:Lco/vine/android/util/MeasureInputStream;
    :cond_e
    :try_start_4
    const-string v3, "application/octet-stream"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "video/mp4"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    const-string v3, "binary/octet-stream"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 277
    const-string v3, "application/json"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 278
    if-eqz v15, :cond_5

    const-string v3, "gzip"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 279
    new-instance v29, Ljava/util/zip/GZIPInputStream;

    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 280
    .end local v28           #in:Ljava/io/InputStream;
    .local v29, in:Ljava/io/InputStream;
    const/16 v16, -0x1

    move-object/from16 v28, v29

    .end local v29           #in:Ljava/io/InputStream;
    .restart local v28       #in:Ljava/io/InputStream;
    goto/16 :goto_3

    .line 282
    :cond_f
    const-string v3, "text/html"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_10

    const-string v3, "text/plain"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_10

    const-string v3, "text/xml"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_10

    const-string v3, "application/xml"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_10

    const-string v3, "image/"

    move-object/from16 v0, v17

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 288
    :cond_10
    if-eqz v15, :cond_5

    const-string v3, "gzip"

    invoke-virtual {v15, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 289
    new-instance v29, Ljava/util/zip/GZIPInputStream;

    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    .line 290
    .end local v28           #in:Ljava/io/InputStream;
    .restart local v29       #in:Ljava/io/InputStream;
    const/16 v16, -0x1

    move-object/from16 v28, v29

    .end local v29           #in:Ljava/io/InputStream;
    .restart local v28       #in:Ljava/io/InputStream;
    goto/16 :goto_3

    .line 293
    :cond_11
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Unsupported content type: "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 298
    .end local v30           #measuredIn:Lco/vine/android/util/MeasureInputStream;
    :catchall_0
    move-exception v3

    :try_start_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v31

    .line 299
    .restart local v31       #now:J
    invoke-static/range {v28 .. v28}, Lco/vine/android/util/Util;->closeSilently(Ljava/io/Closeable;)V

    .line 300
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v47

    sub-long v13, v47, v31

    .line 301
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 303
    .end local v15           #contentEncoding:Ljava/lang/String;
    .end local v16           #contentLength:I
    .end local v17           #contentType:Ljava/lang/String;
    .end local v23           #entity:Lorg/apache/http/HttpEntity;
    .end local v24           #entityContentType:Lorg/apache/http/Header;
    .end local v28           #in:Ljava/io/InputStream;
    .end local v31           #now:J
    .end local v37           #reasonPhrase:Ljava/lang/String;
    .end local v38           #resp:Lorg/apache/http/HttpResponse;
    .end local v41           #statusCode:I
    .end local v42           #statusLine:Lorg/apache/http/StatusLine;
    :catch_0
    move-exception v25

    .line 304
    .local v25, ex:Ljava/lang/Exception;
    :try_start_6
    sget-boolean v3, Lco/vine/android/network/HttpOperation;->LOGGABLE:Z

    if-eqz v3, :cond_12

    .line 305
    const-string v3, "HttpOperation"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "["

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v9, "]"

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-static {v3, v4, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 307
    :cond_12
    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpRequestBase;->abort()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 308
    const/16 v41, 0x0

    .line 309
    .restart local v41       #statusCode:I
    const/16 v37, 0x0

    .line 310
    .restart local v37       #reasonPhrase:Ljava/lang/String;
    move-object/from16 v22, v25

    .line 311
    const-wide/16 v5, -0x1

    .line 314
    add-long v3, v33, v35

    add-long v7, v3, v13

    .line 315
    .restart local v7       #durationMs:J
    const-wide/16 v3, -0x1

    cmp-long v3, v5, v3

    if-eqz v3, :cond_a

    sget-boolean v3, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-nez v3, :cond_13

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    const-wide v47, 0x3fb999999999999aL

    cmpl-double v3, v3, v47

    if-lez v3, :cond_a

    .line 316
    :cond_13
    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v46

    .line 317
    .restart local v46       #uri:Ljava/net/URI;
    const-string v3, "{}, {} took {} ms to open and {} total."

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v47

    aput-object v47, v4, v9

    const/4 v9, 0x1

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v47

    aput-object v47, v4, v9

    const/4 v9, 0x2

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v4, v9

    const/4 v9, 0x3

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v47

    aput-object v47, v4, v9

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 318
    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v47, "/r/videos/"

    move-object/from16 v0, v47

    invoke-virtual {v9, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    invoke-static/range {v3 .. v9}, Lco/vine/android/util/FlurryUtils;->trackRespondTime(Ljava/lang/String;Ljava/lang/String;JJZ)V

    goto/16 :goto_4

    .line 314
    .end local v7           #durationMs:J
    .end local v25           #ex:Ljava/lang/Exception;
    .end local v37           #reasonPhrase:Ljava/lang/String;
    .end local v41           #statusCode:I
    .end local v46           #uri:Ljava/net/URI;
    :catchall_1
    move-exception v3

    move-object/from16 v47, v3

    add-long v3, v33, v35

    add-long v7, v3, v13

    .line 315
    .restart local v7       #durationMs:J
    const-wide/16 v3, -0x1

    cmp-long v3, v5, v3

    if-eqz v3, :cond_15

    sget-boolean v3, Lcom/edisonwang/android/slog/SLog;->sLogsOn:Z

    if-nez v3, :cond_14

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v3

    const-wide v48, 0x3fb999999999999aL

    cmpl-double v3, v3, v48

    if-lez v3, :cond_15

    .line 316
    :cond_14
    invoke-virtual/range {v27 .. v27}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v46

    .line 317
    .restart local v46       #uri:Ljava/net/URI;
    const-string v3, "{}, {} took {} ms to open and {} total."

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v4, v9

    const/4 v9, 0x1

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v48

    aput-object v48, v4, v9

    const/4 v9, 0x2

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v48

    aput-object v48, v4, v9

    const/4 v9, 0x3

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v48

    aput-object v48, v4, v9

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 318
    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v9

    const-string v48, "/r/videos/"

    move-object/from16 v0, v48

    invoke-virtual {v9, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    invoke-static/range {v3 .. v9}, Lco/vine/android/util/FlurryUtils;->trackRespondTime(Ljava/lang/String;Ljava/lang/String;JJZ)V

    .line 319
    .end local v46           #uri:Ljava/net/URI;
    :cond_15
    throw v47

    .line 206
    :sswitch_data_0
    .sparse-switch
        0xc8 -> :sswitch_1
        0x191 -> :sswitch_2
        0x1f4 -> :sswitch_0
        0x1f6 -> :sswitch_0
        0x1f7 -> :sswitch_0
    .end sparse-switch
.end method

.method public getHttpRequest()Lorg/apache/http/client/methods/HttpRequestBase;
    .locals 1

    .prologue
    .line 389
    iget-object v0, p0, Lco/vine/android/network/HttpOperation;->mHttpRequest:Lorg/apache/http/client/methods/HttpRequestBase;

    return-object v0
.end method

.method public getReader()Lco/vine/android/network/HttpOperationReader;
    .locals 1

    .prologue
    .line 148
    iget-object v0, p0, Lco/vine/android/network/HttpOperation;->mReader:Lco/vine/android/network/HttpOperationReader;

    return-object v0
.end method

.method public getResults()[Lco/vine/android/network/HttpResult;
    .locals 1

    .prologue
    .line 381
    iget-object v0, p0, Lco/vine/android/network/HttpOperation;->mResults:[Lco/vine/android/network/HttpResult;

    if-nez v0, :cond_0

    .line 382
    sget-object v0, Lco/vine/android/network/HttpOperation;->EMPTY_RESULTS:[Lco/vine/android/network/HttpResult;

    .line 384
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lco/vine/android/network/HttpOperation;->mResults:[Lco/vine/android/network/HttpResult;

    goto :goto_0
.end method

.method public isOK()Z
    .locals 2

    .prologue
    .line 363
    iget v0, p0, Lco/vine/android/network/HttpOperation;->statusCode:I

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isSuccessful()Z
    .locals 2

    .prologue
    .line 372
    iget v0, p0, Lco/vine/android/network/HttpOperation;->statusCode:I

    const/16 v1, 0xc8

    if-lt v0, v1, :cond_0

    iget v0, p0, Lco/vine/android/network/HttpOperation;->statusCode:I

    const/16 v1, 0x12c

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected prepareRequest(J)V
    .locals 0
    .parameter "timeOffset"

    .prologue
    .line 355
    return-void
.end method
