.class public Lco/vine/android/api/VineUploadParsers;
.super Ljava/lang/Object;
.source "VineUploadParsers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/api/VineUploadParsers$1;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    return-void
.end method

.method public static parsePostInfo(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUpload$PostInfo;
    .locals 14
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 14
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v12

    .line 15
    .local v12, t:Lcom/fasterxml/jackson/core/JsonToken;
    const-string v1, ""

    .line 16
    .local v1, description:Ljava/lang/String;
    const-string v7, ""

    .line 17
    .local v7, message:Ljava/lang/String;
    const/4 v2, 0x0

    .line 18
    .local v2, postToTwitter:Z
    const/4 v3, 0x0

    .line 19
    .local v3, postToFacebook:Z
    const-wide/16 v4, -0x1

    .line 20
    .local v4, channelId:J
    const/4 v6, 0x0

    .line 21
    .local v6, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    const-wide/16 v8, 0x0

    .line 22
    .local v8, created:J
    :goto_0
    if-eqz v12, :cond_7

    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v12, v0, :cond_7

    .line 23
    sget-object v0, Lco/vine/android/api/VineUploadParsers$1;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v12}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v13

    aget v0, v0, v13

    packed-switch v0, :pswitch_data_0

    .line 73
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v12

    goto :goto_0

    .line 25
    :pswitch_0
    const-string v0, "description"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 26
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    .line 28
    :cond_1
    const-string v0, "message"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 29
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v7

    goto :goto_1

    .line 35
    :pswitch_1
    const-string v0, "postToTwitter"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 36
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v2

    goto :goto_1

    .line 37
    :cond_2
    const-string v0, "postToFacebook"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 38
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v3

    goto :goto_1

    .line 43
    :pswitch_2
    const-string v0, "channelId"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 44
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v4

    goto :goto_1

    .line 45
    :cond_3
    const-string v0, "created"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v8

    goto :goto_1

    .line 51
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v11

    .line 52
    .local v11, name:Ljava/lang/String;
    const-string v0, "entities"

    invoke-virtual {v0, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 53
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v12

    .line 54
    :goto_2
    if-eqz v12, :cond_0

    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v12, v0, :cond_0

    .line 55
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseEntity(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineEntity;

    move-result-object v10

    .line 56
    .local v10, entity:Lco/vine/android/api/VineEntity;
    if-nez v6, :cond_4

    .line 57
    new-instance v6, Ljava/util/ArrayList;

    .end local v6           #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .restart local v6       #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_4
    if-eqz v10, :cond_5

    .line 60
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    :cond_5
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v12

    .line 63
    goto :goto_2

    .line 65
    .end local v10           #entity:Lco/vine/android/api/VineEntity;
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 75
    .end local v11           #name:Ljava/lang/String;
    :cond_7
    new-instance v0, Lco/vine/android/api/VineUpload$PostInfo;

    invoke-direct/range {v0 .. v9}, Lco/vine/android/api/VineUpload$PostInfo;-><init>(Ljava/lang/String;ZZJLjava/util/ArrayList;Ljava/lang/String;J)V

    return-object v0

    .line 23
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
