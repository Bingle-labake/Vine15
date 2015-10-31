.class public Lco/vine/android/api/VineParsers;
.super Ljava/lang/Object;
.source "VineParsers.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/api/VineParsers$8;,
        Lco/vine/android/api/VineParsers$RecordParser;,
        Lco/vine/android/api/VineParsers$API_RESPONSE;
    }
.end annotation


# static fields
.field private static final ACTIVITY_PARSER:Lco/vine/android/api/VineParsers$RecordParser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VineParsers$RecordParser",
            "<",
            "Lco/vine/android/api/VineNotification;",
            ">;"
        }
    .end annotation
.end field

.field private static final CHANNELS_PARSER:Lco/vine/android/api/VineParsers$RecordParser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VineParsers$RecordParser",
            "<",
            "Lco/vine/android/api/VineChannel;",
            ">;"
        }
    .end annotation
.end field

.field private static final COMMENT_PARSER:Lco/vine/android/api/VineParsers$RecordParser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VineParsers$RecordParser",
            "<",
            "Lco/vine/android/api/VineComment;",
            ">;"
        }
    .end annotation
.end field

.field public static final JSON_FACTORY:Lcom/fasterxml/jackson/core/JsonFactory; = null

.field private static final LIKES_PARSER:Lco/vine/android/api/VineParsers$RecordParser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VineParsers$RecordParser",
            "<",
            "Lco/vine/android/api/VineLike;",
            ">;"
        }
    .end annotation
.end field

.field private static final PARAM_DATA:Ljava/lang/String; = "data"

.field private static final PARAM_EDITION_ID:Ljava/lang/String; = "editionId"

.field private static final PARAM_NAME:Ljava/lang/String; = "name"

.field private static final PARAM_RECORDS:Ljava/lang/String; = "records"

.field private static final PARAM_USERS:Ljava/lang/String; = "users"

.field private static final POST_PARSER:Lco/vine/android/api/VineParsers$RecordParser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VineParsers$RecordParser",
            "<",
            "Lco/vine/android/api/VinePost;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG_PARSER:Lco/vine/android/api/VineParsers$RecordParser; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VineParsers$RecordParser",
            "<",
            "Lco/vine/android/api/VineTag;",
            ">;"
        }
    .end annotation
.end field

.field private static final TIMESTAMP_FORMAT:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS"

