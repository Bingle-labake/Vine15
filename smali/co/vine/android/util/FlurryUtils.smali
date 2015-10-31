.class public Lco/vine/android/util/FlurryUtils;
.super Ljava/lang/Object;
.source "FlurryUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lco/vine/android/util/FlurryUtils$FlurryEvent;
    }
.end annotation


# static fields
.field private static final LOADING_KEY:Ljava/lang/String; = "Loading"

.field private static isSignupFailed:Z

.field private static final mLoadingTime:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sRecordingCamera:Z

.field private static sRecordingFocus:Z

.field private static sRecordingGhost:Z

.field private static sRecordingGrid:Z

.field private static sRecordingSession:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 100
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lco/vine/android/util/FlurryUtils;->mLoadingTime:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    return-void
.end method

.method private static getBucketedTime(J)Ljava/lang/String;
    .locals 7
    .parameter "time"

    .prologue
    const-wide/16 v5, 0x1f4

    const-wide/16 v3, 0x64

    .line 111
    const-wide/16 v0, 0x3e8

    cmp-long v0, p0, v0

    if-gez v0, :cond_0

    .line 112
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    div-long v1, p0, v3

    mul-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "ms"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 114
    :goto_0
    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    div-long v1, p0, v5

    mul-long/2addr v1, v5

    long-to-double v1, v1

    const-wide v3, 0x408f400000000000L

    div-double/2addr v1, v3

    const-wide/high16 v3, 0x3ff0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(DD)D

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "s"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static onSignupFailure(ZLco/vine/android/api/VineError;I)V
    .locals 4
    .parameter "twitterSignup"
    .parameter "error"
    .parameter "statusCode"

    .prologue
    .line 147
    const/4 v1, 0x1

    sput-boolean v1, Lco/vine/android/util/FlurryUtils;->isSignupFailed:Z

    .line 148
    new-instance v0, Lco/vine/android/util/FlurryUtils$FlurryEvent;

    const-string v1, "SignupFailure"

    invoke-direct {v0, v1}, Lco/vine/android/util/FlurryUtils$FlurryEvent;-><init>(Ljava/lang/String;)V

    .line 149
    .local v0, event:Lco/vine/android/util/FlurryUtils$FlurryEvent;
    if-eqz p1, :cond_0

    .line 150
    const-string v1, "errorCode"

    iget v2, p1, Lco/vine/android/api/VineError;->errorCode:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v1

    const-string v2, "message"

    iget-object v3, p1, Lco/vine/android/api/VineError;->message:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    .line 152
    :cond_0
    const-string v1, "isTwitter"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v1

    const-string v2, "statusCode"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log()V

    .line 153
    return-void
.end method

.method public static onSignupSuccess(Z)V
    .locals 3
    .parameter "twitterSignup"

    .prologue
    .line 142
    const/4 v0, 0x0

    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->isSignupFailed:Z

    .line 143
    const-string v0, "SignupSuccess"

    const-string v1, "isTwitter"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 144
    return-void
.end method

