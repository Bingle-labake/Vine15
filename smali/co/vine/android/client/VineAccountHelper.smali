.class public Lco/vine/android/client/VineAccountHelper;
.super Ljava/lang/Object;
.source "VineAccountHelper.java"


# static fields
.field public static final ACCOUNT_TYPE:Ljava/lang/String; = null

.field public static final KEY_ADD_WIDGET:Ljava/lang/String; = "account_add_widget"

.field public static final KEY_LOGIN_TYPE:Ljava/lang/String; = "account_login_type"

.field public static final KEY_NORMAL_VIDEO_PLAYABLE:Ljava/lang/String; = "account_normal_video_playable"

.field public static final KEY_SETTINGS:Ljava/lang/String; = "account_settings"

.field public static final KEY_TWITTER_SECRET:Ljava/lang/String; = "account_t_secret"

.field public static final KEY_TWITTER_TOKEN:Ljava/lang/String; = "account_t_token"

.field public static final KEY_TWITTER_USERNAME:Ljava/lang/String; = "account_t_username"

.field public static final KEY_TWITTER_USER_ID:Ljava/lang/String; = "account_t_id"

.field public static final KEY_USER_AVATAR:Ljava/lang/String; = "account_user_avatar"

.field public static final KEY_USER_DATA:Ljava/lang/String; = "account_user_data"

.field public static final KEY_USER_ID:Ljava/lang/String; = "account_user_info"

.field public static final KEY_USER_NAME:Ljava/lang/String; = "account_user_name"

.field public static final LOGIN_TYPE_EMAIL:I = 0x1

.field public static final LOGIN_TYPE_TWITTER:I = 0x2

.field public static final SESSION_TOKEN_KEY:Ljava/lang/String; = "co.vine.android.basic_auth.token.secret"

