.class public abstract Ltwitter4j/internal/http/HttpResponse;
.super Ljava/lang/Object;
.source "HttpResponse.java"


# static fields
.field private static LOGGABLE:Z = false

.field private static final TAG:Ljava/lang/String; = "T4JHttpResposne"


# instance fields
.field protected final CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

.field protected is:Ljava/io/InputStream;

.field private json:Ltwitter4j/internal/org/json/JSONObject;

.field private jsonArray:Ltwitter4j/internal/org/json/JSONArray;

.field protected responseAsString:Ljava/lang/String;

.field protected statusCode:I

.field private streamConsumed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 45
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v0

    sput-boolean v0, Ltwitter4j/internal/http/HttpResponse;->LOGGABLE:Z

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object v1, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Ltwitter4j/internal/http/HttpResponse;->streamConsumed:Z

    .line 137
    iput-object v1, p0, Ltwitter4j/internal/http/HttpResponse;->json:Ltwitter4j/internal/org/json/JSONObject;

    .line 185
    iput-object v1, p0, Ltwitter4j/internal/http/HttpResponse;->jsonArray:Ltwitter4j/internal/org/json/JSONArray;

    .line 50
    invoke-static {}, Ltwitter4j/conf/ConfigurationContext;->getInstance()Ltwitter4j/conf/Configuration;

    move-result-object v0

    iput-object v0, p0, Ltwitter4j/internal/http/HttpResponse;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    .line 51
    return-void
.end method

.method public constructor <init>(Ltwitter4j/internal/http/HttpClientConfiguration;)V
    .locals 2
    .parameter "conf"

    .prologue
    const/4 v1, 0x0

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object v1, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    .line 60
    const/4 v0, 0x0

    iput-boolean v0, p0, Ltwitter4j/internal/http/HttpResponse;->streamConsumed:Z

    .line 137
    iput-object v1, p0, Ltwitter4j/internal/http/HttpResponse;->json:Ltwitter4j/internal/org/json/JSONObject;

    .line 185
    iput-object v1, p0, Ltwitter4j/internal/http/HttpResponse;->jsonArray:Ltwitter4j/internal/org/json/JSONArray;

    .line 54
    iput-object p1, p0, Ltwitter4j/internal/http/HttpResponse;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    .line 55
    return-void
.end method

.method private disconnectForcibly()V
    .locals 1

    .prologue
    .line 243
    :try_start_0
    invoke-virtual {p0}, Ltwitter4j/internal/http/HttpResponse;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 246
    :goto_0
    return-void

    .line 244
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public asJSONArray()Ltwitter4j/internal/org/json/JSONArray;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 195
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->jsonArray:Ltwitter4j/internal/org/json/JSONArray;

    if-nez v2, :cond_2

    .line 196
    const/4 v1, 0x0

    .line 198
    .local v1, reader:Ljava/io/Reader;
    :try_start_0
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 199
    invoke-virtual {p0}, Ltwitter4j/internal/http/HttpResponse;->asReader()Ljava/io/Reader;

    move-result-object v1

    .line 200
    new-instance v2, Ltwitter4j/internal/org/json/JSONArray;

    new-instance v3, Ltwitter4j/internal/org/json/JSONTokener;

    invoke-direct {v3, v1}, Ltwitter4j/internal/org/json/JSONTokener;-><init>(Ljava/io/Reader;)V

    invoke-direct {v2, v3}, Ltwitter4j/internal/org/json/JSONArray;-><init>(Ltwitter4j/internal/org/json/JSONTokener;)V

    iput-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->jsonArray:Ltwitter4j/internal/org/json/JSONArray;

    .line 204
    :goto_0
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v2}, Ltwitter4j/internal/http/HttpClientConfiguration;->isPrettyDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 205
    sget-boolean v2, Ltwitter4j/internal/http/HttpResponse;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 206
    const-string v2, "T4JHttpResposne"

    iget-object v3, p0, Ltwitter4j/internal/http/HttpResponse;->jsonArray:Ltwitter4j/internal/org/json/JSONArray;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ltwitter4j/internal/org/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ltwitter4j/internal/org/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    :cond_0
    :goto_1
    if-eqz v1, :cond_1

    .line 223
    :try_start_1
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 227
    :cond_1
    :goto_2
    invoke-direct {p0}, Ltwitter4j/internal/http/HttpResponse;->disconnectForcibly()V

    .line 230
    .end local v1           #reader:Ljava/io/Reader;
    :cond_2
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->jsonArray:Ltwitter4j/internal/org/json/JSONArray;

    return-object v2

    .line 202
    .restart local v1       #reader:Ljava/io/Reader;
    :cond_3
    :try_start_2
    new-instance v2, Ltwitter4j/internal/org/json/JSONArray;

    iget-object v3, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    invoke-direct {v2, v3}, Ltwitter4j/internal/org/json/JSONArray;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->jsonArray:Ltwitter4j/internal/org/json/JSONArray;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ltwitter4j/internal/org/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 214
    :catch_0
    move-exception v0

    .line 215
    .local v0, jsone:Ltwitter4j/internal/org/json/JSONException;
    :try_start_3
    sget-boolean v2, Ltwitter4j/internal/http/HttpResponse;->LOGGABLE:Z

    if-eqz v2, :cond_7

    .line 216
    new-instance v2, Ltwitter4j/TwitterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ltwitter4j/internal/org/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ltwitter4j/TwitterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 221
    .end local v0           #jsone:Ltwitter4j/internal/org/json/JSONException;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_4

    .line 223
    :try_start_4
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 227
    :cond_4
    :goto_3
    invoke-direct {p0}, Ltwitter4j/internal/http/HttpResponse;->disconnectForcibly()V

    throw v2

    .line 209
    :cond_5
    :try_start_5
    sget-boolean v2, Ltwitter4j/internal/http/HttpResponse;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 210
    const-string v3, "T4JHttpResposne"

    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    :goto_4
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_6
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->jsonArray:Ltwitter4j/internal/org/json/JSONArray;

    invoke-virtual {v2}, Ltwitter4j/internal/org/json/JSONArray;->toString()Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ltwitter4j/internal/org/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v2

    goto :goto_4

    .line 218
    .restart local v0       #jsone:Ltwitter4j/internal/org/json/JSONException;
    :cond_7
    :try_start_6
    new-instance v2, Ltwitter4j/TwitterException;

    invoke-virtual {v0}, Ltwitter4j/internal/org/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ltwitter4j/TwitterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 224
    .end local v0           #jsone:Ltwitter4j/internal/org/json/JSONException;
    :catch_1
    move-exception v2

    goto :goto_2

    :catch_2
    move-exception v3

    goto :goto_3