.field private static final USER_PARSER:Lco/vine/android/api/VineParsers$RecordParser;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lco/vine/android/api/VineParsers$RecordParser",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    new-instance v0, Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-direct {v0}, Lcom/fasterxml/jackson/core/JsonFactory;-><init>()V

    sput-object v0, Lco/vine/android/api/VineParsers;->JSON_FACTORY:Lcom/fasterxml/jackson/core/JsonFactory;

    .line 49
    new-instance v0, Lco/vine/android/api/VineParsers$1;

    invoke-direct {v0}, Lco/vine/android/api/VineParsers$1;-><init>()V

    sput-object v0, Lco/vine/android/api/VineParsers;->USER_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    .line 57
    new-instance v0, Lco/vine/android/api/VineParsers$2;

    invoke-direct {v0}, Lco/vine/android/api/VineParsers$2;-><init>()V

    sput-object v0, Lco/vine/android/api/VineParsers;->LIKES_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    .line 65
    new-instance v0, Lco/vine/android/api/VineParsers$3;

    invoke-direct {v0}, Lco/vine/android/api/VineParsers$3;-><init>()V

    sput-object v0, Lco/vine/android/api/VineParsers;->POST_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    .line 73
    new-instance v0, Lco/vine/android/api/VineParsers$4;

    invoke-direct {v0}, Lco/vine/android/api/VineParsers$4;-><init>()V

    sput-object v0, Lco/vine/android/api/VineParsers;->COMMENT_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    .line 81
    new-instance v0, Lco/vine/android/api/VineParsers$5;

    invoke-direct {v0}, Lco/vine/android/api/VineParsers$5;-><init>()V

    sput-object v0, Lco/vine/android/api/VineParsers;->ACTIVITY_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    .line 89
    new-instance v0, Lco/vine/android/api/VineParsers$6;

    invoke-direct {v0}, Lco/vine/android/api/VineParsers$6;-><init>()V

    sput-object v0, Lco/vine/android/api/VineParsers;->TAG_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    .line 97
    new-instance v0, Lco/vine/android/api/VineParsers$7;

    invoke-direct {v0}, Lco/vine/android/api/VineParsers$7;-><init>()V

    sput-object v0, Lco/vine/android/api/VineParsers;->CHANNELS_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method static synthetic access$000(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUser;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUser;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineLike;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseLike(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineLike;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VinePost;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parsePost(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VinePost;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineComment;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseComment(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineComment;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineNotification;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseNotification(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineNotification;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineTag;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseTag(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineTag;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineChannel;
    .locals 1
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 25
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseChannel(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineChannel;

    move-result-object v0

    return-object v0
.end method

.method public static createParser(Ljava/io/InputStream;)Lcom/fasterxml/jackson/core/JsonParser;
    .locals 2
    .parameter "inputStream"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1521
    sget-object v1, Lco/vine/android/api/VineParsers;->JSON_FACTORY:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v1, p0}, Lcom/fasterxml/jackson/core/JsonFactory;->createJsonParser(Ljava/io/InputStream;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object v0

    .line 1522
    .local v0, jp:Lcom/fasterxml/jackson/core/JsonParser;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 1523
    return-object v0
.end method

.method public static createParser(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParser;
    .locals 2
    .parameter "inputString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1527
    sget-object v1, Lco/vine/android/api/VineParsers;->JSON_FACTORY:Lcom/fasterxml/jackson/core/JsonFactory;

    invoke-virtual {v1, p0}, Lcom/fasterxml/jackson/core/JsonFactory;->createJsonParser(Ljava/lang/String;)Lcom/fasterxml/jackson/core/JsonParser;

    move-result-object v0

    .line 1528
    .local v0, jp:Lcom/fasterxml/jackson/core/JsonParser;
    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 1529
    return-object v0
.end method

.method private static parseBlockedUsers(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/util/ArrayList;
    .locals 5
    .parameter "p"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 853
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 855
    .local v0, blockedUsers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 856
    .local v1, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v1, :cond_0

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v1, v3, :cond_0

    .line 857
    sget-object v3, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 870
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 859
    :pswitch_0
    new-instance v2, Lco/vine/android/api/VineUser;

    invoke-direct {v2}, Lco/vine/android/api/VineUser;-><init>()V

    .line 860
    .local v2, user:Lco/vine/android/api/VineUser;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v3

    iput-wide v3, v2, Lco/vine/android/api/VineUser;->userId:J

    .line 861
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 866
    .end local v2           #user:Lco/vine/android/api/VineUser;
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 872
    :cond_0
    return-object v0

    .line 857
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static declared-synchronized parseChannel(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineChannel;
    .locals 7
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 667
    const-class v4, Lco/vine/android/api/VineParsers;

    monitor-enter v4

    :try_start_0
    new-instance v2, Lco/vine/android/api/VineChannel;

    invoke-direct {v2}, Lco/vine/android/api/VineChannel;-><init>()V

    .line 668
    .local v2, vineChannel:Lco/vine/android/api/VineChannel;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 669
    .local v1, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v1, :cond_5

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v1, v3, :cond_5

    .line 670
    sget-object v3, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v5

    aget v3, v3, v5

    packed-switch v3, :pswitch_data_0

    .line 699
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 673
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 667
    .end local v1           #t:Lcom/fasterxml/jackson/core/JsonToken;
    .end local v2           #vineChannel:Lco/vine/android/api/VineChannel;
    :catchall_0
    move-exception v3

    monitor-exit v4

    throw v3

    .line 677
    .restart local v1       #t:Lcom/fasterxml/jackson/core/JsonToken;
    .restart local v2       #vineChannel:Lco/vine/android/api/VineChannel;
    :pswitch_1
    :try_start_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 678
    .local v0, cn:Ljava/lang/String;
    const-string v3, "channel"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 679
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lco/vine/android/api/VineChannel;->channel:Ljava/lang/String;

    goto :goto_1

    .line 680
    :cond_1
    const-string v3, "retinaIconUrl"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 681
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lco/vine/android/api/VineChannel;->retinaIconUrl:Ljava/lang/String;

    goto :goto_1

    .line 682
    :cond_2
    const-string v3, "created"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 683
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    const-string v5, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS"

    invoke-static {v3, v5}, Lco/vine/android/util/Util;->getTimeInMsFromString(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, v2, Lco/vine/android/api/VineChannel;->created:J

    goto :goto_1

    .line 684
    :cond_3
    const-string v3, "backgroundColor"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 685
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lco/vine/android/api/VineChannel;->backgroundColor:Ljava/lang/String;

    goto :goto_1

    .line 686
    :cond_4
    const-string v3, "fontColor"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 687
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lco/vine/android/api/VineChannel;->fontColor:Ljava/lang/String;

    goto :goto_1

    .line 692
    .end local v0           #cn:Ljava/lang/String;
    :pswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 693
    .restart local v0       #cn:Ljava/lang/String;
    const-string v3, "channelId"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 694
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v5

    iput-wide v5, v2, Lco/vine/android/api/VineChannel;->channelId:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .line 701
    .end local v0           #cn:Ljava/lang/String;
    :cond_5
    monitor-exit v4

    return-object v2

    .line 670
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static parseClientProfile(Lcom/fasterxml/jackson/core/JsonParser;)Lorg/json/JSONObject;
    .locals 5
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1143
    const-string v3, "Parse client profile."

    invoke-static {v3}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;)V

    .line 1144
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 1145
    .local v2, t:Lcom/fasterxml/jackson/core/JsonToken;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 1146
    .local v1, object:Lorg/json/JSONObject;
    :goto_0
    if-eqz v2, :cond_0

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_0

    .line 1147
    sget-object v3, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 1177
    :goto_1
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    goto :goto_0

    .line 1151
    :pswitch_1
    :try_start_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 1152
    :catch_0
    move-exception v0

    .line 1153
    .local v0, e:Lorg/json/JSONException;
    const-string v3, "Failed to parse: {}."

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 1159
    .end local v0           #e:Lorg/json/JSONException;
    :pswitch_2
    :try_start_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v4

    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 1160
    :catch_1
    move-exception v0

    .line 1161
    .restart local v0       #e:Lorg/json/JSONException;
    const-string v3, "Failed to parse: {}."

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    .line 1166
    .end local v0           #e:Lorg/json/JSONException;
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 1170
    :pswitch_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 1179
    :cond_0
    const-string v3, "Parsed client profile: "

    invoke-static {v3, v1}, Lcom/edisonwang/android/slog/SLog;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1180
    return-object v1

    .line 1147
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private static parseComment(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineComment;
    .locals 22
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 741
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    .line 742
    .local v21, t:Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v6, 0x0

    .line 743
    .local v6, avatarUrl:Ljava/lang/String;
    const/4 v5, 0x0

    .line 744
    .local v5, comment:Ljava/lang/String;
    const-wide/16 v8, 0x0

    .line 745
    .local v8, timestamp:J
    const-wide/16 v3, 0x0

    .line 746
    .local v3, commentId:J
    const/4 v10, 0x0

    .line 747
    .local v10, location:Ljava/lang/String;
    const/4 v7, 0x0

    .line 748
    .local v7, user:Lco/vine/android/api/VineUser;
    const-wide/16 v11, 0x0

    .line 749
    .local v11, userId:J
    const/4 v13, 0x0

    .line 750
    .local v13, username:Ljava/lang/String;
    const/4 v14, 0x0

    .line 751
    .local v14, verified:Z
    const/16 v17, 0x0

    .line 753
    .local v17, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :goto_0
    if-eqz v21, :cond_a

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v21

    if-eq v0, v2, :cond_a

    .line 754
    sget-object v2, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual/range {v21 .. v21}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v15

    aget v2, v2, v15

    packed-switch v2, :pswitch_data_0

    .line 814
    :cond_0
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    goto :goto_0

    .line 756
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v19

    .line 757
    .local v19, cn:Ljava/lang/String;
    const-string v2, "user"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 758
    invoke-static/range {p0 .. p0}, Lco/vine/android/api/VineParsers;->parseUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUser;

    move-result-object v7

    goto :goto_1

    .line 760
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 765
    .end local v19           #cn:Ljava/lang/String;
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v19

    .line 766
    .restart local v19       #cn:Ljava/lang/String;
    const-string v2, "avatarUrl"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 767
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 768
    :cond_2
    const-string v2, "comment"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 769
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 770
    :cond_3
    const-string v2, "created"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 771
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    const-string v15, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS"

    invoke-static {v2, v15}, Lco/vine/android/util/Util;->getTimeInMsFromString(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v8

    goto :goto_1

    .line 772
    :cond_4
    const-string v2, "location"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 773
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v10

    goto :goto_1

    .line 774
    :cond_5
    const-string v2, "username"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 775
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v13

    goto :goto_1

    .line 780
    .end local v19           #cn:Ljava/lang/String;
    :pswitch_2
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v19

    .line 781
    .restart local v19       #cn:Ljava/lang/String;
    const-string v2, "commentId"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 782
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v3

    goto/16 :goto_1

    .line 783
    :cond_6
    const-string v2, "userId"

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 784
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v11

    goto/16 :goto_1

    .line 790
    .end local v19           #cn:Ljava/lang/String;
    :pswitch_3
    const-string v2, "verified"

    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 791
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v14

    goto/16 :goto_1

    .line 796
    :pswitch_4
    const-string v2, "entities"

    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 797
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    .line 798
    :goto_2
    if-eqz v21, :cond_0

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v21

    if-eq v0, v2, :cond_0

    .line 799
    invoke-static/range {p0 .. p0}, Lco/vine/android/api/VineParsers;->parseEntity(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineEntity;

    move-result-object v20

    .line 800
    .local v20, entity:Lco/vine/android/api/VineEntity;
    if-nez v17, :cond_7

    .line 801
    new-instance v17, Ljava/util/ArrayList;

    .end local v17           #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 803
    .restart local v17       #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_7
    if-eqz v20, :cond_8

    .line 804
    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 806
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    .line 807
    goto :goto_2

    .line 809
    .end local v20           #entity:Lco/vine/android/api/VineEntity;
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 816
    :cond_a
    if-eqz v17, :cond_b

    .line 817
    invoke-static/range {v17 .. v17}, Lco/vine/android/util/Util;->validateAndFixEntities(Ljava/util/ArrayList;)V

    .line 819
    :cond_b
    new-instance v2, Lco/vine/android/api/VineComment;

    const-wide/16 v15, 0x0

    const/16 v18, 0x0

    invoke-direct/range {v2 .. v18}, Lco/vine/android/api/VineComment;-><init>(JLjava/lang/String;Ljava/lang/String;Lco/vine/android/api/VineUser;JLjava/lang/String;JLjava/lang/String;ZJLjava/util/ArrayList;Z)V

    return-object v2

    .line 754
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private static parseEditions(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 5
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 207
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .local v1, editions:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/util/Pair<Ljava/lang/String;Ljava/lang/String;>;>;"
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 210
    .local v2, t:Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v0, 0x0

    .line 211
    .local v0, editionId:Ljava/lang/String;
    :goto_0
    if-eqz v2, :cond_3

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_3

    .line 212
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_2

    .line 213
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 214
    :goto_1
    if-eqz v2, :cond_2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_2

    .line 215
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_STRING:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v2, v3, :cond_0

    .line 216
    const-string v3, "editionId"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 217
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    .line 222
    :cond_0
    :goto_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    goto :goto_1

    .line 218
    :cond_1
    const-string v3, "name"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 219
    new-instance v3, Landroid/util/Pair;

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v0, v4}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 225
    :cond_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    goto :goto_0

    .line 227
    :cond_3
    return-object v1
.end method

.method public static parseEntity(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineEntity;
    .locals 11
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1406
    const/4 v1, 0x0

    .line 1407
    .local v1, type:Ljava/lang/String;
    const/4 v3, 0x0

    .line 1408
    .local v3, link:Ljava/lang/String;
    const/4 v2, 0x0

    .line 1409
    .local v2, title:Ljava/lang/String;
    const-wide/16 v6, 0x0

    .line 1410
    .local v6, id:J
    const/4 v4, -0x1

    .line 1411
    .local v4, start:I
    const/4 v5, -0x1

    .line 1412
    .local v5, end:I
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v9

    .line 1413
    .local v9, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v9, :cond_6

    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v9, v0, :cond_6

    .line 1414
    sget-object v0, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v10

    aget v0, v0, v10

    packed-switch v0, :pswitch_data_0

    .line 1456
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v9

    goto :goto_0

    .line 1416
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v8

    .line 1417
    .local v8, cn:Ljava/lang/String;
    const-string v0, "type"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1418
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 1419
    :cond_1
    const-string v0, "link"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1420
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 1421
    :cond_2
    const-string v0, "title"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1422
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1427
    .end local v8           #cn:Ljava/lang/String;
    :pswitch_1
    const-string v0, "range"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1428
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v9

    .line 1429
    :goto_2
    if-eqz v9, :cond_5

    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v9, v0, :cond_5

    .line 1430
    sget-object v0, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v9}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v10

    aget v0, v0, v10

    packed-switch v0, :pswitch_data_1

    .line 1440
    :goto_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v9

    goto :goto_2

    .line 1432
    :pswitch_2
    const/4 v0, -0x1

    if-ne v4, v0, :cond_3

    .line 1433
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v4

    goto :goto_3

    .line 1435
    :cond_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v5

    goto :goto_3

    .line 1443
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 1447
    :cond_5
    :pswitch_3
    const-string v0, "id"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1448
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v6

    goto :goto_1

    .line 1458
    :cond_6
    new-instance v0, Lco/vine/android/api/VineEntity;

    invoke-direct/range {v0 .. v7}, Lco/vine/android/api/VineEntity;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIJ)V

    return-object v0

    .line 1414
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_3
        :pswitch_0
    .end packed-switch

    .line 1430
    :pswitch_data_1
    .packed-switch 0x3
        :pswitch_2
    .end packed-switch
.end method

.method public static parseError(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineError;
    .locals 6
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1248
    const/4 v1, 0x0

    .line 1249
    .local v1, error:I
    const/4 v2, 0x0

    .line 1250
    .local v2, reason:Ljava/lang/String;
    const/4 v0, 0x0

    .line 1251
    .local v0, data:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 1253
    .local v3, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v3, :cond_2

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v3, v4, :cond_2

    .line 1254
    sget-object v4, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 1277
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    goto :goto_0

    .line 1256
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 1260
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 1264
    :pswitch_2
    const-string v4, "code"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1265
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v1

    goto :goto_1

    .line 1270
    :pswitch_3
    const-string v4, "error"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1271
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1272
    :cond_1
    const-string v4, "data"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 1273
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 1279
    :cond_2
    new-instance v4, Lco/vine/android/api/VineError;

    invoke-direct {v4, v1, v2, v0}, Lco/vine/android/api/VineError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    return-object v4

    .line 1254
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private static parseGeneral(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 3
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 824
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 825
    .local v0, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v0, :cond_2

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_2

    .line 826
    sget-object v1, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 847
    :cond_0
    :goto_1
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_0

    .line 828
    :pswitch_1
    const-string v1, "success"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 829
    sget-object v1, Lco/vine/android/api/VineParsers$API_RESPONSE;->SUCCESS:Lco/vine/android/api/VineParsers$API_RESPONSE;

    .line 849
    :goto_2
    return-object v1

    .line 834
    :pswitch_2
    const-string v1, "success"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 835
    sget-object v1, Lco/vine/android/api/VineParsers$API_RESPONSE;->FAILURE:Lco/vine/android/api/VineParsers$API_RESPONSE;

    goto :goto_2

    .line 839
    :cond_1
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 843
    :pswitch_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 849
    :cond_2
    const/4 v1, 0x0

    goto :goto_2

    .line 826
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private static parseLike(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineLike;
    .locals 7
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 312
    new-instance v4, Lco/vine/android/api/VineLike;

    invoke-direct {v4}, Lco/vine/android/api/VineLike;-><init>()V

    .line 313
    .local v4, vineLike:Lco/vine/android/api/VineLike;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 314
    .local v3, t:Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v2, -0x1

    .line 315
    .local v2, following:I
    const/4 v0, 0x0

    .line 317
    .local v0, blocked:I
    :goto_0
    if-eqz v3, :cond_8

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v3, v5, :cond_8

    .line 318
    sget-object v5, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 362
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    goto :goto_0

    .line 320
    :pswitch_0
    const-string v5, "user"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 321
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUser;

    move-result-object v5

    iput-object v5, v4, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    goto :goto_1

    .line 326
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 330
    :pswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v1

    .line 331
    .local v1, cn:Ljava/lang/String;
    const-string v5, "created"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 332
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    const-string v6, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS"

    invoke-static {v5, v6}, Lco/vine/android/util/Util;->getTimeInMsFromString(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v5

    iput-wide v5, v4, Lco/vine/android/api/VineLike;->created:J

    goto :goto_1

    .line 333
    :cond_1
    const-string v5, "location"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 334
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lco/vine/android/api/VineLike;->location:Ljava/lang/String;

    goto :goto_1

    .line 335
    :cond_2
    const-string v5, "avatarUrl"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 336
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lco/vine/android/api/VineLike;->avatarUrl:Ljava/lang/String;

    goto :goto_1

    .line 337
    :cond_3
    const-string v5, "username"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 338
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v4, Lco/vine/android/api/VineLike;->username:Ljava/lang/String;

    goto :goto_1

    .line 343
    .end local v1           #cn:Ljava/lang/String;
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v1

    .line 344
    .restart local v1       #cn:Ljava/lang/String;
    const-string v5, "likeId"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 345
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v5

    iput-wide v5, v4, Lco/vine/android/api/VineLike;->likeId:J

    goto :goto_1

    .line 346
    :cond_4
    const-string v5, "userId"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 347
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v5

    iput-wide v5, v4, Lco/vine/android/api/VineLike;->userId:J

    goto/16 :goto_1

    .line 348
    :cond_5
    const-string v5, "verified"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 349
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v5

    iput v5, v4, Lco/vine/android/api/VineLike;->verified:I

    goto/16 :goto_1

    .line 350
    :cond_6
    const-string v5, "following"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_7

    .line 351
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v2

    goto/16 :goto_1

    .line 352
    :cond_7
    const-string v5, "blocked"

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 353
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v0

    goto/16 :goto_1

    .line 365
    .end local v1           #cn:Ljava/lang/String;
    :cond_8
    iget-object v5, v4, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    if-eqz v5, :cond_9

    .line 366
    iget-object v5, v4, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    iput v2, v5, Lco/vine/android/api/VineUser;->following:I

    .line 367
    iget-object v5, v4, Lco/vine/android/api/VineLike;->user:Lco/vine/android/api/VineUser;

    iput v0, v5, Lco/vine/android/api/VineUser;->blocked:I

    .line 370
    :cond_9
    return-object v4

    .line 318
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private static parseLikeId(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Long;
    .locals 5
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 876
    const-wide/16 v0, 0x0

    .line 877
    .local v0, id:J
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    .line 878
    .local v2, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v2, :cond_1

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v2, v3, :cond_1

    .line 879
    sget-object v3, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v2}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 892
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v2

    goto :goto_0

    .line 881
    :pswitch_0
    const-string v3, "likeId"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 882
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v0

    .line 883
    goto :goto_1

    .line 888
    :cond_0
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 894
    :cond_1
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    return-object v3

    .line 879
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static parseLogin(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineLogin;
    .locals 10
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1184
    const/4 v1, 0x0

    .line 1185
    .local v1, key:Ljava/lang/String;
    const/4 v2, 0x0

    .line 1186
    .local v2, username:Ljava/lang/String;
    const/4 v5, 0x0

    .line 1187
    .local v5, edition:Ljava/lang/String;
    const-wide/16 v3, 0x0

    .line 1188
    .local v3, userId:J
    const/4 v7, 0x0

    .line 1190
    .local v7, success:Z
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    .line 1191
    .local v8, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v8, :cond_5

    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v8, v0, :cond_5

    .line 1192
    sget-object v0, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v9

    aget v0, v0, v9

    packed-switch v0, :pswitch_data_0

    .line 1237
    :cond_0
    :goto_1
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    goto :goto_0

    .line 1194
    :pswitch_1
    const-string v0, "data"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1195
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    .line 1196
    :goto_2
    if-eqz v8, :cond_0

    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v8, v0, :cond_0

    .line 1197
    sget-object v0, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v8}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v9

    aget v0, v0, v9

    packed-switch v0, :pswitch_data_1

    .line 1219
    :cond_1
    :goto_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v8

    goto :goto_2

    .line 1199
    :pswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v6

    .line 1200
    .local v6, name:Ljava/lang/String;
    const-string v0, "key"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1201
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 1202
    :cond_2
    const-string v0, "username"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1203
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 1204
    :cond_3
    const-string v0, "edition"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1205
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 1210
    .end local v6           #name:Ljava/lang/String;
    :pswitch_3
    const-string v0, "userId"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1211
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v3

    goto :goto_3

    .line 1222
    :cond_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 1228
    :pswitch_4
    const-string v0, "success"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1229
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v7

    goto :goto_1

    .line 1240
    :cond_5
    if-eqz v7, :cond_6

    .line 1241
    new-instance v0, Lco/vine/android/api/VineLogin;

    invoke-direct/range {v0 .. v5}, Lco/vine/android/api/VineLogin;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 1243
    :goto_4
    return-object v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_4

    .line 1192
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_4
        :pswitch_4
    .end packed-switch

    .line 1197
    :pswitch_data_1
    .packed-switch 0x3
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private static parseNotification(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineNotification;
    .locals 26
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1292
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v23

    .line 1293
    .local v23, t:Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v3, 0x0

    .line 1294
    .local v3, avatarUrl:Ljava/lang/String;
    const/4 v4, 0x0

    .line 1295
    .local v4, username:Ljava/lang/String;
    const/4 v5, 0x0

    .line 1296
    .local v5, thumbnailUrl:Ljava/lang/String;
    const/4 v6, 0x0

    .line 1297
    .local v6, comment:Ljava/lang/String;
    const-wide/16 v7, 0x0

    .line 1298
    .local v7, notificationId:J
    const-wide/16 v9, 0x0

    .line 1299
    .local v9, userId:J
    const-wide/16 v11, 0x0

    .line 1300
    .local v11, postId:J
    const-wide/16 v13, 0x0

    .line 1301
    .local v13, createdAt:J
    const/4 v15, 0x0

    .line 1302
    .local v15, verified:Z
    const/16 v16, 0x0

    .line 1303
    .local v16, notificationType:I
    const/16 v22, 0x0

    .line 1304
    .local v22, privateAccount:Z
    const/16 v19, 0x0

    .line 1305
    .local v19, followRequested:Z
    const/16 v20, 0x0

    .line 1306
    .local v20, following:Z
    const/16 v17, 0x0

    .line 1308
    .local v17, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :goto_0
    if-eqz v23, :cond_13

    sget-object v24, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    if-eq v0, v1, :cond_13

    .line 1309
    sget-object v24, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual/range {v23 .. v23}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v25

    aget v24, v24, v25

    packed-switch v24, :pswitch_data_0

    .line 1378
    :cond_0
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v23

    goto :goto_0

    .line 1311
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v21

    .line 1312
    .local v21, name:Ljava/lang/String;
    const-string v24, "avatarUrl"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_1

    .line 1313
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 1314
    :cond_1
    const-string v24, "body"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_2

    .line 1315
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lco/vine/android/util/Util;->getUsernameFromActivity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1316
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 1317
    :cond_2
    const-string v24, "thumbnailUrl"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_3

    .line 1318
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 1319
    :cond_3
    const-string v24, "created"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_0

    .line 1320
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v24

    const-string v25, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS"

    invoke-static/range {v24 .. v25}, Lco/vine/android/util/Util;->getTimeInMsFromString(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v13

    goto :goto_1

    .line 1325
    .end local v21           #name:Ljava/lang/String;
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v21

    .line 1326
    .restart local v21       #name:Ljava/lang/String;
    const-string v24, "notificationTypeId"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_4

    .line 1327
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v16

    goto :goto_1

    .line 1328
    :cond_4
    const-string v24, "notificationId"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_5

    .line 1329
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v7

    goto :goto_1

    .line 1330
    :cond_5
    const-string v24, "userId"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_6

    .line 1331
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v9

    goto/16 :goto_1

    .line 1332
    :cond_6
    const-string v24, "postId"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_7

    .line 1333
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v11

    goto/16 :goto_1

    .line 1334
    :cond_7
    const-string v24, "verified"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_9

    .line 1335
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_8

    const/4 v15, 0x1

    :goto_2
    goto/16 :goto_1

    :cond_8
    const/4 v15, 0x0

    goto :goto_2

    .line 1336
    :cond_9
    const-string v24, "private"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_b

    .line 1337
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_a

    const/16 v22, 0x1

    :goto_3
    goto/16 :goto_1

    :cond_a
    const/16 v22, 0x0

    goto :goto_3

    .line 1338
    :cond_b
    const-string v24, "followRequested"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_d

    .line 1339
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_c

    const/16 v19, 0x1

    :goto_4
    goto/16 :goto_1

    :cond_c
    const/16 v19, 0x0

    goto :goto_4

    .line 1340
    :cond_d
    const-string v24, "following"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_0

    .line 1341
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v24

    const/16 v25, 0x1

    move/from16 v0, v24

    move/from16 v1, v25

    if-ne v0, v1, :cond_e

    const/16 v20, 0x1

    :goto_5
    goto/16 :goto_1

    :cond_e
    const/16 v20, 0x0

    goto :goto_5

    .line 1346
    .end local v21           #name:Ljava/lang/String;
    :pswitch_2
    const-string v24, "entities"

    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v25

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_11

    .line 1347
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v23

    .line 1348
    :goto_6
    if-eqz v23, :cond_0

    sget-object v24, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v23

    move-object/from16 v1, v24

    if-eq v0, v1, :cond_0

    .line 1349
    invoke-static/range {p0 .. p0}, Lco/vine/android/api/VineParsers;->parseEntity(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineEntity;

    move-result-object v18

    .line 1350
    .local v18, entity:Lco/vine/android/api/VineEntity;
    if-nez v17, :cond_f

    .line 1351
    new-instance v17, Ljava/util/ArrayList;

    .end local v17           #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 1353
    .restart local v17       #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_f
    if-eqz v18, :cond_10

    .line 1354
    invoke-virtual/range {v17 .. v18}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1356
    :cond_10
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v23

    .line 1357
    goto :goto_6

    .line 1359
    .end local v18           #entity:Lco/vine/android/api/VineEntity;
    :cond_11
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 1365
    :pswitch_3
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v21

    .line 1366
    .restart local v21       #name:Ljava/lang/String;
    const-string v24, "followRequested"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_12

    .line 1367
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v19

    goto/16 :goto_1

    .line 1368
    :cond_12
    const-string v24, "following"

    move-object/from16 v0, v24

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_0

    .line 1369
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v20

    goto/16 :goto_1

    .line 1374
    .end local v21           #name:Ljava/lang/String;
    :pswitch_4
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 1381
    :cond_13
    new-instance v2, Lco/vine/android/api/VineNotification;

    invoke-direct/range {v2 .. v17}, Lco/vine/android/api/VineNotification;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJJZILjava/util/ArrayList;)V

    .line 1385
    .local v2, result:Lco/vine/android/api/VineNotification;
    if-eqz v17, :cond_14

    .line 1386
    invoke-static/range {v17 .. v17}, Lco/vine/android/util/Util;->validateAndFixEntities(Ljava/util/ArrayList;)V

    .line 1388
    :cond_14
    if-eqz v20, :cond_15

    .line 1389
    invoke-virtual {v2}, Lco/vine/android/api/VineNotification;->setFollowing()V

    .line 1391
    :cond_15
    if-eqz v19, :cond_16

    .line 1392
    invoke-virtual {v2}, Lco/vine/android/api/VineNotification;->setFollowRequested()V

    .line 1394
    :cond_16
    if-eqz v22, :cond_17

    .line 1395
    invoke-virtual {v2}, Lco/vine/android/api/VineNotification;->setPrivate()V

    .line 1398
    :cond_17
    if-lez v16, :cond_18

    .line 1401
    .end local v2           #result:Lco/vine/android/api/VineNotification;
    :goto_7
    return-object v2

    .restart local v2       #result:Lco/vine/android/api/VineNotification;
    :cond_18
    const/4 v2, 0x0

    goto :goto_7

    .line 1309
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_3
    .end packed-switch
.end method

.method private static parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;
    .locals 6
    .parameter "p"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Landroid/os/Parcelable;",
            ">(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Lco/vine/android/api/VineParsers$RecordParser",
            "<TT;>;)",
            "Lco/vine/android/api/VinePagedData",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 264
    .local p1, parser:Lco/vine/android/api/VineParsers$RecordParser;,"Lco/vine/android/api/VineParsers$RecordParser<TT;>;"
    new-instance v2, Lco/vine/android/api/VinePagedData;

    invoke-direct {v2}, Lco/vine/android/api/VinePagedData;-><init>()V

    .line 265
    .local v2, pagedData:Lco/vine/android/api/VinePagedData;,"Lco/vine/android/api/VinePagedData<TT;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, v2, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    .line 267
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 268
    .local v3, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v3, :cond_7

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v3, v4, :cond_7

    .line 269
    sget-object v4, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v3}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 305
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    goto :goto_0

    .line 271
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 275
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 276
    .local v0, cn:Ljava/lang/String;
    const-string v4, "count"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 277
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v4

    iput v4, v2, Lco/vine/android/api/VinePagedData;->count:I

    goto :goto_1

    .line 278
    :cond_1
    const-string v4, "nextPage"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 279
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v4

    iput v4, v2, Lco/vine/android/api/VinePagedData;->nextPage:I

    goto :goto_1

    .line 280
    :cond_2
    const-string v4, "previousPage"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 281
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v4

    iput v4, v2, Lco/vine/android/api/VinePagedData;->previousPage:I

    goto :goto_1

    .line 282
    :cond_3
    const-string v4, "size"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 283
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v4

    iput v4, v2, Lco/vine/android/api/VinePagedData;->size:I

    goto :goto_1

    .line 284
    :cond_4
    const-string v4, "anchor"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 285
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v4

    iput-wide v4, v2, Lco/vine/android/api/VinePagedData;->anchor:J

    goto :goto_1

    .line 286
    :cond_5
    const-string v4, "title"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 287
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v2, Lco/vine/android/api/VinePagedData;->title:Ljava/lang/String;

    goto :goto_1

    .line 292
    .end local v0           #cn:Ljava/lang/String;
    :pswitch_2
    const-string v4, "records"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 293
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 294
    :goto_2
    if-eqz v3, :cond_0

    sget-object v4, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v3, v4, :cond_0

    .line 295
    invoke-interface {p1, p0}, Lco/vine/android/api/VineParsers$RecordParser;->parse(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Parcelable;

    .line 296
    .local v1, item:Landroid/os/Parcelable;,"TT;"
    if-eqz v1, :cond_6

    .line 297
    iget-object v4, v2, Lco/vine/android/api/VinePagedData;->items:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 299
    :cond_6
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v3

    .line 300
    goto :goto_2

    .line 307
    .end local v1           #item:Landroid/os/Parcelable;,"TT;"
    :cond_7
    return-object v2

    .line 269
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private static parsePost(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VinePost;
    .locals 28
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 455
    new-instance v23, Lco/vine/android/api/VinePost;

    invoke-direct/range {v23 .. v23}, Lco/vine/android/api/VinePost;-><init>()V

    .line 456
    .local v23, vinePost:Lco/vine/android/api/VinePost;
    const/4 v11, 0x0

    .line 457
    .local v11, address:Ljava/lang/String;
    const/4 v4, 0x0

    .line 458
    .local v4, categoryIconUrl:Ljava/lang/String;
    const/4 v6, 0x0

    .line 459
    .local v6, categoryId:Ljava/lang/String;
    const/4 v5, 0x0

    .line 460
    .local v5, categoryShortName:Ljava/lang/String;
    const/4 v7, 0x0

    .line 461
    .local v7, city:Ljava/lang/String;
    const/4 v8, 0x0

    .line 462
    .local v8, countryCode:Ljava/lang/String;
    const/4 v9, 0x0

    .line 463
    .local v9, venueName:Ljava/lang/String;
    const/4 v10, 0x0

    .line 464
    .local v10, state:Ljava/lang/String;
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    .line 465
    .local v21, t:Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v15, 0x0

    .line 466
    .local v15, explicitContent:Z
    const/16 v22, 0x0

    .line 467
    .local v22, verified:Z
    const/16 v16, 0x0

    .line 468
    .local v16, liked:Z
    const/16 v20, 0x0

    .line 469
    .local v20, revined:Z
    const/16 v19, 0x0

    .line 470
    .local v19, promoted:Z
    const/16 v17, 0x0

    .line 471
    .local v17, postVerified:Z
    const/16 v18, 0x0

    .line 473
    .local v18, priv:Z
    :goto_0
    if-eqz v21, :cond_2d

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v21

    if-eq v0, v3, :cond_2d

    .line 474
    sget-object v3, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual/range {v21 .. v21}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v24

    aget v3, v3, v24

    packed-switch v3, :pswitch_data_0

    .line 617
    :cond_0
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    goto :goto_0

    .line 476
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v12

    .line 477
    .local v12, cn:Ljava/lang/String;
    const-string v3, "comments"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 478
    sget-object v3, Lco/vine/android/api/VineParsers;->COMMENT_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    goto :goto_1

    .line 479
    :cond_1
    const-string v3, "likes"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 480
    sget-object v3, Lco/vine/android/api/VineParsers;->LIKES_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    move-object/from16 v0, p0

    invoke-static {v0, v3}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    goto :goto_1

    .line 481
    :cond_2
    const-string v3, "user"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 482
    invoke-static/range {p0 .. p0}, Lco/vine/android/api/VineParsers;->parseUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUser;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->user:Lco/vine/android/api/VineUser;

    goto :goto_1

    .line 483
    :cond_3
    const-string v3, "repost"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 484
    invoke-static/range {p0 .. p0}, Lco/vine/android/api/VineParsers;->parseRepost(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineRepost;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->repost:Lco/vine/android/api/VineRepost;

    goto :goto_1

    .line 485
    :cond_4
    const-string v3, "reposts"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 486
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    .line 487
    :goto_2
    if-eqz v21, :cond_0

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v21

    if-eq v0, v3, :cond_0

    .line 488
    sget-object v3, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual/range {v21 .. v21}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v24

    aget v3, v3, v24

    packed-switch v3, :pswitch_data_1

    .line 504
    :cond_5
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    goto :goto_2

    .line 494
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_3

    .line 498
    :pswitch_2
    const-string v3, "count"

    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, v24

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 499
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v3

    move-object/from16 v0, v23

    iput v3, v0, Lco/vine/android/api/VinePost;->revinersCount:I

    goto :goto_3

    .line 507
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 512
    .end local v12           #cn:Ljava/lang/String;
    :pswitch_3
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v12

    .line 513
    .restart local v12       #cn:Ljava/lang/String;
    const-string v3, "tags"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 514
    invoke-static/range {p0 .. p0}, Lco/vine/android/api/VineParsers;->parseTags(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/util/ArrayList;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->tags:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 515
    :cond_7
    const-string v3, "entities"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 516
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    .line 517
    const/4 v13, 0x0

    .line 518
    .local v13, entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :goto_4
    if-eqz v21, :cond_a

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v21

    if-eq v0, v3, :cond_a

    .line 519
    invoke-static/range {p0 .. p0}, Lco/vine/android/api/VineParsers;->parseEntity(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineEntity;

    move-result-object v14

    .line 520
    .local v14, entity:Lco/vine/android/api/VineEntity;
    if-nez v13, :cond_8

    .line 521
    new-instance v13, Ljava/util/ArrayList;

    .end local v13           #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 523
    .restart local v13       #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_8
    if-eqz v14, :cond_9

    .line 524
    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 526
    :cond_9
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v21

    .line 527
    goto :goto_4

    .line 528
    .end local v14           #entity:Lco/vine/android/api/VineEntity;
    :cond_a
    if-eqz v13, :cond_0

    .line 529
    invoke-static {v13}, Lco/vine/android/util/Util;->validateAndFixEntities(Ljava/util/ArrayList;)V

    .line 530
    move-object/from16 v0, v23

    iput-object v13, v0, Lco/vine/android/api/VinePost;->entities:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 533
    .end local v13           #entities:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineEntity;>;"
    :cond_b
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 538
    .end local v12           #cn:Ljava/lang/String;
    :pswitch_4
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v12

    .line 539
    .restart local v12       #cn:Ljava/lang/String;
    const-string v3, "foursquareVenueId"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 540
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    goto/16 :goto_1

    .line 541
    :cond_c
    const-string v3, "description"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 542
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->description:Ljava/lang/String;

    goto/16 :goto_1

    .line 543
    :cond_d
    const-string v3, "created"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 544
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    const-string v24, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS"

    move-object/from16 v0, v24

    invoke-static {v3, v0}, Lco/vine/android/util/Util;->getTimeInMsFromString(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v24

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    iput-wide v0, v2, Lco/vine/android/api/VinePost;->created:J

    goto/16 :goto_1

    .line 545
    :cond_e
    const-string v3, "location"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 546
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->location:Ljava/lang/String;

    goto/16 :goto_1

    .line 547
    :cond_f
    const-string v3, "avatarUrl"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 548
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->avatarUrl:Ljava/lang/String;

    goto/16 :goto_1

    .line 549
    :cond_10
    const-string v3, "videoLowURL"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 550
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->videoLowURL:Ljava/lang/String;

    goto/16 :goto_1

    .line 551
    :cond_11
    const-string v3, "videoUrl"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 552
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->videoUrl:Ljava/lang/String;

    goto/16 :goto_1

    .line 553
    :cond_12
    const-string v3, "username"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 554
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->username:Ljava/lang/String;

    goto/16 :goto_1

    .line 555
    :cond_13
    const-string v3, "shareUrl"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 556
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->shareUrl:Ljava/lang/String;

    goto/16 :goto_1

    .line 557
    :cond_14
    const-string v3, "thumbnailUrl"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 558
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->thumbnailUrl:Ljava/lang/String;

    goto/16 :goto_1

    .line 559
    :cond_15
    const-string v3, "venueAddress"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 560
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v11

    goto/16 :goto_1

    .line 561
    :cond_16
    const-string v3, "venueCategoryIconUrl"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_17

    .line 562
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v4

    goto/16 :goto_1

    .line 563
    :cond_17
    const-string v3, "venueCategoryId"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 564
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v6

    goto/16 :goto_1

    .line 565
    :cond_18
    const-string v3, "venueCategoryShortName"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 566
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_1

    .line 567
    :cond_19
    const-string v3, "venueCity"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1a

    .line 568
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v7

    goto/16 :goto_1

    .line 569
    :cond_1a
    const-string v3, "venueCountryCode"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 570
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1

    .line 571
    :cond_1b
    const-string v3, "venueName"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    .line 572
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_1

    .line 573
    :cond_1c
    const-string v3, "state"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 574
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_1

    .line 579
    .end local v12           #cn:Ljava/lang/String;
    :pswitch_5
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v12

    .line 580
    .restart local v12       #cn:Ljava/lang/String;
    const-string v3, "explicitContent"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1e

    .line 581
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v3

    const/16 v24, 0x1

    move/from16 v0, v24

    if-ne v3, v0, :cond_1d

    const/4 v15, 0x1

    :goto_5
    goto/16 :goto_1

    :cond_1d
    const/4 v15, 0x0

    goto :goto_5

    .line 582
    :cond_1e
    const-string v3, "postFlags"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1f

    .line 583
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v3

    move-object/from16 v0, v23

    iput v3, v0, Lco/vine/android/api/VinePost;->postFlags:I

    goto/16 :goto_1

    .line 584
    :cond_1f
    const-string v3, "postVerified"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_21

    .line 585
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v3

    const/16 v24, 0x1

    move/from16 v0, v24

    if-ne v3, v0, :cond_20

    const/16 v17, 0x1

    :goto_6
    goto/16 :goto_1

    :cond_20
    const/16 v17, 0x0

    goto :goto_6

    .line 586
    :cond_21
    const-string v3, "promoted"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_23

    .line 587
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v3

    const/16 v24, 0x1

    move/from16 v0, v24

    if-ne v3, v0, :cond_22

    const/16 v19, 0x1

    :goto_7
    goto/16 :goto_1

    :cond_22
    const/16 v19, 0x0

    goto :goto_7

    .line 588
    :cond_23
    const-string v3, "verified"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_25

    .line 589
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v3

    const/16 v24, 0x1

    move/from16 v0, v24

    if-ne v3, v0, :cond_24

    const/16 v22, 0x1

    :goto_8
    goto/16 :goto_1

    :cond_24
    const/16 v22, 0x0

    goto :goto_8

    .line 590
    :cond_25
    const-string v3, "postId"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_26

    .line 591
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v24

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    iput-wide v0, v2, Lco/vine/android/api/VinePost;->postId:J

    goto/16 :goto_1

    .line 592
    :cond_26
    const-string v3, "userId"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_27

    .line 593
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v24

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    iput-wide v0, v2, Lco/vine/android/api/VinePost;->userId:J

    goto/16 :goto_1

    .line 594
    :cond_27
    const-string v3, "myRepostId"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 595
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v24

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    iput-wide v0, v2, Lco/vine/android/api/VinePost;->myRepostId:J

    .line 596
    move-object/from16 v0, v23

    iget-wide v0, v0, Lco/vine/android/api/VinePost;->myRepostId:J

    move-wide/from16 v24, v0

    const-wide/16 v26, 0x0

    cmp-long v3, v24, v26

    if-lez v3, :cond_0

    .line 597
    const/16 v20, 0x1

    goto/16 :goto_1

    .line 599
    :cond_28
    const-string v3, "private"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 600
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v24

    const-wide/16 v26, 0x1

    cmp-long v3, v24, v26

    if-nez v3, :cond_29

    const/16 v18, 0x1

    :goto_9
    goto/16 :goto_1

    :cond_29
    const/16 v18, 0x0

    goto :goto_9

    .line 601
    :cond_2a
    const-string v3, "liked"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 602
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v24

    const-wide/16 v26, 0x1

    cmp-long v3, v24, v26

    if-nez v3, :cond_2b

    const/16 v16, 0x1

    :goto_a
    goto/16 :goto_1

    :cond_2b
    const/16 v16, 0x0

    goto :goto_a

    .line 608
    .end local v12           #cn:Ljava/lang/String;
    :pswitch_6
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v12

    .line 609
    .restart local v12       #cn:Ljava/lang/String;
    const-string v3, "liked"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2c

    .line 610
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v16

    goto/16 :goto_1

    .line 611
    :cond_2c
    const-string v3, "revined"

    invoke-virtual {v3, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 612
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v20

    goto/16 :goto_1

    .line 620
    .end local v12           #cn:Ljava/lang/String;
    :cond_2d
    move-object/from16 v0, v23

    iget-object v3, v0, Lco/vine/android/api/VinePost;->foursquareVenueId:Ljava/lang/String;

    if-eqz v3, :cond_2e

    .line 621
    new-instance v3, Lco/vine/android/api/VineVenue;

    invoke-direct/range {v3 .. v11}, Lco/vine/android/api/VineVenue;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v23

    iput-object v3, v0, Lco/vine/android/api/VinePost;->venueData:Lco/vine/android/api/VineVenue;

    .line 625
    :cond_2e
    move-object/from16 v0, v23

    invoke-virtual {v0, v15}, Lco/vine/android/api/VinePost;->setFlagExplicit(Z)V

    .line 626
    move-object/from16 v0, v23

    move/from16 v1, v22

    invoke-virtual {v0, v1}, Lco/vine/android/api/VinePost;->setFlagVerified(Z)V

    .line 627
    move-object/from16 v0, v23

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lco/vine/android/api/VinePost;->setFlagRevined(Z)V

    .line 628
    move-object/from16 v0, v23

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Lco/vine/android/api/VinePost;->setFlagLiked(Z)V

    .line 629
    move-object/from16 v0, v23

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lco/vine/android/api/VinePost;->setFlagPromoted(Z)V

    .line 630
    move-object/from16 v0, v23

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lco/vine/android/api/VinePost;->setFlagPostVerified(Z)V

    .line 631
    move-object/from16 v0, v23

    move/from16 v1, v18

    invoke-virtual {v0, v1}, Lco/vine/android/api/VinePost;->setFlagPrivate(Z)V

    .line 633
    move-object/from16 v0, v23

    iget-object v3, v0, Lco/vine/android/api/VinePost;->likes:Lco/vine/android/api/VinePagedData;

    iget v3, v3, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, v23

    iput v3, v0, Lco/vine/android/api/VinePost;->likesCount:I

    .line 634
    move-object/from16 v0, v23

    iget-object v3, v0, Lco/vine/android/api/VinePost;->comments:Lco/vine/android/api/VinePagedData;

    iget v3, v3, Lco/vine/android/api/VinePagedData;->count:I

    move-object/from16 v0, v23

    iput v3, v0, Lco/vine/android/api/VinePost;->commentsCount:I

    .line 636
    return-object v23

    .line 474
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_6
        :pswitch_6
    .end packed-switch

    .line 488
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static parsePushNotification(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineNotification;
    .locals 2
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1283
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v1, :cond_0

    .line 1284
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseNotification(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineNotification;

    move-result-object v0

    .line 1286
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static parseRepost(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineRepost;
    .locals 18
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 374
    const/4 v2, 0x0

    .line 375
    .local v2, username:Ljava/lang/String;
    const/4 v3, 0x0

    .line 376
    .local v3, avatarUrl:Ljava/lang/String;
    const/4 v4, 0x0

    .line 377
    .local v4, location:Ljava/lang/String;
    const/4 v5, 0x0

    .line 378
    .local v5, description:Ljava/lang/String;
    const-wide/16 v6, 0x0

    .line 379
    .local v6, userId:J
    const-wide/16 v8, 0x0

    .line 380
    .local v8, postId:J
    const-wide/16 v10, 0x0

    .line 381
    .local v10, repostId:J
    const/4 v12, 0x0

    .line 382
    .local v12, verified:I
    const/4 v13, 0x0

    .line 383
    .local v13, priv:I
    const/4 v14, 0x0

    .line 385
    .local v14, unflaggable:I
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v16

    .line 387
    .local v16, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v16, :cond_a

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v16

    if-eq v0, v1, :cond_a

    .line 388
    sget-object v1, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual/range {v16 .. v16}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v17

    aget v1, v1, v17

    packed-switch v1, :pswitch_data_0

    .line 446
    :cond_0
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v16

    goto :goto_0

    .line 390
    :pswitch_0
    const-string v1, "user"

    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 391
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v16

    .line 392
    :goto_2
    if-eqz v16, :cond_0

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v16

    if-eq v0, v1, :cond_0

    .line 393
    sget-object v1, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual/range {v16 .. v16}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v17

    aget v1, v1, v17

    packed-switch v1, :pswitch_data_1

    .line 426
    :cond_1
    :goto_3
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v16

    goto :goto_2

    .line 395
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v15

    .line 396
    .local v15, cn:Ljava/lang/String;
    const-string v1, "description"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 397
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 398
    :cond_2
    const-string v1, "avatarUrl"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 399
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 400
    :cond_3
    const-string v1, "location"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 401
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v4

    goto :goto_3

    .line 402
    :cond_4
    const-string v1, "username"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 403
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    goto :goto_3

    .line 408
    .end local v15           #cn:Ljava/lang/String;
    :pswitch_2
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v15

    .line 409
    .restart local v15       #cn:Ljava/lang/String;
    const-string v1, "verified"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 410
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v12

    goto :goto_3

    .line 411
    :cond_5
    const-string v1, "private"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 412
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v13

    goto :goto_3

    .line 413
    :cond_6
    const-string v1, "unflaggable"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 414
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v14

    goto :goto_3

    .line 415
    :cond_7
    const-string v1, "userId"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 416
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v6

    goto :goto_3

    .line 422
    .end local v15           #cn:Ljava/lang/String;
    :pswitch_3
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_3

    .line 429
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 434
    :pswitch_4
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v15

    .line 435
    .restart local v15       #cn:Ljava/lang/String;
    const-string v1, "repostId"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 436
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v10

    goto/16 :goto_1

    .line 437
    :cond_9
    const-string v1, "postId"

    invoke-virtual {v1, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 438
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v8

    goto/16 :goto_1

    .line 443
    .end local v15           #cn:Ljava/lang/String;
    :pswitch_5
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 449
    :cond_a
    new-instance v1, Lco/vine/android/api/VineRepost;

    invoke-direct/range {v1 .. v14}, Lco/vine/android/api/VineRepost;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJJIII)V

    return-object v1

    .line 388
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_5
        :pswitch_4
    .end packed-switch

    .line 393
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private static parseRepostResponse(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;
    .locals 9
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 231
    const-wide/16 v3, 0x0

    .line 232
    .local v3, repostId:J
    const-wide/16 v1, 0x0

    .line 234
    .local v1, postId:J
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    .line 235
    .local v5, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v5, :cond_2

    sget-object v7, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v5, v7, :cond_2

    .line 236
    sget-object v7, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v8

    aget v7, v7, v8

    packed-switch v7, :pswitch_data_0

    .line 252
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    goto :goto_0

    .line 238
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 239
    .local v0, cn:Ljava/lang/String;
    const-string v7, "repostId"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 240
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v3

    goto :goto_1

    .line 241
    :cond_1
    const-string v7, "postId"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 242
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v1

    goto :goto_1

    .line 248
    .end local v0           #cn:Ljava/lang/String;
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 255
    :cond_2
    new-instance v6, Lco/vine/android/api/VineRepost;

    invoke-direct {v6}, Lco/vine/android/api/VineRepost;-><init>()V

    .line 256
    .local v6, vr:Lco/vine/android/api/VineRepost;
    iput-wide v3, v6, Lco/vine/android/api/VineRepost;->repostId:J

    .line 257
    iput-wide v1, v6, Lco/vine/android/api/VineRepost;->postId:J

    .line 258
    return-object v6

    .line 236
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static parseServerStatus(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/ServerStatus;
    .locals 9
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1462
    const/4 v1, 0x0

    .line 1463
    .local v1, uploadType:Ljava/lang/String;
    const/4 v2, 0x0

    .line 1464
    .local v2, status:Ljava/lang/String;
    const/4 v3, 0x0

    .line 1465
    .local v3, message:Ljava/lang/String;
    const/4 v4, 0x0

    .line 1466
    .local v4, title:Ljava/lang/String;
    const/4 v5, 0x0

    .line 1467
    .local v5, staticTimelineUrl:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    .line 1468
    .local v7, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v7, :cond_4

    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v7, v0, :cond_4

    .line 1469
    sget-object v0, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v7}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v8

    aget v0, v0, v8

    packed-switch v0, :pswitch_data_0

    .line 1489
    :cond_0
    :goto_1
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v7

    goto :goto_0

    .line 1472
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 1476
    :pswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v6

    .line 1477
    .local v6, cn:Ljava/lang/String;
    const-string v0, "uploadType"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1478
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 1479
    :cond_1
    const-string v0, "status"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1480
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1481
    :cond_2
    const-string v0, "message"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1482
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 1483
    :cond_3
    const-string v0, "staticTimelineUrl"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1484
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 1491
    .end local v6           #cn:Ljava/lang/String;
    :cond_4
    new-instance v0, Lco/vine/android/api/ServerStatus;

    invoke-direct/range {v0 .. v5}, Lco/vine/android/api/ServerStatus;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 1469
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private static parseSignUp(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineLogin;
    .locals 8
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1036
    const-wide/16 v3, 0x0

    .line 1037
    .local v3, userId:J
    const/4 v5, 0x0

    .line 1038
    .local v5, edition:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    .line 1040
    .local v6, t:Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v1, 0x0

    .line 1041
    .local v1, sessionKey:Ljava/lang/String;
    :goto_0
    if-eqz v6, :cond_2

    sget-object v2, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v6, v2, :cond_2

    .line 1042
    sget-object v2, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v6}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v7

    aget v2, v2, v7

    packed-switch v2, :pswitch_data_0

    .line 1064
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v6

    goto :goto_0

    .line 1044
    :pswitch_0
    const-string v2, "userId"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1045
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v3

    goto :goto_1

    .line 1050
    :pswitch_1
    const-string v2, "key"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1051
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 1052
    :cond_1
    const-string v2, "edition"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1053
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 1058
    :pswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    .line 1061
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 1067
    :cond_2
    new-instance v0, Lco/vine/android/api/VineLogin;

    const/4 v2, 0x0

    invoke-direct/range {v0 .. v5}, Lco/vine/android/api/VineLogin;-><init>(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;)V

    .line 1068
    .local v0, vl:Lco/vine/android/api/VineLogin;
    return-object v0

    .line 1042
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static parseTag(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineTag;
    .locals 5
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 705
    new-instance v2, Lco/vine/android/api/VineTag;

    invoke-direct {v2}, Lco/vine/android/api/VineTag;-><init>()V

    .line 706
    .local v2, tag:Lco/vine/android/api/VineTag;
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    .line 707
    .local v1, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v1, :cond_2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v1, v3, :cond_2

    .line 708
    sget-object v3, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v1}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 735
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v1

    goto :goto_0

    .line 710
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 711
    .local v0, cn:Ljava/lang/String;
    const-string v3, "tag"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 712
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lco/vine/android/api/VineTag;->tagName:Ljava/lang/String;

    goto :goto_1

    .line 713
    :cond_1
    const-string v3, "created"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 714
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    const-string v4, "yyyy-MM-dd\'T\'HH:mm:ss.SSSSSS"

    invoke-static {v3, v4}, Lco/vine/android/util/Util;->getTimeInMsFromString(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v3

    iput-wide v3, v2, Lco/vine/android/api/VineTag;->created:J

    goto :goto_1

    .line 718
    .end local v0           #cn:Ljava/lang/String;
    :pswitch_1
    const-string v3, "tagId"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 719
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v3

    iput-wide v3, v2, Lco/vine/android/api/VineTag;->tagId:J

    goto :goto_1

    .line 724
    :pswitch_2
    const-string v3, "deleted"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 725
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v3

    iput-boolean v3, v2, Lco/vine/android/api/VineTag;->deleted:Z

    goto :goto_1

    .line 731
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 737
    :cond_2
    return-object v2

    .line 708
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private static parseTags(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/util/ArrayList;
    .locals 7
    .parameter "p"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineTag;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 640
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 641
    .local v4, tags:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineTag;>;"
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 642
    .local v0, t:Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v3, 0x0

    .line 643
    .local v3, tagName:Ljava/lang/String;
    const-wide/16 v1, 0x0

    .line 644
    .local v1, tagId:J
    :goto_0
    if-eqz v0, :cond_1

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v5, :cond_1

    .line 645
    sget-object v5, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 661
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_0

    .line 647
    :goto_2
    :pswitch_0
    if-eqz v0, :cond_0

    sget-object v5, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v5, :cond_0

    .line 648
    sget-object v5, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_1

    .line 656
    :goto_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_2

    .line 650
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    .line 651
    goto :goto_3

    .line 653
    :pswitch_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v1

    goto :goto_3

    .line 658
    :cond_0
    new-instance v5, Lco/vine/android/api/VineTag;

    invoke-direct {v5, v3, v1, v2}, Lco/vine/android/api/VineTag;-><init>(Ljava/lang/String;J)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 663
    :cond_1
    return-object v4

    .line 645
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch

    .line 648
    :pswitch_data_1
    .packed-switch 0x3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static parseTwitterUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/TwitterUser;
    .locals 13
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1080
    const/4 v1, 0x0

    .line 1081
    .local v1, name:Ljava/lang/String;
    const/4 v2, 0x0

    .line 1082
    .local v2, screenName:Ljava/lang/String;
    const/4 v3, 0x0

    .line 1083
    .local v3, location:Ljava/lang/String;
    const/4 v4, 0x0

    .line 1084
    .local v4, description:Ljava/lang/String;
    const/4 v5, 0x0

    .line 1085
    .local v5, url:Ljava/lang/String;
    const/4 v6, 0x0

    .line 1086
    .local v6, profileUrl:Ljava/lang/String;
    const/4 v7, 0x0

    .line 1087
    .local v7, defaultProfileImage:Z
    const-wide/16 v8, 0x0

    .line 1089
    .local v8, userId:J
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v11

    .line 1090
    .local v11, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v11, :cond_6

    sget-object v0, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v11, v0, :cond_6

    .line 1091
    sget-object v0, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v11}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v12

    aget v0, v0, v12

    packed-switch v0, :pswitch_data_0

    .line 1135
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v11

    goto :goto_0

    .line 1093
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v10

    .line 1094
    .local v10, cn:Ljava/lang/String;
    const-string v0, "name"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1095
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    .line 1096
    :cond_1
    const-string v0, "screen_name"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1097
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1098
    :cond_2
    const-string v0, "profile_image_url"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1099
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v6

    .line 1100
    const-string v0, "_normal"

    const-string v12, "_bigger"

    invoke-virtual {v6, v0, v12}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 1101
    :cond_3
    const-string v0, "url"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1102
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 1103
    :cond_4
    const-string v0, "description"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1104
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 1105
    :cond_5
    const-string v0, "location"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1106
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 1111
    .end local v10           #cn:Ljava/lang/String;
    :pswitch_1
    const-string v0, "id"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1112
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v8

    goto :goto_1

    .line 1118
    :pswitch_2
    const-string v0, "default_profile_image"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1119
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getBooleanValue()Z

    move-result v7

    goto :goto_1

    .line 1124
    :pswitch_3
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 1128
    :pswitch_4
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 1137
    :cond_6
    new-instance v0, Lco/vine/android/api/TwitterUser;

    invoke-direct/range {v0 .. v9}, Lco/vine/android/api/TwitterUser;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJ)V

    return-object v0

    .line 1091
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method private static parseUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUser;
    .locals 34
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 916
    const/4 v3, 0x0

    .line 917
    .local v3, username:Ljava/lang/String;
    const/4 v4, 0x0

    .line 918
    .local v4, avatarUrl:Ljava/lang/String;
    const/4 v5, 0x0

    .line 919
    .local v5, description:Ljava/lang/String;
    const/4 v6, 0x0

    .line 920
    .local v6, location:Ljava/lang/String;
    const/16 v21, 0x0

    .line 921
    .local v21, phoneNumber:Ljava/lang/String;
    const/16 v20, 0x0

    .line 922
    .local v20, email:Ljava/lang/String;
    const/16 v26, 0x0

    .line 923
    .local v26, edition:Ljava/lang/String;
    const-wide/16 v7, 0x0

    .line 924
    .local v7, userId:J
    const-wide/16 v9, 0x0

    .line 925
    .local v9, orderId:J
    const/4 v11, 0x0

    .line 926
    .local v11, blocked:I
    const/4 v12, 0x0

    .line 927
    .local v12, blocking:I
    const/4 v13, 0x0

    .line 928
    .local v13, explicit:I
    const/4 v14, 0x0

    .line 929
    .local v14, followerCount:I
    const/4 v15, 0x0

    .line 930
    .local v15, followingCount:I
    const/16 v16, -0x1

    .line 931
    .local v16, following:I
    const/16 v17, 0x0

    .line 932
    .local v17, likeCount:I
    const/16 v27, 0x0

    .line 933
    .local v27, authoredPostCount:I
    const/16 v18, 0x0

    .line 934
    .local v18, postCount:I
    const/16 v19, 0x0

    .line 935
    .local v19, verified:I
    const/16 v22, 0x0

    .line 936
    .local v22, twitterConnected:I
    const/16 v23, 0x0

    .line 937
    .local v23, includePromoted:I
    const/16 v24, 0x0

    .line 938
    .local v24, privateAccount:I
    const/16 v28, 0x0

    .line 939
    .local v28, followApprovalPending:Z
    const/16 v29, 0x0

    .line 940
    .local v29, followRequested:Z
    const/16 v25, 0x1

    .line 942
    .local v25, repostsEnabled:I
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v31

    .line 944
    .local v31, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v31, :cond_1a

    sget-object v32, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    if-eq v0, v1, :cond_1a

    .line 945
    sget-object v32, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual/range {v31 .. v31}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v33

    aget v32, v32, v33

    packed-switch v32, :pswitch_data_0

    .line 1014
    :cond_0
    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v31

    goto :goto_0

    .line 947
    :pswitch_0
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v30

    .line 948
    .local v30, name:Ljava/lang/String;
    const-string v32, "avatarUrl"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_1

    .line 949
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 950
    :cond_1
    const-string v32, "username"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_2

    .line 951
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 952
    :cond_2
    const-string v32, "description"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_3

    .line 953
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 954
    :cond_3
    const-string v32, "location"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_4

    .line 955
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 956
    :cond_4
    const-string v32, "phoneNumber"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_5

    .line 957
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v21

    goto :goto_1

    .line 958
    :cond_5
    const-string v32, "email"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_6

    .line 959
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v20

    goto :goto_1

    .line 960
    :cond_6
    const-string v32, "edition"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_0

    .line 961
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getText()Ljava/lang/String;

    move-result-object v26

    goto :goto_1

    .line 966
    .end local v30           #name:Ljava/lang/String;
    :pswitch_1
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v30

    .line 967
    .restart local v30       #name:Ljava/lang/String;
    const-string v32, "userId"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_7

    .line 968
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v7

    goto/16 :goto_1

    .line 969
    :cond_7
    const-string v32, "blocked"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_8

    .line 970
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v11

    goto/16 :goto_1

    .line 971
    :cond_8
    const-string v32, "blocking"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_9

    .line 972
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v12

    goto/16 :goto_1

    .line 973
    :cond_9
    const-string v32, "explicit"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_a

    .line 974
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v13

    goto/16 :goto_1

    .line 975
    :cond_a
    const-string v32, "followerCount"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_b

    .line 976
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v14

    goto/16 :goto_1

    .line 977
    :cond_b
    const-string v32, "followingCount"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_c

    .line 978
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v15

    goto/16 :goto_1

    .line 979
    :cond_c
    const-string v32, "following"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_d

    .line 980
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v16

    goto/16 :goto_1

    .line 981
    :cond_d
    const-string v32, "likeCount"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_e

    .line 982
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v17

    goto/16 :goto_1

    .line 983
    :cond_e
    const-string v32, "authoredPostCount"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_f

    .line 984
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v27

    goto/16 :goto_1

    .line 985
    :cond_f
    const-string v32, "postCount"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_10

    .line 986
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v18

    goto/16 :goto_1

    .line 987
    :cond_10
    const-string v32, "verified"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_11

    .line 988
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v19

    goto/16 :goto_1

    .line 989
    :cond_11
    const-string v32, "followId"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_12

    .line 990
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v9

    goto/16 :goto_1

    .line 991
    :cond_12
    const-string v32, "twitterConnected"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_13

    .line 992
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v22

    goto/16 :goto_1

    .line 993
    :cond_13
    const-string v32, "includePromoted"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_14

    .line 994
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v23

    goto/16 :goto_1

    .line 995
    :cond_14
    const-string v32, "private"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_15

    .line 996
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v24

    goto/16 :goto_1

    .line 997
    :cond_15
    const-string v32, "followApprovalPending"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_17

    .line 998
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v32

    const/16 v33, 0x1

    move/from16 v0, v32

    move/from16 v1, v33

    if-ne v0, v1, :cond_16

    const/16 v28, 0x1

    :goto_2
    goto/16 :goto_1

    :cond_16
    const/16 v28, 0x0

    goto :goto_2

    .line 999
    :cond_17
    const-string v32, "followRequested"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_19

    .line 1000
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v32

    const/16 v33, 0x1

    move/from16 v0, v32

    move/from16 v1, v33

    if-ne v0, v1, :cond_18

    const/16 v29, 0x1

    :goto_3
    goto/16 :goto_1

    :cond_18
    const/16 v29, 0x0

    goto :goto_3

    .line 1001
    :cond_19
    const-string v32, "repostsEnabled"

    move-object/from16 v0, v32

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v32

    if-eqz v32, :cond_0

    .line 1002
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v25

    goto/16 :goto_1

    .line 1008
    .end local v30           #name:Ljava/lang/String;
    :pswitch_2
    invoke-virtual/range {p0 .. p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_1

    .line 1017
    :cond_1a
    const-wide/16 v32, 0x0

    cmp-long v32, v7, v32

    if-gtz v32, :cond_1c

    .line 1018
    const/4 v2, 0x0

    .line 1031
    :cond_1b
    :goto_4
    return-object v2

    .line 1021
    :cond_1c
    new-instance v2, Lco/vine/android/api/VineUser;

    invoke-direct/range {v2 .. v27}, Lco/vine/android/api/VineUser;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJIIIIIIIIILjava/lang/String;Ljava/lang/String;IIIILjava/lang/String;I)V

    .line 1025
    .local v2, u:Lco/vine/android/api/VineUser;
    if-eqz v28, :cond_1d

    .line 1026
    invoke-virtual {v2}, Lco/vine/android/api/VineUser;->setApprovalPending()V

    .line 1028
    :cond_1d
    if-eqz v29, :cond_1b

    .line 1029
    invoke-virtual {v2}, Lco/vine/android/api/VineUser;->setFollowRequested()V

    goto :goto_4

    .line 945
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static parseUsersArray(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/util/ArrayList;
    .locals 4
    .parameter "p"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lco/vine/android/api/VineUser;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 898
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 899
    .local v0, t:Lcom/fasterxml/jackson/core/JsonToken;
    const/4 v2, 0x0

    .line 900
    .local v2, users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    :goto_0
    if-eqz v0, :cond_2

    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->END_ARRAY:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v3, :cond_2

    .line 901
    sget-object v3, Lcom/fasterxml/jackson/core/JsonToken;->START_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-ne v0, v3, :cond_1

    .line 902
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUser;

    move-result-object v1

    .line 903
    .local v1, user:Lco/vine/android/api/VineUser;
    if-eqz v1, :cond_1

    .line 904
    if-nez v2, :cond_0

    .line 905
    new-instance v2, Ljava/util/ArrayList;

    .end local v2           #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 907
    .restart local v2       #users:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lco/vine/android/api/VineUser;>;"
    :cond_0
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 910
    .end local v1           #user:Lco/vine/android/api/VineUser;
    :cond_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_0

    .line 912
    :cond_2
    return-object v2
.end method

.method private static parseVinePostResponse(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VinePostResponse;
    .locals 8
    .parameter "p"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1495
    const-wide/16 v3, 0x0

    .line 1496
    .local v3, postId:J
    const-wide/16 v1, 0x0

    .line 1497
    .local v1, createdAt:J
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    .line 1498
    .local v5, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_0
    if-eqz v5, :cond_2

    sget-object v6, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v5, v6, :cond_2

    .line 1499
    sget-object v6, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v5}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 1515
    :cond_0
    :goto_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v5

    goto :goto_0

    .line 1501
    :pswitch_0
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v0

    .line 1502
    .local v0, cn:Ljava/lang/String;
    const-string v6, "postId"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1503
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v3

    goto :goto_1

    .line 1504
    :cond_1
    const-string v6, "createdAt"

    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1505
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getLongValue()J

    move-result-wide v1

    goto :goto_1

    .line 1511
    .end local v0           #cn:Ljava/lang/String;
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_1

    .line 1517
    :cond_2
    new-instance v6, Lco/vine/android/api/VinePostResponse;

    invoke-direct {v6, v3, v4, v1, v2}, Lco/vine/android/api/VinePostResponse;-><init>(JJ)V

    return-object v6

    .line 1499
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static parseVineResponse(Lcom/fasterxml/jackson/core/JsonParser;I)Ljava/lang/Object;
    .locals 4
    .parameter "p"
    .parameter "type"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    const/16 v1, 0x10

    if-ne p1, v1, :cond_0

    .line 107
    const/4 v1, 0x0

    .line 194
    :goto_0
    return-object v1

    .line 109
    :cond_0
    const/16 v1, 0xf

    if-ne p1, v1, :cond_1

    .line 110
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseServerStatus(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/ServerStatus;

    move-result-object v1

    goto :goto_0

    .line 112
    :cond_1
    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    .line 113
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseGeneral(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0

    .line 116
    :cond_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    .line 117
    .local v0, t:Lcom/fasterxml/jackson/core/JsonToken;
    :goto_1
    if-eqz v0, :cond_4

    sget-object v1, Lcom/fasterxml/jackson/core/JsonToken;->END_OBJECT:Lcom/fasterxml/jackson/core/JsonToken;

    if-eq v0, v1, :cond_4

    .line 118
    sget-object v1, Lco/vine/android/api/VineParsers$8;->$SwitchMap$com$fasterxml$jackson$core$JsonToken:[I

    invoke-virtual {v0}, Lcom/fasterxml/jackson/core/JsonToken;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 201
    :cond_3
    :goto_2
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->nextToken()Lcom/fasterxml/jackson/core/JsonToken;

    move-result-object v0

    goto :goto_1

    .line 120
    :pswitch_0
    const-string v1, "data"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 121
    packed-switch p1, :pswitch_data_1

    .line 165
    :pswitch_1
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto :goto_2

    .line 123
    :pswitch_2
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseUser(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineUser;

    move-result-object v1

    goto :goto_0

    .line 126
    :pswitch_3
    sget-object v1, Lco/vine/android/api/VineParsers;->USER_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    invoke-static {p0, v1}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v1

    goto :goto_0

    .line 129
    :pswitch_4
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseClientProfile(Lcom/fasterxml/jackson/core/JsonParser;)Lorg/json/JSONObject;

    move-result-object v1

    goto :goto_0

    .line 132
    :pswitch_5
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseSignUp(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineLogin;

    move-result-object v1

    goto :goto_0

    .line 135
    :pswitch_6
    sget-object v1, Lco/vine/android/api/VineParsers;->COMMENT_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    invoke-static {p0, v1}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v1

    goto :goto_0

    .line 138
    :pswitch_7
    sget-object v1, Lco/vine/android/api/VineParsers;->POST_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    invoke-static {p0, v1}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v1

    goto :goto_0

    .line 141
    :pswitch_8
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseComment(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VineComment;

    move-result-object v1

    goto :goto_0

    .line 144
    :pswitch_9
    sget-object v1, Lco/vine/android/api/VineParsers;->ACTIVITY_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    invoke-static {p0, v1}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v1

    goto :goto_0

    .line 147
    :pswitch_a
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseLikeId(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Long;

    move-result-object v1

    goto :goto_0

    .line 150
    :pswitch_b
    sget-object v1, Lco/vine/android/api/VineParsers;->LIKES_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    invoke-static {p0, v1}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v1

    goto :goto_0

    .line 153
    :pswitch_c
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseVinePostResponse(Lcom/fasterxml/jackson/core/JsonParser;)Lco/vine/android/api/VinePostResponse;

    move-result-object v1

    goto :goto_0

    .line 156
    :pswitch_d
    sget-object v1, Lco/vine/android/api/VineParsers;->TAG_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    invoke-static {p0, v1}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v1

    goto/16 :goto_0

    .line 159
    :pswitch_e
    sget-object v1, Lco/vine/android/api/VineParsers;->CHANNELS_PARSER:Lco/vine/android/api/VineParsers$RecordParser;

    invoke-static {p0, v1}, Lco/vine/android/api/VineParsers;->parsePagedData(Lcom/fasterxml/jackson/core/JsonParser;Lco/vine/android/api/VineParsers$RecordParser;)Lco/vine/android/api/VinePagedData;

    move-result-object v1

    goto/16 :goto_0

    .line 162
    :pswitch_f
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseRepostResponse(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_0

    .line 172
    :pswitch_10
    const-string v1, "data"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 173
    sparse-switch p1, :sswitch_data_0

    .line 184
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->skipChildren()Lcom/fasterxml/jackson/core/JsonParser;

    goto/16 :goto_2

    .line 175
    :sswitch_0
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseUsersArray(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/util/ArrayList;

    move-result-object v1

    goto/16 :goto_0

    .line 178
    :sswitch_1
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseBlockedUsers(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/util/ArrayList;

    move-result-object v1

    goto/16 :goto_0

    .line 181
    :sswitch_2
    invoke-static {p0}, Lco/vine/android/api/VineParsers;->parseEditions(Lcom/fasterxml/jackson/core/JsonParser;)Ljava/lang/Object;

    move-result-object v1

    goto/16 :goto_0

    .line 191
    :pswitch_11
    const-string v1, "data"

    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 192
    packed-switch p1, :pswitch_data_2

    goto/16 :goto_2

    .line 194
    :pswitch_12
    invoke-virtual {p0}, Lcom/fasterxml/jackson/core/JsonParser;->getIntValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto/16 :goto_0

    .line 203
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unhandled parse type "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 118
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_10
        :pswitch_11
    .end packed-switch

    .line 121
    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_2
        :pswitch_3
        :pswitch_1
        :pswitch_5
        :pswitch_6
        :pswitch_8
        :pswitch_7
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_4
        :pswitch_d
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_e
        :pswitch_f
    .end packed-switch

    .line 173
    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x11 -> :sswitch_1
        0x15 -> :sswitch_2
    .end sparse-switch

    .line 192
    :pswitch_data_2
    .packed-switch 0x14
        :pswitch_12
    .end packed-switch
.end method