.field private static mActiveSession:Lco/vine/android/client/Session;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 57
    const-string v0, ".auth"

    invoke-static {v0}, Lco/vine/android/util/BuildUtil;->getAuthority(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lco/vine/android/client/VineAccountHelper;->ACCOUNT_TYPE:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createAccount(Landroid/content/Context;Ljava/lang/String;Lco/vine/android/api/VineLogin;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/accounts/Account;
    .locals 5
    .parameter "context"
    .parameter "uniqueLogin"
    .parameter "vl"
    .parameter "password"
    .parameter "avatar"
    .parameter "accountName"

    .prologue
    const/4 v2, 0x0

    .line 103
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 104
    .local v1, am:Landroid/accounts/AccountManager;
    invoke-static {p0, p1}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    .line 105
    .local v0, account:Landroid/accounts/Account;
    if-nez v0, :cond_0

    .line 106
    new-instance v0, Landroid/accounts/Account;

    .end local v0           #account:Landroid/accounts/Account;
    sget-object v3, Lco/vine/android/client/VineAccountHelper;->ACCOUNT_TYPE:Ljava/lang/String;

    invoke-direct {v0, p1, v3}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .restart local v0       #account:Landroid/accounts/Account;
    invoke-virtual {v1, v0, v2, v2}, Landroid/accounts/AccountManager;->addAccountExplicitly(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 131
    :goto_0
    return-object v2

    .line 111
    :cond_0
    iget v2, p2, Lco/vine/android/api/VineLogin;->loginType:I

    packed-switch v2, :pswitch_data_0

    .line 127
    :goto_1
    const-string v2, "account_user_name"

    invoke-virtual {v1, v0, v2, p5}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    const-string v2, "account_user_avatar"

    invoke-virtual {v1, v0, v2, p4}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    const-string v2, "account_user_info"

    iget-wide v3, p2, Lco/vine/android/api/VineLogin;->userId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    const-string v2, "co.vine.android.basic_auth.token.secret"

    iget-object v3, p2, Lco/vine/android/api/VineLogin;->key:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setAuthToken(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    move-object v2, v0

    .line 131
    goto :goto_0

    .line 113
    :pswitch_0
    invoke-virtual {v1, v0, p3}, Landroid/accounts/AccountManager;->setPassword(Landroid/accounts/Account;Ljava/lang/String;)V

    .line 114
    const-string v2, "account_login_type"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 118
    :pswitch_1
    const-string v2, "account_t_token"

    iget-object v3, p2, Lco/vine/android/api/VineLogin;->twitterToken:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    const-string v2, "account_t_secret"

    iget-object v3, p2, Lco/vine/android/api/VineLogin;->twitterSecret:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    const-string v2, "account_t_id"

    iget-wide v3, p2, Lco/vine/android/api/VineLogin;->twitterUserId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    const-string v2, "account_t_username"

    iget-object v3, p2, Lco/vine/android/api/VineLogin;->twitterUsername:Ljava/lang/String;

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const-string v2, "account_login_type"

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 111
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static createSession()Lco/vine/android/client/Session;
    .locals 7

    .prologue
    const/4 v1, 0x0

    .line 399
    new-instance v0, Lco/vine/android/client/Session;

    const-wide/16 v2, 0x0

    move-object v4, v1

    move-object v5, v1

    move-object v6, v1

    invoke-direct/range {v0 .. v6}, Lco/vine/android/client/Session;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static createSession(Landroid/content/Context;Landroid/accounts/Account;)Lco/vine/android/client/Session;
    .locals 8
    .parameter "context"
    .parameter "account"

    .prologue
    .line 345
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v7

    .line 346
    .local v7, am:Landroid/accounts/AccountManager;
    invoke-static {v7, p1}, Lco/vine/android/client/VineAccountHelper;->getUserId(Landroid/accounts/AccountManager;Landroid/accounts/Account;)J

    move-result-wide v2

    .line 347
    .local v2, userId:J
    invoke-static {p0}, Lco/vine/android/provider/SettingsManager;->getEdition(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 348
    .local v6, edition:Ljava/lang/String;
    new-instance v0, Lco/vine/android/client/Session;

    invoke-static {v7, p1}, Lco/vine/android/client/VineAccountHelper;->getSessionKey(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v7, p1}, Lco/vine/android/client/VineAccountHelper;->getName(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v7, p1}, Lco/vine/android/client/VineAccountHelper;->getAvatarUrl(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v5

    invoke-direct/range {v0 .. v6}, Lco/vine/android/client/Session;-><init>(Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;
    .locals 7
    .parameter "context"
    .parameter "accountName"

    .prologue
    .line 74
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 75
    .local v2, am:Landroid/accounts/AccountManager;
    sget-object v6, Lco/vine/android/client/VineAccountHelper;->ACCOUNT_TYPE:Ljava/lang/String;

    invoke-virtual {v2, v6}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 76
    .local v1, accounts:[Landroid/accounts/Account;
    move-object v3, v1

    .local v3, arr$:[Landroid/accounts/Account;
    array-length v5, v3

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_1

    aget-object v0, v3, v4

    .line 77
    .local v0, account:Landroid/accounts/Account;
    iget-object v6, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 81
    .end local v0           #account:Landroid/accounts/Account;
    :goto_1
    return-object v0

    .line 76
    .restart local v0       #account:Landroid/accounts/Account;
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 81
    .end local v0           #account:Landroid/accounts/Account;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public static getAccountsCount(Landroid/content/Context;)I
    .locals 2
    .parameter "context"

    .prologue
    .line 91
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v0

    .line 92
    .local v0, am:Landroid/accounts/AccountManager;
    sget-object v1, Lco/vine/android/client/VineAccountHelper;->ACCOUNT_TYPE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    array-length v1, v1

    return v1
.end method

.method public static getActiveAccount(Landroid/content/Context;)Landroid/accounts/Account;
    .locals 1
    .parameter "context"

    .prologue
    .line 434
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/AppController;->getActiveSession()Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    return-object v0
.end method

.method public static getActiveSession(Landroid/content/Context;Z)Lco/vine/android/client/Session;
    .locals 9
    .parameter "context"
    .parameter "readOnly"

    .prologue
    .line 358
    sget-object v7, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    .line 359
    .local v7, session:Lco/vine/android/client/Session;
    if-nez v7, :cond_5

    .line 360
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v3

    .line 361
    .local v3, am:Landroid/accounts/AccountManager;
    sget-object v8, Lco/vine/android/client/VineAccountHelper;->ACCOUNT_TYPE:Ljava/lang/String;

    invoke-virtual {v3, v8}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v2

    .line 363
    .local v2, accounts:[Landroid/accounts/Account;
    array-length v8, v2

    if-lez v8, :cond_3

    .line 365
    invoke-static {p0}, Lco/vine/android/provider/SettingsManager;->getCurrentAccount(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 368
    .local v1, accountName:Ljava/lang/String;
    move-object v4, v2

    .local v4, arr$:[Landroid/accounts/Account;
    array-length v6, v4

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_0
    if-ge v5, v6, :cond_3

    aget-object v0, v4, v5

    .line 369
    .local v0, account:Landroid/accounts/Account;
    if-eqz v1, :cond_0

    iget-object v8, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_2

    .line 372
    :cond_0
    iget-object v8, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {p0, v8}, Lco/vine/android/client/VineAccountHelper;->getSession(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/client/Session;

    move-result-object v7

    .line 373
    iget-object v8, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lco/vine/android/client/Session;->setLoginEmail(Ljava/lang/String;)V

    .line 374
    sget-object v8, Lco/vine/android/client/Session$LoginStatus;->LOGGED_IN:Lco/vine/android/client/Session$LoginStatus;

    invoke-virtual {v7, v8}, Lco/vine/android/client/Session;->setLoginStatus(Lco/vine/android/client/Session$LoginStatus;)V

    .line 375
    if-nez p1, :cond_1

    .line 376
    invoke-static {p0, v7}, Lco/vine/android/client/VineAccountHelper;->setActiveSession(Landroid/content/Context;Lco/vine/android/client/Session;)V

    .line 378
    :cond_1
    sput-object v7, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    move-object v8, v7

    .line 395
    .end local v0           #account:Landroid/accounts/Account;
    .end local v1           #accountName:Ljava/lang/String;
    .end local v2           #accounts:[Landroid/accounts/Account;
    .end local v3           #am:Landroid/accounts/AccountManager;
    .end local v4           #arr$:[Landroid/accounts/Account;
    .end local v5           #i$:I
    .end local v6           #len$:I
    :goto_1
    return-object v8

    .line 368
    .restart local v0       #account:Landroid/accounts/Account;
    .restart local v1       #accountName:Ljava/lang/String;
    .restart local v2       #accounts:[Landroid/accounts/Account;
    .restart local v3       #am:Landroid/accounts/AccountManager;
    .restart local v4       #arr$:[Landroid/accounts/Account;
    .restart local v5       #i$:I
    .restart local v6       #len$:I
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 386
    .end local v0           #account:Landroid/accounts/Account;
    .end local v1           #accountName:Ljava/lang/String;
    .end local v4           #arr$:[Landroid/accounts/Account;
    .end local v5           #i$:I
    .end local v6           #len$:I
    :cond_3
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->createSession()Lco/vine/android/client/Session;

    move-result-object v7

    .line 389
    if-nez p1, :cond_4

    .line 390
    invoke-static {p0, v7}, Lco/vine/android/client/VineAccountHelper;->setActiveSession(Landroid/content/Context;Lco/vine/android/client/Session;)V

    .line 392
    :cond_4
    sput-object v7, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    .line 395
    .end local v2           #accounts:[Landroid/accounts/Account;
    .end local v3           #am:Landroid/accounts/AccountManager;
    :cond_5
    sget-object v8, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    goto :goto_1
.end method

.method public static getAvatarUrl(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;
    .locals 1
    .parameter "am"
    .parameter "account"

    .prologue
    .line 240
    const-string v0, "account_user_avatar"

    invoke-virtual {p0, p1, v0}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getCachedActiveSession()Lco/vine/android/client/Session;
    .locals 1

    .prologue
    .line 354
    sget-object v0, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    return-object v0
.end method

.method public static getLoginType(Landroid/accounts/AccountManager;Landroid/accounts/Account;)I
    .locals 1
    .parameter "am"
    .parameter "account"

    .prologue
    .line 258
    const-string v0, "account_login_type"

    invoke-virtual {p0, p1, v0}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getName(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;
    .locals 1
    .parameter "am"
    .parameter "account"

    .prologue
    .line 251
    const-string v0, "account_user_name"

    invoke-virtual {p0, p1, v0}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getPassword(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;
    .locals 1
    .parameter "am"
    .parameter "account"

    .prologue
    .line 265
    invoke-virtual {p0, p1}, Landroid/accounts/AccountManager;->getPassword(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSession(Landroid/content/Context;Ljava/lang/String;)Lco/vine/android/client/Session;
    .locals 2
    .parameter "context"
    .parameter "accountName"

    .prologue
    .line 415
    if-nez p1, :cond_0

    .line 416
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->createSession()Lco/vine/android/client/Session;

    move-result-object v1

    .line 426
    :goto_0
    return-object v1

    .line 418
    :cond_0
    sget-object v1, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    if-nez v1, :cond_1

    .line 419
    invoke-static {p0, p1}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    .line 420
    .local v0, account:Landroid/accounts/Account;
    if-nez v0, :cond_2

    .line 421
    invoke-static {}, Lco/vine/android/client/VineAccountHelper;->createSession()Lco/vine/android/client/Session;

    move-result-object v1

    sput-object v1, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    .line 426
    .end local v0           #account:Landroid/accounts/Account;
    :cond_1
    :goto_1
    sget-object v1, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    goto :goto_0

    .line 423
    .restart local v0       #account:Landroid/accounts/Account;
    :cond_2
    invoke-static {p0, v0}, Lco/vine/android/client/VineAccountHelper;->createSession(Landroid/content/Context;Landroid/accounts/Account;)Lco/vine/android/client/Session;

    move-result-object v1

    sput-object v1, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    goto :goto_1
.end method

.method public static getSessionKey(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;
    .locals 1
    .parameter "am"
    .parameter "account"

    .prologue
    .line 213
    const-string v0, "co.vine.android.basic_auth.token.secret"

    invoke-virtual {p0, p1, v0}, Landroid/accounts/AccountManager;->peekAuthToken(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTwitterSecret(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;
    .locals 1
    .parameter "am"
    .parameter "account"

    .prologue
    .line 279
    const-string v0, "account_t_secret"

    invoke-virtual {p0, p1, v0}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTwitterToken(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;
    .locals 1
    .parameter "am"
    .parameter "account"

    .prologue
    .line 272
    const-string v0, "account_t_token"

    invoke-virtual {p0, p1, v0}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTwitterUsername(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Ljava/lang/String;
    .locals 1
    .parameter "am"
    .parameter "account"

    .prologue
    .line 286
    const-string v0, "account_t_username"

    invoke-virtual {p0, p1, v0}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getUserId(Landroid/accounts/AccountManager;Landroid/accounts/Account;)J
    .locals 3
    .parameter "am"
    .parameter "account"

    .prologue
    .line 224
    const-string v1, "account_user_info"

    invoke-virtual {p0, p1, v1}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 225
    .local v0, userIdS:Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 226
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 228
    :goto_0
    return-wide v1

    :cond_0
    const-wide/16 v1, 0x0

    goto :goto_0
.end method

.method public static isLoggedIn(Landroid/content/Context;Z)Z
    .locals 1
    .parameter "context"
    .parameter "readOnly"

    .prologue
    .line 439
    invoke-static {p0, p1}, Lco/vine/android/client/VineAccountHelper;->getActiveSession(Landroid/content/Context;Z)Lco/vine/android/client/Session;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/client/Session;->isLoggedIn()Z

    move-result v0

    return v0
.end method

.method public static isNormalVideoPlayable(Landroid/content/Context;)Lco/vine/android/util/SystemUtil$PrefBooleanState;
    .locals 4
    .parameter "activity"

    .prologue
    .line 327
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 328
    .local v1, am:Landroid/accounts/AccountManager;
    if-nez v1, :cond_0

    .line 329
    sget-object v3, Lco/vine/android/util/SystemUtil$PrefBooleanState;->UNKNOWN:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    .line 339
    :goto_0
    return-object v3

    .line 331
    :cond_0
    invoke-static {p0}, Lco/vine/android/client/VineAccountHelper;->getActiveAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    .line 332
    .local v0, account:Landroid/accounts/Account;
    const/4 v2, 0x0

    .line 333
    .local v2, data:Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 334
    const-string v3, "account_normal_video_playable"

    invoke-virtual {v1, v0, v3}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 336
    :cond_1
    if-eqz v2, :cond_2

    .line 337
    invoke-static {v2}, Lco/vine/android/util/SystemUtil$PrefBooleanState;->valueOf(Ljava/lang/String;)Lco/vine/android/util/SystemUtil$PrefBooleanState;

    move-result-object v3

    goto :goto_0

    .line 339
    :cond_2
    sget-object v3, Lco/vine/android/util/SystemUtil$PrefBooleanState;->UNKNOWN:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    goto :goto_0
.end method

.method public static needsAddwidget(Landroid/accounts/AccountManager;Landroid/accounts/Account;)Z
    .locals 2
    .parameter "am"
    .parameter "account"

    .prologue
    .line 293
    const-string v1, "account_add_widget"

    invoke-virtual {p0, p1, v1}, Landroid/accounts/AccountManager;->getUserData(Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 294
    .local v0, data:Ljava/lang/String;
    if-nez v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static removeAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/AccountManagerFuture;
    .locals 8
    .parameter "context"
    .parameter "accountName"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Landroid/accounts/AccountManagerFuture",
            "<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 145
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 146
    .local v2, am:Landroid/accounts/AccountManager;
    sget-object v7, Lco/vine/android/client/VineAccountHelper;->ACCOUNT_TYPE:Ljava/lang/String;

    invoke-virtual {v2, v7}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v1

    .line 148
    .local v1, accounts:[Landroid/accounts/Account;
    move-object v3, v1

    .local v3, arr$:[Landroid/accounts/Account;
    array-length v5, v3

    .local v5, len$:I
    const/4 v4, 0x0

    .local v4, i$:I
    :goto_0
    if-ge v4, v5, :cond_0

    aget-object v0, v3, v4

    .line 149
    .local v0, account:Landroid/accounts/Account;
    iget-object v7, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v7, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 150
    invoke-virtual {v2, v0, v6, v6}, Landroid/accounts/AccountManager;->removeAccount(Landroid/accounts/Account;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    move-result-object v6

    .line 153
    .end local v0           #account:Landroid/accounts/Account;
    :cond_0
    return-object v6

    .line 148
    .restart local v0       #account:Landroid/accounts/Account;
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0
.end method

.method public static removeTwitterInfo(Landroid/content/Context;Ljava/lang/String;)V
    .locals 4
    .parameter "context"
    .parameter "accountName"

    .prologue
    const/4 v3, 0x0

    .line 189
    invoke-static {p0, p1}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    .line 190
    .local v0, account:Landroid/accounts/Account;
    if-eqz v0, :cond_0

    .line 191
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 192
    .local v1, am:Landroid/accounts/AccountManager;
    const-string v2, "account_t_token"

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    const-string v2, "account_t_secret"

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    const-string v2, "account_t_id"

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    const-string v2, "account_t_username"

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 196
    const-string v2, "account_login_type"

    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .end local v1           #am:Landroid/accounts/AccountManager;
    :cond_0
    return-void
.end method

.method public static resetActiveSession()V
    .locals 1

    .prologue
    .line 430
    const/4 v0, 0x0

    sput-object v0, Lco/vine/android/client/VineAccountHelper;->mActiveSession:Lco/vine/android/client/Session;

    .line 431
    return-void
.end method

.method public static saveTwitterInfo(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 4
    .parameter "context"
    .parameter "accountName"
    .parameter "username"
    .parameter "token"
    .parameter "secret"
    .parameter "twitterUserId"

    .prologue
    .line 175
    invoke-static {p0, p1}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    .line 176
    .local v0, account:Landroid/accounts/Account;
    if-eqz v0, :cond_0

    .line 177
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 178
    .local v1, am:Landroid/accounts/AccountManager;
    const-string v2, "account_t_token"

    invoke-virtual {v1, v0, v2, p3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    const-string v2, "account_t_secret"

    invoke-virtual {v1, v0, v2, p4}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    const-string v2, "account_t_id"

    invoke-static {p5, p6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    const-string v2, "account_t_username"

    invoke-virtual {v1, v0, v2, p2}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    const-string v2, "account_login_type"

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .end local v1           #am:Landroid/accounts/AccountManager;
    :cond_0
    return-void
.end method

.method public static saveUserId(Landroid/content/Context;Ljava/lang/String;J)V
    .locals 4
    .parameter "context"
    .parameter "accountName"
    .parameter "userId"

    .prologue
    .line 164
    invoke-static {p0, p1}, Lco/vine/android/client/VineAccountHelper;->getAccount(Landroid/content/Context;Ljava/lang/String;)Landroid/accounts/Account;

    move-result-object v0

    .line 165
    .local v0, account:Landroid/accounts/Account;
    if-eqz v0, :cond_0

    .line 166
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 167
    .local v1, am:Landroid/accounts/AccountManager;
    const-wide/16 v2, 0x0

    cmp-long v2, p2, v2

    if-lez v2, :cond_0

    .line 168
    const-string v2, "account_user_info"

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v2, v3}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .end local v1           #am:Landroid/accounts/AccountManager;
    :cond_0
    return-void
.end method

.method public static setActiveSession(Landroid/content/Context;Lco/vine/android/client/Session;)V
    .locals 4
    .parameter "context"
    .parameter "session"

    .prologue
    .line 410
    invoke-virtual {p1}, Lco/vine/android/client/Session;->getLoginEmail()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lco/vine/android/client/Session;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lco/vine/android/client/Session;->getUserId()J

    move-result-wide v2

    invoke-static {p0, v0, v1, v2, v3}, Lco/vine/android/provider/SettingsManager;->setCurrentAccount(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;J)V

    .line 412
    return-void
.end method

.method public static setAddWidget(Landroid/accounts/AccountManager;Landroid/accounts/Account;)V
    .locals 2
    .parameter "am"
    .parameter "account"

    .prologue
    .line 301
    const-string v0, "account_add_widget"

    const-string v1, "YES"

    invoke-virtual {p0, p1, v0, v1}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    return-void
.end method

.method public static setSessionKey(Landroid/accounts/AccountManager;Landroid/accounts/Account;Ljava/lang/String;)V
    .locals 1
    .parameter "am"
    .parameter "account"
    .parameter "key"

    .prologue
    .line 202
    const-string v0, "co.vine.android.basic_auth.token.secret"

    invoke-virtual {p0, p1, v0, p2}, Landroid/accounts/AccountManager;->setAuthToken(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    return-void
.end method

.method public static syncNormalVideoPlayable(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    .line 309
    invoke-static {p0}, Lco/vine/android/client/VineAccountHelper;->isNormalVideoPlayable(Landroid/content/Context;)Lco/vine/android/util/SystemUtil$PrefBooleanState;

    move-result-object v1

    .line 310
    .local v1, accountStatus:Lco/vine/android/util/SystemUtil$PrefBooleanState;
    invoke-static {p0}, Lco/vine/android/util/SystemUtil;->isNormalVideoPlayable(Landroid/content/Context;)Lco/vine/android/util/SystemUtil$PrefBooleanState;

    move-result-object v3

    .line 311
    .local v3, preferenceStatus:Lco/vine/android/util/SystemUtil$PrefBooleanState;
    if-eq v1, v3, :cond_0

    .line 312
    sget-object v4, Lco/vine/android/util/SystemUtil$PrefBooleanState;->UNKNOWN:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    if-eq v3, v4, :cond_1

    .line 314
    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    .line 315
    .local v2, am:Landroid/accounts/AccountManager;
    invoke-static {p0}, Lco/vine/android/client/VineAccountHelper;->getActiveAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    .line 316
    .local v0, account:Landroid/accounts/Account;
    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    .line 317
    const-string v4, "account_normal_video_playable"

    invoke-virtual {v3}, Lco/vine/android/util/SystemUtil$PrefBooleanState;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v0, v4, v5}, Landroid/accounts/AccountManager;->setUserData(Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .end local v0           #account:Landroid/accounts/Account;
    .end local v2           #am:Landroid/accounts/AccountManager;
    :cond_0
    :goto_0
    return-void

    .line 321
    :cond_1
    sget-object v4, Lco/vine/android/util/SystemUtil$PrefBooleanState;->TRUE:Lco/vine/android/util/SystemUtil$PrefBooleanState;

    if-ne v1, v4, :cond_2

    const/4 v4, 0x1

    :goto_1
    invoke-static {p0, v4}, Lco/vine/android/util/SystemUtil;->setNormalVideoPlayable(Landroid/content/Context;Z)V

    goto :goto_0

    :cond_2
    const/4 v4, 0x0

    goto :goto_1
.end method