.method public static start(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    .line 57
    :try_start_0
    const-string v1, "K5MVVCSN2MQ89JDRWKGY"

    invoke-static {p0, v1}, Lcom/flurry/android/FlurryAgent;->onStartSession(Landroid/content/Context;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    :goto_0
    return-void

    .line 58
    :catch_0
    move-exception v0

    .line 59
    .local v0, e:Ljava/lang/Exception;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static stop(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    .line 65
    :try_start_0
    invoke-static {p0}, Lcom/flurry/android/FlurryAgent;->onEndSession(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :goto_0
    return-void

    .line 66
    :catch_0
    move-exception v0

    .line 67
    .local v0, e:Ljava/lang/Exception;
    invoke-static {v0}, Lco/vine/android/util/CrashUtil;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static trackAbandonedStage(Ljava/lang/String;)V
    .locals 2
    .parameter "stage"

    .prologue
    .line 260
    const-string v0, "Abandon"

    const-string v1, "stage"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 261
    return-void
.end method

.method public static trackAddressNewFollowingCount(Ljava/lang/String;)V
    .locals 2
    .parameter "count"

    .prologue
    .line 308
    const-string v0, "FindFriendsAddressNewFollowing"

    const-string v1, "Count"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 309
    return-void
.end method

.method public static trackAttribution()V
    .locals 1

    .prologue
    .line 378
    const-string v0, "Attribution"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 379
    return-void
.end method

.method public static trackBackFromPostScreen()V
    .locals 1

    .prologue
    .line 256
    const-string v0, "BackToPreviewFromPostScreen"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 257
    return-void
.end method

.method public static trackBlockUser()V
    .locals 1

    .prologue
    .line 224
    const-string v0, "BlockUser"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 225
    return-void
.end method

.method public static trackCameraSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 343
    if-eqz p0, :cond_0

    sget-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingCamera:Z

    if-nez v0, :cond_0

    .line 344
    const/4 v0, 0x1

    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingCamera:Z

    .line 345
    const-string v0, "RecordingCamera"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 347
    :cond_0
    return-void
.end method

.method public static trackChangedDescription()V
    .locals 1

    .prologue
    .line 276
    const-string v0, "Settings_ChangedDescription"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 277
    return-void
.end method

.method public static trackChangedEdition()V
    .locals 1

    .prologue
    .line 212
    const-string v0, "ChangedEdition"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 213
    return-void
.end method

.method public static trackChangedEmail()V
    .locals 1

    .prologue
    .line 284
    const-string v0, "Settings_ChangedEmail"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 285
    return-void
.end method

.method public static trackChangedLocation()V
    .locals 1

    .prologue
    .line 280
    const-string v0, "Settings_ChangedLocation"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 281
    return-void
.end method

.method public static trackChangedName()V
    .locals 1

    .prologue
    .line 272
    const-string v0, "Settings_ChangedName"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 273
    return-void
.end method

.method public static trackChannelChange(Ljava/lang/String;)V
    .locals 2
    .parameter "channelDetails"

    .prologue
    .line 252
    const-string v0, "PostChannelChange"

    const-string v1, "channelDetails"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 253
    return-void
.end method

.method public static trackConnectFacebook()V
    .locals 1

    .prologue
    .line 208
    const-string v0, "ConnectFacebook"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 209
    return-void
.end method

.method public static trackConnectTwitter()V
    .locals 1

    .prologue
    .line 180
    const-string v0, "ConnectTwitter"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 181
    return-void
.end method

.method public static trackContentControls()V
    .locals 1

    .prologue
    .line 398
    const-string v0, "ContentControls"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 399
    return-void
.end method

.method public static trackDeactivateAccount()V
    .locals 1

    .prologue
    .line 382
    const-string v0, "DeactivateAccount"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 383
    return-void
.end method

.method public static trackDeleteComment()V
    .locals 1

    .prologue
    .line 200
    const-string v0, "DeleteComment"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 201
    return-void
.end method

.method public static trackDisConnectTwitter()V
    .locals 1

    .prologue
    .line 204
    const-string v0, "DisconnectTwitter"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 205
    return-void
.end method

.method public static trackFilterProfileReposts(ZZZ)V
    .locals 5
    .parameter "hideReposts"
    .parameter "isFollowing"
    .parameter "isMe"

    .prologue
    .line 435
    if-eqz p0, :cond_0

    const-string v0, "ProfileRepostsHidden"

    .line 436
    .local v0, eventName:Ljava/lang/String;
    :goto_0
    const-string v1, "Is Following"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "Is Me"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 437
    return-void

    .line 435
    .end local v0           #eventName:Ljava/lang/String;
    :cond_0
    const-string v0, "ProfileRepostsShown"

    goto :goto_0
.end method

.method public static trackFindFriendsAddressCount(I)V
    .locals 3
    .parameter "count"

    .prologue
    .line 292
    const-string v0, "FindFriendsAddressResultsCount"

    const-string v1, "Result Count"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 293
    return-void
.end method

.method public static trackFindFriendsAddressFailure()V
    .locals 1

    .prologue
    .line 300
    const-string v0, "FindFriendsAddressFailure"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 301
    return-void
.end method

.method public static trackFindFriendsTabSelect(I)V
    .locals 3
    .parameter "position"

    .prologue
    .line 414
    const-string v0, "FindFriendsTabSelect"

    const-string v1, "Address/Twitter/Search"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 415
    return-void
.end method

.method public static trackFindFriendsTwitterCount(I)V
    .locals 3
    .parameter "count"

    .prologue
    .line 296
    const-string v0, "FindFriendsTwitterResultsCount"

    const-string v1, "Result Count"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 297
    return-void
.end method

.method public static trackFindFriendsTwitterFailure()V
    .locals 1

    .prologue
    .line 304
    const-string v0, "FindFriendsTwitterFailure"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 305
    return-void
.end method

.method public static trackFocusSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 350
    if-eqz p0, :cond_0

    sget-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingFocus:Z

    if-nez v0, :cond_0

    .line 351
    const/4 v0, 0x1

    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingFocus:Z

    .line 352
    const-string v0, "RecordingFocus"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 354
    :cond_0
    return-void
.end method

.method public static trackFollow(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 422
    const-string v0, "Follow"

    const-string v1, "source"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 423
    return-void
.end method

.method public static trackGetComments()V
    .locals 1

    .prologue
    .line 188
    const-string v0, "GetComments"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 189
    return-void
.end method

.method public static trackGetEditions()V
    .locals 1

    .prologue
    .line 192
    const-string v0, "GetEditions"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 193
    return-void
.end method

.method public static trackGetUser(Z)V
    .locals 3
    .parameter "self"

    .prologue
    .line 176
    const-string v0, "ProfileFetch"

    const-string v1, "self"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 177
    return-void
.end method

.method public static trackGhostSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 364
    if-eqz p0, :cond_0

    sget-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingGhost:Z

    if-nez v0, :cond_0

    .line 365
    const/4 v0, 0x1

    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingGhost:Z

    .line 366
    const-string v0, "RecordingGhost"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 368
    :cond_0
    return-void
.end method

.method public static trackGraphTimelineRefreshNewCount(I)V
    .locals 3
    .parameter "count"

    .prologue
    .line 136
    const-string v0, "GraphRefreshNewVideoCount"

    const-string v1, "count"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 137
    return-void
.end method

.method public static trackGridSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 357
    if-eqz p0, :cond_0

    sget-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingGrid:Z

    if-nez v0, :cond_0

    .line 358
    const/4 v0, 0x1

    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingGrid:Z

    .line 359
    const-string v0, "RecordingGrid"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 361
    :cond_0
    return-void
.end method

.method public static trackInvite(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "type"
    .parameter "source"

    .prologue
    .line 390
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Invite_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "source"

    invoke-static {v0, v1, p1}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 391
    return-void
.end method

.method public static trackInviteBannerViewed(J)V
    .locals 4
    .parameter "viewCount"

    .prologue
    .line 418
    const-string v0, "InviteBannerViews"

    const-string v1, "ViewCount"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 419
    return-void
.end method

.method public static trackLikePost(JLjava/lang/String;)V
    .locals 4
    .parameter "postId"
    .parameter "source"

    .prologue
    .line 156
    const-string v0, "Like"

    const-string v1, "postId"

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "Source View"

    invoke-static {v0, v1, v2, v3, p2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 157
    return-void
.end method

.method public static trackLoadingTime(Ljava/lang/String;J)V
    .locals 3
    .parameter "loadingTimeTag"
    .parameter "time"

    .prologue
    .line 104
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isProduction()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    sget-object v0, Lco/vine/android/util/FlurryUtils;->mLoadingTime:Ljava/util/HashMap;

    const-string v1, "Loading"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Loading_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lco/vine/android/util/FlurryUtils;->mLoadingTime:Ljava/util/HashMap;

    invoke-static {v0, v1}, Lcom/flurry/android/FlurryAgent;->logEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 108
    :cond_0
    return-void
.end method

.method public static trackLockOutSessionCount()V
    .locals 1

    .prologue
    .line 72
    sget-boolean v0, Lco/vine/android/util/FlurryUtils;->isSignupFailed:Z

    if-eqz v0, :cond_0

    .line 73
    const/4 v0, 0x0

    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->isSignupFailed:Z

    .line 74
    const-string v0, "SignUpLockOut"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 76
    :cond_0
    return-void
.end method

.method public static trackLoginFailure(ZI)V
    .locals 5
    .parameter "isTwitter"
    .parameter "statusCode"

    .prologue
    .line 128
    const-string v0, "LoginFailure"

    const-string v1, "isTwitter"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    const-string v3, "statusCode"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 129
    return-void
.end method

.method public static trackLoginSuccess(Z)V
    .locals 3
    .parameter "isTwitter"

    .prologue
    .line 124
    const-string v0, "LoginSuccess"

    const-string v1, "isTwitter"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 125
    return-void
.end method

.method public static trackLogout()V
    .locals 1

    .prologue
    .line 320
    const-string v0, "Logout"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 321
    return-void
.end method

.method public static trackNotificationSettings()V
    .locals 1

    .prologue
    .line 402
    const-string v0, "NotificationSettings"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 403
    return-void
.end method

.method public static trackPost(Z)V
    .locals 3
    .parameter "checked"

    .prologue
    .line 248
    const-string v0, "Post"

    const-string v1, "Vine"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 249
    return-void
.end method

.method public static trackPostComment()V
    .locals 1

    .prologue
    .line 196
    const-string v0, "PostComment"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 197
    return-void
.end method

.method public static trackPreviewAction(Ljava/lang/String;)V
    .locals 2
    .parameter "action"

    .prologue
    .line 410
    const-string v0, "PreviewAction"

    const-string v1, "action"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 411
    return-void
.end method

.method public static trackPrivacyPolicy()V
    .locals 1

    .prologue
    .line 394
    const-string v0, "PrivacyPolicy"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 395
    return-void
.end method

.method public static trackProfileImageClick(Z)V
    .locals 3
    .parameter "self"

    .prologue
    .line 430
    const-string v0, "ProfileImageClick"

    const-string v1, "self"

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 431
    return-void
.end method

.method public static trackRecordingDestroy()V
    .locals 0

    .prologue
    .line 340
    return-void
.end method

.method public static trackRecordingInfo(IJJI)V
    .locals 3
    .parameter "phase"
    .parameter "total"
    .parameter "waitTime"
    .parameter "cuts"

    .prologue
    .line 79
    new-instance v0, Lco/vine/android/util/FlurryUtils$FlurryEvent;

    const-string v1, "Recording"

    invoke-direct {v0, v1}, Lco/vine/android/util/FlurryUtils$FlurryEvent;-><init>(Ljava/lang/String;)V

    const-string v1, "Duration"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v0

    const-string v1, "Wait time"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v0

    const-string v1, "Cuts"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v0

    const-string v1, "Phase"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v0

    invoke-virtual {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log()V

    .line 85
    return-void
.end method

.method public static trackRecordingStart()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 330
    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingCamera:Z

    .line 331
    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingFocus:Z

    .line 332
    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingGrid:Z

    .line 333
    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingGhost:Z

    .line 334
    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingSession:Z

    .line 335
    const-string v0, "RecordingStart"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 336
    return-void
.end method

.method public static trackReportPost()V
    .locals 1

    .prologue
    .line 240
    const-string v0, "ReportPost"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 241
    return-void
.end method

.method public static trackReportUser()V
    .locals 1

    .prologue
    .line 232
    const-string v0, "ReportUser"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 233
    return-void
.end method

.method public static trackResetPassword()V
    .locals 1

    .prologue
    .line 184
    const-string v0, "ResetPassword"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method public static trackRespondTime(Ljava/lang/String;Ljava/lang/String;JJZ)V
    .locals 4
    .parameter "host"
    .parameter "path"
    .parameter "firstByte"
    .parameter "durationMs"
    .parameter "isVideo"

    .prologue
    .line 88
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isProduction()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 89
    new-instance v0, Lco/vine/android/util/FlurryUtils$FlurryEvent;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Response_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz p6, :cond_1

    const-string v1, "video"

    :goto_0
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lco/vine/android/util/FlurryUtils$FlurryEvent;-><init>(Ljava/lang/String;)V

    .line 90
    .local v0, event:Lco/vine/android/util/FlurryUtils$FlurryEvent;
    if-eqz p6, :cond_2

    .line 91
    const-string v1, "host"

    invoke-virtual {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    .line 95
    :goto_1
    const-string v1, "statusTime"

    invoke-static {p2, p3}, Lco/vine/android/util/FlurryUtils;->getBucketedTime(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v1

    const-string v2, "totalTime"

    invoke-static {p4, p5}, Lco/vine/android/util/FlurryUtils;->getBucketedTime(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v1

    invoke-virtual {v1}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log()V

    .line 98
    .end local v0           #event:Lco/vine/android/util/FlurryUtils$FlurryEvent;
    :cond_0
    return-void

    .line 89
    :cond_1
    const-string v1, "generic"

    goto :goto_0

    .line 93
    .restart local v0       #event:Lco/vine/android/util/FlurryUtils$FlurryEvent;
    :cond_2
    const-string v1, "host"

    invoke-virtual {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    move-result-object v1

    const-string v2, "path"

    invoke-virtual {v1, v2, p1}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->add(Ljava/lang/String;Ljava/lang/Object;)Lco/vine/android/util/FlurryUtils$FlurryEvent;

    goto :goto_1
.end method

.method public static trackRevine(JLjava/lang/String;)V
    .locals 4
    .parameter "postId"
    .parameter "source"

    .prologue
    .line 164
    const-string v0, "Revine"

    const-string v1, "postId"

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "Source View"

    invoke-static {v0, v1, v2, v3, p2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 165
    return-void
.end method

.method public static trackSaveSession(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 406
    const-string v0, "SaveSession"

    const-string v1, "source"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 407
    return-void
.end method

.method public static trackSearchTags()V
    .locals 1

    .prologue
    .line 220
    const-string v0, "SearchTags"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 221
    return-void
.end method

.method public static trackSearchUsers()V
    .locals 1

    .prologue
    .line 216
    const-string v0, "SearchUser"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 217
    return-void
.end method

.method public static trackSeeReviners()V
    .locals 1

    .prologue
    .line 172
    const-string v0, "SeeReviners"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 173
    return-void
.end method

.method public static trackSessionSwitchPressed(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 371
    if-eqz p0, :cond_0

    sget-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingSession:Z

    if-nez v0, :cond_0

    .line 372
    const/4 v0, 0x1

    sput-boolean v0, Lco/vine/android/util/FlurryUtils;->sRecordingSession:Z

    .line 373
    const-string v0, "RecordingSession"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 375
    :cond_0
    return-void
.end method

.method public static trackSharePost(Ljava/lang/String;J)V
    .locals 3
    .parameter "network"
    .parameter "postId"

    .prologue
    .line 236
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SharePost_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "postId"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 237
    return-void
.end method

.method public static trackShareProfile()V
    .locals 1

    .prologue
    .line 264
    const-string v0, "ShareProfile"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 265
    return-void
.end method

.method public static trackSonyCameraModeLaunch()V
    .locals 1

    .prologue
    .line 440
    const-string v0, "Sony_CameraModeLaunch"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 441
    return-void
.end method

.method public static trackSonyCameraModeSessionTime(JZ)V
    .locals 5
    .parameter "time"
    .parameter "loggedOut"

    .prologue
    .line 444
    const-string v0, "Sony_CameraModeFaceTime"

    const-string v1, "Time"

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "LoggedOut"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 445
    return-void
.end method

.method public static trackTabChange(Ljava/lang/String;)V
    .locals 2
    .parameter "tag"

    .prologue
    .line 244
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Page_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 245
    return-void
.end method

.method public static trackTimeLinePageScroll(Ljava/lang/String;I)V
    .locals 3
    .parameter "name"
    .parameter "page"

    .prologue
    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TimeLinePageScroll_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "page"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 133
    return-void
.end method

.method public static trackTos()V
    .locals 1

    .prologue
    .line 386
    const-string v0, "TermsOfServiceClicked"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 387
    return-void
.end method

.method public static trackTwitterNewFollowingCount(Ljava/lang/String;)V
    .locals 2
    .parameter "count"

    .prologue
    .line 312
    const-string v0, "FindFriendsTwitterNewFollowing"

    const-string v1, "Count"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 313
    return-void
.end method

.method public static trackUnBlockUser()V
    .locals 1

    .prologue
    .line 228
    const-string v0, "UnBlockUser"

    invoke-static {v0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;)V

    .line 229
    return-void
.end method

.method public static trackUnLikePost(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 160
    const-string v0, "UnLike"

    const-string v1, "Source View"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 161
    return-void
.end method

.method public static trackUnRevine(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 168
    const-string v0, "UnRevine"

    const-string v1, "Source View"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 169
    return-void
.end method

.method public static trackUnfollow(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 426
    const-string v0, "Unfollow"

    const-string v1, "source"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 427
    return-void
.end method

.method public static trackValidPullToRefreshRelease(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 120
    const-string v0, "ValidPullToRefreshRelease"

    const-string v1, "source"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 121
    return-void
.end method

.method public static trackVisitFindFriends(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 288
    const-string v0, "VisitFindFriends"

    const-string v1, "source"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 289
    return-void
.end method

.method public static trackVisitSearch(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 316
    const-string v0, "VisitSearch"

    const-string v1, "source"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 317
    return-void
.end method

.method public static trackVisitSettings(Ljava/lang/String;)V
    .locals 2
    .parameter "source"

    .prologue
    .line 268
    const-string v0, "VisitSettings"

    const-string v1, "source"

    invoke-static {v0, v1, p0}, Lco/vine/android/util/FlurryUtils$FlurryEvent;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    .line 269
    return-void
.end method