.end method

.method public asJSONObject()Ltwitter4j/internal/org/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 147
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->json:Ltwitter4j/internal/org/json/JSONObject;

    if-nez v2, :cond_2

    .line 148
    const/4 v1, 0x0

    .line 150
    .local v1, reader:Ljava/io/Reader;
    :try_start_0
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 151
    invoke-virtual {p0}, Ltwitter4j/internal/http/HttpResponse;->asReader()Ljava/io/Reader;

    move-result-object v1

    .line 152
    new-instance v2, Ltwitter4j/internal/org/json/JSONObject;

    new-instance v3, Ltwitter4j/internal/org/json/JSONTokener;

    invoke-direct {v3, v1}, Ltwitter4j/internal/org/json/JSONTokener;-><init>(Ljava/io/Reader;)V

    invoke-direct {v2, v3}, Ltwitter4j/internal/org/json/JSONObject;-><init>(Ltwitter4j/internal/org/json/JSONTokener;)V

    iput-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->json:Ltwitter4j/internal/org/json/JSONObject;

    .line 156
    :goto_0
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->CONF:Ltwitter4j/internal/http/HttpClientConfiguration;

    invoke-interface {v2}, Ltwitter4j/internal/http/HttpClientConfiguration;->isPrettyDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 157
    sget-boolean v2, Ltwitter4j/internal/http/HttpResponse;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 158
    const-string v2, "T4JHttpResposne"

    iget-object v3, p0, Ltwitter4j/internal/http/HttpResponse;->json:Ltwitter4j/internal/org/json/JSONObject;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ltwitter4j/internal/org/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ltwitter4j/internal/org/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 173
    :cond_0
    :goto_1
    if-eqz v1, :cond_1

    .line 175
    :try_start_1
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 179
    :cond_1
    :goto_2
    invoke-direct {p0}, Ltwitter4j/internal/http/HttpResponse;->disconnectForcibly()V

    .line 182
    .end local v1           #reader:Ljava/io/Reader;
    :cond_2
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->json:Ltwitter4j/internal/org/json/JSONObject;

    return-object v2

    .line 154
    .restart local v1       #reader:Ljava/io/Reader;
    :cond_3
    :try_start_2
    new-instance v2, Ltwitter4j/internal/org/json/JSONObject;

    iget-object v3, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    invoke-direct {v2, v3}, Ltwitter4j/internal/org/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->json:Ltwitter4j/internal/org/json/JSONObject;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
    .catch Ltwitter4j/internal/org/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 166
    :catch_0
    move-exception v0

    .line 167
    .local v0, jsone:Ltwitter4j/internal/org/json/JSONException;
    :try_start_3
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    if-nez v2, :cond_7

    .line 168
    new-instance v2, Ltwitter4j/TwitterException;

    invoke-virtual {v0}, Ltwitter4j/internal/org/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ltwitter4j/TwitterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 173
    .end local v0           #jsone:Ltwitter4j/internal/org/json/JSONException;
    :catchall_0
    move-exception v2

    if-eqz v1, :cond_4

    .line 175
    :try_start_4
    invoke-virtual {v1}, Ljava/io/Reader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 179
    :cond_4
    :goto_3
    invoke-direct {p0}, Ltwitter4j/internal/http/HttpResponse;->disconnectForcibly()V

    throw v2

    .line 161
    :cond_5
    :try_start_5
    sget-boolean v2, Ltwitter4j/internal/http/HttpResponse;->LOGGABLE:Z

    if-eqz v2, :cond_0

    .line 162
    const-string v3, "T4JHttpResposne"

    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    if-eqz v2, :cond_6

    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    :goto_4
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    :cond_6
    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->json:Ltwitter4j/internal/org/json/JSONObject;

    invoke-virtual {v2}, Ltwitter4j/internal/org/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
    .catch Ltwitter4j/internal/org/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    move-result-object v2

    goto :goto_4

    .line 170
    .restart local v0       #jsone:Ltwitter4j/internal/org/json/JSONException;
    :cond_7
    :try_start_6
    new-instance v2, Ltwitter4j/TwitterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ltwitter4j/internal/org/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v0}, Ltwitter4j/TwitterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 176
    .end local v0           #jsone:Ltwitter4j/internal/org/json/JSONException;
    :catch_1
    move-exception v2

    goto :goto_2

    :catch_2
    move-exception v3

    goto :goto_3
