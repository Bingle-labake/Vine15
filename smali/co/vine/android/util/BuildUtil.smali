.class public Lco/vine/android/util/BuildUtil;
.super Ljava/lang/Object;
.source "BuildUtil.java"


# static fields
.field public static final APP_TYPE_EXPLORE:I = 0x2

.field public static final APP_TYPE_REGULAR:I = 0x1

.field public static final ENVIRONMENT_DEV:I = 0x2

.field public static final ENVIRONMENT_PRODUCTION:I = 0x1

.field public static final MARKET_AMAZON:I = 0x2

.field public static final MARKET_ASTAR:I = 0x3

.field public static final MARKET_GOOGLE:I = 0x1

.field private static isOldDeviceOrLowEndDevice:Ljava/lang/Boolean; = null

.field private static sAppType:I = 0x0

.field private static sAuthority:Ljava/lang/String; = null

.field private static sEnvironment:I = 0x0

.field private static sI18nTest:Z = false

.field private static final sI18nTestDefault:Z = true

.field private static sInstance:Lco/vine/android/util/BuildUtil;

.field private static sLogsOn:Z

.field private static sMarket:I


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v4, 0x0

    .line 29
    const-string v0, "co.vine.android"

    sput-object v0, Lco/vine/android/util/BuildUtil;->sAuthority:Ljava/lang/String;

    .line 37
    const/4 v0, 0x0

    sput-object v0, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice:Ljava/lang/Boolean;

    .line 42
    const-string v0, "google"

    const-string v1, "regular"

    const-string v2, "co.vine.android"

    const-string v3, "production"

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, Lco/vine/android/util/BuildUtil;->setup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 44
    invoke-static {v4}, Lco/vine/android/util/CrashUtil;->setup(Z)V

    .line 45
    const-string v0, "co.vine.android"

    invoke-static {v0}, Lco/vine/android/util/PlayerUtil;->setup(Ljava/lang/String;)V

    .line 46
    const-string v0, "amazon"

    const-string v1, "google"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "co.vine.android"

    invoke-static {v4, v0, v1}, Lcom/edisonwang/android/slog/SLog;->setup(ZZLjava/lang/String;)V

    .line 47
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "c"

    .prologue
    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput-object p1, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    .line 131
    return-void
.end method

.method public static get(Landroid/content/Context;)Lco/vine/android/util/BuildUtil;
    .locals 1
    .parameter "c"

    .prologue
    .line 80
    sget-object v0, Lco/vine/android/util/BuildUtil;->sInstance:Lco/vine/android/util/BuildUtil;

    if-nez v0, :cond_0

    .line 81
    new-instance v0, Lco/vine/android/util/BuildUtil;

    invoke-direct {v0, p0}, Lco/vine/android/util/BuildUtil;-><init>(Landroid/content/Context;)V

    sput-object v0, Lco/vine/android/util/BuildUtil;->sInstance:Lco/vine/android/util/BuildUtil;

    .line 83
    :cond_0
    sget-object v0, Lco/vine/android/util/BuildUtil;->sInstance:Lco/vine/android/util/BuildUtil;

    return-object v0
.end method

