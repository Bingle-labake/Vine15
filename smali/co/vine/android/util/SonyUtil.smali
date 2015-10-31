.class public Lco/vine/android/util/SonyUtil;
.super Ljava/lang/Object;
.source "SonyUtil.java"


# static fields
.field public static final SONY_SESSION_START_TIME:Ljava/lang/String; = "session_start_time"

.field public static final SONY_SESSION_START_TIME_LOGGED_OUT:Ljava/lang/String; = "session_start_time_logged_out"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static endSession(Landroid/content/Context;)V
    .locals 12
    .parameter "context"

    .prologue
    const-wide/16 v10, -0x1

    const-wide/16 v8, 0x0

    .line 29
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    .line 30
    .local v4, prefs:Landroid/content/SharedPreferences;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 33
    .local v2, now:J
    const-string v7, "session_start_time"

    invoke-interface {v4, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    .line 34
    .local v5, startTime:J
    cmp-long v7, v5, v8

    if-lez v7, :cond_1

    .line 35
    sub-long v7, v2, v5

    const/4 v9, 0x0

    invoke-static {v7, v8, v9}, Lco/vine/android/util/FlurryUtils;->trackSonyCameraModeSessionTime(JZ)V

    .line 36
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "session_start_time"

    invoke-interface {v7, v8, v10, v11}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 45
    :cond_0
    :goto_0
    return-void

    .line 38
    :cond_1
    const-string v7, "session_start_time_logged_out"

    invoke-interface {v4, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    .line 40
    .local v0, loggedOutStartTime:J
    cmp-long v7, v0, v8

    if-lez v7, :cond_0

    .line 41
    sub-long v7, v2, v0

    const/4 v9, 0x1

    invoke-static {v7, v8, v9}, Lco/vine/android/util/FlurryUtils;->trackSonyCameraModeSessionTime(JZ)V

    .line 42
    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const-string v8, "session_start_time_logged_out"

    invoke-interface {v7, v8, v10, v11}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method

.method public static startSession(Landroid/content/Context;)V
    .locals 7
    .parameter "context"

    .prologue
    const-wide/16 v5, -0x1

    .line 16
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    .line 17
    .local v0, ac:Lco/vine/android/client/AppController;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 18
    .local v2, startTime:J
    invoke-static {p0}, Lco/vine/android/util/Util;->getDefaultSharedPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 19
    .local v1, edit:Landroid/content/SharedPreferences$Editor;
    invoke-virtual {v0}, Lco/vine/android/client/AppController;->isLoggedIn()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 20
    const-string v4, "session_start_time"

    invoke-interface {v1, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 21
    const-string v4, "session_start_time_logged_out"

    invoke-interface {v1, v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 26
    :goto_0
    return-void

    .line 23
    :cond_0
    const-string v4, "session_start_time"

    invoke-interface {v1, v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 24
    const-string v4, "session_start_time_logged_out"

    invoke-interface {v1, v4, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v4

    invoke-interface {v4}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method