.end method

.method public asReader()Ljava/io/Reader;
    .locals 5

    .prologue
    .line 235
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    iget-object v3, p0, Ltwitter4j/internal/http/HttpResponse;->is:Ljava/io/InputStream;

    const-string v4, "UTF-8"

    invoke-direct {v2, v3, v4}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    :goto_0
    return-object v1

    .line 236
    :catch_0
    move-exception v0

    .line 237
    .local v0, uee:Ljava/io/UnsupportedEncodingException;
    new-instance v1, Ljava/io/InputStreamReader;

    iget-object v2, p0, Ltwitter4j/internal/http/HttpResponse;->is:Ljava/io/InputStream;

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    goto :goto_0
.end method

.method public asStream()Ljava/io/InputStream;
    .locals 2

    .prologue
    .line 82
    iget-boolean v0, p0, Ltwitter4j/internal/http/HttpResponse;->streamConsumed:Z

    if-eqz v0, :cond_0

    .line 83
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Stream has already been consumed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_0
    iget-object v0, p0, Ltwitter4j/internal/http/HttpResponse;->is:Ljava/io/InputStream;

    return-object v0
.end method

.method public asString()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ltwitter4j/TwitterException;
        }
    .end annotation

    .prologue
    .line 96
    iget-object v6, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    if-nez v6, :cond_9

    .line 97
    const/4 v0, 0x0

    .line 98
    .local v0, br:Ljava/io/BufferedReader;
    const/4 v5, 0x0

    .line 100
    .local v5, stream:Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p0}, Ltwitter4j/internal/http/HttpResponse;->asStream()Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7

    move-result-object v5

    .line 101
    if-nez v5, :cond_2

    .line 102
    const/4 v6, 0x0

    .line 119
    if-eqz v5, :cond_0

    .line 121
    :try_start_1
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 125
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 127
    :try_start_2
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 131
    :cond_1
    :goto_1
    invoke-direct {p0}, Ltwitter4j/internal/http/HttpResponse;->disconnectForcibly()V

    .line 134
    .end local v0           #br:Ljava/io/BufferedReader;
    .end local v5           #stream:Ljava/io/InputStream;
    :goto_2
    return-object v6

    .line 104
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v5       #stream:Ljava/io/InputStream;
    :cond_2
    :try_start_3
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v6, Ljava/io/InputStreamReader;

    const-string v7, "UTF-8"

    invoke-direct {v6, v5, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v1, v6}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    .line 105
    .end local v0           #br:Ljava/io/BufferedReader;
    .local v1, br:Ljava/io/BufferedReader;
    :try_start_4
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .local v2, buf:Ljava/lang/StringBuilder;
    :goto_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, line:Ljava/lang/String;
    if-eqz v4, :cond_5

    .line 108
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "\n"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_3

    .line 116
    .end local v2           #buf:Ljava/lang/StringBuilder;
    .end local v4           #line:Ljava/lang/String;
    :catch_0
    move-exception v3

    move-object v0, v1

    .line 117
    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    .local v3, ioe:Ljava/io/IOException;
    :goto_4
    :try_start_5
    new-instance v6, Ltwitter4j/TwitterException;

    invoke-virtual {v3}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v3}, Ltwitter4j/TwitterException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v6
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 119
    .end local v3           #ioe:Ljava/io/IOException;
    :catchall_0
    move-exception v6

    :goto_5
    if-eqz v5, :cond_3

    .line 121
    :try_start_6
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_5

    .line 125
    :cond_3
    :goto_6
    if-eqz v0, :cond_4

    .line 127
    :try_start_7
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_6

    .line 131
    :cond_4
    :goto_7
    invoke-direct {p0}, Ltwitter4j/internal/http/HttpResponse;->disconnectForcibly()V

    throw v6

    .line 110
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v2       #buf:Ljava/lang/StringBuilder;
    .restart local v4       #line:Ljava/lang/String;
    :cond_5
    :try_start_8
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    .line 111
    sget-boolean v6, Ltwitter4j/internal/http/HttpResponse;->LOGGABLE:Z

    if-eqz v6, :cond_6

    .line 112
    const-string v6, "T4JHttpResposne"

    iget-object v7, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    :cond_6
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    .line 115
    const/4 v6, 0x1

    iput-boolean v6, p0, Ltwitter4j/internal/http/HttpResponse;->streamConsumed:Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_0

    .line 119
    if-eqz v5, :cond_7

    .line 121
    :try_start_9
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    .line 125
    :cond_7
    :goto_8
    if-eqz v1, :cond_8

    .line 127
    :try_start_a
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_4

    .line 131
    :cond_8
    :goto_9
    invoke-direct {p0}, Ltwitter4j/internal/http/HttpResponse;->disconnectForcibly()V

    .line 134
    .end local v1           #br:Ljava/io/BufferedReader;
    .end local v2           #buf:Ljava/lang/StringBuilder;
    .end local v4           #line:Ljava/lang/String;
    .end local v5           #stream:Ljava/io/InputStream;
    :cond_9
    iget-object v6, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    goto :goto_2

    .line 122
    .restart local v0       #br:Ljava/io/BufferedReader;
    .restart local v5       #stream:Ljava/io/InputStream;
    :catch_1
    move-exception v7

    goto :goto_0

    .line 128
    :catch_2
    move-exception v7

    goto :goto_1

    .line 122
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    .restart local v2       #buf:Ljava/lang/StringBuilder;
    .restart local v4       #line:Ljava/lang/String;
    :catch_3
    move-exception v6

    goto :goto_8

    .line 128
    :catch_4
    move-exception v6

    goto :goto_9

    .line 122
    .end local v1           #br:Ljava/io/BufferedReader;
    .end local v2           #buf:Ljava/lang/StringBuilder;
    .end local v4           #line:Ljava/lang/String;
    .restart local v0       #br:Ljava/io/BufferedReader;
    :catch_5
    move-exception v7

    goto :goto_6

    .line 128
    :catch_6
    move-exception v7

    goto :goto_7

    .line 119
    .end local v0           #br:Ljava/io/BufferedReader;
    .restart local v1       #br:Ljava/io/BufferedReader;
    :catchall_1
    move-exception v6

    move-object v0, v1

    .end local v1           #br:Ljava/io/BufferedReader;
    .restart local v0       #br:Ljava/io/BufferedReader;
    goto :goto_5

    .line 116
    :catch_7
    move-exception v3

    goto :goto_4
.end method

.method public abstract disconnect()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract getResponseHeader(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getResponseHeaderFields()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end method

.method public getStatusCode()I
    .locals 1

    .prologue
    .line 63
    iget v0, p0, Ltwitter4j/internal/http/HttpResponse;->statusCode:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HttpResponse{statusCode="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Ltwitter4j/internal/http/HttpResponse;->statusCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", responseAsString=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/internal/http/HttpResponse;->responseAsString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", is="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Ltwitter4j/internal/http/HttpResponse;->is:Ljava/io/InputStream;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", streamConsumed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Ltwitter4j/internal/http/HttpResponse;->streamConsumed:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