.method public static getAuthority(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .parameter "suffix"

    .prologue
    .line 134
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lco/vine/android/util/BuildUtil;->sAuthority:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getMarket()I
    .locals 1

    .prologue
    .line 122
    sget v0, Lco/vine/android/util/BuildUtil;->sMarket:I

    return v0
.end method

.method public static isAStar()Z
    .locals 2

    .prologue
    .line 95
    sget v0, Lco/vine/android/util/BuildUtil;->sMarket:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isAmazon()Z
    .locals 2

    .prologue
    .line 87
    sget v0, Lco/vine/android/util/BuildUtil;->sMarket:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isExplore()Z
    .locals 2

    .prologue
    .line 107
    sget v0, Lco/vine/android/util/BuildUtil;->sAppType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isGoogle()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 91
    sget v1, Lco/vine/android/util/BuildUtil;->sMarket:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isI18nOn()Z
    .locals 1

    .prologue
    .line 126
    sget-boolean v0, Lco/vine/android/util/BuildUtil;->sLogsOn:Z

    return v0
.end method

.method public static isI18nTestOn()Z
    .locals 1

    .prologue
    .line 76
    sget-boolean v0, Lco/vine/android/util/BuildUtil;->sI18nTest:Z

    return v0
.end method

.method public static isLogsOn()Z
    .locals 1

    .prologue
    .line 118
    sget-boolean v0, Lco/vine/android/util/BuildUtil;->sLogsOn:Z

    return v0
.end method

.method public static isOldDeviceOrLowEndDevice(Landroid/content/Context;)Z
    .locals 7
    .parameter "context"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 111
    sget-object v0, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice:Ljava/lang/Boolean;

    if-nez v0, :cond_2

    .line 112
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lco/vine/android/util/BuildUtil;->isExplore()Z

    move-result v0

    if-nez v0, :cond_3

    move v0, v1

    :goto_0
    invoke-static {p0, v0}, Lco/vine/android/util/SystemUtil;->getMemoryRatio(Landroid/content/Context;Z)D

    move-result-wide v3

    const-wide/high16 v5, 0x3ff0

    cmpg-double v0, v3, v5

    if-gez v0, :cond_1

    :cond_0
    move v2, v1

    :cond_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice:Ljava/lang/Boolean;

    .line 114
    :cond_2
    sget-object v0, Lco/vine/android/util/BuildUtil;->isOldDeviceOrLowEndDevice:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_3
    move v0, v2

    .line 112
    goto :goto_0
.end method

.method public static isProduction()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 99
    sget v1, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isRegular()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 103
    sget v1, Lco/vine/android/util/BuildUtil;->sAppType:I

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setup(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 3
    .parameter "market"
    .parameter "appType"
    .parameter "authority"
    .parameter "environment"
    .parameter "logsOn"
    .parameter "i18n"

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 51
    const-string v0, "amazon"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 52
    sput v2, Lco/vine/android/util/BuildUtil;->sMarket:I

    .line 58
    :goto_0
    const-string v0, "production"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 59
    sput v1, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    .line 63
    :goto_1
    const-string v0, "explore"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 64
    sput v2, Lco/vine/android/util/BuildUtil;->sAppType:I

    .line 68
    :goto_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 69
    sput-object p2, Lco/vine/android/util/BuildUtil;->sAuthority:Ljava/lang/String;

    .line 71
    :cond_0
    sput-boolean p4, Lco/vine/android/util/BuildUtil;->sLogsOn:Z

    .line 72
    sput-boolean v1, Lco/vine/android/util/BuildUtil;->sI18nTest:Z

    .line 73
    return-void

    .line 53
    :cond_1
    const-string v0, "astar"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 54
    const/4 v0, 0x3

    sput v0, Lco/vine/android/util/BuildUtil;->sMarket:I

    goto :goto_0

    .line 56
    :cond_2
    sput v1, Lco/vine/android/util/BuildUtil;->sMarket:I

    goto :goto_0

    .line 61
    :cond_3
    sput v2, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    goto :goto_1

    .line 66
    :cond_4
    sput v1, Lco/vine/android/util/BuildUtil;->sAppType:I

    goto :goto_2
.end method


# virtual methods
.method public getAmazonBucket()Ljava/lang/String;
    .locals 2

    .prologue
    .line 174
    sget v0, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    packed-switch v0, :pswitch_data_0

    .line 180
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e0045

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 176
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e0044

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 174
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getBaseCdnUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 150
    sget v0, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    packed-switch v0, :pswitch_data_0

    .line 156
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e01e6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 152
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e01e5

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 150
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getBaseUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 138
    sget v0, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    packed-switch v0, :pswitch_data_0

    .line 144
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e01e3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 140
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e01e2

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 138
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getExploreUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 186
    sget v0, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    packed-switch v0, :pswitch_data_0

    .line 192
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e00ac

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 188
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e00ab

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 186
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getMediaUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 162
    sget v0, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    packed-switch v0, :pswitch_data_0

    .line 168
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e01e8

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 164
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e01e7

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 162
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getSenderId()Ljava/lang/String;
    .locals 2

    .prologue
    .line 210
    sget v0, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    packed-switch v0, :pswitch_data_0

    .line 216
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e0151

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 212
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e0152

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 210
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method public getStatusUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 198
    sget v0, Lco/vine/android/util/BuildUtil;->sEnvironment:I

    packed-switch v0, :pswitch_data_0

    .line 204
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e01af

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 200
    :pswitch_0
    iget-object v0, p0, Lco/vine/android/util/BuildUtil;->mContext:Landroid/content/Context;

    const v1, 0x7f0e01ae

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 198
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
