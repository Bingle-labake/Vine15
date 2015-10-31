.class public Lco/vine/android/api/VineUpload$PostInfo;
.super Ljava/lang/Object;
.source "VineUpload.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lco/vine/android/api/VineUpload;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PostInfo"
.end annotation


# instance fields
.field public final caption:Ljava/lang/String;

.field public final channelId:J

.field public created:J

.field public final entities:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;"
        }
    .end annotation
.end field

.field public final message:Ljava/lang/String;

.field public final postToFacebook:Z

.field public final postToTwitter:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;ZZJLjava/util/ArrayList;Ljava/lang/String;J)V
    .locals 0
    .parameter "caption"
    .parameter "postToTwitter"
    .parameter "postToFacebook"
    .parameter "channelId"
    .parameter
    .parameter "message"
    .parameter "created"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "ZZJ",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    .prologue
    .line 154
    .local p6, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    if-nez p1, :cond_0

    .line 156
    const-string p1, ""

    .line 158
    :cond_0
    iput-object p1, p0, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    .line 159
    iput-boolean p2, p0, Lco/vine/android/api/VineUpload$PostInfo;->postToTwitter:Z

    .line 160
    iput-boolean p3, p0, Lco/vine/android/api/VineUpload$PostInfo;->postToFacebook:Z

    .line 161
    iput-object p6, p0, Lco/vine/android/api/VineUpload$PostInfo;->entities:Ljava/util/ArrayList;

    .line 162
    iput-wide p4, p0, Lco/vine/android/api/VineUpload$PostInfo;->channelId:J

    .line 163
    iput-object p7, p0, Lco/vine/android/api/VineUpload$PostInfo;->message:Ljava/lang/String;

    .line 164
    iput-wide p8, p0, Lco/vine/android/api/VineUpload$PostInfo;->created:J

    .line 165
    return-void
.end method

.method public static entitiesToMaps(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineEntity;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 196
    .local p0, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 197
    .local v2, mapEntities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;>;"
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lco/vine/android/api/VineEntity;

    .line 198
    .local v0, entity:Lco/vine/android/api/VineEntity;
    invoke-virtual {v0}, Lco/vine/android/api/VineEntity;->toMap()Ljava/util/HashMap;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 200
    .end local v0           #entity:Lco/vine/android/api/VineEntity;
    :cond_0
    return-object v2
.end method

.method public static fromJsonString(Ljava/lang/String;)Lco/vine/android/api/VineUpload$PostInfo;
    .locals 4
    .parameter "json"

    .prologue
    .line 169
    :try_start_0
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->createParser(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object v1

    .line 170
    .local v1, parser:Lcom/fasterxml/jackson/core/JsonParser;
    invoke-static {v1}, Lco/vine/android/api/VineUploadParsers;->parsePostInfo(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUpload$PostInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    return-object v2

    .line 171
    .end local v1           #parser:Lcom/fasterxml/jackson/core/JsonParser;
    :catch_0
    move-exception v0

    .line 172
    .local v0, e:Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "This should never happen."

    invoke-direct {v2, v3, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private toJson()Lcom/flurry/org/codehaus/jackson/JsonNode;
    .locals 4

    .prologue
    .line 182
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 183
    .local v0, objectHashMap:Ljava/util/HashMap;,"Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v1, "description"

    iget-object v2, p0, Lco/vine/android/api/VineUpload$PostInfo;->caption:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 184
    const-string v1, "postToTwitter"

    iget-boolean v2, p0, Lco/vine/android/api/VineUpload$PostInfo;->postToTwitter:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 185
    const-string v1, "postToFacebook"

    iget-boolean v2, p0, Lco/vine/android/api/VineUpload$PostInfo;->postToFacebook:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    const-string v1, "channelId"

    iget-wide v2, p0, Lco/vine/android/api/VineUpload$PostInfo;->channelId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    iget-object v1, p0, Lco/vine/android/api/VineUpload$PostInfo;->entities:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lco/vine/android/api/VineUpload$PostInfo;->entities:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 188
    const-string v1, "entities"

    iget-object v2, p0, Lco/vine/android/api/VineUpload$PostInfo;->entities:Ljava/util/ArrayList;

    invoke-static {v2}, Lco/vine/android/api/VineUpload$PostInfo;->entitiesToMaps(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    :cond_0
    const-string v1, "message"

    iget-object v2, p0, Lco/vine/android/api/VineUpload$PostInfo;->message:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 191
    const-string v1, "created"

    iget-wide v2, p0, Lco/vine/android/api/VineUpload$PostInfo;->created:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 192
    new-instance v1, Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;

    invoke-direct {v1}, Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;-><init>()V

    invoke-virtual {v1, v0}, Lcom/flurry/org/codehaus/jackson/map/ObjectMapper;->valueToTree(Ljava/lang/Object;)Lcom/flurry/org/codehaus/jackson/JsonNode;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 178
    invoke-direct {p0}, Lco/vine/android/api/VineUpload$PostInfo;->toJson()Lcom/flurry/org/codehaus/jackson/JsonNode;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
