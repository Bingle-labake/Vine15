.class public Lco/vine/android/util/CrashUtil;
.super Ljava/lang/Object;
.source "CrashUtil.java"


# static fields
.field private static sLogsOn:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static log(Ljava/lang/String;)V
    .locals 1
    .parameter "log"

    .prologue
    .line 28
    sget-boolean v0, Lco/vine/android/util/CrashUtil;->sLogsOn:Z

    if-eqz v0, :cond_0

    .line 29
    invoke-static {p0}, Lcom/edisonwang/android/slog/SLog;->i2(Ljava/lang/String;)V

    .line 33
    :goto_0
    return-void

    .line 31
    :cond_0
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static varargs log(Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .parameter "message"
    .parameter "objects"

    .prologue
    .line 36
    invoke-static {p0, p1}, Lcom/edisonwang/android/slog/MessageFormatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Lcom/edisonwang/android/slog/FormattingTuple;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edisonwang/android/slog/FormattingTuple;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 37
    .local v0, log:Ljava/lang/String;
    sget-boolean v1, Lco/vine/android/util/CrashUtil;->sLogsOn:Z

    if-eqz v1, :cond_0

    .line 38
    invoke-static {v0}, Lcom/edisonwang/android/slog/SLog;->i2(Ljava/lang/String;)V

    .line 42
    :goto_0
    return-void

    .line 40
    :cond_0
    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static logException(Ljava/lang/Throwable;)V
    .locals 2
    .parameter "e"

    .prologue
    .line 19
    sget-boolean v0, Lco/vine/android/util/CrashUtil;->sLogsOn:Z

    if-eqz v0, :cond_0

    .line 20
    const-string v0, "Exception was logged."

    invoke-static {v0, p0}, Lcom/edisonwang/android/slog/SLog;->e2(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 25
    :goto_0
    return-void

    .line 22
    :cond_0
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->logException(Ljava/lang/Throwable;)V

    .line 23
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Last Exception was "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static varargs logException(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 2
    .parameter "e"
    .parameter "message"
    .parameter "objects"

    .prologue
    .line 45
    invoke-static {p1, p2}, Lcom/edisonwang/android/slog/MessageFormatter;->format(Ljava/lang/String;[Ljava/lang/Object;)Lcom/edisonwang/android/slog/FormattingTuple;

    move-result-object v1

    invoke-virtual {v1}, Lcom/edisonwang/android/slog/FormattingTuple;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 46
    .local v0, log:Ljava/lang/String;
    sget-boolean v1, Lco/vine/android/util/CrashUtil;->sLogsOn:Z

    if-eqz v1, :cond_0

    .line 47
    invoke-static {v0, p0}, Lcom/edisonwang/android/slog/SLog;->e2(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 52
    :goto_0
    return-void

    .line 49
    :cond_0
    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->log(Ljava/lang/String;)V

    .line 50
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->logException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static setup(Z)V
    .locals 0
    .parameter "logsOn"

    .prologue
    .line 15
    sput-boolean p0, Lco/vine/android/util/CrashUtil;->sLogsOn:Z

    .line 16
    return-void
.end method
