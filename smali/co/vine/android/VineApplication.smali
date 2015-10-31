.class public Lco/vine/android/VineApplication;
.super Landroid/app/Application;
.source "VineApplication.java"


# static fields
.field private static INSTANCE:Lco/vine/android/VineApplication;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lco/vine/android/VineApplication;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lco/vine/android/VineApplication;->INSTANCE:Lco/vine/android/VineApplication;

    return-object v0
.end method

.method public static getInstance()Lco/vine/android/VineApplication;
    .locals 1
    .annotation runtime Lcom/flurry/org/apache/avro/reflect/Nullable;
    .end annotation

    .prologue
    .line 53
    sget-object v0, Lco/vine/android/VineApplication;->INSTANCE:Lco/vine/android/VineApplication;

    return-object v0
.end method


# virtual methods
.method public getLocale()Ljava/util/Locale;
    .locals 1

    .prologue
    .line 94
    invoke-virtual {p0}, Lco/vine/android/VineApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget-object v0, v0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 5
    .parameter "newConfig"

    .prologue
    .line 58
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 59
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isI18nOn()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 60
    invoke-static {p0}, Lco/vine/android/util/Util;->getCustomLocale(Landroid/content/Context;)Ljava/util/Locale;

    move-result-object v0

    .line 61
    .local v0, locale:Ljava/util/Locale;
    if-eqz v0, :cond_0

    iget-object v1, p1, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 62
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    new-instance v2, Lco/vine/android/VineApplication$1;

    invoke-direct {v2, p0, v0}, Lco/vine/android/VineApplication$1;-><init>(Lco/vine/android/VineApplication;Ljava/util/Locale;)V

    const-wide/16 v3, 0x1f4

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 70
    .end local v0           #locale:Ljava/util/Locale;
    :cond_0
    return-void
.end method

.method public onCreate()V
    .locals 2

    .prologue
    .line 29
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 31
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isI18nOn()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 32
    invoke-virtual {p0}, Lco/vine/android/VineApplication;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 33
    .local v0, resources:Landroid/content/res/Resources;
    if-nez v0, :cond_0

    .line 44
    .end local v0           #resources:Landroid/content/res/Resources;
    :goto_0
    return-void

    .line 36
    .restart local v0       #resources:Landroid/content/res/Resources;
    :cond_0
    invoke-static {p0}, Lco/vine/android/util/Util;->forceCustomLocale(Landroid/content/Context;)V

    .line 39
    .end local v0           #resources:Landroid/content/res/Resources;
    :cond_1
    invoke-static {}, Lco/vine/android/util/BuildUtil;->isLogsOn()Z

    move-result v1

    if-nez v1, :cond_2

    .line 40
    invoke-static {p0}, Lcom/crashlytics/android/Crashlytics;->start(Landroid/content/Context;)V

    .line 43
    :cond_2
    sput-object p0, Lco/vine/android/VineApplication;->INSTANCE:Lco/vine/android/VineApplication;

    goto :goto_0
.end method

.method public onLowMemory()V
    .locals 2

    .prologue
    .line 85
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 86
    const-string v1, "onLowMemory happened."

    invoke-static {v1}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;)V

    .line 87
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    .line 88
    .local v0, instance:Lco/vine/android/client/AppController;
    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {v0}, Lco/vine/android/client/AppController;->onLowMemory()V

    .line 91
    :cond_0
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 5
    .parameter "level"
    .annotation build Landroid/annotation/TargetApi;
        value = 0xe
    .end annotation

    .prologue
    .line 75
    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 76
    const-string v1, "onTrimMemory happened: {}."

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Lco/vine/android/util/CrashUtil;->log(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 77
    invoke-static {p0}, Lco/vine/android/client/AppController;->getInstance(Landroid/content/Context;)Lco/vine/android/client/AppController;

    move-result-object v0

    .line 78
    .local v0, instance:Lco/vine/android/client/AppController;
    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {v0, p1}, Lco/vine/android/client/AppController;->onTrimMemory(I)V

    .line 81
    :cond_0
    return-void
.end method
